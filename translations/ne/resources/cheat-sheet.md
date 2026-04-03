# कमाण्ड चिट शीट - अनिवार्य AZD कमाण्डहरू

**सभी अध्यायहरूको छिटो सन्दर्भ**
- **📚 कोर्स होम**: [AZD प्रारम्भकर्ताहरूको लागि](../README.md)
- **📖 छिटो सुरु**: [अध्याय 1: आधार र छिटो सुरु](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI कमाण्डहरू**: [अध्याय 2: AI-प्रथम विकास](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 उन्नत**: [अध्याय 4: पूर्वाधार कोडको रूपमा](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## परिचय

यो व्यापक चिट शीटले Azure Developer CLI को सबैभन्दा सामान्य रूपमा प्रयोग हुने कमाण्डहरूको छिटो सन्दर्भ प्रदान गर्दछ, वर्गीकरण अनुसार व्यावहारिक उदाहरणहरूसहित। विकास, समस्या समाधान, र दैनिक सञ्चालनका क्रममा azd प्रोजेक्टहरूसँग छिटो हेर्नको लागि उत्तम।

## सिक्नका लक्ष्यहरू

यो चिट शीटको प्रयोगले तपाईंलाई:
- अनिवार्य Azure Developer CLI कमाण्डहरू र सिन्ट्याक्समा तुरुन्त पहुँच उपलब्ध गराउँछ
- कार्यात्मक वर्गहरू र प्रयोग मामिलाहरू अनुसार कमाण्ड संगठन बुझ्न सहयत गर्दछ
- सामान्य विकास र व्यवस्थापन परिदृश्यहरूका व्यावहारिक उदाहरणहरू सन्दर्भ गर्न सघाउँछ
- छिटो समस्या समाधानका लागि समस्या निवारण कमाण्डहरूको पहुँच दिन्छ
- उन्नत कन्फिगरेसन र अनुकूलन विकल्पहरू सजिलै पत्ता लगाउन मद्दत गर्दछ
- वातावरण व्यवस्थापन र बहु-वातावरण कार्यप्रवाह कमाण्डहरू फेला पार्न सुविधा दिन्छ

## सिकाइ परिणामहरू

यस चिट शीटलाई नियमित प्रयोग गर्दा, तपाईं:
- पूर्ण कागजातहरू हेर्न नपरी विश्वासिलो रूपमा azd कमाण्डहरू चलाउन सक्षम हुनु हुनेछ
- उपयुक्त डायग्नोस्टिक कमाण्ड प्रयोग गरी सामान्य समस्याहरू छिटो समाधान गर्न सक्नुहुनेछ
- बहु वातावरण र व्यवस्थापन परिदृश्यहरू प्रभावकारी रूपमा व्यवस्थापन गर्न सक्नुहुनेछ
- आवश्यक परेको खण्डमा उन्नत azd सुविधाहरू र कन्फिगरेसन विकल्पहरू लागू गर्न सक्नुहुनेछ
- प्रणालीबद्ध कमाण्ड क्रममा समस्याहरू समाधान गर्न सक्नुहुनेछ
- azd छोटो मार्ग र विकल्पहरूको प्रभावकारी प्रयोगबाट कार्यप्रवाहहरू अनुकूलन गर्न सक्नुहुनेछ

## सुरु गर्ने कमाण्डहरू

### प्रमाणीकरण
```bash
# AZD मार्फत Azure मा लगइन गर्नुहोस्
azd auth login

# Azure CLI मा लगइन गर्नुहोस् (AZD यसलाई भित्रि रूपमा प्रयोग गर्दछ)
az login

# वर्तमान खाता जाँच गर्नुहोस्
az account show

# पूर्वनिर्धारित सदस्यता सेट गर्नुहोस्
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# AZD बाट लगआउट गर्नुहोस्
azd auth logout

# Azure CLI बाट लगआउट गर्नुहोस्
az logout
```

### प्रोजेक्ट सुरु गर्नुहोस्
```bash
# उपलब्ध ढाँचा हेर्नुहोस्
azd template list

# ढाँचाबाट प्रारम्भ गर्नुहोस्
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# वर्तमान निर्देशिकामा प्रारम्भ गर्नुहोस्
azd init .

# अनुकूल नामसहित प्रारम्भ गर्नुहोस्
azd init --template todo-nodejs-mongo my-awesome-app
```

## मुख्य व्यवस्थापन कमाण्डहरू

### पूर्ण व्यवस्थापन कार्यप्रवाह
```bash
# सबै कुरा तैनाथ गर्नुहोस् (प्रावधान + तैनाथ)
azd up

# पुष्टि संकेतहरू अक्षम गरी तैनाथ गर्नुहोस्
azd up --confirm-with-no-prompt

# विशिष्ट वातावरणमा तैनाथ गर्नुहोस्
azd up --environment production

# अनुकूलित प्यारामिटरहरूसँग तैनाथ गर्नुहोस्
azd up --parameter location=westus2
```

### पूर्वाधार मात्र
```bash
# अजुर स्रोतहरू पूर्वप्रदर्शन गर्नुहोस्
azd provision

# 🧪 पूर्वावलोकन पूर्वाधार परिवर्तनहरू
azd provision --preview
# कुन स्रोतहरू सिर्जना/परिमार्जन/मेटिने छन् भन्ने ड्राइ-रुन दृश्य देखाउँछ
# 'terraform plan' वा 'bicep what-if' जस्तो - चलाउन सुरक्षित, कुनै परिवर्तन लागू हुँदैन
```

### अनुप्रयोग मात्र
```bash
# अनुप्रयोग कोड परिनियोजन गर्नुहोस्
azd deploy

# विशेष सेवा परिनियोजन गर्नुहोस्
azd deploy --service web
azd deploy --service api

# सबै सेवाहरू परिनियोजन गर्नुहोस्
azd deploy --all
```

### निर्माण र प्याकेज
```bash
# अनुप्रयोगहरू तयार गर्नुहोस्
azd package

# विशिष्ट सेवा तयार गर्नुहोस्
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

# उपलब्ध वातावरणहरू देखाउनुहोस्
azd env list

# वातावरणको अवस्था ताजा गर्नुहोस्
azd env refresh
```

### वातावरण चरहरू
```bash
# वातावरण चर सेट गर्नुहोस्
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# वातावरण चर प्राप्त गर्नुहोस्
azd env get API_KEY

# सबै वातावरण चरहरूको सूची गर्नुहोस्
azd env get-values

# वातावरण चर हटाउनुहोस्
azd env unset DEBUG
```

## ⚙️ कन्फिगरेसन कमाण्डहरू

### ग्लोबल कन्फिगरेसन
```bash
# सबै कन्फिगरेसन सूचीबद्ध गर्नुहोस्
azd config show

# ग्लोबल पूर्वनिर्धारित सेट गर्नुहोस्
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# कन्फिगरेसन हटाउनुहोस्
azd config unset defaults.location

# सबै कन्फिगरेसन रीसेट गर्नुहोस्
azd config reset
```

### प्रोजेक्ट कन्फिगरेसन
```bash
# azure.yaml प्रमाणित गर्नुहोस्
azd config validate

# परियोजना जानकारी देखाउनुहोस्
azd show

# सेवा अन्तबिन्दुहरू प्राप्त गर्नुहोस्
azd show --output json
```

## 📊 अनुगमन र निदान

### अनुगमन ड्यासबोर्ड
```bash
# Azure पोर्टल अनुगमन ड्यासबोर्ड खोल्नुहोस्
azd monitor

# Application Insights लाइभ मेट्रिक्स खोल्नुहोस्
azd monitor --live

# Application Insights लग ब्लेड खोल्नुहोस्
azd monitor --logs

# Application Insights अवलोकन खोल्नुहोस्
azd monitor --overview
```

### कन्टेनर लगहरू हेर्नुहोस्
```bash
# Azure CLI मार्फत लगहरू हेर्नुहोस् (Container Apps का लागि)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# लगहरूलाई वास्तविक समयमा पछ्याउनुहोस्
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Azure Portal बाट लगहरू हेर्नुहोस्
azd monitor --logs
```

### लग एनालिटिक्स प्रश्नहरू
```bash
# Azure Portal मार्फत Access Log Analytics
azd monitor --logs

# Azure CLI प्रयोग गरी लगहरू सोधपुछ गर्नुहोस्
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ मर्मतसम्भार कमाण्डहरू

### सफाई
```bash
# सबै Azure स्रोतहरू हटाउनुहोस्
azd down

# पुष्टि बिना जबरजस्ती मेटाउनुहोस्
azd down --force

# सफ्ट-डिलिट गरिएका स्रोतहरू पूर्ण रूपमा हटाउनुहोस्
azd down --purge

# पूर्ण सफाइ गर्नुहोस्
azd down --force --purge
```

### अद्यावधिकहरू
```bash
# azd अपडेटहरूको जाँच गर्नुहोस्
azd version

# हालको संस्करण प्राप्त गर्नुहोस्
azd version

# वर्तमान कन्फिगरेसन हेर्नुहोस्
azd config show
```

## 🔧 उन्नत कमाण्डहरू

### पाइपलाइन र CI/CD
```bash
# GitHub Actions कन्फिगर गर्नुहोस्
azd pipeline config

# Azure DevOps कन्फिगर गर्नुहोस्
azd pipeline config --provider azdo

# पाइपलाइन कन्फिगरेसन देखाउनुहोस्
azd pipeline show
```

### पूर्वाधार व्यवस्थापन
```bash
# पूर्वाधार ढाँचा उत्पन्न गर्नुहोस्
azd infra generate

# 🧪 पूर्वाधार पूर्वावलोकन र योजना बनाउने
azd provision --preview
# बिना परिनियोजन पूर्वाधार provisioning सिमुलेट गर्छ
# Bicep/Terraform ढाँचाहरू विश्लेषण गर्छ र देखाउँछ:
# - थपिने स्रोतहरू (हरियो +)
# - परिमार्जन गरिने स्रोतहरू (पहेँलो ~)
# - मेटिने स्रोतहरू (रातो -)
# चलाउन सुरक्षित - Azure वातावरणमा कुनै वास्तविक परिवर्तन गरिएको छैन

# azure.yaml बाट पूर्वाधार संयोजन गर्नुहोस्
azd infra synth
```

### प्रोजेक्ट जानकारी
```bash
# परियोजना स्थिति र अन्त बिन्दुहरू देखाउनुहोस्
azd show

# विस्तृत परियोजना जानकारी JSON रूपमा देखाउनुहोस्
azd show --output json

# सेवा अन्त बिन्दुहरू प्राप्त गर्नुहोस्
azd show --output json | jq '.services'
```

## 🤖 AI र विस्तार कमाण्डहरू

### AZD विस्तारहरू
```bash
# उपलब्ध सबै एक्सटेन्सनहरू सूचीबद्ध गर्नुहोस् (AI सहित)
azd extension list

# Foundry एजेन्टहरू एक्सटेन्सन स्थापना गर्नुहोस्
azd extension install azure.ai.agents

# फाइन-ट्यूनिङ एक्सटेन्सन स्थापना गर्नुहोस्
azd extension install azure.ai.finetune

# कस्टम मोडेलहरू एक्सटेन्सन स्थापना गर्नुहोस्
azd extension install azure.ai.models

# सबै स्थापित एक्सटेन्सनहरू अपडेट गर्नुहोस्
azd extension upgrade --all
```

### AI एजेन्ट कमाण्डहरू
```bash
# म्यानिफेस्टबाट एजेन्ट परियोजना सुरु गर्नुहोस्
azd ai agent init -m <manifest-path-or-uri>

# एउटा विशिष्ट फाउन्ड्री परियोजनालाई लक्षित गर्नुहोस्
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# एजेन्ट स्रोत डिरेक्टरी निर्दिष्ट गर्नुहोस्
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# होस्टिङ लक्ष्य चयन गर्नुहोस्
azd ai agent init -m agent-manifest.yaml --host containerapp
```

### MCP सर्भर (अल्फा)
```bash
# तपाईंको परियोजनाको लागि MCP सर्भर सुरु गर्नुहोस्
azd mcp start

# MCP सञ्चालनहरूको लागि उपकरण सहमति व्यवस्थापन गर्नुहोस्
azd copilot consent list
```

### पूर्वाधार उत्पादन
```bash
# तपाईंको प्रोजेक्ट परिभाषाबाट IaC फाइलहरू सिर्जना गर्नुहोस्
azd infra generate

# azure.yaml बाट पूर्वाधार संश्लेषण गर्नुहोस्
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

# परिवर्तनहरू गर्नुहोस् र पुन: तैनाथ गर्नुहोस्
azd deploy

# अनुगमन ड्यासबोर्ड खोल्नुहोस्
azd monitor --live
```

### बहु-वातावरण कार्यप्रवाह
```bash
# वातावरण तयार गर्नुहोस्
azd env new dev
azd env new staging  
azd env new production

# विकासमा तैनाथ गर्नुहोस्
azd env select dev
azd up

# परीक्षण गर्नुहोस् र स्टेजिङमा बढाउनुहोस्
azd env select staging
azd up

# उत्पादनमा तैनाथ गर्नुहोस्
azd env select production
azd up
```

### समस्या समाधान कार्यप्रवाह
```bash
# डिबग मोड सक्षम गर्नुहोस्
export AZD_DEBUG=true

# वितरण स्थिति जाँच गर्नुहोस्
azd show

# कन्फिगरेसन प्रमाणित गर्नुहोस्
azd config show

# लगहरूको लागि अनुगमन ड्यासबोर्ड खोल्नुहोस्
azd monitor --logs

# स्रोत स्थिति जाँच गर्नुहोस्
azd show --output json
```

## 🔍 डिबगिङ कमाण्डहरू

### डिबग जानकारी
```bash
# डिबग आउटपुट सक्षम गर्नुहोस्
export AZD_DEBUG=true
azd <command> --debug

# सफा आउटपुटका लागि टेलिमेट्री अक्षम गर्नुहोस्
export AZD_DISABLE_TELEMETRY=true

# वर्तमान कन्फिगरेसन जाँच गर्नुहोस्
azd config show

# प्रमाणीकरण स्थिति जाँच गर्नुहोस्
az account show
```

### टेम्पलेट डिबगिङ
```bash
# विवरण सहित उपलब्ध ढाँचाहरू सूचीबद्ध गर्नुहोस्
azd template list --output json

# ढाँचा जानकारी देखाउनुहोस्
azd template show <template-name>

# आरम्भ गर्नु अघि ढाँचा प्रमाणित गर्नुहोस्
azd template validate <template-name>
```

## 📁 फाइल र निर्देशिका कमाण्डहरू

### प्रोजेक्ट संरचना
```bash
# वर्तमान डाइरेक्टरी संरचना देखाउनुहोस्
tree /f  # विन्डोज
find . -type f  # लिनक्स/macOS

# azd प्रोजेक्ट रुटमा जानुहोस्
cd $(azd root)

# azd कन्फिगरेशन डाइरेक्टरी देखाउनुहोस्
echo $AZD_CONFIG_DIR  # प्रायः ~/.azd हुन्छ
```

## 🎨 आउटपुट स्वरूपण

### JSON आउटपुट
```bash
# स्क्रिप्टिङको लागि JSON आउटपुट प्राप्त गर्नुहोस्
azd show --output json
azd env list --output json
azd config show --output json

# jq सँग पार्स गर्नुहोस्
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### तालिका आउटपुट
```bash
# तालिका स्वरूप गर्नुहोस्
azd env list --output table

# परिनियोजित सेवाहरू हेर्नुहोस्
azd show --output json | jq '.services | keys'
```

## 🔧 सामान्य कमाण्ड संयोजनहरू

### स्वास्थ्य जाँच स्क्रिप्ट
```bash
#!/bin/bash
# छिटो स्वास्थ्य जाँच
azd show
azd env get-values
azd monitor --logs
```

### व्यवस्थापन प्रमाणीकरण
```bash
#!/bin/bash
# पूर्व-वितरण प्रमाणीकरण
azd show
azd provision --preview  # वितरण अघि परिवर्तनहरू पूर्वावलोकन गर्नुहोस्
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

### स्रोत सफाई स्क्रिप्ट
```bash
#!/bin/bash
# पुराना वातावरणहरू सफा गर्नुहोस्
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 वातावरण चरहरू

### सामान्य वातावरण चरहरू
```bash
# Azure कन्फिगरेसन
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# AZD कन्फिगरेसन
export AZD_DEBUG=true
export AZD_DISABLE_TELEMETRY=true
export AZD_CONFIG_DIR="~/.azd"

# अनुप्रयोग कन्फिगरेसन
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 आपतकालीन कमाण्डहरू

### छिटो समाधानहरू
```bash
# प्रमाणिकरण रिसेट गर्नुहोस्
az account clear
az login

# वातावरणलाई जबरजस्ती रिफ्रेश गर्नुहोस्
azd env refresh

# सबै सेवाहरू पुनः तैनाथ गर्नुहोस्
azd deploy

# तैनाथी स्थिति जाँच गर्नुहोस्
azd show --output json
```

### पुनर्प्राप्ति कमाण्डहरू
```bash
# असफल परिनियोजनबाट पुनः प्राप्त गर्नुहोस् - सफा गर्नुहोस् र पुनः परिनियोजन गर्नुहोस्
azd down --force --purge
azd up

# मात्र पूर्वाधार पुनः प्रावधान गर्नुहोस्
azd provision

# मात्र आवेदन पुनः परिनियोजन गर्नुहोस्
azd deploy
```

## 💡 प्रो टिप्स

### छिटो कार्यप्रवाहका लागि उपनामहरू
```bash
# तपाइँको .bashrc वा .zshrc मा थप्नुहोस्
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### कार्य सर्टकटहरू
```bash
# छिटो वातावरण स्विचिङ
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
    azd env get-values
    echo "Services:"
    azd show --output json | jq -r '.services | keys[]'
}
```

## 📖 सहायता र कागजात

### सहायता प्राप्त गर्नुहोस्
```bash
# सामान्य मद्दत
azd --help
azd help

# कमाण्ड-विशेष मद्दत
azd up --help
azd env --help
azd config --help

# संस्करण र निर्माण जानकारी देखाउनुहोस्
azd version
azd version --output json
```

### कागजात लिंकहरू
```bash
# ब्राउजरमा दस्तावेज़ीकरण खोल्नुहोस्
azd docs

# टेम्प्लेट दस्तावेज़ीकरण देखाउनुहोस्
azd template show <template-name> --docs
```

---

**टिप**: यस चिट शीटलाई बुकमार्क गर्नुहोस् र तपाईंलाई आवश्यक कमाण्डहरू छिटो फेला पार्न `Ctrl+F` प्रयोग गर्नुहोस्!

---

**नेभिगेसन**
- **अघिल्लो पाठ**: [प्रीफ्लाइट जाँचहरू](../docs/pre-deployment/preflight-checks.md)
- **अर्को पाठ**: [शब्दावली](glossary.md)

---

> **💡 आफ्नो सम्पादकमा Azure कमाण्ड सहायता चाहनुहुन्छ?** [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) इन्स्टल गर्नुहोस् `npx skills add microsoft/github-copilot-for-azure` को साथ — AI, फाउन्ड्री, व्यवस्थापन, निदान, र धेरैका 37 सीपहरू।

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**पक्षपात अभिकथन**:  
यो दस्तावेज एआई अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) को प्रयोग गरी अनुवाद गरिएको हो। हामी शुद्धताका लागि प्रयासरत छौँ भने पनि, कृपया ध्यान दिनुहोस् कि स्वतः अनुवादमा त्रुटिहरू वा अशुद्धता हुनसक्छ। मूल दस्तावेज यसको मूल भाषामा अधिकारिक स्रोत मानिनु पर्छ। महत्वपूर्ण जानकारीका लागि व्यावसायिक मानव अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट हुने कुनै पनि गलत बुझाइ वा गलत व्याख्याका लागि हामी जिम्मेवार छैनौं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->