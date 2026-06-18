# AI कार्यशाला लैब: अपने AI समाधानों को AZD-परिनियोज्य बनाना

**अध्याय नेविगेशन:**
- **📚 Course Home**: [AZD शुरुआती के लिए](../../README.md)
- **📖 Current Chapter**: अध्याय 2 - एआई-प्रथम विकास
- **⬅️ Previous**: [AI मॉडल परिनियोजन](ai-model-deployment.md)
- **➡️ Next**: [प्रोडक्शन AI सर्वोत्तम प्रथाएँ](production-ai-practices.md)
- **🚀 Next Chapter**: [अध्याय 3: विन्यास](../chapter-03-configuration/configuration.md)

## कार्यशाला अवलोकन

यह प्रायोगिक लैब डेवलपर्स को मौजूदा AI टेम्पलेट लेकर Azure Developer CLI (AZD) का उपयोग करके परिनियोजित करने की प्रक्रिया के माध्यम से मार्गदर्शन करती है। आप Microsoft Foundry सेवाओं का उपयोग करते हुए उत्पादन-स्तर AI परिनियोजन के लिए आवश्यक पैटर्न सीखेंगे।

> **Validation note (2026-03-25):** इस वर्कशॉप की समीक्षा `azd` `1.23.12` के खिलाफ की गई थी। यदि आपका स्थानीय इंस्टॉलेशन पुराने संस्करण का है, तो आरंभ करने से पहले AZD को अपडेट करें ताकि ऑथ, टेम्पलेट और परिनियोजन वर्कफ़्लो नीचे दिए गए चरणों से मेल खाए।

**अवधि:** 2-3 घंटे  
**स्तर:** मध्यवर्ती  
**पूर्व आवश्यकता:** Azure का बुनियादी ज्ञान, AI/ML अवधारणाओं की परिचितता

## 🎓 सीखने के उद्देश्य

इस कार्यशाला के अंत तक, आप सक्षम होंगे:
- ✅ मौजूदा AI एप्लिकेशन को AZD टेम्पलेट्स का उपयोग करने के लिए परिवर्तित करना
- ✅ AZD के साथ Microsoft Foundry सेवाओं को कॉन्फ़िगर करना
- ✅ AI सेवाओं के लिए सुरक्षित क्रेडेंशियल प्रबंधन लागू करना
- ✅ निगरानी के साथ उत्पादन-तैयार AI एप्लिकेशन परिनियोजित करना
- ✅ सामान्य AI परिनियोजन समस्याओं का निवारण करना

## पूर्व आवश्यकताएँ

### आवश्यक उपकरण
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) स्थापित
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) स्थापित
- [Git](https://git-scm.com/) स्थापित
- कोड एडिटर (VS Code अनुशंसित)

### Azure संसाधन
- Contributor एक्सेस के साथ Azure सब्सक्रिप्शन
- Microsoft Foundry Models सेवाओं तक पहुँच (या पहुँच का अनुरोध करने की क्षमता)
- Resource group बनाने की अनुमति

### ज्ञान पूर्वापेक्षाएँ
- Azure सेवाओं की बुनियादी समझ
- कमांड-लाइन इंटरफेस की परिचितता
- AI/ML की बुनियादी अवधारणाएँ (APIs, मॉडल, प्रॉम्प्ट्स)

## लैब सेटअप

### चरण 1: पर्यावरण तैयारी

1. **टूल इंस्टॉलेशन सत्यापित करें:**
```bash
# AZD स्थापना की जाँच करें
azd version

# Azure CLI की जाँच करें
az --version

# AZD वर्कफ़्लो के लिए Azure में लॉगिन करें
azd auth login

# केवल यदि आप डायग्नोस्टिक्स के दौरान az कमांड चलाने की योजना बना रहे हैं तो Azure CLI में लॉगिन करें
az login
```

यदि आप कई टेनेन्ट में काम करते हैं या आपकी सब्सक्रिप्शन स्वचालित रूप से पहचान नहीं रही है, तो `azd auth login --tenant-id <tenant-id>` के साथ पुनः प्रयास करें।

2. **वर्कशॉप रिपॉजिटरी क्लोन करें:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## मॉड्यूल 1: AI एप्लिकेशनों के लिए AZD संरचना को समझना

### एक AI AZD टेम्पलेट की संरचना

AI-तैयार AZD टेम्पलेट में प्रमुख फ़ाइलों का अन्वेषण करें:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   └── modules/            # Reusable Bicep modules
│       ├── openai.bicep    # Microsoft Foundry Models configuration
│       ├── search.bicep    # Azure AI Search setup
│       └── webapp.bicep    # Web app configuration
├── app/                    # Application code
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

### **लैब अभ्यास 1.1: कॉन्फ़िगरेशन का अन्वेषण करें**

1. **azure.yaml फ़ाइल की जाँच करें:**
```bash
cat azure.yaml
```

**किस बात पर ध्यान दें:**
- AI घटकों के लिए सेवा परिभाषाएँ
- पर्यावरण चर मैपिंग
- होस्ट कॉन्फ़िगरेशन

2. **main.bicep इन्फ्रास्ट्रक्चर की समीक्षा करें:**
```bash
cat infra/main.bicep
```

**पहचानने के लिए प्रमुख AI पैटर्न:**
- Microsoft Foundry Models सेवा प्रोविज़निंग
- Azure AI Search एकीकरण
- सुरक्षित कुंजी प्रबंधन
- नेटवर्क सुरक्षा कॉन्फ़िगरेशन

### **चर्चा बिंदु:** AI के लिए ये पैटर्न क्यों महत्वपूर्ण हैं

- **सेवा निर्भरताएँ**: AI ऐप्स अक्सर कई समन्वित सेवाओं की आवश्यकता होते हैं
- **सुरक्षा**: API कुंजियाँ और एंडपॉइंट्स का सुरक्षित प्रबंधन आवश्यक है
- **स्केलेबिलिटी**: AI वर्कलोड्स की अद्वितीय स्केलिंग आवश्यकताएँ होती हैं
- **लागत प्रबंधन**: यदि सही तरीके से कॉन्फ़िगर न किया जाए तो AI सेवाएँ महंगी हो सकती हैं

## मॉड्यूल 2: अपना पहला AI एप्लिकेशन परिनियोजित करें

### चरण 2.1: पर्यावरण इनिशियलाइज़ करें

1. **एक नया AZD एनवायरनमेंट बनाएं:**
```bash
azd env new myai-workshop
```

2. **आवश्यक पैरामीटर सेट करें:**
```bash
# अपना पसंदीदा Azure क्षेत्र सेट करें
azd env set AZURE_LOCATION eastus

# वैकल्पिक: विशिष्ट OpenAI मॉडल सेट करें
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### चरण 2.2: इन्फ्रास्ट्रक्चर और एप्लिकेशन को परिनियोजित करें

1. **AZD के साथ परिनियोजन करें:**
```bash
azd up
```

**`azd up` के दौरान क्या होता है:**
- ✅ Microsoft Foundry Models सेवा प्रोविजन करता है
- ✅ Azure AI Search सेवा बनाता है
- ✅ वेब एप्लिकेशन के लिए App Service सेटअप करता है
- ✅ नेटवर्किंग और सुरक्षा कॉन्फ़िगर करता है
- ✅ एप्लिकेशन कोड परिनियोजित करता है
- ✅ निगरानी और लॉगिंग सेटअप करता है

2. **परिनियोजन प्रगति की निगरानी करें** और बनाई जा रही संसाधनों को नोट करें।

### चरण 2.3: अपने परिनियोजन को सत्यापित करें

1. **परिनियोजित संसाधनों की जांच करें:**
```bash
azd show
```

2. **परिनियोजित एप्लिकेशन खोलें:**
```bash
azd show
```

वेब एंडपॉइंट खोलें जो `azd show` आउटपुट में दिखाया गया है।

3. **AI कार्यक्षमता का परीक्षण करें:**
   - वेब एप्लिकेशन पर नेविगेट करें
   - नमूना क्वेरीज आज़माएँ
   - सत्यापित करें कि AI उत्तर काम कर रहे हैं

### **लैब अभ्यास 2.1: ट्रबलशूटिंग अभ्यास**

**परिदृश्य**: आपका परिनियोजन सफल हुआ लेकिन AI प्रतिक्रिया नहीं दे रहा है।

**जाँचने के लिए सामान्य समस्याएँ:**
1. **OpenAI API कुंजियाँ**: सत्यापित करें कि वे सही ढंग से सेट हैं
2. **मॉडल उपलब्धता**: जांचें कि आपका क्षेत्र मॉडल का समर्थन करता है या नहीं
3. **नेटवर्क कनेक्टिविटी**: सुनिश्चित करें कि सेवाएँ आपस में संवाद कर सकती हैं
4. **RBAC अनुमतियाँ**: सत्यापित करें कि ऐप OpenAI तक पहुँच सकता है

**डिबगिंग कमांड्स:**
```bash
# पर्यावरण चर जांचें
azd env get-values

# परिनियोजन लॉग देखें
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# OpenAI परिनियोजन की स्थिति जांचें
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## मॉड्यूल 3: अपनी आवश्यकताओं के लिए AI एप्लिकेशन कस्टमाइज़ करना

### चरण 3.1: AI कॉन्फ़िगरेशन में संशोधन करें

1. **OpenAI मॉडल अपडेट करें:**
```bash
# यदि आपके क्षेत्र में उपलब्ध हो तो किसी अन्य मॉडल में बदलें
azd env set AZURE_OPENAI_MODEL gpt-4.1

# नए विन्यास के साथ पुनः तैनात करें
azd deploy
```

2. **अतिरिक्त AI सेवाएँ जोड़ें:**

Document Intelligence जोड़ने के लिए `infra/main.bicep` संपादित करें:

```bicep
// Add to main.bicep
resource documentIntelligence 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: 'doc-intel-${uniqueString(resourceGroup().id)}'
  location: location
  kind: 'FormRecognizer'
  sku: {
    name: 'F0'  // Free tier for workshop
  }
  properties: {
    customSubDomainName: 'doc-intel-${uniqueString(resourceGroup().id)}'
  }
}
```

### चरण 3.2: पर्यावरण-विशिष्ट कॉन्फ़िगरेशन

**सर्वोत्तम अभ्यास**: विकास और प्रोडक्शन के लिए अलग कॉन्फ़िगरेशन।

1. **प्रोडक्शन एनवायरनमेंट बनाएं:**
```bash
azd env new myai-production
```

2. **प्रोडक्शन-विशिष्ट पैरामीटर सेट करें:**
```bash
# उत्पादन आमतौर पर उच्च SKU का उपयोग करता है
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# अतिरिक्त सुरक्षा सुविधाएँ सक्षम करें
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **लैब अभ्यास 3.1: लागत अनुकूलन**

**चुनौती**: लागत-कुशल विकास के लिए टेम्पलेट कॉन्फ़िगर करें।

**कार्य:**
1. पहचानें कि किस SKU को फ्री/बेसिक टियर पर सेट किया जा सकता है
2. न्यूनतम लागत के लिए पर्यावरण चर कॉन्फ़िगर करें
3. परिनियोजित करें और प्रोडक्शन कॉन्फ़िगरेशन के साथ लागत की तुलना करें

**समाधान संकेत:**
- संभव होने पर Azure AI Services के लिए F0 (फ्री) टियर का उपयोग करें
- डेवलपमेंट में Search Service के लिए Basic टियर का उपयोग करें
- Functions के लिए Consumption योजना उपयोग करने पर विचार करें

## मॉड्यूल 4: सुरक्षा और प्रोडक्शन सर्वोत्तम प्रथाएँ

### चरण 4.1: सुरक्षित क्रेडेंशियल प्रबंधन

**वर्तमान चुनौती**: कई AI ऐप्स API कुंजियों को हार्डकोड करते हैं या असुरक्षित संग्रहण का उपयोग करते हैं।

**AZD समाधान**: Managed Identity + Key Vault एकीकरण।

1. **अपने टेम्पलेट में सुरक्षा कॉन्फ़िगरेशन की समीक्षा करें:**
```bash
# Key Vault और Managed Identity कॉन्फ़िगरेशन की जाँच करें
grep -r "keyVault\|managedIdentity" infra/
```

2. **सत्यापित करें कि Managed Identity काम कर रही है:**
```bash
# जाँचें कि वेब ऐप में सही पहचान विन्यास है
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### चरण 4.2: नेटवर्क सुरक्षा

1. **प्राइवेट एंडपॉइंट सक्षम करें** (यदि पहले से कॉन्फ़िगर नहीं है):

अपने bicep टेम्पलेट में जोड़ें:
```bicep
// Private endpoint for OpenAI
resource openAIPrivateEndpoint 'Microsoft.Network/privateEndpoints@2023-04-01' = {
  name: 'pe-openai-${uniqueString(resourceGroup().id)}'
  location: location
  properties: {
    subnet: {
      id: vnet.properties.subnets[0].id
    }
    privateLinkServiceConnections: [
      {
        name: 'openai-connection'
        properties: {
          privateLinkServiceId: openAIAccount.id
          groupIds: ['account']
        }
      }
    ]
  }
}
```

### चरण 4.3: मॉनिटरिंग और ऑब्ज़र्वेबिलिटी

1. **Application Insights कॉन्फ़िगर करें:**
```bash
# Application Insights को स्वचालित रूप से कॉन्फ़िगर किया जाना चाहिए
# कॉन्फ़िगरेशन की जाँच करें:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **AI-विशिष्ट मॉनिटरिंग सेटअप करें:**

AI ऑपरेशनों के लिए कस्टम मीट्रिक्स जोड़ें:
```bicep
// In your web app configuration
resource webApp 'Microsoft.Web/sites@2023-01-01' = {
  properties: {
    siteConfig: {
      appSettings: [
        {
          name: 'APPLICATIONINSIGHTS_CONNECTION_STRING'
          value: applicationInsights.properties.ConnectionString
        }
        {
          name: 'OPENAI_MONITOR_ENABLED'
          value: 'true'
        }
      ]
    }
  }
}
```

### **लैब अभ्यास 4.1: सुरक्षा ऑडिट**

**कार्य**: अपनी परिनियोजन की सुरक्षा सर्वोत्तम प्रथाओं के लिए समीक्षा करें।

**चेकलिस्ट:**
- [ ] कोड या कॉन्फ़िगरेशन में कोई हार्डकोडेड सीक्रेट्स नहीं
- [ ] Managed Identity का उपयोग सेवा-से-सेवा प्रमाणीकरण के लिए
- [ ] Key Vault संवेदनशील कॉन्फ़िगरेशन संग्रहीत करता है
- [ ] नेटवर्क पहुँच सही तरीके से प्रतिबंधित है
- [ ] मॉनिटरिंग और लॉगिंग सक्षम हैं

## मॉड्यूल 5: अपने स्वयं के AI एप्लिकेशन को कनवर्ट करना

### चरण 5.1: आकलन कार्यपत्रक

**अपने ऐप को कनवर्ट करने से पहले**, इन प्रश्नों के उत्तर दें:

1. **एप्लिकेशन आर्किटेक्चर:**
   - आपका ऐप कौन सी AI सेवाएँ उपयोग करता है?
   - इसे किन compute संसाधनों की आवश्यकता है?
   - क्या इसे डेटाबेस की आवश्यकता है?
   - सेवाओं के बीच निर्भरताएँ क्या हैं?

2. **सुरक्षा आवश्यकताएँ:**
   - आपका ऐप कौन सा संवेदनशील डेटा संभालता है?
   - आपकी क्या कंप्लायंस आवश्यकताएँ हैं?
   - क्या आपको प्राइवेट नेटवर्किंग की आवश्यकता है?

3. **स्केलिंग आवश्यकताएँ:**
   - आपकी अपेक्षित लोड क्या है?
   - क्या आपको ऑटो-स्केलिंग की आवश्यकता है?
   - क्या क्षेत्रीय आवश्यकताएँ हैं?

### चरण 5.2: अपना AZD टेम्पलेट बनाएं

**अपने ऐप को कनवर्ट करने के लिए इस पैटर्न का पालन करें:**

1. **मूल संरचना बनाएं:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# AZD टेम्पलेट प्रारंभ करें
azd init --template minimal
```

2. **azure.yaml बनाएँ:**
```yaml
# Metadata
name: my-ai-app
metadata:
  template: my-ai-app-template@0.0.1-beta

# Services definition
services:
  api:
    project: ./api
    host: containerapp
  web:
    project: ./web
    host: staticwebapp
    
# Hooks for custom deployment logic  
hooks:
  predeploy:
    shell: sh
    run: echo "Preparing AI models..."
```

3. **इन्फ्रास्ट्रक्चर टेम्पलेट बनाएं:**

**infra/main.bicep** - मुख्य टेम्पलेट:
```bicep
@description('Primary location for all resources')
param location string = resourceGroup().location

@description('Name of the OpenAI service')
param openAIServiceName string = 'openai-${uniqueString(resourceGroup().id)}'

// Your AI services here
module openAI 'modules/openai.bicep' = {
  name: 'openai'
  params: {
    name: openAIServiceName
    location: location
  }
}
```

**infra/modules/openai.bicep** - OpenAI मॉड्यूल:
```bicep
@description('Name of the OpenAI service')
param name string

@description('Location for the OpenAI service')
param location string

resource openAIAccount 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: name
  location: location
  kind: 'OpenAI'
  sku: {
    name: 'S0'
  }
  properties: {
    customSubDomainName: name
  }
}

output endpoint string = openAIAccount.properties.endpoint
output name string = openAIAccount.name
```

### **लैब अभ्यास 5.1: टेम्पलेट निर्माण चुनौती**

**चुनौती**: एक दस्तावेज़ प्रसंस्करण AI ऐप के लिए AZD टेम्पलेट बनाएं।

**आवश्यकताएँ:**
- सामग्री विश्लेषण के लिए Microsoft Foundry Models
- OCR के लिए Document Intelligence
- दस्तावेज़ अपलोड के लिए Storage Account
- प्रोसेसिंग लॉजिक के लिए Function App
- यूज़र इंटरफ़ेस के लिए वेब ऐप

**बोनस अंक:**
- उचित त्रुटि हैंडलिंग जोड़ें
- लागत अनुमान शामिल करें
- मॉनिटरिंग डैशबोर्ड सेटअप करें

## मॉड्यूल 6: सामान्य समस्याओं का ट्रबलशूटिंग

### सामान्य परिनियोजन समस्याएँ

#### समस्या 1: OpenAI सेवा कोटा अधिक हो गया
**लक्षण:** कोटा त्रुटि के साथ परिनियोजन विफल होता है  
**समाधान:**
```bash
# वर्तमान कोटाओं की जाँच करें
az cognitiveservices usage list --location eastus

# कोटा बढ़ाने का अनुरोध करें या किसी अन्य क्षेत्र को आज़माएँ
azd env set AZURE_LOCATION westus2
azd up
```

#### समस्या 2: मॉडल क्षेत्र में उपलब्ध नहीं है
**लक्षण:** AI प्रतिक्रियाएँ विफल होती हैं या मॉडल परिनियोजन त्रुटियाँ होती हैं  
**समाधान:**
```bash
# क्षेत्र के अनुसार मॉडल की उपलब्धता जांचें
az cognitiveservices model list --location eastus

# उपलब्ध मॉडल पर अपडेट करें
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### समस्या 3: अनुमति संबंधित समस्याएँ
**लक्षण:** AI सेवाओं को कॉल करने पर 403 Forbidden त्रुटियाँ  
**समाधान:**
```bash
# भूमिका असाइनमेंट की जांच करें
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# लापता भूमिकाएँ जोड़ें
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### प्रदर्शन समस्याएँ

#### समस्या 4: धीमी AI प्रतिक्रियाएँ
**जांच चरण:**
1. प्रदर्शन मीट्रिक्स के लिए Application Insights जांचें
2. Azure पोर्टल में OpenAI सेवा मीट्रिक्स की समीक्षा करें
3. नेटवर्क कनेक्टिविटी और लेटेंसी सत्यापित करें

**समाधान:**
- सामान्य क्वेरीज के लिए कैशिंग लागू करें
- अपने उपयोग के मामले के लिए उपयुक्त OpenAI मॉडल का उपयोग करें
- उच्च-लोड परिदृश्यों के लिए रीड रेप्लिकास पर विचार करें

### **लैब अभ्यास 6.1: डिबगिंग चुनौती**

**परिदृश्य**: आपका परिनियोजन सफल हुआ, लेकिन एप्लिकेशन 500 त्रुटियाँ लौटाता है।

**डिबगिंग कार्य:**
1. एप्लिकेशन लॉग्स जांचें
2. सेवा कनेक्टिविटी सत्यापित करें
3. प्रमाणीकरण का परीक्षण करें
4. कॉन्फ़िगरेशन की समीक्षा करें

**उपयोग के लिए उपकरण:**
- परिनियोजन अवलोकन के लिए `azd show`
- विस्तृत सेवा लॉग्स के लिए Azure पोर्टल
- एप्लिकेशन टेलीमेट्री के लिए Application Insights

## मॉड्यूल 7: मॉनिटरिंग और अनुकूलन

### चरण 7.1: व्यापक मॉनिटरिंग सेटअप करें

1. **कस्टम डैशबोर्ड बनाएँ:**

Azure पोर्टल पर नेविगेट करें और निम्न के साथ एक डैशबोर्ड बनाएं:
- OpenAI अनुरोध गणना और लेटेंसी
- एप्लिकेशन त्रुटि दरें
- संसाधन उपयोग
- लागत ट्रैकिंग

2. **अलर्ट सेटअप करें:**
```bash
# उच्च त्रुटि दर के लिए अलर्ट
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### चरण 7.2: लागत अनुकूलन

1. **वर्तमान लागत का विश्लेषण करें:**
```bash
# लागत डेटा प्राप्त करने के लिए Azure CLI का उपयोग करें
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **लागत नियंत्रण लागू करें:**
- बजट अलर्ट सेट करें
- ऑटोस्केलिंग नीतियों का उपयोग करें
- अनुरोध कैशिंग लागू करें
- OpenAI के लिए टोकन उपयोग की निगरानी करें

### **लैब अभ्यास 7.1: प्रदर्शन अनुकूलन**

**कार्य**: प्रदर्शन और लागत दोनों के लिए अपने AI एप्लिकेशन को अनुकूलित करें।

**सुधारने के लिए मीट्रिक्स:**
- औसत प्रतिक्रिया समय को 20% तक कम करें
- मासिक लागत को 15% तक कम करें
- 99.9% अपटाइम बनाए रखें

**कोशिश करने की रणनीतियाँ:**
- प्रतिक्रिया कैशिंग लागू करें
- टोकन दक्षता के लिए प्रॉम्प्ट्स को अनुकूलित करें
- उपयुक्त compute SKU का उपयोग करें
- उचित ऑटोस्केलिंग सेट करें

## अंतिम चुनौती: एंड-टू-एंड कार्यान्वयन

### चुनौती परिदृश्य

आपको इन आवश्यकताओं के साथ एक उत्पादन-तैयार AI-संचालित कस्टमर सर्विस चैटबॉट बनाने का कार्य दिया गया है:

**कार्यक्षम आवश्यकताएँ:**
- ग्राहक इंटरैक्शन के लिए वेब इंटरफ़ेस
- उत्तरों के लिए Microsoft Foundry Models के साथ एकीकरण
- Azure AI Search का उपयोग करके दस्तावेज़ खोज क्षमता
- मौजूदा ग्राहक डेटाबेस के साथ एकीकरण
- बहु-भाषा समर्थन

**गैर-कार्यात्मक आवश्यकताएँ:**
- 1000 समकालिक उपयोगकर्ताओं को संभालना
- 99.9% अपटाइम SLA
- SOC 2 अनुपालन
- लागत $500/माह से कम
- कई पर्यावरणों में परिनियोजित करें (dev, staging, prod)

### कार्यान्वयन चरण

1. आर्किटेक्चर डिजाइन करें
2. AZD टेम्पलेट बनाएं
3. सुरक्षा उपाय लागू करें
4. मॉनिटरिंग और अलर्ट सेटअप करें
5. परिनियोजन पाइपलाइनों का निर्माण करें
6. समाधान का दस्तावेज़ीकरण करें

### मूल्यांकन मानदंड

- ✅ **कार्यक्षमता**: क्या यह सभी आवश्यकताओं को पूरा करता है?
- ✅ **सुरक्षा**: क्या सर्वोत्तम प्रथाएँ लागू की गई हैं?
- ✅ **स्केलेबिलिटी**: क्या यह लोड को संभाल सकता है?
- ✅ **रख-रखावयोग्यता**: क्या कोड और इन्फ्रास्ट्रक्चर सुव्यवस्थित हैं?
- ✅ **लागत**: क्या यह बजट के भीतर रहता है?

## अतिरिक्त संसाधन

### Microsoft दस्तावेज़ीकरण
- [Azure Developer CLI दस्तावेज़ीकरण](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Service दस्तावेज़ीकरण](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry दस्तावेज़ीकरण](https://learn.microsoft.com/azure/ai-studio/)

### नमूना टेम्पलेट्स
- [Microsoft Foundry Models चैट ऐप](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App क्विकस्टार्ट](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso चैट](https://github.com/Azure-Samples/contoso-chat)

### सामुदायिक संसाधन
- [Microsoft Foundry डिस्कॉर्ड](https://discord.gg/microsoft-azure)
- [Azure डेवलपर CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD टेम्पलेट्स](https://azure.github.io/awesome-azd/)

## 🎓 समापन प्रमाणपत्र

बधाई हो! आपने AI वर्कशॉप लैब पूरा कर लिया है। अब आप निम्न करने में सक्षम होंगे:

- ✅ मौजूदा AI अनुप्रयोगों को AZD टेम्पलेट्स में परिवर्तित करना
- ✅ उत्पादन-तैयार AI अनुप्रयोगों को परिनियोजित करना
- ✅ AI वर्कलोड्स के लिए सुरक्षा सर्वोत्तम प्रथाओं को लागू करना
- ✅ AI अनुप्रयोगों के प्रदर्शन की निगरानी और अनुकूलन करना
- ✅ सामान्य परिनियोजन समस्याओं का निवारण करना

### अगले कदम
1. इन पैटर्नों को अपने AI प्रोजेक्ट्स पर लागू करें
2. टेम्पलेट्स को समुदाय में वापस योगदान दें
3. निरंतर समर्थन के लिए Microsoft Foundry Discord से जुड़ें
4. बहु-क्षेत्र परिनियोजन जैसे उन्नत विषयों का अन्वेषण करें

---

**कार्यशाला प्रतिक्रिया**: कृपया अपने अनुभव को [Microsoft Foundry Discord #Azure चैनल](https://discord.gg/microsoft-azure) में साझा करके इस कार्यशाला को बेहतर बनाने में मदद करें।

---

**अध्याय नेविगेशन:**
- **📚 कोर्स होम**: [AZD शुरुआती के लिए](../../README.md)
- **📖 वर्तमान अध्याय**: अध्याय 2 - AI-प्रथम विकास
- **⬅️ पिछला**: [AI मॉडल परिनियोजन](ai-model-deployment.md)
- **➡️ अगला**: [उत्पादन AI सर्वोत्तम प्रथाएँ](production-ai-practices.md)
- **🚀 अगला अध्याय**: [अध्याय 3: कॉन्फ़िगरेशन](../chapter-03-configuration/configuration.md)

**मदद चाहिए?** हमारे समुदाय से जुड़ें ताकि आप AZD और AI परिनियोजनों के बारे में समर्थन और चर्चाओं में भाग ले सकें।

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
इस दस्तावेज़ का अनुवाद AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके किया गया है। जबकि हम सटीकता के लिए प्रयास करते हैं, कृपया ध्यान दें कि स्वचालित अनुवादों में त्रुटियाँ या अशुद्धियाँ हो सकती हैं। मूल दस्तावेज़ अपनी मूल भाषा में ही प्रामाणिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए, पेशेवर मानव अनुवाद की सिफारिश की जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए हम उत्तरदायी नहीं हैं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->