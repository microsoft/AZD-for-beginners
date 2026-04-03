# कमांड चीट शीट - आवश्यक AZD कमांड

**सभी अध्यायों के लिए त्वरित संदर्भ**
- **📚 कोर्स होम**: [AZD For Beginners](../README.md)
- **📖 त्वरित आरंभ**: [अध्याय 1: आधार और त्वरित आरंभ](../README.md#-chapter-1-foundation--quick-start)
- **🤖 एआई कमांड**: [अध्याय 2: एआई-प्रथम विकास](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 उन्नत**: [अध्याय 4: इंफ्रास्ट्रक्चर ऐज कोड](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## परिचय

यह व्यापक चीट शीट सबसे अधिक उपयोग किए जाने वाले Azure Developer CLI कमांड्स के लिए त्वरित संदर्भ प्रदान करती है, जिन्हें श्रेणीबद्ध करके व्यावहारिक उदाहरणों के साथ व्यवस्थित किया गया है। विकास, समस्या निवारण, और azd परियोजनाओं के साथ दैनिक संचालन के दौरान त्वरित खोज के लिए आदर्श।

## सीखने के लक्ष्य

इस चीट शीट का उपयोग करके, आप:
- आवश्यक Azure Developer CLI कमांड्स और सिंटैक्स तक त्वरित पहुंच प्राप्त करेंगे
- कमांड्स को कार्यात्मक श्रेणियों और उपयोग मामलों के अनुसार समझेंगे
- सामान्य विकास और परिनियोजन परिदृश्यों के लिए व्यावहारिक उदाहरण संदर्भित करेंगे
- त्वरित समस्या समाधान के लिए समस्या निवारण कमांड्स का उपयोग करेंगे
- उन्नत कॉन्फ़िगरेशन और अनुकूलन विकल्पों को कुशलतापूर्वक खोजेंगे
- पर्यावरण प्रबंधन और बहु-पर्यावरण वर्कफ़्लो कमांड्स पाएंगे

## सीखने के परिणाम

इस चीट शीट के नियमित संदर्भ के साथ, आप सक्षम होंगे:
- पूरी दस्तावेज़ीकरण के बिना आत्मविश्वास के साथ azd कमांड्स चलाना
- उपयुक्त निदान कमांड्स का उपयोग करके सामान्य समस्याओं को जल्दी हल करना
- एकाधिक पर्यावरणों और परिनियोजन परिदृश्यों का कुशलतापूर्वक प्रबंधन करना
- जरूरत के अनुसार उन्नत azd सुविधाओं और कॉन्फ़िगरेशन विकल्पों को लागू करना
- व्यवस्थित कमांड अनुक्रम का उपयोग करके परिनियोजन समस्याओं का समाधान करना
- azd शॉर्टकट्स और विकल्पों का प्रभावी उपयोग करके वर्कफ़्लोज़ का अनुकूलन करना

## शुरु करने वाले कमांड्स

### प्रमाणीकरण
```bash
# AZD के माध्यम से Azure में लॉगिन करें
azd auth login

# Azure CLI में लॉगिन करें (AZD इसके तहत उपयोग करता है)
az login

# वर्तमान खाता जांचें
az account show

# डिफ़ॉल्ट सदस्यता सेट करें
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# AZD से लॉगआउट करें
azd auth logout

# Azure CLI से लॉगआउट करें
az logout
```

### परियोजना आरंभिकरण
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

## कोर परिनियोजन कमांड्स

### पूर्ण परिनियोजन वर्कफ़्लो
```bash
# सब कुछ तैनात करें (प्रावधान + तैनाती)
azd up

# पुष्टि संकेतों को अक्षम करके तैनात करें
azd up --confirm-with-no-prompt

# विशिष्ट पर्यावरण में तैनात करें
azd up --environment production

# कस्टम पैरामीटर के साथ तैनात करें
azd up --parameter location=westus2
```

### केवल इंफ्रास्ट्रक्चर
```bash
# Azure संसाधनों की व्यवस्था करें
azd provision

# 🧪 पूर्वावलोकन अवसंरचना परिवर्तनों का
azd provision --preview
# दिखाता है कि कौन से संसाधन बनाए/परिवर्तित/हटाए जाएंगे, जिसका एक ड्राई-रन दृश्य होता है
# 'terraform plan' या 'bicep what-if' के समान - चलाने में सुरक्षित, कोई परिवर्तन लागू नहीं होगा
```

### केवल एप्लिकेशन
```bash
# एप्लिकेशन कोड तैनात करें
azd deploy

# विशिष्ट सेवा तैनात करें
azd deploy --service web
azd deploy --service api

# सभी सेवाएँ तैनात करें
azd deploy --all
```

### निर्माण और पैकेज
```bash
# एप्लिकेशन बनाएं
azd package

# विशिष्ट सेवा बनाएं
azd package --service api
```

## 🌍 पर्यावरण प्रबंधन

### पर्यावरण संचालन
```bash
# सभी वातावरणों की सूची बनाएं
azd env list

# नया वातावरण बनाएं
azd env new development
azd env new staging --location westus2

# वातावरण चुनें
azd env select production

# उपलब्ध वातावरण दिखाएं
azd env list

# वातावरण की स्थिति को ताज़ा करें
azd env refresh
```

### पर्यावरण चर
```bash
# पर्यावरण चर सेट करें
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# पर्यावरण चर प्राप्त करें
azd env get API_KEY

# सभी पर्यावरण चर सूचीबद्ध करें
azd env get-values

# पर्यावरण चर निकालें
azd env unset DEBUG
```

## ⚙️ कॉन्फ़िगरेशन कमांड्स

### वैश्विक कॉन्फ़िगरेशन
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

### परियोजना कॉन्फ़िगरेशन
```bash
# azure.yaml को मान्य करें
azd config validate

# परियोजना जानकारी दिखाएं
azd show

# सेवा एंडपॉइंट्स प्राप्त करें
azd show --output json
```

## 📊 निगरानी और निदान

### निगरानी डैशबोर्ड
```bash
# Azure पोर्टल मॉनिटरिंग डैशबोर्ड खोलें
azd monitor

# Application Insights लाइव मेट्रिक्स खोलें
azd monitor --live

# Application Insights लॉग ब्लेड खोलें
azd monitor --logs

# Application Insights अवलोकन खोलें
azd monitor --overview
```

### कंटेनर लॉग्स देखना
```bash
# Azure CLI के माध्यम से लॉग देखें (Container Apps के लिए)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# रीयल-टाइम में लॉग फॉलो करें
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Azure पोर्टल से लॉग देखें
azd monitor --logs
```

### लॉग एनालिटिक्स प्रश्न
```bash
# Azure पोर्टल के माध्यम से एक्सेस लॉग एनालिटिक्स
azd monitor --logs

# Azure CLI का उपयोग करके लॉग क्वेरी करें
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ रखरखाव कमांड्स

### सफाई
```bash
# सभी Azure संसाधन हटाएं
azd down

# पुष्टि के बिना ज़बरदस्ती हटाएं
azd down --force

# सॉफ्ट-डिलीट किए गए संसाधनों को पूरी तरह से हटाएं
azd down --purge

# पूर्ण सफाई
azd down --force --purge
```

### अपडेट्स
```bash
# azd अपडेट के लिए जांचें
azd version

# वर्तमान संस्करण प्राप्त करें
azd version

# वर्तमान कॉन्फ़िगरेशन देखें
azd config show
```

## 🔧 उन्नत कमांड्स

### पाइपलाइन और CI/CD
```bash
# GitHub Actions सेट करें
azd pipeline config

# Azure DevOps सेट करें
azd pipeline config --provider azdo

# पाइपलाइन कॉन्फ़िगरेशन दिखाएँ
azd pipeline show
```

### इन्फ्रास्ट्रक्चर प्रबंधन
```bash
# इन्फ्रास्ट्रक्चर टेम्पलेट्स उत्पन्न करें
azd infra generate

# 🧪 इन्फ्रास्ट्रक्चर पूर्वावलोकन और योजना बनाना
azd provision --preview
# तैनाती के बिना इन्फ्रास्ट्रक्चर प्रोविजनिंग का अनुकरण करता है
# Bicep/Terraform टेम्पलेट्स का विश्लेषण करता है और दिखाता है:
# - जो संसाधन जोड़े जाएँगे (हरा +)
# - जो संसाधन संशोधित किए जाएँगे (पीला ~)
# - जो संसाधन हटाए जाएँगे (लाल -)
# सुरक्षित रूप से चलाएं - Azure पर्यावरण में कोई वास्तविक परिवर्तन नहीं किया गया

# azure.yaml से इन्फ्रास्ट्रक्चर संश्लेषित करें
azd infra synth
```

### परियोजना जानकारी
```bash
# परियोजना स्थिति और एंडपॉइंट दिखाएं
azd show

# JSON के रूप में विस्तृत परियोजना जानकारी दिखाएं
azd show --output json

# सेवा एंडपॉइंट प्राप्त करें
azd show --output json | jq '.services'
```

## 🤖 एआई और एक्सटेंशंस कमांड्स

### AZD एक्सटेंशंस
```bash
# सभी उपलब्ध एक्सटेंशन्स की सूची बनाएं (AI सहित)
azd extension list

# Foundry एजेंट्स एक्सटेंशन इंस्टॉल करें
azd extension install azure.ai.agents

# फाइन-ट्यूनिंग एक्सटेंशन इंस्टॉल करें
azd extension install azure.ai.finetune

# कस्टम मॉडल एक्सटेंशन इंस्टॉल करें
azd extension install azure.ai.models

# सभी इंस्टॉल किए गए एक्सटेंशन्स को अपग्रेड करें
azd extension upgrade --all
```

### एआई एजेंट कमांड्स
```bash
# मैनिफेस्ट से एक एजेंट प्रोजेक्ट प्रारंभ करें
azd ai agent init -m <manifest-path-or-uri>

# एक विशिष्ट Foundry प्रोजेक्ट को लक्षित करें
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# एजेंट स्रोत निर्देशिका निर्दिष्ट करें
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# होस्टिंग लक्ष्य चुनें
azd ai agent init -m agent-manifest.yaml --host containerapp
```

### MCP सर्वर (अल्फा)
```bash
# अपने प्रोजेक्ट के लिए MCP सर्वर शुरू करें
azd mcp start

# MCP संचालन के लिए टूल सहमति प्रबंधित करें
azd copilot consent list
```

### इंफ्रास्ट्रक्चर जनरेशन
```bash
# अपने प्रोजेक्ट विवरण से IaC फ़ाइलें बनाएं
azd infra generate

# azure.yaml से इन्फ्रास्ट्रक्चर संश्लेषित करें
azd infra synth
```

---

## 🎯 त्वरित वर्कफ़्लोज़

### विकास वर्कफ़्लो
```bash
# नया प्रोजेक्ट शुरू करें
azd init --template todo-nodejs-mongo
cd my-project

# विकास में तैनाती करें
azd env new dev
azd up

# बदलाव करें और पुनः तैनात करें
azd deploy

# मॉनिटरिंग डैशबोर्ड खोलें
azd monitor --live
```

### बहु-पर्यावरण वर्कफ़्लो
```bash
# पर्यावरण सेट करें
azd env new dev
azd env new staging  
azd env new production

# विकास में तैनात करें
azd env select dev
azd up

# परीक्षण करें और स्टेजिंग में बढ़ावा दें
azd env select staging
azd up

# उत्पादन में तैनात करें
azd env select production
azd up
```

### समस्या निवारण वर्कफ़्लो
```bash
# डीबग मोड सक्षम करें
export AZD_DEBUG=true

# डिप्लॉयमेंट की स्थिति जांचें
azd show

# कॉन्फ़िगरेशन मान्य करें
azd config show

# लॉग के लिए मॉनिटरिंग डैशबोर्ड खोलें
azd monitor --logs

# संसाधन की स्थिति जांचें
azd show --output json
```

## 🔍 डिबगिंग कमांड्स

### डिबग जानकारी
```bash
# डिबग आउटपुट सक्षम करें
export AZD_DEBUG=true
azd <command> --debug

# साफ आउटपुट के लिए टेलीमेट्री अक्षम करें
export AZD_DISABLE_TELEMETRY=true

# वर्तमान कॉन्फ़िगरेशन जांचें
azd config show

# प्रमाणीकरण स्थिति जांचें
az account show
```

### टेम्पलेट डिबगिंग
```bash
# उपलब्ध टेम्पलेट्स को विवरण के साथ सूचीबद्ध करें
azd template list --output json

# टेम्पलेट जानकारी दिखाएं
azd template show <template-name>

# इनिशियलाइज़ेशन से पहले टेम्पलेट को मान्य करें
azd template validate <template-name>
```

## 📁 फ़ाइल और निर्देशिका कमांड्स

### परियोजना संरचना
```bash
# वर्तमान निर्देशिका संरचना दिखाएं
tree /f  # विंडोज़
find . -type f  # लिनक्स/macOS

# azd प्रोजेक्ट रूट पर जाएं
cd $(azd root)

# azd कॉन्फ़िगरेशन निर्देशिका दिखाएं
echo $AZD_CONFIG_DIR  # आमतौर पर ~/.azd
```

## 🎨 आउटपुट फॉर्मेटिंग

### JSON आउटपुट
```bash
# स्क्रिप्टिंग के लिए JSON आउटपुट प्राप्त करें
azd show --output json
azd env list --output json
azd config show --output json

# jq के साथ पार्स करें
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### टेबल आउटपुट
```bash
# तालिका के रूप में प्रारूपित करें
azd env list --output table

# तैनात सेवाओं को देखें
azd show --output json | jq '.services | keys'
```

## 🔧 सामान्य कमांड संयोजन

### स्वास्थ्य जांच स्क्रिप्ट
```bash
#!/bin/bash
# त्वरित स्वास्थ्य जांच
azd show
azd env get-values
azd monitor --logs
```

### परिनियोजन सत्यापन
```bash
#!/bin/bash
# पूर्व-तैनाती सत्यापन
azd show
azd provision --preview  # तैनाती से पहले परिवर्तनों का पूर्वावलोकन करें
az account show
```

### पर्यावरण तुलना
```bash
#!/bin/bash
# परिवेशों की तुलना करें
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### संसाधन सफाई स्क्रिप्ट
```bash
#!/bin/bash
# पुराने पर्यावरणों की सफाई करें
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 पर्यावरण चर

### सामान्य पर्यावरण चर
```bash
# एज्योर कॉन्फ़िगरेशन
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

# वातावरण को जबरदस्ती ताज़ा करें
azd env refresh

# सभी सेवाओं को फिर से तैनात करें
azd deploy

# तैनाती की स्थिति जांचें
azd show --output json
```

### पुनर्प्राप्ति कमांड्स
```bash
# विफल डिप्लॉयमेंट से पुनर्प्राप्ति - साफ करें और पुनः डिप्लॉय करें
azd down --force --purge
azd up

# केवल इन्फ्रास्ट्रक्चर का पुनः प्रावधान करें
azd provision

# केवल एप्लिकेशन को पुनः डिप्लॉय करें
azd deploy
```

## 💡 प्रो टिप्स

### तेज वर्कफ़्लो के लिए उपनाम
```bash
# अपनी .bashrc या .zshrc में जोड़ें
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### फंक्शन शॉर्टकट्स
```bash
# त्वरित पर्यावरण स्विचिंग
azd-env() {
    azd env select $1 && azd show
}

# निरीक्षण के साथ त्वरित तैनाती
azd-deploy-watch() {
    azd deploy --service $1 && azd monitor --live
}

# पर्यावरण स्थिति
azd-status() {
    echo "Current environment:"
    azd env get-values
    echo "Services:"
    azd show --output json | jq -r '.services | keys[]'
}
```

## 📖 सहायता और दस्तावेज़ीकरण

### सहायता प्राप्त करना
```bash
# सामान्य सहायता
azd --help
azd help

# कमांड-विशिष्ट सहायता
azd up --help
azd env --help
azd config --help

# संस्करण और निर्माण जानकारी दिखाएं
azd version
azd version --output json
```

### दस्तावेज़ीकरण लिंक
```bash
# ब्राउज़र में दस्तावेज़ खोलें
azd docs

# टेम्पलेट दस्तावेज़ दिखाएं
azd template show <template-name> --docs
```

---

**टिप**: इस चीट शीट को बुकमार्क करें और कमांड्स जल्दी खोजने के लिए `Ctrl+F` का उपयोग करें!

---

**नेविगेशन**
- **पिछला पाठ**: [प्रीफ्लाइट चेक्स](../docs/pre-deployment/preflight-checks.md)
- **अगला पाठ**: [शब्दसूची](glossary.md)

---

> **💡 क्या आप अपने संपादक में Azure कमांड सहायता चाहते हैं?** `npx skills add microsoft/github-copilot-for-azure` के साथ [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) इंस्टॉल करें — एआई, फाउंड्री, परिनियोजन, निदान, और अधिक के लिए 37 स्किल्स।

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:  
यह दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके अनूदित किया गया है। जबकि हम सटीकता के लिए प्रयासरत हैं, कृपया ध्यान दें कि स्वचालित अनुवादों में त्रुटियाँ या गलतियाँ हो सकती हैं। मूल दस्तावेज़ अपनी मूल भाषा में मान्यता प्राप्त स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए, पेशेवर मानव अनुवाद की सलाह दी जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या मिसअंतरप्रीटेशन के लिए हम जिम्मेदार नहीं हैं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->