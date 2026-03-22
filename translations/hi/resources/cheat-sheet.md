# कमांड चीट शीट - आवश्यक AZD कमांड

**सभी अध्यायों के लिए त्वरित संदर्भ**
- **📚 Course Home**: [AZD शुरुआती लोगों के लिए](../README.md)
- **📖 Quick Start**: [अध्याय 1: आधार और त्वरित प्रारंभ](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI Commands**: [अध्याय 2: एआई-प्रथम विकास](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Advanced**: [अध्याय 4: इन्फ्रास्ट्रक्चर कोड के रूप में](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## परिचय

यह व्यापक चीट शीट सबसे अधिक उपयोग किए जाने वाले Azure Developer CLI कमांड्स का त्वरित संदर्भ प्रदान करती है, जिसे श्रेणीवार व्यवस्थित किया गया है और व्यावहारिक उदाहरणों के साथ दिया गया है। azd प्रोजेक्ट्स के साथ विकास, समस्या निवारण और दैनिक संचालन के दौरान त्वरित खोज के लिए यह आदर्श है।

## सीखने के लक्ष्य

इस चीट शीट का उपयोग करके, आप:
- आवश्यक Azure Developer CLI कमांड्स और सिन्टैक्स तक त्वरित पहुँच प्राप्त करेंगे
- कार्यात्मक श्रेणियों और उपयोग मामलों के अनुसार कमांड संगठन को समझेंगे
- सामान्य विकास और तैनाती परिदृश्यों के लिए व्यावहारिक उदाहरण संदर्भित करेंगे
- त्वरित समस्या समाधान के लिए समस्या निवारण कमांड्स तक पहुँच पाएंगे
- उन्नत कॉन्फ़िगरेशन और अनुकूलन विकल्पों को कुशलता से ढूंढ पाएंगे
- पर्यावरण प्रबंधन और बहु-पर्यावरण वर्कफ़्लो कमांड्स का स्थान जानेंगे

## सीखने के परिणाम

इस चीट शीट का नियमित संदर्भ लेने से, आप सक्षम होंगे:
- पूर्ण दस्तावेज़ देखे बिना azd कमांड्स आत्मविश्वास के साथ चलाने में
- उचित निदान कमांड्स का उपयोग करके सामान्य समस्याओं का शीघ्र समाधान करने में
- कई पर्यावरणों और तैनाती परिदृश्यों का कुशल प्रबंधन करने में
- आवश्यकतानुसार उन्नत azd फीचर्स और कॉन्फ़िगरेशन विकल्पों को लागू करने में
- व्यवस्थित कमांड अनुक्रमों का उपयोग करके तैनाती समस्याओं का समस्या निवारण करने में
- azd शॉर्टकट्स और विकल्पों के प्रभावी उपयोग के माध्यम से वर्कफ़्लो अनुकूलित करने में

## आरंभ करने के कमांड

### प्रमाणीकरण
```bash
# AZD के माध्यम से Azure में लॉगिन करें
azd auth login

# Azure CLI में लॉगिन करें (AZD इसे आंतरिक रूप से उपयोग करता है)
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

### परियोजना प्रारंभ
```bash
# उपलब्ध टेम्पलेट ब्राउज़ करें
azd template list

# टेम्पलेट से प्रारंभ करें
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# वर्तमान निर्देशिका में प्रारंभ करें
azd init .

# कस्टम नाम के साथ प्रारंभ करें
azd init --template todo-nodejs-mongo my-awesome-app
```

## मुख्य तैनाती कमांड्स

### पूर्ण तैनाती वर्कफ़्लो
```bash
# सब कुछ तैनात करें (प्राविजन + तैनाती)
azd up

# पुष्टि संकेतों को अक्षम करके तैनात करें
azd up --confirm-with-no-prompt

# विशिष्ट वातावरण में तैनात करें
azd up --environment production

# कस्टम पैरामीटरों के साथ तैनात करें
azd up --parameter location=westus2
```

### केवल इन्फ्रास्ट्रक्चर
```bash
# Azure संसाधनों का प्रावधान करें
azd provision

# 🧪 इन्फ्रास्ट्रक्चर परिवर्तनों का पूर्वावलोकन
azd provision --preview
# यह दिखाता है कि किन संसाधनों को बनाया/संशोधित/हटाया जाएगा — ड्राई-रन दृश्य
# यह 'terraform plan' या 'bicep what-if' के समान है - चलाने के लिए सुरक्षित, कोई परिवर्तन लागू नहीं किए जाते
```

### केवल एप्लिकेशन
```bash
# एप्लिकेशन कोड तैनात करें
azd deploy

# विशिष्ट सेवा तैनात करें
azd deploy --service web
azd deploy --service api

# सभी सेवाओं को तैनात करें
azd deploy --all
```

### बिल्ड और पैकेज
```bash
# एप्लिकेशन बनाएं
azd package

# विशिष्ट सेवा बनाएं
azd package --service api
```

## 🌍 पर्यावरण प्रबंधन

### पर्यावरण संचालन
```bash
# सभी पर्यावरणों को सूचीबद्ध करें
azd env list

# नया पर्यावरण बनाएं
azd env new development
azd env new staging --location westus2

# पर्यावरण चुनें
azd env select production

# वर्तमान पर्यावरण दिखाएं
azd env show

# पर्यावरण की स्थिति ताज़ा करें
azd env refresh
```

### पर्यावरण वेरिएबल्स
```bash
# पर्यावरण चर सेट करें
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# पर्यावरण चर प्राप्त करें
azd env get API_KEY

# सभी पर्यावरण चरों को सूचीबद्ध करें
azd env get-values

# पर्यावरण चर हटाएं
azd env unset DEBUG
```

## ⚙️ कॉन्फ़िगरेशन कमांड्स

### वैश्विक कॉन्फ़िगरेशन
```bash
# सभी कॉन्फ़िगरेशन सूचीबद्ध करें
azd config list

# वैश्विक डिफ़ॉल्ट सेट करें
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# कॉन्फ़िगरेशन हटाएं
azd config unset defaults.location

# सभी कॉन्फ़िगरेशन रीसेट करें
azd config reset
```

### परियोजना कॉन्फ़िगरेशन
```bash
# azure.yaml को सत्यापित करें
azd config validate

# परियोजना की जानकारी दिखाएँ
azd show

# सेवा एंडपॉइंट्स प्राप्त करें
azd show --output json
```

## 📊 मॉनिटरिंग और निदान

### मॉनिटरिंग डैशबोर्ड
```bash
# Azure पोर्टल निगरानी डैशबोर्ड खोलें
azd monitor

# Application Insights लाइव मेट्रिक्स खोलें
azd monitor --live

# Application Insights लॉग्स ब्लेड खोलें
azd monitor --logs

# Application Insights ओवरव्यू खोलें
azd monitor --overview
```

### कंटेनर लॉग्स देखना
```bash
# Azure CLI के माध्यम से लॉग देखें (Container Apps के लिए)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# लॉग वास्तविक समय में फॉलो करें
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Azure Portal से लॉग देखें
azd monitor --logs
```

### लॉग एनालिटिक्स क्वेरियाँ
```bash
# Azure पोर्टल के माध्यम से लॉग एनालिटिक्स तक पहुँचें
azd monitor --logs

# Azure CLI का उपयोग करके लॉग्स क्वेरी करें
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ रखरखाव कमांड्स

### क्लीनअप
```bash
# सभी Azure संसाधनों को हटाएं
azd down

# पुष्टि के बिना जबरदस्ती हटाएं
azd down --force

# सॉफ्ट-डिलीट किए गए संसाधनों को स्थायी रूप से हटाएं
azd down --purge

# पूर्ण सफाई
azd down --force --purge
```

### अपडेट्स
```bash
# azd अद्यतनों के लिए जाँच करें
azd version

# वर्तमान संस्करण प्राप्त करें
azd version

# वर्तमान विन्यास देखें
azd config list
```

## 🔧 उन्नत कमांड्स

### पाइपलाइन और CI/CD
```bash
# GitHub Actions को कॉन्फ़िगर करें
azd pipeline config

# Azure DevOps को कॉन्फ़िगर करें
azd pipeline config --provider azdo

# पाइपलाइन कॉन्फ़िगरेशन दिखाएँ
azd pipeline show
```

### इन्फ्रास्ट्रक्चर प्रबंधन
```bash
# इन्फ्रास्ट्रक्चर टेम्पलेट्स बनाएं
azd infra generate

# 🧪 इन्फ्रास्ट्रक्चर पूर्वावलोकन और योजना
azd provision --preview
# डिप्लॉय किए बिना इन्फ्रास्ट्रक्चर प्रोविजनिंग का अनुकरण करता है
# Bicep/Terraform टेम्पलेट्स का विश्लेषण करता है और दिखाता है:
# - जोड़े जाने वाले संसाधन (हरा +)
# - संशोधित किए जाने वाले संसाधन (पीला ~)
# - हटाए जाने वाले संसाधन (लाल -)
# चलाने के लिए सुरक्षित - Azure पर्यावरण में कोई वास्तविक परिवर्तन नहीं किए जाते हैं

# azure.yaml से इन्फ्रास्ट्रक्चर संश्लेषित करें
azd infra synth
```

### परियोजना जानकारी
```bash
# प्रोजेक्ट की स्थिति और एंडपॉइंट दिखाएँ
azd show

# विस्तृत प्रोजेक्ट जानकारी JSON के रूप में दिखाएँ
azd show --output json

# सेवा के एंडपॉइंट प्राप्त करें
azd show --output json | jq '.services'
```

## 🤖 एआई और एक्सटेंशन कमांड्स

### AZD एक्सटेंशन्स
```bash
# सभी उपलब्ध एक्सटेंशनों को सूचीबद्ध करें (AI सहित)
azd extension list

# Foundry agents एक्सटेंशन इंस्टॉल करें
azd extension install azure.ai.agents

# fine-tuning एक्सटेंशन इंस्टॉल करें
azd extension install azure.ai.finetune

# custom models एक्सटेंशन इंस्टॉल करें
azd extension install azure.ai.models

# सभी इंस्टॉल किए गए एक्सटेंशनों को अपग्रेड करें
azd extension upgrade --all
```

### AI एजेंट कमांड्स
```bash
# मानिफेस्ट से एक एजेंट प्रोजेक्ट आरंभ करें
azd ai agent init -m <manifest-path-or-uri>

# एक विशिष्ट Foundry प्रोजेक्ट को लक्षित करें
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# एजेंट स्रोत निर्देशिका निर्दिष्ट करें
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# एक होस्टिंग लक्ष्य चुनें
azd ai agent init -m agent-manifest.yaml --host containerapp
```

### MCP सर्वर (अल्फा)
```bash
# अपने प्रोजेक्ट के लिए MCP सर्वर शुरू करें
azd mcp start

# MCP संचालन के लिए टूल की सहमति प्रबंधित करें
azd mcp consent
```

### इन्फ्रास्ट्रक्चर जनरेशन
```bash
# अपनी परियोजना परिभाषा से IaC फ़ाइलें उत्पन्न करें
azd infra generate

# azure.yaml से बुनियादी ढाँचा संश्लेषित करें
azd infra synth
```

---

## 🎯 त्वरित वर्कफ़्लोज़

### विकास वर्कफ़्लो
```bash
# नई परियोजना शुरू करें
azd init --template todo-nodejs-mongo
cd my-project

# डेवलपमेंट वातावरण में परिनियोजित करें
azd env new dev
azd up

# परिवर्तन करें और पुनः परिनियोजित करें
azd deploy

# निगरानी डैशबोर्ड खोलें
azd monitor --live
```

### बहु-पर्यावरण वर्कफ़्लो
```bash
# पर्यावरण तैयार करें
azd env new dev
azd env new staging  
azd env new production

# डेव पर तैनात करें
azd env select dev
azd up

# परीक्षण करें और स्टेजिंग पर प्रमोट करें
azd env select staging
azd up

# प्रोडक्शन पर तैनात करें
azd env select production
azd up
```

### ट्रबलशूटिंग वर्कफ़्लो
```bash
# डिबग मोड सक्षम करें
export AZD_DEBUG=true

# परिनियोजन स्थिति जांचें
azd show

# कॉन्फ़िगरेशन सत्यापित करें
azd config list

# लॉग के लिए मॉनिटरिंग डैशबोर्ड खोलें
azd monitor --logs

# संसाधन स्थिति जांचें
azd show --output json
```

## 🔍 डीबगिंग कमांड्स

### डीबग जानकारी
```bash
# डिबग आउटपुट सक्षम करें
export AZD_DEBUG=true
azd <command> --debug

# साफ़ आउटपुट के लिए टेलीमेट्री अक्षम करें
export AZD_DISABLE_TELEMETRY=true

# वर्तमान कॉन्फ़िगरेशन की जाँच करें
azd config list

# प्रमाणीकरण की स्थिति जाँचें
az account show
```

### टेम्पलेट डीबगिंग
```bash
# उपलब्ध टेम्पलेट्स को विवरण सहित सूचीबद्ध करें
azd template list --output json

# टेम्पलेट की जानकारी दिखाएँ
azd template show <template-name>

# init से पहले टेम्पलेट को सत्यापित करें
azd template validate <template-name>
```

## 📁 फ़ाइल और निर्देशिका कमांड्स

### परियोजना संरचना
```bash
# वर्तमान निर्देशिका संरचना दिखाएँ
tree /f  # विंडोज़
find . -type f  # लिनक्स/macOS

# azd परियोजना की मूल निर्देशिका पर जाएँ
cd $(azd root)

# azd कॉन्फ़िगरेशन निर्देशिका दिखाएँ
echo $AZD_CONFIG_DIR  # आम तौर पर ~/.azd
```

## 🎨 आउटपुट फॉर्मैटिंग

### JSON आउटपुट
```bash
# स्क्रिप्टिंग के लिए JSON आउटपुट प्राप्त करें
azd show --output json
azd env list --output json
azd config list --output json

# jq के साथ पार्स करें
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### तालिका आउटपुट
```bash
# तालिका के रूप में प्रारूपित करें
azd env list --output table

# तैनात सेवाओं को देखें
azd show --output json | jq '.services | keys'
```

## 🔧 सामान्य कमांड संयोजन

### हेल्थ चेक स्क्रिप्ट
```bash
#!/bin/bash
# त्वरित स्वास्थ्य जांच
azd show
azd env show
azd monitor --logs
```

### तैनाती सत्यापन
```bash
#!/bin/bash
# तैनाती से पहले सत्यापन
azd show
azd provision --preview  # तैनात करने से पहले परिवर्तनों का पूर्वावलोकन करें
az account show
```

### पर्यावरण तुलना
```bash
#!/bin/bash
# पर्यावरणों की तुलना करें
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### संसाधन क्लीनअप स्क्रिप्ट
```bash
#!/bin/bash
# पुराने परिवेशों को साफ़ करें
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 पर्यावरण वेरिएबल्स

### सामान्य पर्यावरण वेरिएबल्स
```bash
# एज़्योर कॉन्फ़िगरेशन
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

## 🚨 आपातकालीन कमांड्स

### त्वरित समाधान
```bash
# प्रमाणीकरण रीसेट करें
az account clear
az login

# पर्यावरण को जबरदस्ती ताज़ा करें
azd env refresh

# सभी सेवाओं को पुनः तैनात करें
azd deploy

# तैनाती की स्थिति जाँचें
azd show --output json
```

### रिकवरी कमांड्स
```bash
# असफल तैनाती से उबरें - साफ़ करें और पुनः तैनात करें
azd down --force --purge
azd up

# केवल अवसंरचना का पुनःप्रावधान
azd provision

# केवल एप्लिकेशन को पुनः तैनात करें
azd deploy
```

## 💡 प्रो टिप्स

### तेज़ वर्कफ़्लो के लिए एलियास
```bash
# अपने .bashrc या .zshrc में जोड़ें
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### फ़ंक्शन शॉर्टकट्स
```bash
# त्वरित पर्यावरण बदलना
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
    azd env show
    echo "Services:"
    azd show --output json | jq -r '.services | keys[]'
}
```

## 📖 सहायता और दस्तावेज़

### सहायता प्राप्त करना
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

### दस्तावेज़ लिंक
```bash
# ब्राउज़र में दस्तावेज़ खोलें
azd docs

# टेम्पलेट दस्तावेज़ दिखाएँ
azd template show <template-name> --docs
```

---

**टिप**: इस चीट शीट को बुकमार्क करें और आवश्यक कमांड्स जल्दी ढूँढने के लिए `Ctrl+F` का उपयोग करें!

---

**नेविगेशन**
- **Previous Lesson**: [Preflight Checks](../docs/pre-deployment/preflight-checks.md)
- **Next Lesson**: [शब्दावली](glossary.md)

---

> **💡 क्या आप अपने एडिटर में Azure कमांड सहायता चाहते हैं?** इंस्टॉल करें [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) with `npx skills add microsoft/github-copilot-for-azure` — AI, Foundry, तैनाती, डायग्नोस्टिक्स, और अधिक के लिए 37 कौशल।

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
इस दस्तावेज़ का अनुवाद AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके किया गया है। हालाँकि हम सटीकता के लिए प्रयास करते हैं, कृपया ध्यान दें कि स्वचालित अनुवादों में त्रुटियाँ या असंगतियाँ हो सकती हैं। मूल दस्तावेज़ को उसकी मूल भाषा में आधिकारिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए, पेशेवर मानव अनुवाद की सिफारिश की जाती है। हम इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए उत्तरदायी नहीं हैं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->