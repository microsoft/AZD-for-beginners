# Your First Project - Hands-On Tutorial

**Chapter Navigation:**
- **📚 Course Home**: [AZD शुरुआती के लिए](../../README.md)
- **📖 Current Chapter**: अध्याय 1 - आधार और त्वरित प्रारंभ
- **⬅️ Previous**: [Installation & Setup](installation.md)
- **➡️ Next**: [Configuration](configuration.md)
- **🚀 Next Chapter**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introduction

आपका पहला Azure Developer CLI प्रोजेक्ट में आपका स्वागत है! यह व्यापक हैंड्स-ऑन ट्यूटोरियल azd का उपयोग करके Azure पर एक फुल-स्टैक एप्लिकेशन बनाने, तैनात करने और प्रबंधित करने का पूर्ण वॉकथ्रू प्रदान करता है। आप एक वास्तविक todo एप्लिकेशन पर काम करेंगे जिसमें एक React फ्रंटएंड, Node.js API बैकएंड, और MongoDB डेटाबेस शामिल है।

## Learning Goals

इस ट्यूटोरियल को पूरा करके, आप:
- टेम्पलेट्स का उपयोग करके azd प्रोजेक्ट इनिशियलाइज़ेशन वर्कफ़्लो में निपुण हो जाएंगे
- Azure Developer CLI प्रोजेक्ट स्ट्रक्चर और कॉन्फ़िगरेशन फ़ाइलों को समझेंगे
- इन्फ्रास्ट्रक्चर प्रोविजनिंग के साथ Azure पर एप्लिकेशन का पूर्ण तैनाती निष्पादित करेंगे
- एप्लिकेशन अपडेट और पुनःतैनाती रणनीतियाँ लागू करेंगे
- विकास और स्टेजिंग के लिए कई वातावरणों का प्रबंधन करेंगे
- रिसोर्स क्लीनअप और लागत प्रबंधन अभ्यास लागू करेंगे

## Learning Outcomes

पूरा करने पर, आप सक्षम होंगे:
- स्वतंत्र रूप से टेम्पलेट्स से azd प्रोजेक्ट इनिशियलाइज़ और कॉन्फ़िगर करना
- azd प्रोजेक्ट संरचनाओं में प्रभावी ढंग से नेविगेट और संशोधन करना
- एकल कमांड का उपयोग करके Azure पर फुल-स्टैक एप्लिकेशन तैनात करना
- सामान्य तैनाती समस्याओं और प्रमाणीकरण समस्याओं का निवारण करना
- विभिन्न तैनाती चरणों के लिए कई Azure वातावरणों का प्रबंधन करना
- एप्लिकेशन अपडेट के लिए कंटीन्यूअस डिप्लॉयमेंट वर्कफ़्लो लागू करना

## Getting Started

### Prerequisites Checklist
- ✅ Azure Developer CLI installed ([Installation Guide](installation.md))
- ✅ AZD authentication completed with `azd auth login`
- ✅ Git installed on your system
- ✅ Node.js 16+ (for this tutorial)
- ✅ Visual Studio Code (recommended)

जारी रखने से पहले, रिपॉज़िटरी रूट से सेटअप वेलिडेटर चलाएँ:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### Verify Your Setup
```bash
# azd इंस्टॉलेशन की जांच करें
azd version

# AZD प्रमाणीकरण की जांच करें
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

आइए एक लोकप्रिय todo एप्लिकेशन टेम्पलेट से शुरू करें जिसमें React फ्रंटएंड और Node.js API बैकएंड शामिल हैं।

```bash
# उपलब्ध टेम्पलेट्स ब्राउज़ करें
azd template list

# todo ऐप टेम्पलेट प्रारंभ करें
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# प्रॉम्प्ट्स का पालन करें:
# - एक पर्यावरण नाम दर्ज करें: "dev"
# - एक सदस्यता चुनें (यदि आपके पास कई हैं)
# - एक क्षेत्र चुनें: "East US 2" (या अपनी पसंद का क्षेत्र)
```

### What Just Happened?
- टेम्पलेट को आपके लोकल डायरेक्टरी में डाउनलोड किया गया
- सर्विस परिभाषाओं के साथ एक `azure.yaml` फ़ाइल बनाई गई
- `infra/` डायरेक्टरी में इन्फ्रास्ट्रक्चर कोड सेट अप किया गया
- एक वातावरण कॉन्फ़िगरेशन बनाया गया

## Step 2: Explore the Project Structure

आइए देखें कि azd ने हमारे लिए क्या बनाया:

```bash
# परियोजना की संरचना देखें
tree /f   # विंडोज़
# या
find . -type f | head -20   # macOS/लिनक्स
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

**azure.yaml** - आपके azd प्रोजेक्ट का हृदय:
```bash
# प्रोजेक्ट कॉन्फ़िगरेशन देखें
cat azure.yaml
```

**infra/main.bicep** - इन्फ्रास्ट्रक्चर परिभाषा:
```bash
# बुनियादी ढाँचे का कोड देखें
head -30 infra/main.bicep
```

## Step 3: Customize Your Project (Optional)

तैनाती से पहले, आप एप्लिकेशन को अनुकूलित कर सकते हैं:

### Modify the Frontend
```bash
# React ऐप घटक खोलें
code src/web/src/App.tsx
```

एक साधारण परिवर्तन करें:
```typescript
// शीर्षक खोजें और बदलें
<h1>My Awesome Todo App</h1>
```

### Configure Environment Variables
```bash
# कस्टम पर्यावरण चर सेट करें
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# सभी पर्यावरण चर देखें
azd env get-values
```

## Step 4: Deploy to Azure

अब रोमांचक हिस्सा - सब कुछ Azure पर तैनात करें!

```bash
# इन्फ्रास्ट्रक्चर और एप्लिकेशन तैनात करें
azd up

# यह कमांड करेगा:
# 1. Azure संसाधनों को प्रोविजन करेगा (App Service, Cosmos DB, आदि)
# 2. आपके एप्लिकेशन का निर्माण करेगा
# 3. प्रोविजन किए गए संसाधनों पर तैनात करेगा
# 4. एप्लिकेशन का URL प्रदर्शित करेगा
```

### What's Happening During Deployment?

`azd up` कमांड ये चरण करता है:
1. **Provision** (`azd provision`) - Azure संसाधन बनाता है
2. **Package** - आपका एप्लिकेशन कोड बनाता है
3. **Deploy** (`azd deploy`) - कोड को Azure संसाधनों पर तैनात करता है

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
डिप्लॉयमेंट आउटपुट में दिए गए URL पर क्लिक करें, या इसे कभी भी प्राप्त करें:
```bash
# एप्लिकेशन एंडपॉइंट प्राप्त करें
azd show

# अपने ब्राउज़र में एप्लिकेशन खोलें
azd show --output json | jq -r '.services.web.endpoint'
```

### Test the Todo App
1. **Add a todo item** - "Add Todo" पर क्लिक करें और एक टास्क दर्ज करें
2. **Mark as complete** - पूरे हुए आइटम्स को चेक करें
3. **Delete items** - उन todos को हटा दें जिनकी अब आवश्यकता नहीं है

### Monitor Your Application
```bash
# अपने संसाधनों के लिए Azure पोर्टल खोलें
azd monitor

# एप्लिकेशन लॉग देखें
azd monitor --logs

# लाइव मेट्रिक्स देखें
azd monitor --live
```

### ✅ Verify Your Deployment

आगे बढ़ने से पहले, यह त्वरित चेकलिस्ट चलाकर पुष्टि करें कि सब कुछ वास्तव में काम कर रहा है—यह मान कर न चलें कि "deploy succeeded" का मतलब है "app works":

```bash
# 1. पुष्टि करें कि एंडपॉइंट मौजूद है और पहुंच योग्य है
azd show

# 2. एंडपॉइंट का स्मोक-टेस्ट करें (HTTP 200 अपेक्षित)
curl -I "$(azd show --output json | jq -r '.services.web.endpoint')"

# 3. यदि आपका ऐप कोई हेल्थ एंडपॉइंट उपलब्ध कराता है तो उसे जांचें
curl "$(azd show --output json | jq -r '.services.web.endpoint')/health"
```

**Deployment is verified when:**
- ✅ `azd show` एक पहुंच योग्य endpoint URL सूचीबद्ध करता है
- ✅ URL आपके ब्राउज़र में बिना त्रुटियों के खुलता है
- ✅ कोर फीचर्स काम करते हैं (todo जोड़ें/पूरा करें/हटाएँ)
- ✅ `azd monitor --logs` दिखाता है कि अनुरोध बिना अप्रत्याशित त्रुटियों के आ रहे हैं

यदि कोई जाँच विफल होती है, तो जाएँ [Chapter 7: Troubleshooting](../chapter-07-troubleshooting/README.md).

## Step 6: Make Changes and Redeploy

आइए एक परिवर्तन करें और देखें कि अपडेट करना कितना आसान है:

### Modify the API
```bash
# API कोड संपादित करें
code src/api/src/routes/lists.js
```

एक कस्टम प्रतिक्रिया हेडर जोड़ें:
```javascript
// एक रूट हैंडलर खोजें और जोड़ें:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Deploy Just the Code Changes
```bash
# केवल एप्लिकेशन कोड तैनात करें (बुनियादी ढांचा छोड़ें)
azd deploy

# यह 'azd up' की तुलना में बहुत तेज़ है क्योंकि बुनियादी ढांचा पहले से मौजूद है
```

## Step 7: Manage Multiple Environments

परिवर्तन का परीक्षण करने के लिए एक स्टेजिंग वातावरण बनाएं:

```bash
# नया स्टेजिंग वातावरण बनाएँ
azd env new staging

# स्टेजिंग पर तैनात करें
azd up

# डेव वातावरण पर वापस स्विच करें
azd env select dev

# सभी वातावरणों को सूचीबद्ध करें
azd env list
```

### Environment Comparison
```bash
# विकास परिवेश देखें
azd env select dev
azd show

# स्टेजिंग परिवेश देखें
azd env select staging
azd show
```

## Step 8: Clean Up Resources

जब आप प्रयोग करना समाप्त कर लें, तो चलती लागत से बचने के लिए संसाधनों को साफ़ कर दें:

```bash
# वर्तमान वातावरण के लिए सभी Azure संसाधनों को हटाएं
azd down

# बिना पुष्टि के जबरदस्ती हटाएं और सॉफ्ट-डिलीट किए गए संसाधनों को स्थायी रूप से हटाएं
azd down --force --purge

# विशिष्ट वातावरण को हटाएं
azd env select staging
azd down --force --purge
```

## Classic App vs. AI-Powered App: Same Workflow

आपने अभी एक पारंपरिक वेब एप्लिकेशन तैनात किया। लेकिन अगर आप इसके बजाय एक एआई-समर्थित ऐप तैनात करना चाहते — मान लीजिए, Microsoft Foundry Models द्वारा समर्थित एक चैट ऐप?

अच्छी खबर: **वर्कफ़्लो समान है।**

| Step | Classic Todo App | AI Chat App |
|------|-----------------|-------------|
| Initialize | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| Authenticate | `azd auth login` | `azd auth login` |
| Deploy | `azd up` | `azd up` |
| Monitor | `azd monitor` | `azd monitor` |
| Clean up | `azd down --force --purge` | `azd down --force --purge` |

एकमात्र अंतर वह **टेम्पलेट** है जिससे आप शुरू करते हैं। एक AI टेम्पलेट अतिरिक्त इन्फ्रास्ट्रक्चर शामिल कर सकता है (जैसे Microsoft Foundry Models रिसोर्स या एक AI Search इंडेक्स), लेकिन azd उन सबका प्रबंधन आपके लिए करता है। आपको नए कमांड सीखने, अलग टूल अपनाने, या तैनाती के बारे में सोचे जाने के तरीके में बदलाव करने की आवश्यकता नहीं है।

यह azd का मूल सिद्धांत है: **one workflow, any workload.** आपने इस ट्यूटोरियल में जिस कौशल का अभ्यास किया — इनिशियलाइज़ करना, तैनात करना, मॉनिटर करना, पुनःतैनात करना, और क्लीनअप करना — ये सभी AI एप्लिकेशन और एजेंट्स पर समान रूप से लागू होते हैं।

---

## What You've Learned

बधाई हो! आपने सफलतापूर्वक:
- ✅ टेम्पलेट से एक azd प्रोजेक्ट इनिशियलाइज़ किया
- ✅ प्रोजेक्ट स्ट्रक्चर और प्रमुख फ़ाइलों का अन्वेषण किया
- ✅ एक फुल-स्टैक एप्लिकेशन Azure पर तैनात किया
- ✅ कोड परिवर्तन किए और पुनःतैनात किया
- ✅ कई वातावरणों का प्रबंधन किया
- ✅ संसाधनों को साफ़ किया

## 🎯 Skill Validation Exercises

### Exercise 1: Deploy a Different Template (15 minutes)
**Goal**: Demonstrate mastery of azd init and deployment workflow

```bash
# Python + MongoDB स्टैक आज़माएँ
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# डिप्लॉयमेंट सत्यापित करें
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# साफ़ करें
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

# कस्टम एनवायरनमेंट बनाएं
azd env new custom-config

# कस्टम वेरिएबल सेट करें
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# वेरिएबलों को सत्यापित करें
azd env get-values | grep APP_TITLE

# कस्टम कॉन्फ़िग के साथ तैनात करें
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
# डेव वातावरण बनाएं
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# डेव URL नोट करें
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# स्टेजिंग वातावरण बनाएं
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# स्टेजिंग URL नोट करें
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# वातावरणों की तुलना करें
azd env list

# दोनों वातावरणों का परीक्षण करें
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# दोनों वातावरणों को साफ़ करें
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

**Time Invested**: ~60-90 मिनट  
**Skills Acquired**:
- ✅ Template-based project initialization
- ✅ Azure resource provisioning
- ✅ Application deployment workflows
- ✅ Environment management
- ✅ Configuration management
- ✅ Resource cleanup and cost management

**Next Level**: आप [Configuration Guide](configuration.md) के लिए तैयार हैं ताकि उन्नत कॉन्फ़िगरेशन पैटर्न सीख सकें!

## Troubleshooting Common Issues

### Authentication Errors
```bash
# Azure के साथ पुनः प्रमाणीकरण करें
az login

# सदस्यता की पहुँच सत्यापित करें
az account show
```

### Deployment Failures
```bash
# डिबग लॉगिंग सक्षम करें
export AZD_DEBUG=true
azd up --debug

# Azure में एप्लिकेशन लॉग देखें
azd monitor --logs

# Container Apps के लिए Azure CLI का उपयोग करें:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Resource Name Conflicts
```bash
# एक अद्वितीय पर्यावरण नाम का उपयोग करें
azd env new dev-$(whoami)-$(date +%s)
```

### Port/Network Issues
```bash
# जांचें कि पोर्ट उपलब्ध हैं
netstat -an | grep :3000
netstat -an | grep :3100
```

## Next Steps

अब जब आपने अपना पहला प्रोजेक्ट पूरा कर लिया है, तो इन उन्नत विषयों का अन्वेषण करें:

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
# टेम्पलेट्स को श्रेणी के अनुसार ब्राउज़ करें
azd template list --filter web
azd template list --filter api
azd template list --filter database

# विभिन्न तकनीकी स्टैक्स आज़माएँ
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

**Congratulations on completing your first azd project!** आप अब आत्मविश्वास के साथ Azure पर शानदार एप्लिकेशन बनाने और तैनात करने के लिए तैयार हैं।

---

**Chapter Navigation:**
- **📚 Course Home**: [AZD शुरुआती के लिए](../../README.md)
- **📖 Current Chapter**: अध्याय 1 - आधार और त्वरित प्रारंभ
- **⬅️ Previous**: [Installation & Setup](installation.md)
- **➡️ Next**: [Bring Your Own App](bring-your-own-app.md)
- **🚀 Next Chapter**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
इस दस्तावेज़ का अनुवाद AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके किया गया है। जबकि हम सटीकता के लिए प्रयास करते हैं, कृपया ध्यान दें कि स्वचालित अनुवादों में त्रुटियाँ या अशुद्धियाँ हो सकती हैं। मूल दस्तावेज़ अपनी मूल भाषा में ही प्रामाणिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए, पेशेवर मानव अनुवाद की सिफारिश की जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए हम उत्तरदायी नहीं हैं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->