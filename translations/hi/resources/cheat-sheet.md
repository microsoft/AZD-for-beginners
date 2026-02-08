# कमांड चीट शीट - आवश्यक AZD कमांड

**सभी अध्यायों के लिए त्वरित संदर्भ**
- **📚 कोर्स होम**: [AZD शुरुआती के लिए](../README.md)
- **📖 त्वरित प्रारंभ**: [अध्याय 1: फाउंडेशन और त्वरित शुरुआत](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI कमांड्स**: [अध्याय 2: AI-प्रथम विकास](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 उन्नत**: [अध्याय 4: इन्फ्रास्ट्रक्चर ऐज़ कोड](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## परिचय

यह व्यापक चीट शीट सबसे अधिक उपयोग किए जाने वाले Azure Developer CLI कमांड्स के लिए त्वरित संदर्भ प्रदान करती है, कोटि के अनुसार व्यवस्थित और व्यावहारिक उदाहरणों के साथ। विकास, समस्या निवारण, और azd प्रोजेक्ट्स के दैनिक संचालन के दौरान त्वरित लुकअप के लिए यह परिपूर्ण है।

## सीखने के लक्ष्य

इस चीट शीट का उपयोग करके, आप:
- Azure Developer CLI के आवश्यक कमांड्स और विन्यास तक त्वरित पहुँच रखेंगे
- कार्यात्मक श्रेणियों और उपयोग मामलों के अनुसार कमांड के संगठन को समझेंगे
- सामान्य विकास और तैनाती परिदृश्यों के लिए व्यावहारिक उदाहरणों का संदर्भ पाएंगे
- तेज़ समस्या समाधान के लिए ट्रबलशूटिंग कमांड्स तक पहुँच प्राप्त करेंगे
- उन्नत कॉन्फ़िगरेशन और कस्टमाइज़ेशन विकल्पों को कुशलतापूर्वक खोज सकेंगे
- पर्यावरण प्रबंधन और बहु-पर्यावरण वर्कफ़्लो कमांड्स को ढूंढ पाएंगे

## सीखने के परिणाम

इस चीट शीट का नियमित संदर्भ लेकर, आप सक्षम होंगे:
- पूर्ण दस्तावेज़ का संदर्भ लिए बिना azd कमांड्स को आत्मविश्वास के साथ निष्पादित करना
- उपयुक्त डायग्नोस्टिक कमांड्स का उपयोग करके सामान्य समस्याओं को जल्दी हल करना
- कई वातावरणों और तैनाती परिदृश्यों का कुशलतापूर्वक प्रबंधन करना
- आवश्यकता अनुसार उन्नत azd सुविधाओं और कॉन्फ़िगरेशन विकल्पों को लागू करना
- व्यवस्थित कमांड अनुक्रमों का उपयोग करके तैनाती समस्याओं का ट्रबलशूटिंग करना
- azd शॉर्टकट्स और विकल्पों के प्रभावी उपयोग के माध्यम से वर्कफ़्लो को अनुकूलित करना

## आरंभ करने के कमांड

### प्रमाणीकरण
```bash
# AZD के माध्यम से Azure में लॉग इन
azd auth login

# Azure CLI में लॉग इन (AZD इसे आंतरिक रूप से उपयोग करता है)
az login

# वर्तमान खाता जांचें
az account show

# डिफ़ॉल्ट सब्सक्रिप्शन सेट करें
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# AZD से लॉग आउट
azd auth logout

# Azure CLI से लॉग आउट
az logout
```

### परियोजना प्रारंभिकरण
```bash
# उपलब्ध टेम्पलेट देखें
azd template list

# टेम्पलेट से प्रारंभ करें
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# वर्तमान निर्देशिका में प्रारंभ करें
azd init .

# कस्टम नाम के साथ प्रारंभ करें
azd init --template todo-nodejs-mongo my-awesome-app
```

## कोर तैनाती कमांड्स

### पूर्ण तैनाती वर्कफ़्लो
```bash
# सब कुछ तैनात करें (प्रोविजन + परिनियोजन)
azd up

# पुष्टि संकेतों को अक्षम करके तैनात करें
azd up --confirm-with-no-prompt

# विशिष्ट वातावरण में तैनात करें
azd up --environment production

# कस्टम पैरामीटरों के साथ तैनात करें
azd up --parameter location=westus2
```

### केवल अवसंरचना
```bash
# Azure संसाधनों का प्रावधान करें
azd provision

# 🧪 अवसंरचना परिवर्तनों का पूर्वावलोकन
azd provision --preview
# यह दिखाता है कि कौन से संसाधन बनाए, संशोधित या हटाए जाएँगे (ड्राई-रन दृश्य)
# यह 'terraform plan' या 'bicep what-if' के समान है - चलाने के लिए सुरक्षित, कोई परिवर्तन लागू नहीं होंगे
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
# सभी परिवेश सूचीबद्ध करें
azd env list

# नया परिवेश बनाएं
azd env new development
azd env new staging --location westus2

# परिवेश चुनें
azd env select production

# वर्तमान परिवेश दिखाएं
azd env show

# परिवेश की स्थिति ताज़ा करें
azd env refresh
```

### पर्यावरण वेरिएबल्स
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

## ⚙️ कॉन्फ़िगरेशन कमांड्स

### वैश्विक कॉन्फ़िगरेशन
```bash
# सभी कॉन्फ़िगरेशन सूचीबद्ध करें
azd config list

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

# परियोजना जानकारी दिखाएँ
azd show

# सेवा एंडपॉइंट प्राप्त करें
azd show --output json
```

## 📊 मॉनिटरिंग और डायग्नोस्टिक्स

### मॉनिटरिंग डैशबोर्ड
```bash
# Azure पोर्टल का मॉनिटरिंग डैशबोर्ड खोलें
azd monitor

# Application Insights के लाइव मेट्रिक्स खोलें
azd monitor --live

# Application Insights के लॉग्स ब्लेड खोलें
azd monitor --logs

# Application Insights का ओवरव्यू खोलें
azd monitor --overview
```

### कंटेनर लॉग्स देखना
```bash
# Azure CLI के माध्यम से लॉग देखें (Container Apps के लिए)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# लॉग्स को वास्तविक समय में देखें
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Azure पोर्टल से लॉग देखें
azd monitor --logs
```

### लॉग एनालिटिक्स क्वेरीज़
```bash
# Azure पोर्टल के माध्यम से Log Analytics तक पहुँचें
azd monitor --logs

# Azure CLI का उपयोग करके लॉग्स क्वेरी करें
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ रखरखाव कमांड्स

### क्लीनअप
```bash
# सभी Azure संसाधनों को हटाएँ
azd down

# पुष्टि के बिना जबरन हटाएँ
azd down --force

# सॉफ्ट-डिलीट किए गए संसाधनों को स्थायी रूप से हटाएँ
azd down --purge

# संपूर्ण सफाई
azd down --force --purge
```

### अपडेट्स
```bash
# azd अपडेट्स के लिए जाँच करें
azd version

# वर्तमान संस्करण प्राप्त करें
azd version

# वर्तमान कॉन्फ़िगरेशन देखें
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
# इन्फ्रास्ट्रक्चर टेम्पलेट बनाएँ
azd infra generate

# 🧪 इन्फ्रास्ट्रक्चर पूर्वावलोकन और योजना
azd provision --preview
# तैनात किए बिना इन्फ्रास्ट्रक्चर प्रोविजनिंग का अनुकरण करता है
# Bicep/Terraform टेम्पलेट्स का विश्लेषण करता है और दिखाता है:
# - जो संसाधन जोड़े जाएँगे (हरा +)
# - जो संसाधन संशोधित किए जाएँगे (पीला ~)
# - जो संसाधन हटाए जाएँगे (लाल -)
# चलाने के लिए सुरक्षित - Azure वातावरण में कोई वास्तविक परिवर्तन नहीं किए जाते हैं

# azure.yaml से इन्फ्रास्ट्रक्चर संश्लेषित करें
azd infra synth
```

### परियोजना जानकारी
```bash
# परियोजना की स्थिति और एंडपॉइंट्स दिखाएँ
azd show

# विस्तृत परियोजना जानकारी JSON के रूप में दिखाएँ
azd show --output json

# सेवा के एंडपॉइंट्स प्राप्त करें
azd show --output json | jq '.services'
```

## 🎯 त्वरित वर्कफ़्लो

### विकास वर्कफ़्लो
```bash
# नया प्रोजेक्ट शुरू करें
azd init --template todo-nodejs-mongo
cd my-project

# विकास वातावरण पर तैनात करें
azd env new dev
azd up

# बदलाव करें और पुनः तैनात करें
azd deploy

# मॉनिटरिंग डैशबोर्ड खोलें
azd monitor --live
```

### बहु-पर्यावरण वर्कफ़्लो
```bash
# पर्यावरण तैयार करें
azd env new dev
azd env new staging  
azd env new production

# देव पर परिनियोजित करें
azd env select dev
azd up

# परीक्षण करें और स्टेजिंग पर प्रमोट करें
azd env select staging
azd up

# उत्पादन पर परिनियोजित करें
azd env select production
azd up
```

### ट्रबलशूटिंग वर्कफ़्लो
```bash
# डिबग मोड सक्षम करें
export AZD_DEBUG=true

# तैनाती की स्थिति जांचें
azd show

# कॉन्फ़िगरेशन सत्यापित करें
azd config list

# लॉग्स के लिए मॉनिटरिंग डैशबोर्ड खोलें
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

# स्वच्छ आउटपुट के लिए टेलीमेट्री अक्षम करें
export AZD_DISABLE_TELEMETRY=true

# वर्तमान कॉन्फ़िगरेशन जांचें
azd config list

# प्रमाणीकरण की स्थिति जांचें
az account show
```

### टेम्पलेट डिबगिंग
```bash
# उपलब्ध टेम्पलेट्स को विवरण के साथ सूचीबद्ध करें
azd template list --output json

# टेम्पलेट की जानकारी दिखाएँ
azd template show <template-name>

# init से पहले टेम्पलेट को सत्यापित करें
azd template validate <template-name>
```

## 📁 फ़ाइल और डायरेक्टरी कमांड्स

### परियोजना संरचना
```bash
# वर्तमान निर्देशिका संरचना दिखाएँ
tree /f  # विंडोज़
find . -type f  # Linux/macOS

# azd परियोजना की रूट निर्देशिका पर जाएँ
cd $(azd root)

# azd कॉन्फ़िगरेशन निर्देशिका दिखाएँ
echo $AZD_CONFIG_DIR  # आमतौर पर ~/.azd
```

## 🎨 आउटपुट फ़ॉर्मेटिंग

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

### टेबल आउटपुट
```bash
# तालिका के रूप में स्वरूपित करें
azd env list --output table

# परिनियोजित सेवाएँ देखें
azd show --output json | jq '.services | keys'
```

## 🔧 सामान्य कमांड संयोजन

### हेल्थ चेक स्क्रिप्ट
```bash
#!/bin/bash
# Quick स्वास्थ्य जांच
azd show
azd env show
azd monitor --logs
```

### तैनाती वैलिडेशन
```bash
#!/bin/bash
# तैनाती से पहले सत्यापन
azd show
azd provision --preview  # तैनात करने से पहले परिवर्तनों का पूर्वावलोकन
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

# वातावरण को मजबूरन ताज़ा करें
azd env refresh

# सभी सेवाओं को पुनः तैनात करें
azd deploy

# तैनाती की स्थिति जांचें
azd show --output json
```

### रिकवरी कमांड्स
```bash
# असफल तैनाती से उबरें - साफ़ करें और पुनः तैनात करें
azd down --force --purge
azd up

# केवल इन्फ्रास्ट्रक्चर का पुनःप्रावधान
azd provision

# केवल एप्लिकेशन को पुनः तैनात करें
azd deploy
```

## 💡 प्रो टिप्स

### तेज़ वर्कफ़्लो के लिए एलियासेस
```bash
# अपने .bashrc या .zshrc में जोड़ें
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### फ़ंक्शन शॉर्टकट्स
```bash
# पर्यावरणों के बीच त्वरित स्विच
azd-env() {
    azd env select $1 && azd show
}

# निगरानी के साथ त्वरित परिनियोजन
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

## 📖 मदद और दस्तावेज़

### मदद प्राप्त करना
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

**टिप**: इस चीट शीट को बुकमार्क करें और जिन कमांड्स की आपको आवश्यकता हो उन्हें जल्दी खोजने के लिए `Ctrl+F` का उपयोग करें!

---

**नेविगेशन**
- **पिछला पाठ**: [प्रीफ़्लाइट चेक्स](../docs/pre-deployment/preflight-checks.md)
- **अगला पाठ**: [शब्दावली](glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
अस्वीकरण:
यह दस्तावेज़ AI अनुवाद सेवा Co-op Translator (https://github.com/Azure/co-op-translator) का उपयोग करके अनुवादित किया गया है। हम सटीकता के लिए प्रयासरत हैं, फिर भी कृपया ध्यान दें कि स्वचालित अनुवादों में त्रुटियाँ या अशुद्धियाँ हो सकती हैं। मूल दस्तावेज़ अपनी मूल भाषा में आधिकारिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए पेशेवर मानव अनुवाद की सिफारिश की जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए हम उत्तरदायी नहीं हैं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->