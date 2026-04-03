# Command Cheat Sheet - Essential AZD Commands

**सर्व प्रकरणांसाठी जलद संदर्भ**
- **📚 Course Home**: [AZD नवशिक्यांसाठी](../README.md)
- **📖 Quick Start**: [प्रकरण 1: पायाभूत आणि त्वरीत प्रारंभ](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI Commands**: [प्रकरण 2: AI-प्रथम विकास](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Advanced**: [प्रकरण 4: इन्फ्रास्ट्रक्चर अॅज कोड](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## परिचय

हा सर्वसमावेशक चिट शीट सर्वात जास्त वापरल्या जाणाऱ्या Azure Developer CLI कमांडसाठी जलद संदर्भ पुरवतो, श्रेणींनुसार व्यावहारिक उदाहरणांसह आयोजित. azd प्रकल्पांवरील विकास, त्रुटीशोधन आणि दैनंदिन ऑपरेशन्स दरम्यान पटकन शोधण्यासाठी हे उत्तम आहे.

## शिकण्याचे उद्दिष्टे

या चीट शीटचा वापर करून, आपण:
- आवश्यक Azure Developer CLI कमांड्स आणि त्यांचा सिंटॅक्स त्वरीत मिळतील
- कमांडचे आयोजन कार्यात्मक श्रेणींनुसार आणि वापरप्रकरणांनुसार समजून घ्याल
- सामान्य विकास आणि डिप्लॉयमेंट परिस्थितीसाठी व्यावहारिक उदाहरणांचा संदर्भ घ्याल
- त्वरीत समस्या निवारणासाठी त्रुटीशोधन कमांड्स मिळवाल
- उन्नत कॉन्फिगरेशन आणि सानुकूलन पर्याय प्रभावीपणे शोधाल
- पर्यावरण व्यवस्थापन आणि मल्टी-पर्यावरण वर्कफ्लो कमांड्स शोधाल

## शिकण्याचे परिणाम

या चीट शीटचा नियमित संदर्भ घेतल्यास, आपण सक्षम असाल:
- पूर्ण दस्तऐवजाच्या संदर्भाशिवाय azd कमांड्स आत्मविश्वासाने चालवू शकाल
- योग्य डायग्नोस्टिक कमांड्स वापरून सामान्य समस्या त्वरीत सोडवू शकाल
- अनेक वातावरणे आणि डिप्लॉयमेंट परिस्थिती प्रभावीपणे व्यवस्थापित करू शकाल
- आवश्यकतेनुसार उन्नत azd वैशिष्ट्ये आणि कॉन्फिगरेशन पर्याय लागू करू शकाल
- पद्धतशीर कमांड अनुक्रम वापरून डिप्लॉयमेंट समस्या त्रुटीशोधन करू शकाल
- azd शॉर्टकट्स आणि पर्यायांच्या प्रभावी वापराद्वारे वर्कफ्लो ऑप्टिमाइझ करू शकाल

## सुरू करण्यासाठी कमांड्स

### प्रमाणीकरण
```bash
# AZD द्वारे Azure मध्ये लॉगिन करा
azd auth login

# Azure CLI मध्ये लॉगिन करा (AZD अंतर्गतपणे हे वापरते)
az login

# सध्याचे खाते तपासा
az account show

# डिफॉल्ट सदस्यता सेट करा
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# AZD मधून लॉगआउट करा
azd auth logout

# Azure CLI मधून लॉगआउट करा
az logout
```

### प्रकल्प आरंभ
```bash
# उपलब्ध टेम्पलेट्स ब्राउझ करा
azd template list

# टेम्पलेटमधून प्रारंभ करा
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# सध्याच्या निर्देशिकेत प्रारंभ करा
azd init .

# सानुकूल नावासह प्रारंभ करा
azd init --template todo-nodejs-mongo my-awesome-app
```

## कोर डिप्लॉयमेंट कमांड्स

### संपूर्ण डिप्लॉयमेंट वर्कफ़्लो
```bash
# सर्व काही तैनात करा (प्रोव्हिजन + डिप्लॉय)
azd up

# पुष्टी विचारण्यासाठी प्रॉम्प्ट अक्षम करून तैनात करा
azd up --confirm-with-no-prompt

# विशिष्ट वातावरणात तैनात करा
azd up --environment production

# सानुकूल पॅरामीटर्ससह तैनात करा
azd up --parameter location=westus2
```

### फक्त इन्फ्रास्ट्रक्चर
```bash
# Azure संसाधने तरतूद करा
azd provision

# 🧪 इन्फ्रास्ट्रक्चरमधील बदलांचे पूर्वावलोकन
azd provision --preview
# कोणती संसाधने तयार/संशोधित/हटवली जातील याचे ड्राय-रन दृश्य दाखवते
# 'terraform plan' किंवा 'bicep what-if' प्रमाणे — चालवायला सुरक्षित, कोणतेही बदल लागू केले जात नाहीत
```

### फक्त अनुप्रयोग
```bash
# अनुप्रयोग कोड तैनात करा
azd deploy

# विशिष्ट सेवा तैनात करा
azd deploy --service web
azd deploy --service api

# सर्व सेवा तैनात करा
azd deploy --all
```

### बिल्ड आणि पॅकेज
```bash
# अॅप्लिकेशन्स तयार करा
azd package

# विशिष्ट सेवा तयार करा
azd package --service api
```

## 🌍 पर्यावरण व्यवस्थापन

### पर्यावरण ऑपरेशन्स
```bash
# सर्व पर्यावरणांची यादी करा
azd env list

# नवीन पर्यावरण तयार करा
azd env new development
azd env new staging --location westus2

# पर्यावरण निवडा
azd env select production

# उपलब्ध पर्यावरण दाखवा
azd env list

# पर्यावरणाची स्थिती ताजी करा
azd env refresh
```

### पर्यावरण व्हेरिएबल्स
```bash
# पर्यावरण चल सेट करा
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# पर्यावरण चल मिळवा
azd env get API_KEY

# सर्व पर्यावरण चलांची यादी करा
azd env get-values

# पर्यावरण चल काढून टाका
azd env unset DEBUG
```

## ⚙️ कॉन्फिगरेशन कमांड्स

### ग्लोबल कॉन्फिगरेशन
```bash
# सर्व कॉन्फिगरेशन सूची करा
azd config show

# जागतिक डीफॉल्ट्स सेट करा
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# कॉन्फिगरेशन हटवा
azd config unset defaults.location

# सर्व कॉन्फिगरेशन रीसेट करा
azd config reset
```

### प्रोजेक्ट कॉन्फिगरेशन
```bash
# azure.yaml ची वैधता तपासा
azd config validate

# प्रकल्पाची माहिती दाखवा
azd show

# सेवा एंडपॉइंट्स मिळवा
azd show --output json
```

## 📊 मॉनिटरिंग आणि डायग्नोस्टिक्स

### मॉनिटरिंग डॅशबोर्ड
```bash
# Azure पोर्टलवरील मॉनिटरिंग डॅशबोर्ड उघडा
azd monitor

# Application Insights चे लाईव्ह मेट्रिक्स उघडा
azd monitor --live

# Application Insights चे लॉग्स ब्लेड उघडा
azd monitor --logs

# Application Insights चे अवलोकन उघडा
azd monitor --overview
```

### कंटेनर लॉग्स पाहणे
```bash
# Azure CLI द्वारे लॉग पहा (Container Apps साठी)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# लॉग रिअल-टाइममध्ये फॉलो करा
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Azure पोर्टलमधून लॉग पहा
azd monitor --logs
```

### लॉग अॅनॅलिटिक्स क्वेरीज
```bash
# Azure पोर्टलद्वारे Log Analytics मध्ये प्रवेश करा
azd monitor --logs

# Azure CLI वापरून लॉग्स क्वेरी करा
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ देखभाल कमांड्स

### क्लीनअप
```bash
# सर्व Azure संसाधने काढा
azd down

# पुष्टीशिवाय जबरदस्तीने हटवा
azd down --force

# सॉफ्ट-डिलीट केलेली संसाधने कायमचे हटवा
azd down --purge

# संपूर्ण साफसफाई
azd down --force --purge
```

### अद्यतने
```bash
# azd अद्यतनांसाठी तपासा
azd version

# सध्याची आवृत्ती मिळवा
azd version

# सध्याचे कॉन्फिगरेशन पहा
azd config show
```

## 🔧 उन्नत कमांड्स

### पाइपलाइन आणि CI/CD
```bash
# GitHub Actions कॉन्फिगर करा
azd pipeline config

# Azure DevOps कॉन्फिगर करा
azd pipeline config --provider azdo

# पाइपलाइनचे कॉन्फिगरेशन दाखवा
azd pipeline show
```

### इन्फ्रास्ट्रक्चर व्यवस्थापन
```bash
# इन्फ्रास्ट्रक्चर टेम्पलेट्स तयार करा
azd infra generate

# 🧪 इन्फ्रास्ट्रक्चर पूर्वावलोकन आणि नियोजन
azd provision --preview
# डिप्लॉय न करता इन्फ्रास्ट्रक्चर प्रोव्हिजनिंगचे अनुकरण करते
# Bicep/Terraform टेम्पलेटचे विश्लेषण करते आणि दाखवते:
# - जोडली जाणारी संसाधने (हिरवे +)
# - बदलली जाणारी संसाधने (पिवळे ~)
# - हटवली जाणारी संसाधने (लाल -)
# चालवायला सुरक्षित - Azure वातावरणात कोणतेही वास्तविक बदल केले जात नाहीत

# azure.yaml मधून इन्फ्रास्ट्रक्चर तयार करा
azd infra synth
```

### प्रकल्प माहिती
```bash
# प्रकल्पाची स्थिती आणि एंडपॉइंट्स दाखवा
azd show

# सविस्तर प्रकल्प माहिती JSON स्वरूपात दाखवा
azd show --output json

# सेवा एंडपॉइंट्स प्राप्त करा
azd show --output json | jq '.services'
```

## 🤖 AI आणि एक्स्टेंशन्स कमांड्स

### AZD एक्स्टेंशन्स
```bash
# सर्व उपलब्ध विस्तारांची यादी करा (AI सहित)
azd extension list

# Foundry agents विस्तार स्थापित करा
azd extension install azure.ai.agents

# fine-tuning विस्तार स्थापित करा
azd extension install azure.ai.finetune

# सानुकूल मॉडेल्स विस्तार स्थापित करा
azd extension install azure.ai.models

# सर्व स्थापित विस्तार अपग्रेड करा
azd extension upgrade --all
```

### AI एजंट कमांड्स
```bash
# मॅनिफेस्टमधून एजेंट प्रकल्प प्रारंभ करा
azd ai agent init -m <manifest-path-or-uri>

# विशिष्ट Foundry प्रकल्प लक्ष्य करा
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# एजेंट स्रोत निर्देशिका निर्दिष्ट करा
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# होस्टिंग लक्ष्य निवडा
azd ai agent init -m agent-manifest.yaml --host containerapp
```

### MCP सर्व्हर (अल्फा)
```bash
# आपल्या प्रकल्पासाठी MCP सर्व्हर सुरू करा
azd mcp start

# MCP ऑपरेशन्ससाठी टूलची संमती व्यवस्थापित करा
azd copilot consent list
```

### इन्फ्रास्ट्रक्चर निर्मिती
```bash
# आपल्या प्रकल्पाच्या परिभाषेतून IaC फायली तयार करा
azd infra generate

# azure.yaml मधून पायाभूत संरचना तयार करा
azd infra synth
```

---

## 🎯 जलद वर्कफ्लो

### विकास वर्कफ्लो
```bash
# नवीन प्रकल्प सुरू करा
azd init --template todo-nodejs-mongo
cd my-project

# विकास वातावरणात तैनात करा
azd env new dev
azd up

# बदल करा आणि पुन्हा तैनात करा
azd deploy

# निरीक्षण डॅशबोर्ड उघडा
azd monitor --live
```

### मल्टी-पर्यावरण वर्कफ्लो
```bash
# पर्यावरण तयार करा
azd env new dev
azd env new staging  
azd env new production

# विकासात तैनात करा
azd env select dev
azd up

# चाचणी करा आणि स्टेजिंगमध्ये उन्नत करा
azd env select staging
azd up

# उत्पादनावर तैनात करा
azd env select production
azd up
```

### त्रुटी निवारण वर्कफ्लो
```bash
# डिबग मोड सक्षम करा
export AZD_DEBUG=true

# डिप्लॉयमेंट स्थिती तपासा
azd show

# कॉन्फिगरेशन सत्यापित करा
azd config show

# लॉगसाठी मॉनिटरिंग डॅशबोर्ड उघडा
azd monitor --logs

# संसाधन स्थिती तपासा
azd show --output json
```

## 🔍 डिबगिंग कमांड्स

### डिबग माहिती
```bash
# डेबग आउटपुट सक्षम करा
export AZD_DEBUG=true
azd <command> --debug

# स्वच्छ आउटपुटसाठी टेलीमेट्री अक्षम करा
export AZD_DISABLE_TELEMETRY=true

# चालू कॉन्फिगरेशन तपासा
azd config show

# प्रमाणीकरणाची स्थिती तपासा
az account show
```

### टेम्पलेट डिबगिंग
```bash
# तपशीलांसह उपलब्ध टेम्पलेट्सची यादी
azd template list --output json

# टेम्पलेटची माहिती दाखवा
azd template show <template-name>

# init करण्यापूर्वी टेम्पलेटची वैधता तपासा
azd template validate <template-name>
```

## 📁 फाइल आणि डिरेक्टरी कमांड्स

### प्रकल्प रचना
```bash
# सध्याची निर्देशिका रचना दाखवा
tree /f  # विंडोज
find . -type f  # लिनक्स/मॅकओएस

# azd प्रकल्पाच्या मूळ निर्देशिकेत जा
cd $(azd root)

# azd कॉन्फिगरेशन निर्देशिका दाखवा
echo $AZD_CONFIG_DIR  # साधारणपणे ~/.azd
```

## 🎨 आउटपुट फॉरमॅटिंग

### JSON आउटपुट
```bash
# स्क्रिप्टिंगसाठी JSON आउटपुट मिळवा
azd show --output json
azd env list --output json
azd config show --output json

# jq वापरून पार्स करा
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### टेबल आउटपुट
```bash
# टेबल स्वरूपात करा
azd env list --output table

# तैनात केलेल्या सेवा पहा
azd show --output json | jq '.services | keys'
```

## 🔧 सामान्य कमांड संयोजन

### हेल्थ चेक स्क्रिप्ट
```bash
#!/bin/bash
# त्वरीत आरोग्य तपासणी
azd show
azd env get-values
azd monitor --logs
```

### डिप्लॉयमेंट सत्यापन
```bash
#!/bin/bash
# तैनातीपूर्व पडताळणी
azd show
azd provision --preview  # तैनात करण्यापूर्वी बदलांचे पूर्वावलोकन
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

### संसाधन क्लीनअप स्क्रिप्ट
```bash
#!/bin/bash
# जुने पर्यावरणे साफ करा
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 पर्यावरण व्हेरिएबल्स

### सामान्य पर्यावरण व्हेरिएबल्स
```bash
# Azure कॉन्फिगरेशन
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# AZD कॉन्फिगरेशन
export AZD_DEBUG=true
export AZD_DISABLE_TELEMETRY=true
export AZD_CONFIG_DIR="~/.azd"

# अनुप्रयोग कॉन्फिगरेशन
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 तातडीचे कमांड्स

### त्वरीत दुरुस्त्या
```bash
# प्रमाणीकरण रीसेट करा
az account clear
az login

# वातावरण जबरदस्तीने ताजे करा
azd env refresh

# सर्व सेवा पुन्हा तैनात करा
azd deploy

# तैनातीची स्थिती तपासा
azd show --output json
```

### पुनर्प्राप्ती कमांड्स
```bash
# अपयशी झालेल्या तैनातीपासून पुनर्प्राप्त करा - साफ करा आणि पुन्हा तैनात करा
azd down --force --purge
azd up

# फक्त पायाभूत सुविधांचे पुनःप्रावधान करा
azd provision

# फक्त अनुप्रयोग पुन्हा तैनात करा
azd deploy
```

## 💡 प्रो टिप्स

### जलद वर्कफ्लोसाठी अलियासेस
```bash
# आपल्या .bashrc किंवा .zshrc मध्ये जोडा
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### फंक्शन शॉर्टकट्स
```bash
# त्वरित वातावरण बदलणे
azd-env() {
    azd env select $1 && azd show
}

# देखरेखीसह जलद तैनाती
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

# आदेश-विशिष्ट मदत
azd up --help
azd env --help
azd config --help

# आवृत्ती आणि बिल्ड माहिती दाखवा
azd version
azd version --output json
```

### दस्तऐवजीकरण दुवे
```bash
# ब्राउझरमध्ये दस्तऐवजीकरण उघडा
azd docs

# टेम्पलेट दस्तऐवजीकरण दाखवा
azd template show <template-name> --docs
```

---

**टिप**: या चीट शीटला बुकमार्क करा आणि आपल्याला हव्या असलेल्या कमांड्स पटकन शोधण्यासाठी `Ctrl+F` वापरा!

---

**नेव्हिगेशन**
- **Previous Lesson**: [प्रीफ्लाइट तपासण्या](../docs/pre-deployment/preflight-checks.md)
- **Next Lesson**: [शब्दावली](glossary.md)

---

> **💡 आपल्या संपादकात Azure कमांड मदत हवी आहे का?** Install [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) with `npx skills add microsoft/github-copilot-for-azure` — AI, Foundry, डिप्लॉयमेंट, डायग्नोस्टिक्स आणि इतरांसाठी 37 कौशल्ये.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
हा दस्तऐवज AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) वापरून अनुवादित करण्यात आला आहे. आम्ही अचूकतेचा प्रयत्न करत असलो तरी, कृपया लक्षात ठेवा की स्वयंचलित अनुवादांमध्ये त्रुटी किंवा अचूकतेची कमतरता असू शकते. मूळ दस्तऐवज त्याच्या मूळ भाषेत अधिकृत स्रोत म्हणून मानला जावा. महत्वाच्या माहितीसाठी व्यावसायिक मानवी अनुवाद शिफारसीय आहे. या अनुवादाच्या वापरामुळे उद्भवणाऱ्या कोणत्याही गैरसमजुती किंवा चुकीच्या अर्थलागण्याची आम्ही जबाबदारी घेत नाही.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->