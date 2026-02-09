# कमांड चीट शीट - आवश्यक AZD कमांड्स

**सर्व प्रकरणांसाठी जलद संदर्भ**
- **📚 कोर्स होम**: [AZD For Beginners](../README.md)
- **📖 क्विक स्टार्ट**: [Chapter 1: Foundation & Quick Start](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI कमांड्स**: [Chapter 2: AI-First Development](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 प्रगत**: [Chapter 4: Infrastructure as Code](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## परिचय

हा सर्वसमावेशक चीट शीट सर्वात सामान्य वापरल्या जाणाऱ्या Azure Developer CLI कमांड्ससाठी जलद संदर्भ प्रदान करतो, विभागानुसार क्रमवारी लावलेला आणि व्यावहारिक उदाहरणांसह. azd प्रकल्पांसह विकास, समस्या निवारण आणि दैनिक ऑपरेशन दरम्यान जलद शोधासाठी परिपूर्ण.

## शिकण्याची उद्दिष्टे

हा चीट शीट वापरून, आपण:
- आवश्यक Azure Developer CLI कमांड्स आणि सिंटॅक्सला त्वरित प्रवेश मिळवू शकता
- फंक्शनल विभागांनुसार आणि वापराच्या प्रकरणांनुसार कमांड्सची संघटना समजू शकता
- सामान्य विकास आणि तैनात केल्याच्या परिस्थितीसाठी व्यावहारिक उदाहरणांचे संदर्भ घेऊ शकता
- त्वरीत समस्या निवारणासाठी कमांड्स उपलब्ध आहेत
- प्रगत कॉन्फिगरेशन व सानुकूलन पर्याय सुलभपणे शोधू शकता
- पर्यावरण व्यवस्थापन आणि बहु-पर्यावरण वर्कफ्लो कमांड्स शोधू शकता

## शिकण्याचे परिणाम

या चीट शीटला नियमित संदर्भ देऊन, आपण सक्षम असाल:
- पूर्ण दस्तऐवज वाचण्याशिवाय आत्मविश्वासाने azd कमांड्स चालवू शकता
- योग्य निदान कमांड्स वापरून सामान्य समस्या त्वरीत सोडवू शकता
- बहु-पर्यावरणे आणि तैनात केल्याच्या परिस्थिता प्रभावीपणे व्यवस्थापित करू शकता
- आवश्यकतेनुसार प्रगत azd वैशिष्ट्ये आणि कॉन्फिगरेशन पर्याय लागू करू शकता
- पुनर्रचना प्रक्रिया वापरून तैनात केल्यातील समस्या शोधू आणि दूर करू शकता
- azd शॉर्टकट्स आणि पर्यायांचा प्रभावी वापर करून वर्कफ्लोज ऑप्टिमाइझ करू शकता

## सुरूवातीचे कमांड्स

### प्रमाणीकरण
```bash
# AZD द्वारे Azure मध्ये लॉगिन करा
azd auth login

# Azure CLI मध्ये लॉगिन करा (AZD हे खालीलप्रमाणे वापरते)
az login

# वर्तमान खाते तपासा
az account show

# डीफॉल्ट सदस्यता सेट करा
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# AZD मधून लॉगआउट करा
azd auth logout

# Azure CLI मधून लॉगआउट करा
az logout
```

### प्रकल्प प्रारंभिकरण
```bash
# उपलब्ध टेम्पलेट ब्राउझ करा
azd template list

# टेम्पलेटमधून प्रारंभ करा
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# सद्य निर्देशिकेत प्रारंभ करा
azd init .

# खास नावाने प्रारंभ करा
azd init --template todo-nodejs-mongo my-awesome-app
```

## मुख्य तैनात केल्याचे कमांड्स

### संपूर्ण तैनात केल्याचा वर्कफ्लो
```bash
# सर्व काही तैनात करा (प्रोव्हिजन + तैनात करा)
azd up

# पुष्टीकरण सूचना अक्षम करून तैनात करा
azd up --confirm-with-no-prompt

# विशिष्ट वातावरणात तैनात करा
azd up --environment production

# सानुकूल पॅरामीटर्ससह तैनात करा
azd up --parameter location=westus2
```

### केवळ इन्फ्रास्ट्रक्चर
```bash
# Azure संसाधने प्रदान करा
azd provision

# 🧪 पूर्वावलोकन इन्फ्रास्ट्रक्चर बदल
azd provision --preview
# कोणती संसाधने तयार/संपादित/काढून टाकली जातील याचा ड्राय-रन दृश्य दर्शवितो
# 'terraform plan' किंवा 'bicep what-if' सारखे - धोकादायक नाही, कोणतेही बदल लागू होत नाहीत
```

### केवळ अनुप्रयोग
```bash
# अर्जाचे कोड तैनात करा
azd deploy

# विशिष्ट सेवा तैनात करा
azd deploy --service web
azd deploy --service api

# सर्व सेवा तैनात करा
azd deploy --all
```

### बिल्ड आणि पॅकेज
```bash
# अ‍ॅप्लिकेशन्स तयार करा
azd package

# विशिष्ट सेवा तयार करा
azd package --service api
```

## 🌍 पर्यावरण व्यवस्थापन

### पर्यावरण ऑपरेशन्स
```bash
# सर्व वातावरणांची यादी करा
azd env list

# नवीन वातावरण तयार करा
azd env new development
azd env new staging --location westus2

# वातावरण निवडा
azd env select production

# वर्तमान वातावरण दाखवा
azd env show

# वातावरणाची स्थिती रीफ्रेश करा
azd env refresh
```

### पर्यावरण चल
```bash
# पर्यावरण चल सेट करा
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# पर्यावरण चल मिळवा
azd env get API_KEY

# सर्व पर्यावरण चलांची यादी करा
azd env get-values

# पर्यावरण चल काढा
azd env unset DEBUG
```

## ⚙️ कॉन्फिगरेशन कमांड्स

### जागतिक कॉन्फिगरेशन
```bash
# सर्व कॉन्फिगरेशन सूचीबद्ध करा
azd config list

# जागतिक डीफॉल्ट सेट करा
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# कॉन्फिगरेशन काढा
azd config unset defaults.location

# सर्व कॉन्फिगरेशन रीसेट करा
azd config reset
```

### प्रकल्प कॉन्फिगरेशन
```bash
# azure.yaml ची पडताळणी करा
azd config validate

# प्रकल्पाची माहिती दाखवा
azd show

# सेवा एंडपॉइंट्स मिळवा
azd show --output json
```

## 📊 निरीक्षण आणि निदान

### निरीक्षण डॅशबोर्ड
```bash
# Azure पोर्टल मॉनिटरिंग डॅशबोर्ड उघडा
azd monitor

# Application Insights लाईव्ह मेट्रिक्स उघडा
azd monitor --live

# Application Insights लॉग्ज ब्लेड उघडा
azd monitor --logs

# Application Insights आढावा उघडा
azd monitor --overview
```

### कंटेनर लॉग्स पाहाणे
```bash
# Azure CLI मार्फत लॉग पहा (कंटेनर अ‍ॅप्ससाठी)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# रिअल-टाइम मध्ये लॉग्स फॉलो करा
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Azure पोर्टलमधून लॉग पहा
azd monitor --logs
```

### लॉग विश्लेषण क्वेरीज
```bash
# Azure पोर्टलद्वारे ऍक्सेस लॉग अॅनालिटिक्स
azd monitor --logs

# Azure CLI वापरून लॉग क्वेरी करा
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ देखभाल कमांड्स

### साफसफाई
```bash
# सर्व Azure संसाधने काढून टाका
azd down

# पुष्टीकरणाशिवाय जबरदस्तीने हटवा
azd down --force

# सौम्य-नष्ट संसाधने पूर्णपणे हटवा
azd down --purge

# संपूर्ण स्वच्छता
azd down --force --purge
```

### अद्यतने
```bash
# azd अद्यतनांसाठी तपासा
azd version

# वर्तमान आवृत्ती मिळवा
azd version

# वर्तमान संरचना पहा
azd config list
```

## 🔧 प्रगत कमांड्स

### पाइपलाइन आणि CI/CD
```bash
# GitHub अॅक्शन्स कॉन्फिगर करा
azd pipeline config

# Azure DevOps कॉन्फिगर करा
azd pipeline config --provider azdo

# पाइपलाइन कॉन्फिगरेशन दाखवा
azd pipeline show
```

### इन्फ्रास्ट्रक्चर व्यवस्थापन
```bash
# इन्फ्रास्ट्रक्चर टेम्पलेट्स तयार करा
azd infra generate

# 🧪 इन्फ्रास्ट्रक्चर पूर्वावलोकन आणि नियोजन
azd provision --preview
# तैनात न करता इन्फ्रास्ट्रक्चर पुरवठा अनुकरण करते
# Bicep/Terraform टेम्पलेट्सचे विश्लेषण करते आणि दर्शविते:
# - जोडल्या जाणाऱ्या संसाधनांसाठी (तांबूस +)
# - सुधारित करावयाच्या संसाधनांसाठी (पिवळ्या ~)
# - हटविण्यात येणाऱ्या संसाधनांसाठी (लाल -)
# चालवायला सुरक्षित - Azure पर्यावरणात प्रत्यक्ष बदल झाले नाहीत

# azure.yaml मधून इन्फ्रास्ट्रक्चर संश्लेषित करा
azd infra synth
```

### प्रकल्प माहिती
```bash
# प्रकल्पाची स्थिती आणि एंडपॉइंट दाखवा
azd show

# प्रकल्पाची सविस्तर माहिती JSON स्वरूपात दाखवा
azd show --output json

# सेवा एंडपॉइंट मिळवा
azd show --output json | jq '.services'
```

## 🎯 जलद वर्कफ्लोज

### विकास वर्कफ्लो
```bash
# नवीन प्रकल्प सुरू करा
azd init --template todo-nodejs-mongo
cd my-project

# विकासासाठी तैनात करा
azd env new dev
azd up

# बदल करा आणि पुनः तैनात करा
azd deploy

# निरीक्षण डॅशबोर्ड उघडा
azd monitor --live
```

### बहु-पर्यावरण वर्कफ्लो
```bash
# वातावरण तयार करा
azd env new dev
azd env new staging  
azd env new production

# डेव्हलपमेंटसाठी तैनात करा
azd env select dev
azd up

# चाचणी करा आणि स्टेजिंगवर प्रमोट करा
azd env select staging
azd up

# उत्पादनासाठी तैनात करा
azd env select production
azd up
```

### समस्या निवारण वर्कफ्लो
```bash
# डीबग मोड सक्षम करा
export AZD_DEBUG=true

# तैनात स्थिती तपासा
azd show

# कॉन्फिगरेशन सत्यापित करा
azd config list

# लॉगसाठी मॉनिटरिंग डॅशबोर्ड उघडा
azd monitor --logs

# संसाधन स्थिती तपासा
azd show --output json
```

## 🔍 डिबगिंग कमांड्स

### डिबग माहिती
```bash
# डीबग आउटपुट सक्षम करा
export AZD_DEBUG=true
azd <command> --debug

# स्वच्छ आउटपुटसाठी टेलिमेट्री अक्षम करा
export AZD_DISABLE_TELEMETRY=true

# सध्याची संरचना तपासा
azd config list

# प्रमाणीकरण स्थिती तपासा
az account show
```

### टेम्पलेट डिबगिंग
```bash
# तपशीलांसह उपलब्ध साच्यांची यादी करा
azd template list --output json

# साच्याची माहिती दाखवा
azd template show <template-name>

# प्रारंभ करण्यापूर्वी साचा खरेदी करा
azd template validate <template-name>
```

## 📁 फाइल आणि निर्देशिका कमांड्स

### प्रकल्प रचना
```bash
# सध्याचा डायरेक्टरी संरचना दर्शवा
tree /f  # विंडोज
find . -type f  # लिनक्स/macOS

# azd प्रकल्पाच्या मूळ स्थानाकडे जा
cd $(azd root)

# azd कॉन्फिगरेशन डायरेक्टरी दर्शवा
echo $AZD_CONFIG_DIR  # सहसा ~/.azd
```

## 🎨 आउटपुट फॉरमॅटिंग

### JSON आउटपुट
```bash
# स्क्रिप्टिंगसाठी JSON आउटपुट मिळवा
azd show --output json
azd env list --output json
azd config list --output json

# jq ने पार्स करा
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### टेबल आउटपुट
```bash
# टेबल म्हणून स्वरूपित करा
azd env list --output table

# तैनात केलेल्या सेवांना पहा
azd show --output json | jq '.services | keys'
```

## 🔧 सामान्य कमांड संयोजना

### हेल्थ चेक स्क्रिप्ट
```bash
#!/bin/bash
# जलद आरोग्य तपासणी
azd show
azd env show
azd monitor --logs
```

### तैनात केल्याची पडताळणी
```bash
#!/bin/bash
# तैनात करण्यापूर्वी तपासणी
azd show
azd provision --preview  # तैनात करण्यापूर्वी बदलांची पूर्वदृश्य पाहणी करा
az account show
```

### पर्यावरण तुलना
```bash
#!/bin/bash
# वातावरणांची तुलना करा
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### संसाधन साफसफाई स्क्रिप्ट
```bash
#!/bin/bash
# जुने पर्यावरण स्वच्छ करा
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 पर्यावरण चल

### सामान्य पर्यावरण चल
```bash
# Azure संरचना
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# AZD संरचना
export AZD_DEBUG=true
export AZD_DISABLE_TELEMETRY=true
export AZD_CONFIG_DIR="~/.azd"

# अर्ज संरचना
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 आपत्कालीन कमांड्स

### जलद दुरुस्त्या
```bash
# प्रमाणीकरण रीसेट करा
az account clear
az login

# पर्यावरण जबरदस्ती पुनः ताजेतवाने करा
azd env refresh

# सर्व सेवा पुन्हा तैनात करा
azd deploy

# तैनाती स्थिती तपासा
azd show --output json
```

### पुनर्प्राप्ती कमांड्स
```bash
# अपयशी वितरणातून पुनर्प्राप्त करा - स्वच्छ करा आणि पुन्हा वितरण करा
azd down --force --purge
azd up

# केवळ इन्फ्रास्ट्रक्चर पुन्हा पुरवठा करा
azd provision

# केवळ अनुप्रयोग पुन्हा वितरण करा
azd deploy
```

## 💡 प्रो टिप्स

### जलद वर्कफ्लोसाठी उपनाम
```bash
# आपल्या .bashrc किंवा .zshrc मध्ये जोडा
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### फंक्शन शॉर्टकट्स
```bash
# जलद वातावरण बदलणे
azd-env() {
    azd env select $1 && azd show
}

# देखरेखीसह जलद वितरण
azd-deploy-watch() {
    azd deploy --service $1 && azd monitor --live
}

# वातावरणाचा स्थिती
azd-status() {
    echo "Current environment:"
    azd env show
    echo "Services:"
    azd show --output json | jq -r '.services | keys[]'
}
```

## 📖 मदत आणि दस्तऐवजीकरण

### मदत मिळवा
```bash
# सामान्य मदत
azd --help
azd help

# आदेश-विशिष्ट मदत
azd up --help
azd env --help
azd config --help

# आवृत्ती आणि बिल्ड माहिती दर्शवा
azd version
azd version --output json
```

### दस्तऐवजीकरण दुवे
```bash
# ब्राउझरमध्ये दस्तऐवज उघडा
azd docs

# टेम्पलेट दस्तऐवज दाखवा
azd template show <template-name> --docs
```

---

**टीप**: या चीट शीटला बुकमार्क करा आणि आपणास हव्या असलेल्या कमांड्स शोधण्यासाठी `Ctrl+F` वापरा!

---

**नेव्हिगेशन**
- **मागील धडा**: [Preflight Checks](../docs/pre-deployment/preflight-checks.md)
- **पुढील धडा**: [Glossary](glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
हे दस्तऐवज AI भाषांतर सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) च्या मदतीने भाषांतरित केलेले आहे. आपण अचूकतेसाठी प्रयत्न करत असलो तरी, कृपया लक्षात ठेवा की स्वयंचलित भाषांतरांमध्ये चुका किंवा अपूर्णता असू शकते. मूळ दस्तऐवज त्याच्या मूळ भाषेतच प्रामाणिक स्रोत मानला पाहिजे. महत्त्वाच्या माहितीसाठी व्यावसायिक मानवी भाषांतर सुचवले जाते. या भाषांतराच्या वापरामुळे उद्भवणाऱ्या कोणत्याही गैरसमजुती किंवा चुकीच्या अर्थसंग्रहांसाठी आम्ही जबाबदार नाही.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->