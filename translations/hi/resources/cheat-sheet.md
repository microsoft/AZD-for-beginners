# Command Cheat Sheet - Essential AZD Commands

**Quick Reference for All Chapters**
- **📚 Course Home**: [AZD शुरुआती के लिए](../README.md)
- **📖 Quick Start**: [अध्याय 1: आधार और त्वरित शुरुआत](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI Commands**: [अध्याय 2: AI-प्रथम विकास](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Advanced**: [अध्याय 4: इन्फ्रास्ट्रक्चर कोड के रूप में](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Introduction

यह विस्तृत चीट शीट सबसे अधिक उपयोग किए जाने वाले Azure Developer CLI कमांड्स के लिए त्वरित संदर्भ प्रदान करती है, जिन्हें श्रेणीवार व्यावहारिक उदाहरणों के साथ व्यवस्थित किया गया है। यह azd प्रोजेक्ट्स के साथ विकास, समस्या निवारण और दैनिक संचालन के दौरान त्वरित संदर्भ के लिए उपयोगी है।

## Learning Goals

इस चीट शीट का उपयोग करके, आप:
- आवश्यक Azure Developer CLI कमांड्स और सिंटैक्स तक तुरंत पहुँच प्राप्त करेंगे
- कार्यात्मक श्रेणियों और उपयोग मामलों के अनुसार कमांड संगठन को समझेंगे
- सामान्य विकास और परिनियोजन परिदृश्यों के लिए व्यावहारिक उदाहरण संदर्भित करेंगे
- त्वरित समस्या समाधान के लिए निदान कमांड्स का उपयोग कर सकेंगे
- उन्नत कॉन्फ़िगरेशन और अनुकूलन विकल्पों को कुशलता से खोज पाएँगे
- वातावरण प्रबंधन और मल्टी-एनवायरनमेंट वर्कफ़्लो कमांड्स पाएँगे

## Learning Outcomes

नियमित संदर्भ के साथ, आप सक्षम होंगे:
- बिना पूर्ण दस्तावेज़ संदर्भ के azd कमांड्स को आत्मविश्वास के साथ निष्पादित करना
- उपयुक्त डायग्नोस्टिक कमांड्स का उपयोग करके सामान्य समस्याओं का शीघ्र समाधान करना
- कई वातावरणों और परिनियोजन परिदृश्यों का कुशलतापूर्वक प्रबंधन करना
- आवश्यकतानुसार उन्नत azd सुविधाओं और कॉन्फ़िगरेशन विकल्पों को लागू करना
- व्यवस्थित कमांड अनुक्रमों का उपयोग करके परिनियोजन मुद्दों का निदान करना
- azd शॉर्टकट्स और विकल्पों के प्रभावी उपयोग के माध्यम से वर्कफ़्लो का अनुकूलन करना

## Getting Started Commands

### Authentication
```bash
# AZD के माध्यम से Azure में लॉगिन करें
azd auth login

# Azure CLI में लॉगिन करें (AZD इसे पृष्ठभूमि में उपयोग करता है)
az login

# वर्तमान खाता जांचें
az account show

# डिफ़ॉल्ट सब्सक्रिप्शन सेट करें
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# AZD से लॉगआउट करें
azd auth logout

# Azure CLI से लॉगआउट करें
az logout
```

### Project Initialization
```bash
# उपलब्ध टेम्पलेट्स ब्राउज़ करें
azd template list

# टेम्पलेट से प्रारंभ करें
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# वर्तमान निर्देशिका में प्रारंभ करें
azd init .

# कस्टम नाम के साथ प्रारंभ करें
azd init --template todo-nodejs-mongo my-awesome-app
```

## Core Deployment Commands

### Complete Deployment Workflow
```bash
# सब कुछ तैनात करें (प्राविजन + तैनाती)
azd up

# पुष्टिकरण संकेतों को अक्षम करके तैनात करें
azd up --confirm-with-no-prompt

# विशिष्ट पर्यावरण में तैनात करें
azd up --environment production

# कस्टम पैरामीटर के साथ तैनात करें
azd up --parameter location=westus2
```

### Infrastructure Only
```bash
# Azure संसाधनों का प्रावधान करें
azd provision

# 🧪 बुनियादी ढांचे में होने वाले परिवर्तनों का पूर्वावलोकन
azd provision --preview
# यह ड्राय-रन दिखाता है कि कौन से संसाधन बनाए/संशोधित/हटाए जाएंगे
# यह 'terraform plan' या 'bicep what-if' के समान है - चलाने के लिए सुरक्षित है, कोई बदलाव लागू नहीं होते
```

### Application Only
```bash
# एप्लिकेशन कोड तैनात करें
azd deploy

# विशिष्ट सेवा तैनात करें
azd deploy --service web
azd deploy --service api

# सभी सेवाएँ तैनात करें
azd deploy --all
```

### Build and Package
```bash
# एप्लिकेशन की निर्भरताओं को पुनर्स्थापित (डाउनलोड) करें
azd restore

# किसी विशिष्ट सेवा को पुनर्स्थापित करें
azd restore --service api

# तैनात किए बिना एक तैनात करने योग्य आर्टिफैक्ट बनाएं
azd package

# विशिष्ट सेवा बनाएं
azd package --service api
```

> **`azd restore`** आपके ऐप की निर्भरताओं (npm, pip, NuGet, Maven, आदि) को डाउनलोड करता है। यह `azd package` और `azd deploy` के दौरान स्वचालित रूप से चलता है, इसलिए आप मुश्किल से ही इसे सीधे कॉल करेंगे—इसे मैन्युअल रूप से चलाएँ जब आप निर्भरताओं को पहले से फ़ेच करना चाहें (उदा., CI कैश को गर्म करने के लिए या बाद में ऑफ़लाइन काम करने के लिए)।
> 
> **`azd package`** परिनियोज्य आर्टिफैक्ट (एक कंटेनर इमेज या ज़िप) बनाता है **बिना** इसे Azure पर पुश किए। इसे अकेले उपयोग करें ताकि यह सत्यापित कर सकें कि बिल्ड सफल है, आउटपुट का निरीक्षण करें, या ऐसा आर्टिफैक्ट बनाएँ जिसे कोई अलग प्रक्रिया बाद में परिनियोजित करेगी। `azd deploy` स्वचालित रूप से पैकेज करता है, इसलिए केवल तब ही `azd package` की आवश्यकता होती है जब आप आर्टिफैक्ट को परिनियोजित किए बिना ही चाहते हों।

## 🌍 Environment Management

### Environment Operations
```bash
# सभी एनवायरनमेंट्स सूचीबद्ध करें
azd env list

# नया एनवायरनमेंट बनाएँ
azd env new development
azd env new staging --location westus2

# एनवायरनमेंट चुनें
azd env select production

# उपलब्ध एनवायरनमेंट्स दिखाएँ
azd env list

# एनवायरनमेंट की स्थिति ताज़ा करें
azd env refresh
```

### Environment Variables
```bash
# पर्यावरण चर सेट करें
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# पर्यावरण चर प्राप्त करें
azd env get API_KEY

# सभी पर्यावरण चर सूचीबद्ध करें
azd env get-values

# पर्यावरण चर हटाएँ
azd env unset DEBUG
```

## ⚙️ Configuration Commands

### Global Configuration
```bash
# सभी कॉन्फ़िगरेशन सूचीबद्ध करें
azd config show

# वैश्विक डिफ़ॉल्ट सेट करें
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# कॉन्फ़िगरेशन हटाएँ
azd config unset defaults.location

# सभी कॉन्फ़िगरेशन रीसेट करें
azd config reset
```

### Project Configuration
```bash
# azure.yaml को मान्य करें
azd config validate

# परियोजना जानकारी दिखाएँ
azd show

# सेवा एंडपॉइंट प्राप्त करें
azd show --output json
```

## 📊 Monitoring and Diagnostics

### Monitoring Dashboard
```bash
# Azure पोर्टल में मॉनिटरिंग डैशबोर्ड खोलें
azd monitor

# Application Insights के लाइव मेट्रिक्स खोलें
azd monitor --live

# Application Insights के लॉग्स ब्लेड खोलें
azd monitor --logs

# Application Insights का अवलोकन खोलें
azd monitor --overview
```

### Viewing Container Logs
```bash
# Azure CLI के माध्यम से लॉग देखें (Container Apps के लिए)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# लॉग्स को वास्तविक समय में फॉलो करें
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Azure Portal से लॉग देखें
azd monitor --logs
```

### Log Analytics Queries
```bash
# Azure पोर्टल के माध्यम से लॉग एनालिटिक्स तक पहुँच
azd monitor --logs

# Azure CLI का उपयोग करके लॉग्स क्वेरी करें
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Maintenance Commands

### Cleanup
```bash
# सभी Azure संसाधनों को हटाएँ
azd down

# पुष्टि के बिना बलपूर्वक हटाएँ
azd down --force

# सॉफ्ट-डिलीट किए गए संसाधनों को स्थायी रूप से हटाएँ
azd down --purge

# पूर्ण सफाई
azd down --force --purge
```

### Updates
```bash
# azd अपडेट्स की जाँच करें
azd version

# वर्तमान संस्करण प्राप्त करें
azd version

# वर्तमान कॉन्फ़िगरेशन देखें
azd config show
```

## 🔧 Advanced Commands

### Pipeline and CI/CD
```bash
# GitHub Actions को कॉन्फ़िगर करें
azd pipeline config

# Azure DevOps को कॉन्फ़िगर करें
azd pipeline config --provider azdo

# पाइपलाइन कॉन्फ़िगरेशन दिखाएं
azd pipeline show
```

### Infrastructure Management
```bash
# इन्फ्रास्ट्रक्चर टेम्पलेट बनाएं
azd infra generate

# 🧪 इन्फ्रास्ट्रक्चर पूर्वावलोकन और योजना
azd provision --preview
# डिप्लॉय किए बिना इन्फ्रास्ट्रक्चर प्रोविज़निंग का अनुकरण करता है
# Bicep/Terraform टेम्पलेट्स का विश्लेषण करता है और दिखाता है:
# - जो संसाधन जोड़े जाएंगे (हरा +)
# - जो संसाधन संशोधित किए जाएंगे (पीला ~)
# - जो संसाधन हटाए जाएंगे (लाल -)
# चलाने के लिए सुरक्षित - Azure वातावरण में कोई वास्तविक परिवर्तन नहीं किए जाते

# azure.yaml से इन्फ्रास्ट्रक्चर संश्लेषित करें
azd infra synth
```

### Project Information
```bash
# प्रोजेक्ट की स्थिति और एंडपॉइंट दिखाएँ
azd show

# विस्तृत प्रोजेक्ट जानकारी JSON के रूप में दिखाएँ
azd show --output json

# सेवा के एंडपॉइंट प्राप्त करें
azd show --output json | jq '.services'
```

## 🤖 AI & Extensions Commands

### AZD Extensions
```bash
# सभी उपलब्ध एक्सटेंशनों को सूचीबद्ध करें (AI सहित)
azd extension list

# Foundry एजेंट्स एक्सटेंशन इंस्टॉल करें
azd extension install azure.ai.agents

# एजेंट स्किल्स एक्सटेंशन (पूर्वावलोकन) इंस्टॉल करें
azd extension install azure.ai.skills

# Foundry कनेक्शन्स एक्सटेंशन (पूर्वावलोकन) इंस्टॉल करें
azd extension install azure.ai.connections

# फाइन-ट्यूनिंग एक्सटेंशन इंस्टॉल करें
azd extension install azure.ai.finetune

# कस्टम मॉडल्स एक्सटेंशन इंस्टॉल करें
azd extension install azure.ai.models

# सभी इंस्टॉल किए गए एक्सटेंशनों को अपग्रेड करें
azd extension upgrade --all
```

### AI Agent Commands
```bash
# मैनिफेस्ट से एक एजेंट प्रोजेक्ट आरंभ करें
azd ai agent init -m <manifest-path-or-uri>

# एक विशिष्ट Foundry प्रोजेक्ट को लक्षित करें
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# एजेंट स्रोत निर्देशिका निर्दिष्ट करें
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# होस्टिंग लक्ष्य चुनें
azd ai agent init -m agent-manifest.yaml --host containerapp

# डिप्लॉय किए गए एजेंट का परीक्षण करें (लेटेंसी और प्रथम-बाइट तक का समय प्रदर्शित करेगा)
azd ai agent invoke

# लाइव एंडपॉइंट कॉन्फ़िगरेशन दिखाएँ
azd ai agent endpoint show

# एक मूल्यांकन डेटासेट उत्पन्न करें, फिर एजेंट का अनुकूलन करें
azd ai agent eval generate
azd ai agent optimize

# कोड-आधारित होस्ट किए गए एजेंट का डिप्लॉय किया गया स्रोत डाउनलोड करें
azd ai agent code download

# एक होस्ट किए गए एजेंट और इसके सभी संस्करण हटाएँ (--force सक्रिय सत्र समाप्त कर देता है)
azd ai agent delete --force
```

### MCP Server (Alpha)
```bash
# अपने प्रोजेक्ट के लिए MCP सर्वर शुरू करें
azd mcp start

# MCP संचालन के लिए टूल की सहमति प्रबंधित करें
azd copilot consent list
```

### Infrastructure Generation
```bash
# अपने प्रोजेक्ट की परिभाषा से IaC फ़ाइलें उत्पन्न करें
azd infra generate

# azure.yaml से बुनियादी ढाँचा तैयार करें
azd infra synth
```

---

## 🎯 Quick Workflows

### Development Workflow
```bash
# नया प्रोजेक्ट शुरू करें
azd init --template todo-nodejs-mongo
cd my-project

# डेवलपमेंट में तैनात करें
azd env new dev
azd up

# परिवर्तन करें और पुनः तैनात करें
azd deploy

# मॉनिटरिंग डैशबोर्ड खोलें
azd monitor --live
```

### Multi-Environment Workflow
```bash
# पर्यावरण तैयार करें
azd env new dev
azd env new staging  
azd env new production

# विकास में तैनात करें
azd env select dev
azd up

# परीक्षण करें और स्टेजिंग में प्रमोट करें
azd env select staging
azd up

# उत्पादन में तैनात करें
azd env select production
azd up
```

### Troubleshooting Workflow
```bash
# डिबग मोड सक्षम करें
export AZD_DEBUG=true

# डिप्लॉयमेंट की स्थिति जाँचें
azd show

# कॉन्फ़िगरेशन सत्यापित करें
azd config show

# लॉग्स के लिए मॉनिटरिंग डैशबोर्ड खोलें
azd monitor --logs

# संसाधन की स्थिति जाँचें
azd show --output json
```

## 🔍 Debugging Commands

### Debug Information
```bash
# डिबग आउटपुट सक्षम करें
export AZD_DEBUG=true
azd <command> --debug

# साफ़ आउटपुट के लिए टेलीमेट्री अक्षम करें
export AZD_DISABLE_TELEMETRY=true

# वर्तमान कॉन्फ़िगरेशन जाँचें
azd config show

# प्रमाणीकरण की स्थिति जाँचें
az account show
```

### Template Debugging
```bash
# उपलब्ध टेम्पलेट्स को विवरण सहित सूचीबद्ध करें
azd template list --output json

# टेम्पलेट की जानकारी दिखाएँ
azd template show <template-name>

# init से पहले टेम्पलेट को मान्य करें
azd template validate <template-name>
```

## 📁 File and Directory Commands

### Project Structure
```bash
# वर्तमान निर्देशिका संरचना दिखाएँ
tree /f  # विंडोज़
find . -type f  # लिनक्स/मैकओएस

# azd प्रोजेक्ट रूट पर जाएँ
cd $(azd root)

# azd कॉन्फ़िगरेशन निर्देशिका दिखाएँ
echo $AZD_CONFIG_DIR  # आम तौर पर ~/.azd
```

## 🎨 Output Formatting

### JSON Output
```bash
# स्क्रिप्टिंग के लिए JSON आउटपुट प्राप्त करें
azd show --output json
azd env list --output json
azd config show --output json

# jq के साथ पार्स करें
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Table Output
```bash
# तालिका के रूप में प्रारूपित करें
azd env list --output table

# परिनियोजित सेवाओं को देखें
azd show --output json | jq '.services | keys'
```

## 🔧 Common Command Combinations

### Health Check Script
```bash
#!/bin/bash
# त्वरित स्वास्थ्य जांच
azd show
azd env get-values
azd monitor --logs
```

### Deployment Validation
```bash
#!/bin/bash
# तैनाती से पहले सत्यापन
azd show
azd provision --preview  # तैनाती से पहले परिवर्तनों का पूर्वावलोकन करें
az account show
```

### Environment Comparison
```bash
#!/bin/bash
# पर्यावरणों की तुलना करें
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### Resource Cleanup Script
```bash
#!/bin/bash
# पुराने परिवेशों को साफ़ करें
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 Environment Variables

### Common Environment Variables
```bash
# Azure कॉन्फ़िगरेशन
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# AZD कॉन्फ़िगरेशन
export AZD_DEBUG=true
export AZD_DISABLE_TELEMETRY=true
export AZD_CONFIG_DIR="~/.azd"

# एप्लिकेशन कॉन्फ़िगरेशन
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 Emergency Commands

### Quick Fixes
```bash
# प्रमाणीकरण रीसेट करें
az account clear
az login

# पर्यावरण को जबरदस्ती ताज़ा करें
azd env refresh

# सभी सेवाओं को पुनः तैनात करें
azd deploy

# तैनाती की स्थिति जांचें
azd show --output json
```

### Recovery Commands
```bash
# विफल तैनाती से उबरें - साफ़ करें और पुनःतैनात करें
azd down --force --purge
azd up

# केवल अवसंरचना का पुनःप्रावधान
azd provision

# केवल एप्लिकेशन की पुनःतैनाती
azd deploy
```

## 💡 Pro Tips

### Aliases for Faster Workflow
```bash
# अपने .bashrc या .zshrc में जोड़ें
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Function Shortcuts
```bash
# त्वरित पर्यावरण परिवर्तन
azd-env() {
    azd env select $1 && azd show
}

# निगरानी के साथ त्वरित तैनाती
azd-deploy-watch() {
    azd deploy --service $1 && azd monitor --live
}

# पर्यावरण की स्थिति
azd-status() {
    echo "Current environment:"
    azd env get-values
    echo "Services:"
    azd show --output json | jq -r '.services | keys[]'
}
```

## 📖 Help and Documentation

### Getting Help
```bash
# सामान्य सहायता
azd --help
azd help

# कमांड-विशिष्ट सहायता
azd up --help
azd env --help
azd config --help

# संस्करण और बिल्ड जानकारी दिखाएँ
azd version
azd version --output json
```

### Documentation Links
```bash
# ब्राउज़र में प्रलेखन खोलें
azd docs

# टेम्पलेट प्रलेखन दिखाएँ
azd template show <template-name> --docs
```

---

**टिप**: इस चीट शीट को बुकमार्क करें और आवश्यक कमांड जल्दी ढूंढने के लिए `Ctrl+F` का उपयोग करें!

---

**नेविगेशन**
- **Previous Lesson**: [पूर्व-नियोजन जांच](../docs/pre-deployment/preflight-checks.md)
- **Next Lesson**: [शब्दावली](glossary.md)

---

> **💡 क्या आप अपने एडिटर में Azure कमांड सहायता चाहते हैं?** [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) को `npx skills add microsoft/github-copilot-for-azure` के साथ इंस्टॉल करें — AI, Foundry, तैनाती, डायग्नोस्टिक्स, और अधिक के लिए 37 स्किल्स।

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
इस दस्तावेज़ का अनुवाद AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके किया गया है। जबकि हम सटीकता के लिए प्रयास करते हैं, कृपया ध्यान दें कि स्वचालित अनुवादों में त्रुटियाँ या अशुद्धियाँ हो सकती हैं। मूल दस्तावेज़ अपनी मूल भाषा में ही प्रामाणिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए, पेशेवर मानव अनुवाद की सिफारिश की जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए हम उत्तरदायी नहीं हैं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->