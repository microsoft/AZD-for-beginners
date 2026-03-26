# कमांड चीट शीट - आवश्यक AZD कमांड्स

**सर्व अध्यायांसाठी वेगवान संदर्भ**
- **📚 कोर्स होम**: [AZD For Beginners](../README.md)
- **📖 जलद प्रारंभ**: [अध्याय 1: पाया व जलद प्रारंभ](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI कमांड्स**: [अध्याय 2: AI-प्रथम विकास](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 प्रगत**: [अध्याय 4: इन्फ्रास्ट्रक्चर ऐज कोड](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## परिचय

या सर्वसमावेशक चीट शीटमध्ये सर्वाधिक वापरल्या जाणाऱ्या Azure Developer CLI कमांड्सचे वेगवान संदर्भ प्रस्थापित केले आहेत, जे विभागांनुसार आयोजित आणि व्यवहार्य उदाहरणांसह आहेत. azd प्रोजेक्ट्ससह विकास, समस्या निवारण, आणि दैनंदिन ऑपरेशन्स दरम्यान जलद संदर्भासाठी उपयुक्त.

## शिकण्याचे उद्दिष्ट

हि चीट शीट वापरून, आपण:
- आवश्यक Azure Developer CLI कमांड्स आणि सिंटॅक्स लगेच मिळवा
- कार्यात्मक विभागांनुसार आणि वापर प्रकरणांनुसार कमांड संघटित करणे समजून घ्या
- सामान्य विकास आणि डिप्लॉयमेंट परिस्थितीसाठी व्यवहार्य उदाहरणे पाहा
- समस्या सोडवण्यासाठी ट्रबलशूटिंग कमांड्स वापरू शक्ता
- प्रगत कॉन्फिगरेशन आणि कस्टमायझेशन पर्याय प्रभावीपणे शोधा
- पर्यावरण व्यवस्थापन आणि मल्टी-पर्यावरण वर्कफ्लो कमांड्स शोधा

## शिकण्याचे परिणाम

ही चीट शीट नियमितपणे वापरल्यास, आपण:
- azd कमांड्स आत्मविश्वासाने चालवू शकाल, संपूर्ण दस्तऐवज बघण्याची गरज न पडता
- योग्य निदान कमांड्सच्या साहाय्याने सामान्य समस्या लवकर मिटवू शकाल
- अनेक पर्यावरणे आणि डिप्लॉयमेंट परिस्थिती प्रभावीपणे व्यवस्थापित करू शकाल
- आवश्यकतेनुसार प्रगत azd वैशिष्ट्ये आणि कॉन्फिगरेशन पर्याय लागू करू शकाल
- प्रणालीबद्ध कमांड अनुक्रमांच्या साहाय्याने डिप्लॉयमेंट समस्या सोडवू शकाल
- azd शॉर्टकट्स आणि पर्यायांचा प्रभावी वापर करून वर्कफ्लोज ऑप्टिमाइझ करू शकाल

## सुरुवातीच्या कमांड्स

### प्रमाणीकरण
```bash
# AZD च्या माध्यमातून Azure मध्ये लॉगिन करा
azd auth login

# Azure CLI मध्ये लॉगिन करा (ही AZD अंतर्गत वापरते)
az login

# सध्याचा खाते तपासा
az account show

# डिफॉल्ट सदस्यता सेट करा
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# AZD मधून लॉगआउट करा
azd auth logout

# Azure CLI मधून लॉगआउट करा
az logout
```

### प्रोजेक्ट प्रारंभिकरण
```bash
# उपलब्ध टेम्पलेट ब्राउझ करा
azd template list

# टेम्पलेटमधून प्रारंभ करा
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# चालू निर्देशिकेत प्रारंभ करा
azd init .

# सानुकूल नावासह प्रारंभ करा
azd init --template todo-nodejs-mongo my-awesome-app
```

## मुख्य डिप्लॉयमेंट कमांड्स

### संपूर्ण डिप्लॉयमेंट वर्कफ्लो
```bash
# सर्वकाही तैनात करा (प्राव्हिजन + तैनात करा)
azd up

# पुष्टीकरण सूचना निष्क्रिय करून तैनात करा
azd up --confirm-with-no-prompt

# विशिष्ट वातावरणात तैनात करा
azd up --environment production

# सानुकूल पॅरामीटर्ससह तैनात करा
azd up --parameter location=westus2
```

### केवळ इन्फ्रास्ट्रक्चर
```bash
# Azure संसाधने पुरवा
azd provision

# 🧪 पूर्वावलोकन इन्फ्रास्ट्रक्चर बदल
azd provision --preview
# कोणती संसाधने तयार/सुधारित/अपसादित केली जातील याचा ड्राय-रन पाहावा दाखवतो
# 'terraform plan' किंवा 'bicep what-if' प्रमाणे - चालवायला सुरक्षित, कोणतेही बदल लागू केले जात नाहीत
```

### केवळ अ‍ॅप्लिकेशन
```bash
# अनुप्रयोग कोड तयार करा
azd deploy

# विशिष्ट सेवा तयार करा
azd deploy --service web
azd deploy --service api

# सर्व सेवा तयार करा
azd deploy --all
```

### बिल्ड आणि पॅकेज
```bash
# अनुप्रयोग तयार करा
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

# चालू पर्यावरण दर्शवा
azd env show

# पर्यावरण स्थिती ताजे करा
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

# कॉन्फिगरेशन काढून टाका
azd config unset defaults.location

# सर्व कॉन्फिगरेशन रीसेट करा
azd config reset
```

### प्रोजेक्ट कॉन्फिगरेशन
```bash
# azure.yaml वैधता तपासा
azd config validate

# प्रकल्पाची माहिती दर्शवा
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

# Application Insights लॉग्स ब्लेड उघडा
azd monitor --logs

# Application Insights ओव्हरव्ह्यू उघडा
azd monitor --overview
```

### कंटेनर लॉग्ज पहाणे
```bash
# Azure CLI द्वारे लॉग पहा (कंटेनर अॅप्ससाठी)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# रिअल-टाइममध्ये लॉग फॉलो करा
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Azure पोर्टलमधून लॉग पहा
azd monitor --logs
```

### लॉग अ‍ॅनालिटिक्स क्वेरीज
```bash
# Azure पोर्टलद्वारे Access Log Analytics ला भेट द्या
azd monitor --logs

# Azure CLI वापरून लॉगसाठी क्वेरी करा
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ देखभाल कमांड्स

### साफसफाई
```bash
# सर्व Azure स्रोत काढा
azd down

# पुष्टीकरणाशिवाय जबरदस्ती delete करा
azd down --force

# मऊ-हटवलेले स्रोत साफ करा
azd down --purge

# पूर्ण स्वच्छता करा
azd down --force --purge
```

### अपडेट्स
```bash
# azd अद्यतने तपासा
azd version

# वर्तमान आवृत्ती मिळवा
azd version

# वर्तमान संरचना पहा
azd config list
```

## 🔧 प्रगत कमांड्स

### पाइपलाइन आणि CI/CD
```bash
# GitHub Actions कॉन्फिगर करा
azd pipeline config

# Azure DevOps कॉन्फिगर करा
azd pipeline config --provider azdo

# पाईपलाईन कॉन्फिगरेशन दर्शवा
azd pipeline show
```

### इन्फ्रास्ट्रक्चर व्यवस्थापन
```bash
# इन्फ्रास्ट्रक्चर टेम्प्लेट तयार करा
azd infra generate

# 🧪 इन्फ्रास्ट्रक्चर पूर्वावलोकन आणि नियोजन
azd provision --preview
# तैनात न करता इन्फ्रास्ट्रक्चर पुरवठा अनुकरण करते
# Bicep/Terraform टेम्प्लेटचे विश्लेषण करते आणि दर्शवते:
# - जोडणे आवश्यक असलेले स्रोत (हिरवा +)
# - सुधारित करणे आवश्यक असलेले स्रोत (पिवळा ~)
# - हटविणे आवश्यक असलेले स्रोत (लाल -)
# चालविण्यास सुरक्षित - Azure वातावरणात कोणतेही वास्तविक बदल झाले नाहीत

# azure.yaml मधून इन्फ्रास्ट्रक्चर एकत्र करा
azd infra synth
```

### प्रोजेक्ट माहिती
```bash
# प्रकल्प स्थिती आणि एंडपॉइंट्स दर्शवा
azd show

# तपशीलवार प्रकल्प माहिती JSON स्वरूपात दर्शवा
azd show --output json

# सेवा एंडपॉइंट्स मिळवा
azd show --output json | jq '.services'
```

## 🤖 AI आणि विस्तार कमांड्स

### AZD विस्तार
```bash
# सर्व उपलब्ध एक्स्टेंशन्सची यादी करा (AI सहित)
azd extension list

# फौंड्री एजंट्स एक्स्टेंशन इंस्टॉल करा
azd extension install azure.ai.agents

# फाइन-ट्यूनिंग एक्स्टेंशन इंस्टॉल करा
azd extension install azure.ai.finetune

# कस्टम मॉडेल्स एक्स्टेंशन इंस्टॉल करा
azd extension install azure.ai.models

# सर्व इंस्टॉल केलेल्या एक्स्टेंशन्सचे अपग्रेड करा
azd extension upgrade --all
```

### AI एजंट कमांड्स
```bash
# मॅनिफेस्टमधून एजंट प्रोजेक्ट प्रारंभ करा
azd ai agent init -m <manifest-path-or-uri>

# विशिष्ट फाउंड्री प्रोजेक्टला लक्ष्य करा
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# एजंट स्रोत निर्देशिका निर्दिष्ट करा
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# होस्टिंग लक्ष्य निवडा
azd ai agent init -m agent-manifest.yaml --host containerapp
```

### MCP सर्व्हर (अल्फा)
```bash
# आपल्या प्रोजेक्टसाठी MCP सर्व्हर सुरू करा
azd mcp start

# MCP ऑपरेशन्ससाठी टूल संमती व्यवस्थापित करा
azd mcp consent
```

### इन्फ्रास्ट्रक्चर जनरेशन
```bash
# आपल्या प्रकल्प परिभाषेपासून IaC फाइल्स तयार करा
azd infra generate

# azure.yaml मधून पायाभूत सुविधा निर्माण करा
azd infra synth
```

---

## 🎯 जलद वर्कफ्लोज

### विकास वर्कफ्लो
```bash
# नवीन प्रकल्प सुरू करा
azd init --template todo-nodejs-mongo
cd my-project

# डेव्हलपमेंटमध्ये तैनात करा
azd env new dev
azd up

# बदल करा आणि पुन्हा तैनात करा
azd deploy

# मॉनिटरिंग डॅशबोर्ड उघडा
azd monitor --live
```

### मल्टी-पर्यावरण वर्कफ्लो
```bash
# वातावरण सेट करा
azd env new dev
azd env new staging  
azd env new production

# विकासासाठी तैनात करा
azd env select dev
azd up

# चाचणी करा आणि स्टेजिंगसाठी प्रोत्साहित करा
azd env select staging
azd up

# उत्पादनासाठी तैनात करा
azd env select production
azd up
```

### समस्या सोडवण्याचा वर्कफ्लो
```bash
# डीबग मोड सक्षम करा
export AZD_DEBUG=true

# तैनाती स्थिती तपासा
azd show

# संरचना तपासा
azd config list

# लॉगसाठी निरीक्षण डॅशबोर्ड उघडा
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

# वर्तमान कॉन्फिगरेशन तपासा
azd config list

# प्रमाणीकरण स्थिती तपासा
az account show
```

### टेम्प्लेट डिबगिंग
```bash
# तपशीलांसह उपलब्ध टेम्प्लेटची यादी करा
azd template list --output json

# टेम्प्लेटची माहिती दाखवा
azd template show <template-name>

# प्रारंभ करण्यापूर्वी टेम्प्लेटची सत्यता तपासा
azd template validate <template-name>
```

## 📁 फाइल आणि डायरेक्टरी कमांड्स

### प्रोजेक्ट स्ट्रक्चर
```bash
# सध्याचा निर्देशिका संरचना दाखवा
tree /f  # विंडोज
find . -type f  # लिनक्स/macOS

# azd प्रकल्पाच्या मूळ निर्देशिकेकडे जा
cd $(azd root)

# azd कॉन्फिगरेशन निर्देशिका दाखवा
echo $AZD_CONFIG_DIR  # सहसा ~/.azd
```

## 🎨 आउटपुट फॉरमॅटिंग

### JSON आउटपुट
```bash
# स्क्रिप्टिंगसाठी JSON आउटपुट मिळवा
azd show --output json
azd env list --output json
azd config list --output json

# jq वापरून पार्स करा
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### टेबल आउटपुट
```bash
# टेबल म्हणून फॉर्मॅट करा
azd env list --output table

# तैनात केलेल्या सेवा पाहा
azd show --output json | jq '.services | keys'
```

## 🔧 सामान्य कमांड संयोजन

### हेल्थ चेक स्क्रिप्ट
```bash
#!/bin/bash
# वेगवान आरोग्य तपासणी
azd show
azd env show
azd monitor --logs
```

### डिप्लॉयमेंट वैलिडेशन
```bash
#!/bin/bash
# पूर्व-प्रतिष्ठापन प्रमाणीकरण
azd show
azd provision --preview  # प्रतिष्ठापनेपूर्वी बदलांचे पूर्वावलोकन करा
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
# जुने पर्यावरण साफ करा
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

## 🚨 आपत्कालीन कमांड्स

### जलद निराकरणे
```bash
# प्रमाणीकरण रीसेट करा
az account clear
az login

# पर्यावरण अधिकृतपणे रीफ्रेश करा
azd env refresh

# सर्व सेवा पुनःप्रस्थापित करा
azd deploy

# प्रस्थापनेची स्थिती तपासा
azd show --output json
```

### पुनर्प्राप्ती कमांड्स
```bash
# अपयशी डिप्लॉयमेंटमधून पुनर्प्राप्ती करा - स्वच्छ करा आणि पुन्हा डिप्लॉय करा
azd down --force --purge
azd up

# फक्त इन्फ्रास्ट्रक्चर पुन्हा प्राविजन करा
azd provision

# फक्त अनुप्रयोग पुन्हा डिप्लॉय करा
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
# जलद वातावरण स्विचिंग
azd-env() {
    azd env select $1 && azd show
}

# मॉनिटरिंगसह जलद तैनाती
azd-deploy-watch() {
    azd deploy --service $1 && azd monitor --live
}

# वातावरण स्थिती
azd-status() {
    echo "Current environment:"
    azd env show
    echo "Services:"
    azd show --output json | jq -r '.services | keys[]'
}
```

## 📖 मदत आणि दस्तऐवज

### मदत मिळवा
```bash
# सामान्य मदत
azd --help
azd help

# कमांड-विशिष्ट मदत
azd up --help
azd env --help
azd config --help

# आवृत्ती आणि बिल्ड माहिती दाखवा
azd version
azd version --output json
```

### दस्तऐवज लिंक
```bash
# ब्राउझरमध्ये दस्तऐवज उघडा
azd docs

# साच्याचे दस्तऐवज दाखवा
azd template show <template-name> --docs
```

---

**टीप**: ही चीट शीट बुकमार्क करा आणि आपल्याला हवी असलेली कमांड्स जलद शोधण्यासाठी `Ctrl+F` वापरा!

---

**नेव्हिगेशन**
- **मागील धडा**: [Preflight Checks](../docs/pre-deployment/preflight-checks.md)
- **पुढचा धडा**: [Glossary](glossary.md)

---

> **💡 आपल्या संपादकात Azure कमांड मदत हवी आहे का?** इन्स्टॉल करा [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) `npx skills add microsoft/github-copilot-for-azure` सह — AI, Foundry, डिप्लॉयमेंट, निदान आणि बरेच काहीसाठी 37 कौशल्ये.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
हा दस्तऐवज AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) चा वापर करून अनुवादित करण्यात आला आहे. आम्ही अचूकतेसाठी प्रयत्नशील असलो तरी, कृपया लक्षात घ्या की स्वयंचलित अनुवादांमध्ये चुका किंवा असमर्थता असू शकते. मूळ दस्तऐवज त्याच्या स्थानिक भाषेत अधिकृत स्रोत म्हणून मानला जावा. महत्त्वाची माहिती असल्यास, व्यावसायिक मानवी अनुवाद शिफारसीय आहे. या अनुवादाच्या वापरामुळे उद्भवलेल्या कोणत्याही गैरसमज किंवा चुकीच्या अर्थ लावण्याबद्दल आम्ही जबाबदार नाही.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->