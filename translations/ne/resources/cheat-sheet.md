# कमाण्ड चीट शीट - आवश्यक AZD कमाण्डहरू

**सबै अध्यायको छिटो सन्दर्भ**
- **📚 कोर्स होम**: [AZD शुरुआतीका लागि](../README.md)
- **📖 छिटो सुरु**: [अध्याय 1: आधार र छिटो सुरु](../README.md#-chapter-1-foundation--quick-start)
- **🤖 एआई कमाण्डहरू**: [अध्याय 2: एआई-प्रथम विकास](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 उन्नत**: [अध्याय 4: पूर्वाधारलाई कोडको रूपमा](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## परिचय

यो समग्र चीट शीटले सबैभन्दा धेरै प्रयोग गरिएका Azure Developer CLI कमाण्डहरूको छिटो सन्दर्भ प्रदान गर्दछ, कार्यसमूह अनुसार व्यावहारिक उदाहरणहरूसहित व्यवस्थित। azd परियोजनाहरूको विकास, समस्याहरू समाधान, र दैनिक संचालनका क्रममा छिटो खोजका लागि उपयुक्त।

## सिक्ने उद्देश्यहरू

यस चीट शीट प्रयोग गरेर, तपाइँ:
- आवश्यक Azure Developer CLI कमाण्ड र सिन्ट्याक्समा तुरुन्त पहुँच पाउनुहुनेछ
- कार्यात्मक वर्गीकरण र प्रयोग केस अनुसार कमाण्डको संगठन बुझ्नुहुनेछ
- सामान्य विकास र परिनियोजन परिदृश्यका लागि व्यावहारिक उदाहरणहरू सन्दर्भ गर्न सक्नुहुनेछ
- छिटो समस्या समाधानका लागि डायग्नोस्टिक कमाण्डहरू पहुँच गर्न सक्नुहुनेछ
- उन्नत कन्फिगरेसन र कस्टमाइजेसन विकल्पहरू प्रभावकारी रूपमा सुन्नु र प्रयोग गर्न सक्नुहुनेछ
- वातावरण व्यवस्थापन र बहु-पर्यावरण कार्यप्रवाह कमाण्डहरू पत्ता लगाउन सक्नुहुनेछ

## सिकाइ परिणामहरू

नियमित रूपमा यस चीट शीटलाई सन्दर्भ गर्दा, तपाइँ सक्षम हुनुहुनेछ:
- azd कमाण्डहरू बिना व्यापक दस्तावेज हेर्नै आत्मविश्वासका साथ चलाउन
- उपयुक्त निदान कमाण्डहरूको प्रयोग गरी सामान्य समस्याहरू छिटो समाधान गर्न
- बहु वातावरण र परिनियोजन परिदृश्यहरू प्रभावकारी रूपमा व्यवस्थापन गर्न
- आवश्यक अनुसार azd का उन्नत सुविधाहरू र कन्फिगरेसन विकल्पहरू लागू गर्न
- व्यवस्थित कमाण्ड अनुक्रम प्रयोग गरी परिनियोजन समस्याहरू ट्रबलशुट गर्न
- azd सर्टकट र विकल्पहरूको प्रभावकारी प्रयोगले कार्यप्रवाहहरू अनुकूलन गर्न

## सुरु गर्ने कमाण्डहरू

### प्रमाणीकरण
```bash
# AZD मार्फत Azure मा लगइन गर्नुहोस्
azd auth login

# Azure CLI मा लगइन (AZD ले पृष्ठभूमिमा यसलाई प्रयोग गर्छ)
az login

# हालको खाता जाँच्नुहोस्
az account show

# पूर्वनिर्धारित सदस्यता सेट गर्नुहोस्
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# AZD बाट लगआउट गर्नुहोस्
azd auth logout

# Azure CLI बाट लगआउट गर्नुहोस्
az logout
```

### परियोजना आरम्भ
```bash
# उपलब्ध टेम्पलेटहरू ब्राउज गर्नुहोस्
azd template list

# टेम्पलेटबाट आरम्भ गर्नुहोस्
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# वर्तमान निर्देशिकामा आरम्भ गर्नुहोस्
azd init .

# अनुकूल नाम प्रयोग गरी आरम्भ गर्नुहोस्
azd init --template todo-nodejs-mongo my-awesome-app
```

## मुख्य परिनियोजन कमाण्डहरू

### पूरा परिनियोजन कार्यप्रवाह
```bash
# सबै कुरा तैनाथ गर्नुहोस् (प्राविजन + तैनाथ)
azd up

# पुष्टिकरण संकेतहरू अक्षम गरेर तैनाथ गर्नुहोस्
azd up --confirm-with-no-prompt

# निर्दिष्ट वातावरणमा तैनाथ गर्नुहोस्
azd up --environment production

# कस्टम प्यारामिटरहरूसँग तैनाथ गर्नुहोस्
azd up --parameter location=westus2
```

### केवल पूर्वाधार
```bash
# Azure संसाधनहरू प्रावधान गर्नुहोस्
azd provision

# 🧪 पूर्वाधार परिवर्तनहरूको पूर्वावलोकन
azd provision --preview
# कुन संसाधनहरू सिर्जना/संशोधित/हटाइने थिए भन्ने ड्राइ-रन दृश्य देखाउँछ
# 'terraform plan' वा 'bicep what-if' जस्तै - चलाउन सुरक्षित, कुनै परिवर्तन लागू हुँदैन
```

### केवल एप्लिकेशन
```bash
# अनुप्रयोग कोड तैनाथ गर्नुहोस्
azd deploy

# विशिष्ट सेवा तैनाथ गर्नुहोस्
azd deploy --service web
azd deploy --service api

# सबै सेवाहरू तैनाथ गर्नुहोस्
azd deploy --all
```

### बिल्ड र प्याकेज
```bash
# अनुप्रयोगहरू निर्माण गर्नुहोस्
azd package

# विशिष्ट सेवा निर्माण गर्नुहोस्
azd package --service api
```

## 🌍 वातावरण व्यवस्थापन

### वातावरण अपरेसनहरू
```bash
# सबै वातावरणहरू सूचीबद्ध गर्नुहोस्
azd env list

# नयाँ वातावरण सिर्जना गर्नुहोस्
azd env new development
azd env new staging --location westus2

# वातावरण चयन गर्नुहोस्
azd env select production

# वर्तमान वातावरण देखाउनुहोस्
azd env show

# वातावरणको अवस्था ताजा गर्नुहोस्
azd env refresh
```

### वातावरण भेरिएबलहरू
```bash
# पर्यावरण चर सेट गर्नुहोस्
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# पर्यावरण चर प्राप्त गर्नुहोस्
azd env get API_KEY

# सबै पर्यावरण चरहरू सूचीबद्ध गर्नुहोस्
azd env get-values

# पर्यावरण चर हटाउनुहोस्
azd env unset DEBUG
```

## ⚙️ कन्फिगुरेसन कमाण्डहरू

### ग्लोबल कन्फिगुरेसन
```bash
# सबै कन्फिगरेसनहरू सूचीबद्ध गर्नुहोस्
azd config list

# ग्लोबल पूर्वनिर्धारित मानहरू सेट गर्नुहोस्
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# कन्फिगरेसन हटाउनुहोस्
azd config unset defaults.location

# सबै कन्फिगरेसनहरू रिसेट गर्नुहोस्
azd config reset
```

### परियोजना कन्फिगुरेसन
```bash
# azure.yaml को वैधता जाँच्नुहोस्
azd config validate

# परियोजना जानकारी देखाउनुहोस्
azd show

# सेवा अन्तबिन्दुहरू प्राप्त गर्नुहोस्
azd show --output json
```

## 📊 अनुगमन र निदान

### अनुगमन ड्यासबोर्ड
```bash
# Azure पोर्टलको निगरानी ड्यासबोर्ड खोल्नुहोस्
azd monitor

# Application Insights को लाइभ मेट्रिक्स खोल्नुहोस्
azd monitor --live

# Application Insights को लॉग्स ब्लेड खोल्नुहोस्
azd monitor --logs

# Application Insights को अवलोकन खोल्नुहोस्
azd monitor --overview
```

### कन्टेनर लगहरू हेर्नु
```bash
# Azure CLI मार्फत लगहरू हेर्नुहोस् (Container Apps का लागि)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# लगहरू वास्तविक समयमा अनुगमन गर्नुहोस्
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Azure पोर्टलबाट लगहरू हेर्नुहोस्
azd monitor --logs
```

### लग एनालिटिक्स क्वेरीहरू
```bash
# Azure पोर्टलमार्फत लॉग एनालिटिक्स पहुँच गर्नुहोस्
azd monitor --logs

# Azure CLI प्रयोग गरेर लॉगहरू क्वेरी गर्नुहोस्
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ मर्मतसम्भार कमाण्डहरू

### सफाइ
```bash
# सबै Azure संसाधनहरू हटाउनुहोस्
azd down

# पुष्टिकरण बिना बलपूर्वक मेटाउनुहोस्
azd down --force

# सफ्ट-डिलेट गरिएका संसाधनहरू स्थायी रूपमा मेटाउनुहोस्
azd down --purge

# पूर्ण सफाइ
azd down --force --purge
```

### अपडेटहरू
```bash
# azd अपडेटहरूको लागि जाँच गर्नुहोस्
azd version

# हालको संस्करण प्राप्त गर्नुहोस्
azd version

# हालको कन्फिगरेसन हेर्नुहोस्
azd config list
```

## 🔧 उन्नत कमाण्डहरू

### पाइपलाइन र CI/CD
```bash
# GitHub Actions कन्फिगर गर्नुहोस्
azd pipeline config

# Azure DevOps कन्फिगर गर्नुहोस्
azd pipeline config --provider azdo

# पाइपलाइन विन्यास देखाउनुहोस्
azd pipeline show
```

### पूर्वाधार व्यवस्थापन
```bash
# पूर्वाधार टेम्पलेटहरू उत्पन्न गर्नुहोस्
azd infra generate

# 🧪 पूर्वाधार पूर्वावलोकन र योजना
azd provision --preview
# डिप्लोय नगरी पूर्वाधार प्रावधान गर्ने प्रक्रिया नक्कल गर्छ
# Bicep/Terraform टेम्पलेटहरू विश्लेषण गरी देखाउँछ:
# - थपिने संसाधनहरू (हरियो +)
# - परिवर्तित हुने संसाधनहरू (पहेलो ~)
# - हटाइने संसाधनहरू (रातो -)
# चलाउन सुरक्षित - Azure वातावरणमा कुनै वास्तविक परिवर्तन गरिँदैन

# azure.yaml बाट पूर्वाधार संश्लेषण गर्नुहोस्
azd infra synth
```

### परियोजना जानकारी
```bash
# प्रोजेक्टको स्थिति र अन्तबिन्दुहरू देखाउनुहोस्
azd show

# JSON मा विस्तृत प्रोजेक्ट जानकारी देखाउनुहोस्
azd show --output json

# सेवा अन्तबिन्दुहरू प्राप्त गर्नुहोस्
azd show --output json | jq '.services'
```

## 🤖 एआई र एक्सटेन्सन कमाण्डहरू

### AZD एक्सटेन्सनहरू
```bash
# एआई समेत सबै उपलब्ध एक्सटेन्सनहरू सूचीबद्ध गर्नुहोस्
azd extension list

# Foundry agents एक्सटेन्सन स्थापना गर्नुहोस्
azd extension install azure.ai.agents

# फाइन-ट्यूनिङ एक्सटेन्सन स्थापना गर्नुहोस्
azd extension install azure.ai.finetune

# कस्टम मोडेल एक्सटेन्सन स्थापना गर्नुहोस्
azd extension install azure.ai.models

# स्थापना भएका सबै एक्सटेन्सनहरू अपग्रेड गर्नुहोस्
azd extension upgrade --all
```

### एआई एजेन्ट कमाण्डहरू
```bash
# म्यानिफेस्टबाट एजेन्ट परियोजना प्रारम्भ गर्नुहोस्
azd ai agent init -m <manifest-path-or-uri>

# एक विशिष्ट Foundry परियोजनालाई लक्षित गर्नुहोस्
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# एजेन्ट स्रोत निर्देशिका निर्दिष्ट गर्नुहोस्
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# होस्टिङ लक्ष्य चयन गर्नुहोस्
azd ai agent init -m agent-manifest.yaml --host containerapp
```

### MCP सर्भर (Alpha)
```bash
# तपाईंको परियोजनाका लागि MCP सर्भर सुरु गर्नुहोस्
azd mcp start

# MCP सञ्चालनहरूको लागि उपकरणको सहमति व्यवस्थापन गर्नुहोस्
azd mcp consent
```

### पूर्वाधार निर्माण
```bash
# तपाईंको परियोजना परिभाषाबाट IaC फाइलहरू सिर्जना गर्नुहोस्
azd infra generate

# azure.yaml बाट पूर्वाधार निर्माण गर्नुहोस्
azd infra synth
```

---

## 🎯 छिटो कार्यप्रवाहहरू

### विकास कार्यप्रवाह
```bash
# नयाँ परियोजना सुरु गर्नुहोस्
azd init --template todo-nodejs-mongo
cd my-project

# विकासमा तैनाथ गर्नुहोस्
azd env new dev
azd up

# परिवर्तन गर्नुहोस् र पुनः तैनाथ गर्नुहोस्
azd deploy

# निगरानी ड्यासबोर्ड खोल्नुहोस्
azd monitor --live
```

### बहु-वातावरण कार्यप्रवाह
```bash
# पर्यावरणहरू सेट अप गर्नुहोस्
azd env new dev
azd env new staging  
azd env new production

# विकासमा परिनियोजन गर्नुहोस्
azd env select dev
azd up

# परीक्षण गर्नुहोस् र स्टेजिङमा परिनियोजन गर्नुहोस्
azd env select staging
azd up

# उत्पादनमा परिनियोजन गर्नुहोस्
azd env select production
azd up
```

### समस्या समाधान कार्यप्रवाह
```bash
# डिबग मोड सक्षम गर्नुहोस्
export AZD_DEBUG=true

# परिनियोजन स्थिति जाँच गर्नुहोस्
azd show

# विन्यास मान्य गर्नुहोस्
azd config list

# लगका लागि निगरानी ड्यासबोर्ड खोल्नुहोस्
azd monitor --logs

# संसाधन स्थिति जाँच गर्नुहोस्
azd show --output json
```

## 🔍 डिबगिङ कमाण्डहरू

### डिबग जानकारी
```bash
# डिबग आउटपुट सक्षम गर्नुहोस्
export AZD_DEBUG=true
azd <command> --debug

# स्वच्छ आउटपुटका लागि टेलिमेट्री अक्षम गर्नुहोस्
export AZD_DISABLE_TELEMETRY=true

# वर्तमान कन्फिगरेसन जाँच गर्नुहोस्
azd config list

# प्रमाणीकरण स्थिति जाँच गर्नुहोस्
az account show
```

### टेम्पलेट डिबगिङ
```bash
# उपलब्ध टेम्पलेटहरू विवरणसहित सूचीबद्ध गर्नुहोस्
azd template list --output json

# टेम्पलेट जानकारी देखाउनुहोस्
azd template show <template-name>

# init गर्नु अघि टेम्पलेट मान्य गर्नुहोस्
azd template validate <template-name>
```

## 📁 फाइल र निर्देशिका कमाण्डहरू

### परियोजना संरचना
```bash
# हालको निर्देशिका संरचना देखाउनुहोस्
tree /f  # विन्डोज
find . -type f  # लिनक्स/म्याकओएस

# azd परियोजनाको मूल निर्देशिकामा जानुहोस्
cd $(azd root)

# azd को कन्फिगरेसन निर्देशिका देखाउनुहोस्
echo $AZD_CONFIG_DIR  # सामान्यतया ~/.azd
```

## 🎨 आउटपुट ढाँचा

### JSON आउटपुट
```bash
# स्क्रिप्टिङका लागि JSON आउटपुट प्राप्त गर्नुहोस्
azd show --output json
azd env list --output json
azd config list --output json

# jq प्रयोग गरेर पार्स गर्नुहोस्
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### तालिका आउटपुट
```bash
# तालिकाको रूपमा स्वरूपित गर्नुहोस्
azd env list --output table

# परिनियोजित सेवाहरू हेर्नुहोस्
azd show --output json | jq '.services | keys'
```

## 🔧 सामान्य कमाण्ड संयोजनहरू

### हेल्थ चेक स्क्रिप्ट
```bash
#!/bin/bash
# छिटो स्वास्थ्य जाँच
azd show
azd env show
azd monitor --logs
```

### परिनियोजन पुष्टि
```bash
#!/bin/bash
# पूर्व-तैनाती मान्यकरण
azd show
azd provision --preview  # तैनात गर्नु अघि परिवर्तनहरूको पूर्वावलोकन गर्नुहोस्
az account show
```

### वातावरण तुलना
```bash
#!/bin/bash
# वातावरणहरूको तुलना गर्नुहोस्
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### स्रोत सफाइ स्क्रिप्ट
```bash
#!/bin/bash
# पुराना वातावरणहरू सफा गर्नुहोस्
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 वातावरण भेरिएबलहरू

### साझा वातावरण भेरिएबलहरू
```bash
# Azure विन्यास
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# AZD विन्यास
export AZD_DEBUG=true
export AZD_DISABLE_TELEMETRY=true
export AZD_CONFIG_DIR="~/.azd"

# अनुप्रयोग विन्यास
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 आपतकालीन कमाण्डहरू

### छिटो समाधानहरू
```bash
# प्रमाणीकरण रिसेट गर्नुहोस्
az account clear
az login

# वातावरण जबर्जस्ती रिफ्रेश गर्नुहोस्
azd env refresh

# सबै सेवाहरू पुनः परिनियोजन गर्नुहोस्
azd deploy

# परिनियोजन स्थिति जाँच गर्नुहोस्
azd show --output json
```

### रिकभरी कमाण्डहरू
```bash
# विफल परिनियोजनबाट पुनर्प्राप्ति - सफा गरी पुनः परिनियोजन
azd down --force --purge
azd up

# केवल पूर्वाधार पुनः प्रावधान
azd provision

# केवल अनुप्रयोग पुनः परिनियोजन
azd deploy
```

## 💡 प्रो टिप्स

### छिटो कार्यप्रवाहका लागि अलियसहरू
```bash
# आफ्नो .bashrc वा .zshrc मा थप्नुहोस्
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### फंक्शन शॉर्टकटहरू
```bash
# छिटो वातावरण परिवर्तन
azd-env() {
    azd env select $1 && azd show
}

# निगरानी सहित छिटो परिनियोजन
azd-deploy-watch() {
    azd deploy --service $1 && azd monitor --live
}

# वातावरण स्थिति
azd-status() {
    echo "Current environment:"
    azd env show
    echo "Services:"
    azd show --output json | jq -r '.services | keys[]'
}
```

## 📖 सहयोग र दस्तावेज

### सहयोग प्राप्त गर्ने तरिका
```bash
# सामान्य सहायता
azd --help
azd help

# कमाण्ड-विशेष सहायता
azd up --help
azd env --help
azd config --help

# संस्करण र बिल्ड जानकारी देखाउनुहोस्
azd version
azd version --output json
```

### दस्तावेज लिंकहरू
```bash
# ब्राउजरमा प्रलेखन खोल्नुहोस्
azd docs

# ढाँचा प्रलेखन देखाउनुहोस्
azd template show <template-name> --docs
```

---

**सुझाव**: यो चीट शीट बुकमार्क गर्नुहोस् र चाहिने कमाण्ड छिटो फेला पार्न `Ctrl+F` प्रयोग गर्नुहोस्!

---

**नेभिगेसन**
- **अघिल्लो पाठ**: [Preflight Checks](../docs/pre-deployment/preflight-checks.md)
- **अर्को पाठ**: [शब्दावली](glossary.md)

---

> **💡 तपाइँको सम्पादकमा Azure कमाण्ड सहयोग चाहनुहुन्छ?** Install [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) with `npx skills add microsoft/github-copilot-for-azure` — AI, Foundry, परिनियोजन, डायग्नोस्टिक्स, र थपका लागि 37 सीपहरू.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
अस्वीकरण:
यो दस्तावेज AI अनुवाद सेवा Co-op Translator (https://github.com/Azure/co-op-translator) प्रयोग गरी अनुवाद गरिएको हो। हामी शुद्धतामा प्रतिबद्ध भए तापनि, कृपया ध्यान दिनुहोस् कि स्वचालित अनुवादहरूमा त्रुटि वा अशुद्धि हुन सक्छ। मूल भाषामा रहेको दस्तावेजलाई अधिकारिक स्रोत मानिनुपर्नेछ। महत्वपूर्ण जानकारीका लागि व्यावसायिक मानव अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न हुने कुनै पनि गलत बुझाइ वा गलत व्याख्याका लागि हामी जिम्मेवार छैनौं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->