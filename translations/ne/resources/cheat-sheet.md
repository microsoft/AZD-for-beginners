# कमाण्ड चीट सिट - आवश्यक AZD कमाण्डहरू

**सबै अध्यायहरूको छिटो सन्दर्भ**
- **📚 कोर्स गृह**: [AZD शुरुवातकर्ताहरूका लागि](../README.md)
- **📖 छिटो सुरूवात**: [अध्याय 1: आधार र छिटो शुरूआत](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI कमाण्डहरू**: [अध्याय 2: AI-प्रथम विकास](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 उन्नत**: [अध्याय 4: पूर्वाधारलाई कोडको रूपमा](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## परिचय

यो व्यापक चीट सिटले सबैभन्दा सामान्य रूपमा प्रयोग गरिने Azure Developer CLI कमाण्डहरूको छिटो सन्दर्भ प्रदान गर्दछ, कार्यक्षेत्र अनुसार व्यवस्थित र व्यवहारिक उदाहरणहरूसहित। azd परियोजनाहरूको विकास, समस्यासाधन, र दैनिक अपरेशन्सका लागि छिटो खोजीको लागि उपयुक्त छ।

## सिकाइ लक्ष्यहरू

यस चीट सिट प्रयोग गरेर, तपाइँ:
- आवश्यक Azure Developer CLI कमाण्डहरू र सिन्ट्याक्समा तुरुन्त पहुँच पाउनुहुनेछ
- कार्यगत कोटीहरू र प्रयोग केसहरूअनुसार कमाण्डहरूको संगठन बुझ्नुहुनेछ
- सामान्य विकास र तैनाती परिदृश्यहरूको लागि व्यवहारिक उदाहरणहरू सन्दर्भ गर्न सक्नुहुनेछ
- छिटो समस्यासाधनका लागि डायग्नोस्टिक कमाण्डहरूसम्म पहुँच पाउनुहुनेछ
- उन्नत कन्फिगरेसन र कस्टमाइजेसन विकल्पहरू प्रभावकारी रूपमा प्रयोग गर्न सक्नुहुनेछ
- वातावरण व्यवस्थापन र बहु-वातावरण कार्यप्रवाह कमाण्डहरू पत्ता लगाउन सक्नुहुनेछ

## सिकाइ नतिजाहरू

यस चीट सिटको नियमित सन्दर्भले, तपाईं सक्षम हुनुहुनेछ:
- पूर्ण दस्तावेज हेर्नु नपरी आत्मविश्वासपूर्वक azd कमाण्डहरू चलाउन
- उपयुक्त डायग्नोस्टिक कमाण्ड प्रयोग गरेर सामान्य समस्याहरू छिटो समाधान गर्न
- धेरै वातावरण र तैनाती परिदृश्यहरू कुशलतापूर्वक व्यवस्थापन गर्न
- आवश्यक अनुसार उन्नत azd सुविधाहरू र कन्फिगरेसन विकल्पहरू लागू गर्न
- व्यवस्थित कमाण्ड अनुक्रमहरू प्रयोग गरी तैनाती समस्याहरू निदान गर्न
- azd छोटकरीहरू र विकल्पहरूको प्रभावकारी प्रयोगबाट कार्यप्रवाहहरू अनुकूलन गर्न

## सुरु गर्ने कमाण्डहरू

### प्रमाणीकरण
```bash
# AZD मार्फत Azure मा लगइन गर्नुहोस्
azd auth login

# Azure CLI मा लगइन गर्नुहोस् (AZD ले पृष्ठभूमिमा यसलाई प्रयोग गर्छ)
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

### परियोजना प्रारम्भ
```bash
# उपलब्ध टेम्पलेटहरू ब्राउज़ गर्नुहोस्
azd template list

# टेम्पलेटबाट सुरु गर्नुहोस्
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# हालको निर्देशिकामा सुरु गर्नुहोस्
azd init .

# अनुकूलित नामसँग सुरु गर्नुहोस्
azd init --template todo-nodejs-mongo my-awesome-app
```

## मुख्य तैनाती कमाण्डहरू

### पूर्ण तैनाती कार्यप्रवाह
```bash
# सबै डिप्लोय गर्नुहोस् (प्रोभिजन + डिप्लोय)
azd up

# पुष्टिकरण संकेतहरू अक्षम गरेर डिप्लोय गर्नुहोस्
azd up --confirm-with-no-prompt

# विशिष्ट वातावरणमा डिप्लोय गर्नुहोस्
azd up --environment production

# अनुकूलित प्यारामिटरहरूसँग डिप्लोय गर्नुहोस्
azd up --parameter location=westus2
```

### केवल पूर्वाधार
```bash
# Azure स्रोतहरू प्रावधान गर्नुहोस्
azd provision

# 🧪 पूर्वाधार परिवर्तनहरूको पूर्वावलोकन
azd provision --preview
# ड्राइ-रन दृश्य देखाउँछ कि कुन स्रोतहरू सिर्जना/संशोधित/मेटिने थिए
# 'terraform plan' वा 'bicep what-if' जस्तै — चलाउन सुरक्षित, कुनै परिवर्तन लागू हुँदैन
```

### केवल एप्लिकेशन
```bash
# अनुप्रयोग कोड परिनियोजन गर्नुहोस्
azd deploy

# विशिष्ट सेवा परिनियोजन गर्नुहोस्
azd deploy --service web
azd deploy --service api

# सबै सेवाहरू परिनियोजन गर्नुहोस्
azd deploy --all
```

### बिल्ड र प्याकेज
```bash
# अनुप्रयोगका निर्भरताहरू पुनर्स्थापना (डाउनलोड)
azd restore

# विशिष्ट सेवा पुनर्स्थापना गर्नुहोस्
azd restore --service api

# डिप्लोय नगरी डिप्लोययोग्य आर्टिफ्याक्ट निर्माण गर्नुहोस्
azd package

# विशिष्ट सेवा निर्माण गर्नुहोस्
azd package --service api
```

> **`azd restore`** तपाईँको एपको निर्भरता (npm, pip, NuGet, Maven, आदि) डाउनलोड गर्छ। यो `azd package` र `azd deploy` चलाउँदा स्वचालित रूपमा चलेको हुन्छ, त्यसैले तपाईंले प्रायः यसलाई सिधा कल गर्नुहुन्न—पहिले निर्भरता पूर्व-प्राप्त गर्न (उदाहरणका लागि, CI क्याश तातो पार्न वा पछि अफलाइनमा काम गर्न) म्यानुअली चलाउनुहोस्।

> **`azd package`** डिप्लोययोग्य आर्टिफ्याक्ट (एक कन्टेनर इमेज वा जिप) बनाउँछ **बिना** यसलाई Azure मा पुश गरेको। एक्लै प्रयोग गरेर बिल्ड सफल भयो कि भएन भनी जाँच गर्न, आउटपुट निरीक्षण गर्न, वा अलग प्रक्रियाले पछि तैनाथ गर्ने आर्टिफ्याक्ट उत्पादन गर्न प्रयोग गर्नुहोस्। `azd deploy` ले स्वचालित रूपमा प्याकेज गर्छ, त्यसैले तपाईंले मात्र तबै `azd package` चाहिन्छ जब तपाईंले तैनाथ नगरी आर्टिफ्याक्ट चाहनुहुन्छ।

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

## ⚙️ कन्फिगरेसन कमाण्डहरू

### वैश्विक कन्फिगरेसन
```bash
# सबै कन्फिगरेसनहरू सूचीबद्ध गर्नुहोस्
azd config show

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

# परियोजनाको जानकारी देखाउनुहोस्
azd show

# सेवा एन्डप्वाइन्टहरू प्राप्त गर्नुहोस्
azd show --output json
```

## 📊 निगरानी र निदान

### निगरानी ड्यासबोर्ड
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

### कन्टेनर लगहरू हेर्ने
```bash
# Azure CLI मार्फत लगहरू हेर्नुहोस् (Container Apps को लागि)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# वास्तविक समयमा लगहरू पछ्याउनुहोस्
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Azure Portal बाट लगहरू हेर्नुहोस्
azd monitor --logs
```

### लग एनालिटिक्स क्वेरीहरू
```bash
# Azure पोर्टल मार्फत Log Analytics पहुँच गर्नुहोस्
azd monitor --logs

# Azure CLI प्रयोग गरेर लगहरू सोधपुछ गर्नुहोस्
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ मर्मतसम्भार कमाण्डहरू

### सफाइ
```bash
# सबै Azure संसाधनहरू हटाउनुहोस्
azd down

# पुष्टिकरण बिना जबर्जस्ती मेटाउनुहोस्
azd down --force

# अस्थायी रूपमा मेटाइएका संसाधनहरू स्थायी रूपमा हटाउनुहोस्
azd down --purge

# पूर्ण सरसफाइ पूरा गर्नुहोस्
azd down --force --purge
```

### अपडेटहरू
```bash
# azd अपडेटहरू जाँच गर्नुहोस्
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

# पाइपलाइनको कन्फिगरेसन देखाउनुहोस्
azd pipeline show
```

### पूर्वाधार व्यवस्थापन
```bash
# पूर्वाधार टेम्पलेटहरू उत्पन्न गर्नुहोस्
azd infra generate

# 🧪 पूर्वाधार पूर्वावलोकन र योजना
azd provision --preview
# तैनात नगरी पूर्वाधार प्रोभिजनिङ अनुकरण गर्छ
# Bicep/Terraform टेम्पलेटहरू विश्लेषण गरेर देखाउँछ:
# - थपिने संसाधनहरू (हरियो +)
# - परिमार्जन गरिने संसाधनहरू (पहेलो ~)
# - हटाइने संसाधनहरू (रातो -)
# चलाउन सुरक्षित - Azure वातावरणमा कुनै वास्तविक परिवर्तन गरिएको छैन

# azure.yaml बाट पूर्वाधार संश्लेषण गर्नुहोस्
azd infra synth
```

### परियोजना जानकारी
```bash
# परियोजनाको स्थिति र अन्त्यबिन्दुहरू देखाउनुहोस्
azd show

# विस्तृत परियोजना जानकारी JSON को रूपमा देखाउनुहोस्
azd show --output json

# सेवा अन्त्यबिन्दुहरू प्राप्त गर्नुहोस्
azd show --output json | jq '.services'
```

## 🤖 AI र एक्सटेन्सन कमाण्डहरू

### AZD एक्सटेन्सनहरू
```bash
# सबै उपलब्ध एक्सटेन्सनहरू सूचीबद्ध गर्नुहोस् (AI सहित)
azd extension list

# Foundry agents एक्सटेन्सन स्थापना गर्नुहोस्
azd extension install azure.ai.agents

# agent skills एक्सटेन्सन स्थापना गर्नुहोस् (पूर्वावलोकन)
azd extension install azure.ai.skills

# Foundry connections एक्सटेन्सन स्थापना गर्नुहोस् (पूर्वावलोकन)
azd extension install azure.ai.connections

# fine-tuning एक्सटेन्सन स्थापना गर्नुहोस्
azd extension install azure.ai.finetune

# custom models एक्सटेन्सन स्थापना गर्नुहोस्
azd extension install azure.ai.models

# स्थापित सबै एक्सटेन्सनहरू अपग्रेड गर्नुहोस्
azd extension upgrade --all
```

### AI एजेन्ट कमाण्डहरू
```bash
# म्यानिफेस्टबाट एजेन्ट परियोजना प्रारम्भ गर्नुहोस्
azd ai agent init -m <manifest-path-or-uri>

# निर्दिष्ट Foundry परियोजनालाई लक्षित गर्नुहोस्
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# एजेन्ट स्रोत निर्देशिका निर्दिष्ट गर्नुहोस्
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# होस्टिङ लक्ष्य चयन गर्नुहोस्
azd ai agent init -m agent-manifest.yaml --host containerapp

# परिनियोजित एजेन्ट परीक्षण गर्नुहोस् (लेटेन्सी + पहिलो-बाइटसम्मको समय मुद्रण गर्छ)
azd ai agent invoke

# लाइभ अन्त्यबिन्दु कन्फिगरेसन देखाउनुहोस्
azd ai agent endpoint show

# मूल्यांकन डेटासेट सिर्जना गर्नुहोस्, त्यसपछि एजेन्ट अनुकूल गर्नुहोस्
azd ai agent eval generate
azd ai agent optimize

# कोड-आधारित होस्ट गरिएको एजेन्टको परिनियोजित स्रोत डाउनलोड गर्नुहोस्
azd ai agent code download

# होस्ट गरिएको एजेन्ट र यसको सबै संस्करणहरू मेटाउनुहोस् (--force सक्रिय सत्रहरू समाप्त गर्छ)
azd ai agent delete --force
```

### MCP सर्भर (अल्फा)
```bash
# तपाईंको परियोजनाका लागि MCP सर्भर सुरु गर्नुहोस्
azd mcp start

# MCP कार्यहरूको लागि उपकरण सहमति व्यवस्थापन गर्नुहोस्
azd copilot consent list
```

### पूर्वाधार उत्पन्न
```bash
# तपाईंको परियोजना परिभाषाबाट IaC फाइलहरू उत्पन्न गर्नुहोस्
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

# विकासमा परिनियोजन गर्नुहोस्
azd env new dev
azd up

# परिवर्तनहरू गर्नुहोस् र पुनः परिनियोजन गर्नुहोस्
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

# डेभमा परिनियोजन गर्नुहोस्
azd env select dev
azd up

# परीक्षण गरी स्टेजिङमा परिनियोजन गर्नुहोस्
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

# तैनाती स्थिति जाँच गर्नुहोस्
azd show

# कन्फिगरेसन मान्य गर्नुहोस्
azd config show

# लगहरूको लागि निगरानी ड्यासबोर्ड खोल्नुहोस्
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
azd config show

# प्रमाणीकरण स्थिति जाँच गर्नुहोस्
az account show
```

### टेम्प्लेट डिबगिङ
```bash
# विवरणसहित उपलब्ध टेम्पलेटहरू सूचीबद्ध गर्नुहोस्
azd template list --output json

# टेम्पलेट जानकारी देखाउनुहोस्
azd template show <template-name>

# init गर्नु अघि टेम्पलेट मान्य गर्नुहोस्
azd template validate <template-name>
```

## 📁 फाइल र डाइरेक्टरी कमाण्डहरू

### परियोजना संरचना
```bash
# वर्तमान निर्देशिका संरचना देखाउनुहोस्
tree /f  # Windows
find . -type f  # Linux/macOS

# azd परियोजना मूलमा जानुहोस्
cd $(azd root)

# azd कन्फिगरेसन निर्देशिका देखाउनुहोस्
echo $AZD_CONFIG_DIR  # सामान्यतया ~/.azd
```

## 🎨 आउटपुट फर्म्याटिङ

### JSON आउटपुट
```bash
# स्क्रिप्टिङका लागि JSON आउटपुट प्राप्त गर्नुहोस्
azd show --output json
azd env list --output json
azd config show --output json

# jq प्रयोग गरेर पार्स गर्नुहोस्
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### तालिका आउटपुट
```bash
# तालिकाको रूपमा स्वरूप गर्नुहोस्
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
azd env get-values
azd monitor --logs
```

### तैनाती मान्यकरण
```bash
#!/bin/bash
# पूर्व-तैनाती सत्यापन
azd show
azd provision --preview  # तैनाती गर्नु अघि परिवर्तनहरूको पूर्वावलोकन गर्नुहोस्
az account show
```

### वातावरण तुलना
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

### छिटो सुधार
```bash
# प्रमाणीकरण पुनः सेट गर्नुहोस्
az account clear
az login

# वातावरण बलपूर्वक रिफ्रेश गर्नुहोस्
azd env refresh

# सबै सेवाहरू पुनः तैनाथ गर्नुहोस्
azd deploy

# तैनातीको स्थिति जाँच गर्नुहोस्
azd show --output json
```

### पुनर्प्राप्ति कमाण्डहरू
```bash
# असफल तैनातीबाट पुनः प्राप्ति - सफा गरेर पुनः तैनात गर्नुहोस्
azd down --force --purge
azd up

# पूर्वाधार मात्र पुनः प्रावधान गर्नुहोस्
azd provision

# अनुप्रयोग मात्र पुनः तैनात गर्नुहोस्
azd deploy
```

## 💡 प्रो टिप्स

### छिटो कार्यप्रवाहका लागि अलियसहरू
```bash
# तपाईंको .bashrc वा .zshrc मा थप्नुहोस्
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### फंक्शन छोटोमार्गहरू
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
    azd env get-values
    echo "Services:"
    azd show --output json | jq -r '.services | keys[]'
}
```

## 📖 सहायता र दस्तावेजीकरण

### सहायता प्राप्त गर्ने
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

### दस्तावेजीकरण लिंकहरू
```bash
# ब्राउजरमा दस्तावेज खोल्नुहोस्
azd docs

# टेम्पलेट दस्तावेज देखाउनुहोस्
azd template show <template-name> --docs
```

---

**Tip**: यो चीट सिटलाई बुकमार्क गर्नुहोस् र चाहिने कमाण्डहरू छिटो फेला पार्न `Ctrl+F` प्रयोग गर्नुहोस्!

---

**नेभिगेशन**
- **अघिल्लो पाठ**: [Preflight Checks](../docs/pre-deployment/preflight-checks.md)
- **अर्को पाठ**: [परिभाषाहरू](glossary.md)

---

> **💡 के तपाइँको सम्पादकमा Azure कमाण्ड सहयोग चाहनुहुन्छ?** `npx skills add microsoft/github-copilot-for-azure` प्रयोग गरी [Microsoft Azure एजेन्ट स्किल्स](https://skills.sh/microsoft/github-copilot-for-azure) इन्स्टल गर्नुहोस् — AI, Foundry, तैनाती, डायग्नोस्टिक्स, र थपका लागि 37 स्किलहरू।

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
यो दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) प्रयोग गरेर अनुवाद गरिएको हो। हामी सही हुन प्रयास गर्छौं, तर कृपया जानकार हुनुस् कि स्वचालित अनुवादमा त्रुटिहरू वा अशुद्धताहरू हुन सक्छन्। मूल दस्तावेज़ यसको मूल भाषामा आधिकारिक स्रोत मानिनुपर्छ। महत्वपूर्ण जानकारीका लागि व्यावसायिक मानव अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न कुनै पनि गलत बुझाइ वा त्रुटिको लागि हामी जिम्मेवार छैनौं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->