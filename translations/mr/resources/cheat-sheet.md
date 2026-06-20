# कमांड चीट शीट - आवश्यक AZD कमांड्स

**सर्व अध्यायांसाठी जलद संदर्भ**
- **📚 कोर्स होम**: [AZD सुरुवातीसाठी](../README.md)
- **📖 जलद सुरूवात**: [अध्याय 1: पाया आणि जलद सुरूवात](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI कमांड्स**: [अध्याय 2: AI-फर्स्ट डेव्हलपमेंट](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 प्रगत**: [अध्याय 4: इन्फ्रास्ट्रक्चर अॅज कोड](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## परिचय

हा सर्वसमावेशक चीट शीट सर्वाधिक वापरल्या जाणाऱ्या Azure Developer CLI कमांडसाठी जलद संदर्भ पुरवतो, विभागानिहाय व्यावहारिक उदाहरणांसह आयोजित. azd प्रकल्पांसह विकास, समस्या निराकरण आणि दैनंदिन ऑपरेशन्स दरम्यान जलद शोधासाठी उत्तम.

## शिकण्याचे उद्दिष्टे

या चीट शीटचा वापर करून, आपण:
- आवश्यक Azure Developer CLI कमांडस आणि सिंटॅक्सवर तात्काळ प्रवेश मिळवू शकता
- कमांडची कार्यात्मक विभागांनुसार आणि वापराच्या प्रकरणांनुसार संघटना समजू शकता
- सर्वसामान्य विकास आणि तैनात करण्याच्या परिस्थितींसाठी व्यावहारिक उदाहरणे पाहू शकता
- समस्यांचे जलद निराकरण करण्यासाठी समस्या निवारण कमांड्स वापरू शकता
- प्रगत कॉन्फिगरेशन आणि सानुकूलन पर्याय कार्यक्षमतेने शोधू शकता
- पर्यावरण व्यवस्थापन आणि बहु-पर्यावरण कार्यप्रवाह कमांड्ससाठी प्रवेश करू शकता

## शिकण्याचे परिणाम

या चीट शीटचा नियमित संदर्भ घेतल्यास, आपण सक्षम असाल:
- पूर्ण दस्तऐवज न पाहता विश्वासाने azd कमांड कार्यान्वित करण्यास
- योग्य निदान कमांडस वापरून सामान्य समस्या लवकर सोडविण्यास
- एकाधिक पर्यावरणे आणि तैनात करण्याच्या परिस्थितींचे कार्यक्षम व्यवस्थापन करण्यास
- आवश्यक असल्यास प्रगत azd वैशिष्ट्ये आणि कॉन्फिगरेशन पर्याय लागू करण्यास
- प्रणालीबद्ध कमांड अनुक्रम वापरून तैनात करण्याच्या समस्यांचे निराकरण करण्यास
- azd शॉर्टकट्स आणि पर्यायांचा प्रभावी वापर करून कार्यप्रवाह सुधारण्यास

## सुरू करण्याचे कमांड्स

### प्रमाणीकरण
```bash
# AZD द्वारे Azure मध्ये लॉगिन करा
azd auth login

# Azure CLI मध्ये लॉगिन करा (AZD हे अंतर्गतपणे वापरते)
az login

# सध्याचे खाते तपासा
az account show

# डीफॉल्ट सबस्क्रिप्शन सेट करा
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# AZD मधून लॉगआउट करा
azd auth logout

# Azure CLI मधून लॉगआउट करा
az logout
```

### प्रकल्प प्रारंभ
```bash
# उपलब्ध साचे ब्राउझ करा
azd template list

# साच्यापासून प्रारंभ करा
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# चालू निर्देशिकेत प्रारंभ करा
azd init .

# सानुकूल नावाने प्रारंभ करा
azd init --template todo-nodejs-mongo my-awesome-app
```

## मुख्य तैनात कमांड्स

### संपूर्ण तैनात कार्यप्रवाह
```bash
# सगळं तैनात करा (प्राव्हिजन + तैनात)
azd up

# पुष्टीकरण सूचना बंद करून तैनात करा
azd up --confirm-with-no-prompt

# विशिष्ट पर्यावरणात तैनात करा
azd up --environment production

# सानुकूल पॅरामीटर्ससह तैनात करा
azd up --parameter location=westus2
```

### फक्त इन्फ्रास्ट्रक्चर
```bash
# Azure संसाधने उपलब्ध करा
azd provision

# 🧪 पूर्वावलोकन इन्फ्रास्ट्रक्चर बदल
azd provision --preview
# कोणती संसाधने तयार/संशोधित/काढली जातील याचा ड्राय-रन दृश्य दर्शविते
# 'terraform plan' किंवा 'bicep what-if' सारखे - चालविण्यास सुरक्षित, कोणतेही बदल लागू नाहीत
```

### फक्त अॅप्लिकेशन
```bash
# अनुप्रयोग कोड तैनात करा
azd deploy

# विशिष्ट सेवा तैनात करा
azd deploy --service web
azd deploy --service api

# सर्व सेवा तैनात करा
azd deploy --all
```

### बांधणी आणि पॅकेजिंग
```bash
# अनुप्रयोग अवलंबित्व पुनर्संचयित करा (डाउनलोड करा)
azd restore

# विशिष्ट सेवा पुनर्संचयित करा
azd restore --service api

# तैनात न करता तैनात करण्यायोग्य आर्टिफॅक्ट तयार करा
azd package

# विशिष्ट सेवा तयार करा
azd package --service api
```

> **`azd restore`** आपले अॅपचे अवलंबित्व (npm, pip, NuGet, Maven, इ.) डाउनलोड करते. हे `azd package` आणि `azd deploy` दरम्यान आपोआप चालते, त्यामुळे आपण ते थेट क्वचितच कॉल करता—दुसऱ्या उदाहरणार्थ, CI कॅश गरम करण्यासाठी किंवा नंतर ऑफलाइन कामासाठी ते मॅन्युअली चालवा.

> **`azd package`** तैनात करण्यायोग्य आर्टिफॅक्ट (कंटेनर इमेज किंवा झिप) तयार करते **पण** ते Azure वर पुश करत नाही. बांधणी यशस्वी झाली आहे का ते तपासण्यासाठी, आउटपुट पाहण्यासाठी किंवा नंतर वेगळ्या प्रक्रियेमार्फत तैनात करणारा आर्टिफॅक्ट तयार करण्यासाठी स्वतंत्रपणे वापरा. `azd deploy` आपोआप पॅकेजिंग करते, त्यामुळे तैनात न करता फक्त आर्टिफॅक्ट पाहिजे असल्यास `azd package` वापरा.

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

# उपलब्ध वातावरण दाखवा
azd env list

# वातावरणाची स्थिती रिफ्रेश करा
azd env refresh
```

### पर्यावरण चलन
```bash
# पर्यावरण चल सेट करा
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# पर्यावरण चल मिळवा
azd env get API_KEY

# सर्व पर्यावरण चाले यादी करा
azd env get-values

# पर्यावरण चल काढा
azd env unset DEBUG
```

## ⚙️ कॉन्फिगरेशन कमांड्स

### जागतिक कॉन्फिगरेशन
```bash
# सर्व संरचना यादी करा
azd config show

# जागतिक डीफॉल्ट सेट करा
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# संरचना काढा
azd config unset defaults.location

# सर्व संरचना रीसेट करा
azd config reset
```

### प्रकल्प कॉन्फिगरेशन
```bash
# azure.yaml सत्यापित करा
azd config validate

# प्रकल्पाची माहिती दाखवा
azd show

# सेवा एंडपॉइंट मिळवा
azd show --output json
```

## 📊 मॉनिटरिंग आणि निदान

### मॉनिटरिंग डॅशबोर्ड
```bash
# Azure पोर्टल मॉनिटरिंग डॅशबोर्ड उघडा
azd monitor

# Application Insights लाइव्ह मेट्रिक्स उघडा
azd monitor --live

# Application Insights लॉग ब्लेड उघडा
azd monitor --logs

# Application Insights विहंगावलोकन उघडा
azd monitor --overview
```

### कंटेनर लॉग्स पाहणी
```bash
# Azure CLI द्वारे लॉग्स पहा (Container Apps साठी)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# रियल-टाइममध्ये लॉग्स फॉलो करा
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Azure Portal मधून लॉग्स पहा
azd monitor --logs
```

### लॉग अॅनालिटिक्स क्वेरीज
```bash
# Azure पोर्टलद्वारे ऍक्सेस लॉग विश्लेषण करा
azd monitor --logs

# Azure CLI वापरून लॉग क्वेरी करा
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ देखभाल कमांड्स

### साफसफाई
```bash
# सर्व Azure संसाधने काढा
azd down

# पुष्टीकरणाशिवाय जबरदस्ती हटवा
azd down --force

# सॉफ्ट-डिलिटेड संसाधने पुर्णपणे नष्ट करा
azd down --purge

# संपूर्ण स्वच्छता करा
azd down --force --purge
```

### अद्यतने
```bash
# azd अद्यतने तपासा
azd version

# वर्तमान आवृत्ती मिळवा
azd version

# वर्तमान संरचना पहा
azd config show
```

## 🔧 प्रगत कमांड्स

### पाइपलाइन आणि CI/CD
```bash
# GitHub Actions कॉन्फिगर करा
azd pipeline config

# Azure DevOps कॉन्फिगर करा
azd pipeline config --provider azdo

# पाइपलाइन कॉन्फिगरेशन दाखवा
azd pipeline show
```

### इन्फ्रास्ट्रक्चर व्यवस्थापन
```bash
# इन्फ्रास्ट्रक्चर टेम्पलेट तयार करा
azd infra generate

# 🧪 इन्फ्रास्ट्रक्चर प्रीव्ह्यू आणि नियोजन
azd provision --preview
# तैनात न करता इन्फ्रास्ट्रक्चर पुरवठा अनुकरण करते
# बाईसेप/टेरेफॉर्म टेम्पलेटचे विश्लेषण करते आणि दाखवते:
# - जोडायची संसाधने (हिरवे +)
# - सुधारायची संसाधने (पिवळी ~)
# - काढून टाकायची संसाधने (लाल -)
# चालवण्यासाठी सुरक्षित - Azure पर्यावरणात कोणतेही प्रत्यक्ष बदल केले जात नाहीत

# azure.yaml मधून इन्फ्रास्ट्रक्चर संकलित करा
azd infra synth
```

### प्रकल्प माहिती
```bash
# प्रोजेक्टची स्थिती आणि एंडपॉइंट दाखवा
azd show

# JSON मध्ये सविस्तर प्रोजेक्ट माहिती दाखवा
azd show --output json

# सेवा एंडपॉइंट्स मिळवा
azd show --output json | jq '.services'
```

## 🤖 AI आणि एक्सटेंशन्स कमांड्स

### AZD एक्सटेंशन्स
```bash
# सर्व उपलब्ध विस्तार (AI सह) यादी करा
azd extension list

# Foundry एजंट्स विस्तार स्थापित करा
azd extension install azure.ai.agents

# एजंट कौशल्ये विस्तार स्थापित करा (पूर्वावलोकन)
azd extension install azure.ai.skills

# Foundry कनेक्शन्स विस्तार स्थापित करा (पूर्वावलोकन)
azd extension install azure.ai.connections

# फाईन-ट्यूनिंग विस्तार स्थापित करा
azd extension install azure.ai.finetune

# सानुकूल मॉडेल्स विस्तार स्थापित करा
azd extension install azure.ai.models

# सर्व स्थापित विस्तार अपग्रेड करा
azd extension upgrade --all
```

### AI एजंट कमांड्स
```bash
# मॅनिफेस्टमधून एजंट प्रोजेक्ट प्रारंभ करा
azd ai agent init -m <manifest-path-or-uri>

# विशिष्ट फाउन्ड्री प्रोजेक्टला लक्ष्य करा
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# एजंट स्रोत निर्देशिका निर्दिष्ट करा
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# एक होस्टिंग लक्ष्य निवडा
azd ai agent init -m agent-manifest.yaml --host containerapp

# तैनात एजंटची चाचणी करा (लेटन्सी + पहिल्या बाइटपर्यंतचा वेळ दर्शविते)
azd ai agent invoke

# थेट एंडपॉइंट कॉन्फिगरेशन दाखवा
azd ai agent endpoint show

# एक मूल्यमापन डेटासेट तयार करा, नंतर एजंट अनुकूल करा
azd ai agent eval generate
azd ai agent optimize

# कोड-आधारित होस्टेड एजंटचा तैनात स्रोत डाउनलोड करा
azd ai agent code download

# होस्टेड एजंट आणि त्याच्या सर्व आवृत्त्या हटवा (--force सक्रिय सत्र समाप्त करते)
azd ai agent delete --force
```

### MCP सर्व्हर (अल्फा)
```bash
# आपल्या प्रकल्पासाठी MCP सर्व्हर सुरू करा
azd mcp start

# MCP ऑपरेशन्ससाठी टूल संमती व्यवस्थापित करा
azd copilot consent list
```

### इन्फ्रास्ट्रक्चर जनरेशन
```bash
# आपल्या प्रकल्प व्याख्येतून IaC फायली तयार करा
azd infra generate

# azure.yaml मधून इन्फ्रास्ट्रक्चर संश्लेषित करा
azd infra synth
```

---

## 🎯 जलद कार्यप्रवाह

### विकास कार्यप्रवाह
```bash
# नवीन प्रकल्प सुरू करा
azd init --template todo-nodejs-mongo
cd my-project

# विकासासाठी तैनात करा
azd env new dev
azd up

# बदल करा आणि पुन्हा तैनात करा
azd deploy

# निरीक्षण डॅशबोर्ड उघडा
azd monitor --live
```

### बहु-पर्यावरण कार्यप्रवाह
```bash
# वातावरण सेट करा
azd env new dev
azd env new staging  
azd env new production

# डेव्हलपमेंटवर तैनात करा
azd env select dev
azd up

# तपासा आणि स्टेजिंगवर प्रवर्तित करा
azd env select staging
azd up

# उत्पादनावर तैनात करा
azd env select production
azd up
```

### समस्या निवारण कार्यप्रवाह
```bash
# डीबग मोड सक्षम करा
export AZD_DEBUG=true

# तैनाती स्थिती तपासा
azd show

# कॉन्फिगरेशन वैधता तपासा
azd config show

# लॉगसाठी मॉनिटरिंग डॅशबोर्ड उघडा
azd monitor --logs

# संसाधन स्थिती तपासा
azd show --output json
```

## 🔍 डीबगिंग कमांड्स

### डीबग माहिती
```bash
# डीबग आउटपुट सक्षम करा
export AZD_DEBUG=true
azd <command> --debug

# स्वच्छ आउटपुटसाठी टेलीमेट्री अक्षम करा
export AZD_DISABLE_TELEMETRY=true

# वर्तमान संरचना तपासा
azd config show

# प्रमाणीकरण स्थीती तपासा
az account show
```

### टेम्प्लेट डीबगिंग
```bash
# तपशीलांसह उपलब्ध टेम्पलेटची यादी करा
azd template list --output json

# टेम्पलेट माहिती दाखवा
azd template show <template-name>

# प्रारंभ करण्यापूर्वी टेम्पलेटची पडताळणी करा
azd template validate <template-name>
```

## 📁 फाइल आणि डिरेक्टरी कमांड्स

### प्रकल्प रचना
```bash
# वर्तमान निर्देशिका रचना दर्शवा
tree /f  # विंडोज
find . -type f  # लिनक्स/macos

# azd प्रोजेक्ट रूटकडे जा
cd $(azd root)

# azd कॉन्फिगरेशन निर्देशिका दर्शवा
echo $AZD_CONFIG_DIR  # सहसा ~/.azd
```

## 🎨 आउटपुट फॉरमॅटिंग

### JSON आउटपुट
```bash
# स्क्रिप्टसाठी JSON आउटपुट घ्या
azd show --output json
azd env list --output json
azd config show --output json

# jq ने पार्स करा
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### टेबल आउटपुट
```bash
# टेबल म्हणून स्वरूपित करा
azd env list --output table

# तैनात केलेल्या सेवा तपासा
azd show --output json | jq '.services | keys'
```

## 🔧 सामान्य कमांड संयोजन

### हेल्थ चेक स्क्रिप्ट
```bash
#!/bin/bash
# जलद आरोग्य तपासणी
azd show
azd env get-values
azd monitor --logs
```

### तैनात पडताळणी
```bash
#!/bin/bash
# पूर्व-परिनियोजन प्रमाणीकरण
azd show
azd provision --preview  # परिनियोजित करण्यापूर्वी बदलांचे पूर्वदर्शन करा
az account show
```

### पर्यावरण तुलना
```bash
#!/bin/bash
# पर्यावरणांची तुलना करा
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### संसाधन साफसफाई स्क्रिप्ट
```bash
#!/bin/bash
# जुन्या वातावरणाची साफसफाई करा
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 पर्यावरण चलन

### सामान्य पर्यावरण चलन
```bash
# अॅझ्युर सेटअप
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# AZD सेटअप
export AZD_DEBUG=true
export AZD_DISABLE_TELEMETRY=true
export AZD_CONFIG_DIR="~/.azd"

# अनुप्रयोग सेटअप
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 आणीबाणी कमांड्स

### जलद निराकरण
```bash
# प्रमाणीकरण रीसेट करा
az account clear
az login

# पर्यावरण जबरदस्ती रीफ्रेश करा
azd env refresh

# सर्व सेवा पुन्हा तैनात करा
azd deploy

# तैनातीची स्थिती तपासा
azd show --output json
```

### पुनर्प्राप्ती कमांड्स
```bash
# अयशस्वी पोहोचयापासून पुनर्प्राप्त करा - स्वच्छ करा आणि पुनर्स्थापित करा
azd down --force --purge
azd up

# केवळ पायाभूत सुविधा पुनर्स्थापित करा
azd provision

# केवळ अनुप्रयोग पुनर्स्थापित करा
azd deploy
```

## 💡 प्रो टीप्स

### जलद कार्यप्रवाहासाठी उपनाम
```bash
# आपल्या .bashrc किंवा .zshrc मध्ये जोडा
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### फंक्शन शॉर्टकट्स
```bash
# जलद पर्यावरण बदलणे
azd-env() {
    azd env select $1 && azd show
}

# निरीक्षणासह जलद तैनाती
azd-deploy-watch() {
    azd deploy --service $1 && azd monitor --live
}

# पर्यावरण स्थिती
azd-status() {
    echo "Current environment:"
    azd env get-values
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

# आज्ञा-विशिष्ट मदत
azd up --help
azd env --help
azd config --help

# आवृत्ती आणि बिल्ड माहिती दाखवा
azd version
azd version --output json
```

### दस्तऐवज लिंक
```bash
# दस्तऐवज ब्राउझरमध्ये उघडा
azd docs

# टेम्पलेट दस्तऐवज दर्शवा
azd template show <template-name> --docs
```

---

**टीप**: या चीट शीटला बुकमार्क करा आणि आपल्याला हव्या असलेल्या कमांड्स जलद शोधण्यासाठी `Ctrl+F` वापरा!

---

**नेव्हिगेशन**
- **मागील धडा**: [प्रीफ्लाइट तपासण्या](../docs/pre-deployment/preflight-checks.md)
- **पुढील धडा**: [शब्दकोश](glossary.md)

---

> **💡 आपल्या एडिटरमध्ये Azure कमांड मदत हवी आहे का?** `npx skills add microsoft/github-copilot-for-azure` वापरून [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) इंस्टॉल करा — AI, Foundry, तैनात, निदान आणि इतर 37 कौशल्ये.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
हा दस्तऐवज AI भाषांतर सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) चा वापर करून अनुवादित केला आहे. जरी आम्ही अचूकतेसाठी प्रयत्न करतो, तरी कृपया लक्षात घ्या की स्वयंचलित भाषांतरांमध्ये त्रुटी किंवा अचूकतेची कमतरता असू शकते. मूळ दस्तऐवज त्याच्या मूळ भाषेत अधिकृत स्रोत मानला पाहिजे. महत्त्वाची माहिती असल्यास, व्यावसायिक मानवी भाषांतराची शिफारस केली जाते. या भाषांतराच्या वापरामुळे उद्भवणाऱ्या कोणत्याही गैरसमज किंवा चुकीच्या अर्थलावणीसाठी आम्ही जबाबदार नाही.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->