# Command Cheat Sheet - आवश्यक AZD आदेशहरू

**सबै अध्यायहरूको लागि छिटो सन्दर्भ**
- **📚 कोर्स होम**: [AZD सुरुवातकर्ताहरूका लागि](../README.md)
- **📖 छिटो सुरु**: [अध्याय 1: आधार र छिटो सुरुवात](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI आदेशहरू**: [अध्याय 2: AI-प्रथम विकास](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 उन्नत**: [अध्याय 4: पूर्वाधारलाई कोडको रूपमा](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## परिचय

यो व्यापक चीट शीटले सबैभन्दा सामान्य रूपमा प्रयोग हुने Azure Developer CLI आदेशहरूको छिटो सन्दर्भ प्रदान गर्छ, श्रेणीअनुसार व्यावहारिक उदाहरणहरूसँग व्यवस्थित। विकास, समस्या समाधान, र azd परियोजनाहरूका दैनिक अपरेशन्सका क्रममा छिटो हेर्नका लागि उत्तम।

## सिकाइ लक्ष्यहरू

यस चीट शीटको प्रयोग गरेर, तपाईंले:
- Azure Developer CLI का आवश्यक आदेशहरू र सिन्ट्याक्समा तुरुन्त पहुँच पाउन सक्नुहुनेछ
- आदेशहरूलाई कार्यात्मक श्रेणीहरू र प्रयोग केसहरूद्वारा कसरी व्यवस्थित गरिएको छ भन्ने बुझ्न सक्नुहुनेछ
- सामान्य विकास र परिनियोजन परिदृश्यहरूको लागि व्यावहारिक उदाहरणहरू सन्दर्भ गर्न सक्नुहुनेछ
- समस्या समाधानका लागि उपयुक्त ट्रबलशुटिङ आदेशहरू पहुँच गर्न सक्नुहुनेछ
- उन्नत कन्फिगरेसन र अनुकूलन विकल्पहरू प्रभावकारी रूपमा फेला पार्न सक्नुहुनेछ
- वातावरण व्यवस्थापन र बहु-पर्यावरण कार्यप्रवाहका आदेशहरू पत्ता लगाउन सक्नुहुनेछ

## सिकाइ नतिजाहरू

यस चीट शीटलाई नियमित रूपमा सन्दर्भ गर्दा, तपाईं सक्षम हुनुहुनेछ:
- पूर्ण दस्तावेज सन्दर्भ नगरी आत्मविश्वासका साथ azd आदेशहरू कार्यान्वयन गर्न सक्नुहुनेछ
- उपयुक्त डायग्नोस्टिक आदेशहरू प्रयोग गरी सामान्य समस्याहरू छिटो समाधान गर्न सक्नुहुनेछ
- बहु-पर्यावरण र परिनियोजन परिदृश्यहरूलाई कुशलतापूर्वक व्यवस्थापन गर्न सक्नुहुनेछ
- आवश्यकताअनुसार उन्नत azd सुविधाहरू र कन्फिगरेसन विकल्पहरू लागू गर्न सक्नुहुनेछ
- प्रणालीगत आदेश क्रमहरू प्रयोग गरी परिनियोजन समस्याहरू ट्रबलशुट गर्न सक्नुहुनेछ
- azd शर्टकटहरू र विकल्पहरूको प्रभावकारी प्रयोगमार्फत कार्यप्रवाहहरू अनुकूलन गर्न सक्नुहुनेछ

## सुरु गर्ने आदेशहरू

### प्रमाणीकरण
```bash
# AZD मार्फत Azure मा लगइन गर्नुहोस्
azd auth login

# Azure CLI मा लगइन गर्नुहोस् (AZD ले यसलाई आन्तरिक रूपमा प्रयोग गर्छ)
az login

# हालको खाता जाँच गर्नुहोस्
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

# अनुकूलित नामसहित आरम्भ गर्नुहोस्
azd init --template todo-nodejs-mongo my-awesome-app
```

## मुख्य परिनियोजन आदेशहरू

### पूर्ण परिनियोजन कार्यप्रवाह
```bash
# सबै तैनाथ गर्नुहोस् (प्राविजन + तैनाथ)
azd up

# पुष्टिकरण प्रॉम्प्टहरू निष्क्रिय गरेर तैनाथ गर्नुहोस्
azd up --confirm-with-no-prompt

# निर्दिष्ट वातावरणमा तैनाथ गर्नुहोस्
azd up --environment production

# अनुकूलित प्यारामिटरहरू सहित तैनाथ गर्नुहोस्
azd up --parameter location=westus2
```

### पूर्वाधार मात्र
```bash
# Azure स्रोतहरू प्रावधान गर्नुहोस्
azd provision

# 🧪 इन्फ्रास्ट्रक्चर परिवर्तनहरूको पूर्वावलोकन
azd provision --preview
# कुन स्रोतहरू सिर्जना/परिमार्जन/मेटाइने हुन् भन्ने ड्राइ-रन दृश्य देखाउँछ
# 'terraform plan' वा 'bicep what-if' जस्तै - चलाउन सुरक्षित, कुनै परिवर्तन लागू हुँदैन
```

### अनुप्रयोग मात्र
```bash
# अनुप्रयोग कोड परिनियोजन गर्नुहोस्
azd deploy

# विशिष्ट सेवा परिनियोजन गर्नुहोस्
azd deploy --service web
azd deploy --service api

# सबै सेवाहरू परिनियोजन गर्नुहोस्
azd deploy --all
```

### निर्माण र प्याकेज
```bash
# अनुप्रयोगहरू बनाउनुहोस्
azd package

# विशिष्ट सेवा निर्माण गर्नुहोस्
azd package --service api
```

## 🌍 पर्यावरण व्यवस्थापन

### पर्यावरण सञ्चालनहरू
```bash
# सबै वातावरणहरू सूचीबद्ध गर्नुहोस्
azd env list

# नयाँ वातावरण सिर्जना गर्नुहोस्
azd env new development
azd env new staging --location westus2

# वातावरण चयन गर्नुहोस्
azd env select production

# हालको वातावरण देखाउनुहोस्
azd env show

# वातावरणको स्थिति ताजा गर्नुहोस्
azd env refresh
```

### पर्यावरण चरहरू
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

## ⚙️ कन्फिगरेसन आदेशहरू

### वैश्विक कन्फिगरेसन
```bash
# सबै कन्फिगरेसनहरू सूचीबद्ध गर्नुहोस्
azd config list

# वैश्विक पूर्वनिर्धारित मानहरू सेट गर्नुहोस्
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# कन्फिगरेसन हटाउनुहोस्
azd config unset defaults.location

# सबै कन्फिगरेसनहरू रिसेट गर्नुहोस्
azd config reset
```

### परियोजना कन्फिगरेसन
```bash
# azure.yaml मान्य गर्नुहोस्
azd config validate

# प्रोजेक्ट जानकारी देखाउनुहोस्
azd show

# सेवा अन्तबिन्दुहरू प्राप्त गर्नुहोस्
azd show --output json
```

## 📊 अनुगमन र डायग्नोस्टिक्स

### अनुगमन ड्यासबोर्ड
```bash
# Azure पोर्टलको अनुगमन ड्यासबोर्ड खोल्नुहोस्
azd monitor

# Application Insights को लाइभ मेट्रिक्स खोल्नुहोस्
azd monitor --live

# Application Insights को लॉग्स ब्लेड खोल्नुहोस्
azd monitor --logs

# Application Insights को अवलोकन खोल्नुहोस्
azd monitor --overview
```

### कन्टेनर लगहरू हेर्ने
```bash
# Azure CLI मार्फत लॉगहरू हेर्नुहोस् (Container Apps का लागि)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# लॉगहरू वास्तविक-समयमा अनुगमन गर्नुहोस्
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Azure Portal बाट लॉगहरू हेर्नुहोस्
azd monitor --logs
```

### लग एनालिटिक्स क्वेरीहरू
```bash
# Azure पोर्टल मार्फत Log Analytics मा पहुँच गर्नुहोस्
azd monitor --logs

# Azure CLI प्रयोग गरेर लॉगहरू क्वेरी गर्नुहोस्
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ मर्मत आदेशहरू

### सफा गर्ने
```bash
# सबै Azure स्रोतहरू हटाउनुहोस्
azd down

# पुष्टिकरण बिना बलपूर्वक मेटाउनुहोस्
azd down --force

# सफ्ट-डिलिट गरिएका स्रोतहरू पूर्ण रूपमा हटाउनुहोस्
azd down --purge

# पूर्ण सरसफाइ
azd down --force --purge
```

### अपडेटहरू
```bash
# azd अपडेटहरूको जाँच गर्नुहोस्
azd version

# हालको संस्करण प्राप्त गर्नुहोस्
azd version

# हालको कन्फिगरेसन हेर्नुहोस्
azd config list
```

## 🔧 उन्नत आदेशहरू

### पाइपलाइन र CI/CD
```bash
# GitHub Actions कन्फिगर गर्नुहोस्
azd pipeline config

# Azure DevOps कन्फिगर गर्नुहोस्
azd pipeline config --provider azdo

# पाइपलाइनको कन्फिगरेसन देखाउनुहोस्
azd pipeline show
```

### पूर्वाधार व्यवस्थापन
```bash
# पूर्वाधार टेम्पलेटहरू उत्पन्न गर्नुहोस्
azd infra generate

# 🧪 पूर्वाधार पूर्वावलोकन र योजना
azd provision --preview
# डिप्लॉय नगरी पूर्वाधार प्रावधानको अनुकरण गर्दछ
# Bicep/Terraform टेम्पलेटहरू विश्लेषण गरी देखाउँछ:
# - थपिने स्रोतहरू (हरियो +)
# - परिवर्तन हुने स्रोतहरू (पहेलो ~)
# - हटाइने स्रोतहरू (रातो -)
# चलाउन सुरक्षित - Azure वातावरणमा कुनै वास्तविक परिवर्तन गरिँदैन

# azure.yaml बाट पूर्वाधार संश्लेषण गर्नुहोस्
azd infra synth
```

### परियोजना जानकारी
```bash
# परियोजनाको स्थिति र अन्तबिन्दुहरू देखाउनुहोस्
azd show

# विस्तृत परियोजनाको जानकारी JSON रूपमा देखाउनुहोस्
azd show --output json

# सेवा अन्तबिन्दुहरू प्राप्त गर्नुहोस्
azd show --output json | jq '.services'
```

## 🎯 छिटो कार्यप्रवाहहरू

### विकास कार्यप्रवाह
```bash
# नयाँ परियोजना सुरु गर्नुहोस्
azd init --template todo-nodejs-mongo
cd my-project

# विकासमा तैनात गर्नुहोस्
azd env new dev
azd up

# परिवर्तनहरू गर्नुहोस् र पुनः तैनात गर्नुहोस्
azd deploy

# निगरानी ड्यासबोर्ड खोल्नुहोस्
azd monitor --live
```

### बहु-पर्यावरण कार्यप्रवाह
```bash
# पर्यावरणहरू सेटअप गर्नुहोस्
azd env new dev
azd env new staging  
azd env new production

# विकास वातावरणमा परिनियोजन गर्नुहोस्
azd env select dev
azd up

# परीक्षण गर्नुहोस् र स्टेजिङ वातावरणमा परिनियोजन गर्नुहोस्
azd env select staging
azd up

# उत्पादन वातावरणमा परिनियोजन गर्नुहोस्
azd env select production
azd up
```

### समस्या समाधान कार्यप्रवाह
```bash
# डिबग मोड सक्षम गर्नुहोस्
export AZD_DEBUG=true

# परिनियोजन स्थिति जाँच गर्नुहोस्
azd show

# कन्फिगरेसन सत्यापित गर्नुहोस्
azd config list

# लगहरूको लागि अनुगमन ड्यासबोर्ड खोल्नुहोस्
azd monitor --logs

# स्रोतहरूको स्थिति जाँच गर्नुहोस्
azd show --output json
```

## 🔍 डिबगिङ आदेशहरू

### डिबग जानकारी
```bash
# डिबग आउटपुट सक्षम गर्नुहोस्
export AZD_DEBUG=true
azd <command> --debug

# सफा आउटपुटको लागि टेलिमेट्री अक्षम गर्नुहोस्
export AZD_DISABLE_TELEMETRY=true

# हालको विन्यास जाँच गर्नुहोस्
azd config list

# प्रमाणीकरण स्थिति जाँच गर्नुहोस्
az account show
```

### टेम्पलेट डिबगिङ
```bash
# विवरणसहित उपलब्ध टेम्पलेटहरू सूचीबद्ध गर्नुहोस्
azd template list --output json

# टेम्पलेट जानकारी देखाउनुहोस्
azd template show <template-name>

# init अघि टेम्पलेट मान्य गर्नुहोस्
azd template validate <template-name>
```

## 📁 फाइल र डाइरेक्टरी आदेशहरू

### परियोजना संरचना
```bash
# वर्तमान निर्देशिका संरचना देखाउनुहोस्
tree /f  # विन्डोज
find . -type f  # लिनक्स/म्याकओएस

# azd परियोजनाको मूल निर्देशिकामा जानुहोस्
cd $(azd root)

# azd कन्फिगरेसन निर्देशिका देखाउनुहोस्
echo $AZD_CONFIG_DIR  # सामान्यतया ~/.azd
```

## 🎨 आउटपुट ढाँचा

### JSON आउटपुट
```bash
# स्क्रिप्टिङको लागि JSON आउटपुट प्राप्त गर्नुहोस्
azd show --output json
azd env list --output json
azd config list --output json

# jq प्रयोग गरेर पार्स गर्नुहोस्
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### टेबल आउटपुट
```bash
# तालिका रूपमा ढाँचा गर्नुहोस्
azd env list --output table

# तैनाथ सेवाहरू हेर्नुहोस्
azd show --output json | jq '.services | keys'
```

## 🔧 सामान्य आदेश संयोजनहरू

### हेल्थ चेक स्क्रिप्ट
```bash
#!/bin/bash
# छिटो स्वास्थ्य जाँच
azd show
azd env show
azd monitor --logs
```

### परिनियोजन मान्यकरण
```bash
#!/bin/bash
# तैनातीको पूर्व मान्यकरण
azd show
azd provision --preview  # तैनाती गर्नु अघि परिवर्तनहरूको पूर्वावलोकन
az account show
```

### पर्यावरण तुलना
```bash
#!/bin/bash
# वातावरणहरू तुलना गर्नुहोस्
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

## 📝 पर्यावरण भेरिएबलहरू

### सामान्य पर्यावरण भेरिएबलहरू
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

## 🚨 आपतकालीन आदेशहरू

### छिटो समाधानहरू
```bash
# प्रमाणीकरण रिसेट गर्नुहोस्
az account clear
az login

# वातावरणलाई जबर्जस्ती रिफ्रेश गर्नुहोस्
azd env refresh

# सबै सेवाहरू पुनः तैनाथ गर्नुहोस्
azd deploy

# तैनाती स्थिति जाँच गर्नुहोस्
azd show --output json
```

### पुनर्प्राप्ति आदेशहरू
```bash
# विफल तैनातीबाट पुनर्स्थापना - सफा गरी पुनःतैनात
azd down --force --purge
azd up

# केवल पूर्वाधार पुनःप्रावधान
azd provision

# केवल अनुप्रयोग पुनःतैनात
azd deploy
```

## 💡 प्रो सुझावहरू

### द्रुत कार्यप्रवाहका लागि अलियसहरू
```bash
# आफ्नो .bashrc वा .zshrc मा थप्नुहोस्
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### फङ्सन शर्टकटहरू
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

## 📖 सहायता र दस्तावेज

### सहायता प्राप्त गर्नु
```bash
# सामान्य सहायता
azd --help
azd help

# कमाण्ड-विशिष्ट सहायता
azd up --help
azd env --help
azd config --help

# संस्करण र बिल्ड जानकारी देखाउनुहोस्
azd version
azd version --output json
```

### दस्तावेज लिङ्कहरू
```bash
# ब्राउजरमा दस्तावेज खोल्नुहोस्
azd docs

# टेम्पलेट दस्तावेज देखाउनुहोस्
azd template show <template-name> --docs
```

---

**टिप**: यस चीट शीटलाई बुकमार्क गर्नुहोस् र आवश्यक आदेशहरू छिटो फेला पार्न `Ctrl+F` प्रयोग गर्नुहोस्!

---

**नेभिगेशन**
- **अघिल्लो पाठ**: [Preflight Checks](../docs/pre-deployment/preflight-checks.md)
- **अर्को पाठ**: [शब्दावली](glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
अस्वीकरण:
यस दस्तावेजलाई AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) प्रयोग गरी अनुवाद गरिएको हो। हामी शुद्धताका लागि प्रयासरत भए तापनि, कृपया जानकार रहनुहोस् कि स्वचालित अनुवादमा त्रुटि वा अशुद्धता हुनसक्छ। मूल दस्तावेज त्यसको मूल भाषामा नै अधिकारिक स्रोत मानिनु पर्छ। महत्वपूर्ण जानकारीका लागि पेशेवर मानव अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न कुनै पनि गलतफहमी वा गलत व्याख्याका लागि हामी जिम्मेवार हुनेछैनौं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->