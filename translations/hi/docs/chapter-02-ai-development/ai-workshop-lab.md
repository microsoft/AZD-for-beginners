# एआई वर्कशॉप लैब: अपने AI सॉल्यूशंस को AZD-Deployable बनाना

**अध्याय नेविगेशन:**
- **📚 कोर्स होम**: [AZD For Beginners](../../README.md)
- **📖 वर्तमान अध्याय**: अध्याय 2 - AI-First डेवलपमेंट
- **⬅️ पिछला**: [AI मॉडल डिप्लॉयमेंट](ai-model-deployment.md)
- **➡️ अगला**: [प्रोडक्शन AI बेस्ट प्रैक्टिसेज़](production-ai-practices.md)
- **🚀 अगला अध्याय**: [अध्याय 3: कॉन्फ़िगरेशन](../chapter-03-configuration/configuration.md)

## वर्कशॉप अवलोकन

यह हाथों-हाथ लैब डेवलपर्स को एक मौजूदा AI टेम्पलेट लेकर उसे Azure Developer CLI (AZD) का उपयोग करके डिप्लॉय करने की प्रक्रिया से मार्गदर्शन करती है। आप Microsoft Foundry सेवाओं का उपयोग करके प्रोडक्शन AI डिप्लॉयमेंट के आवश्यक पैटर्न सीखेंगे।

> **सत्यापन नोट (2026-07-13):** इस वर्कशॉप की समीक्षा `azd` `1.27.1` के आधार पर की गई थी। यदि आपकी स्थानीय स्थापना पुरानी है, तो आरंभ करने से पहले AZD को अपडेट करें ताकि ऑथ, टेम्पलेट, और डिप्लॉयमेंट वर्कफ़्लो नीचे दिए गए चरणों से मेल खाता रहे।

**समयावधि:** 2-3 घंटे  
**स्तर:** मध्यवर्ती  
**पूर्वापेक्षाएँ:** बुनियादी Azure ज्ञान, AI/ML अवधारणाओं से परिचय

## 🎓 शिक्षण उद्देश्य

इस वर्कशॉप के अंत तक, आप सक्षम होंगे:
- ✅ एक मौजूदा AI एप्लिकेशन को AZD टेम्पलेट्स में कन्वर्ट करना
- ✅ AZD के साथ Microsoft Foundry सेवाओं को कॉन्फ़िगर करना
- ✅ AI सेवाओं के लिए सुरक्षित क्रेडेंशियल प्रबंधन लागू करना
- ✅ मॉनिटरिंग के साथ प्रोडक्शन-तैयार AI एप्लिकेशन डिप्लॉय करना
- ✅ सामान्य AI डिप्लॉयमेंट मुद्दों का निवारण करना

## पूर्वापेक्षाएँ

### आवश्यक उपकरण
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) इंस्टॉल किया हुआ
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) इंस्टॉल किया हुआ
- [Git](https://git-scm.com/) इंस्टॉल किया हुआ
- कोड एडिटर (VS Code अनुशंसित)

### Azure संसाधन
- कॉन्ट्रिब्यूटर एक्सेस वाला Azure सब्सक्रिप्शन
- Microsoft Foundry Models सेवाओं तक पहुंच (या पहुंच अनुरोध करने की क्षमता)
- रिसोर्स ग्रुप क्रिएशन परमिशन

### ज्ञान पूर्वापेक्षाएँ
- Azure सेवाओं की बुनियादी समझ
- कमांड-लाइन इंटरफेस से परिचित होना
- बुनियादी AI/ML अवधारणाएँ (API, मॉडल, प्रॉम्प्ट)

## लैब सेटअप

### चरण 1: पर्यावरण तैयार करना

1. **उपकरण इंस्टॉलेशन सत्यापित करें:**
```bash
# AZD स्थापना जांचें
azd version

# Azure CLI जांचें
az --version

# AZD वर्कफ़्लो के लिए Azure में लॉगिन करें
azd auth login

# केवल तभी Azure CLI में लॉगिन करें जब आप डायग्नोस्टिक्स के दौरान az कमांड चलाने की योजना बनाते हैं
az login
```

यदि आप कई टेनेंट के साथ काम करते हैं या आपकी सब्सक्रिप्शन स्वतः पता नहीं चल रही है, तो `azd auth login --tenant-id <tenant-id>` के साथ पुनः प्रयास करें।

2. **वर्कशॉप रिपोसिटरी क्लोन करें:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## मॉड्यूल 1: AI एप्लिकेशन के लिए AZD स्ट्रक्चर को समझना

### AI AZD टेम्पलेट की संरचना

AI-तैयार AZD टेम्पलेट की मुख्य फ़ाइलें देखें:

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

1. **azure.yaml फ़ाइल की जांच करें:**
```bash
cat azure.yaml
```

**ध्यान देने योग्य बातें:**
- AI कम्पोनेंट्स के लिए सेवा परिभाषाएं
- पर्यावरण परिवर्तनशील मैपिंग्स
- होस्ट कॉन्फ़िगरेशन

2. **main.bicep इन्फ्रास्ट्रक्चर की समीक्षा करें:**
```bash
cat infra/main.bicep
```

**पहचाने जाने वाले प्रमुख AI पैटर्न:**
- Microsoft Foundry Models सेवा प्रोविजनिंग
- Azure AI Search इंटीग्रेशन
- सुरक्षित कुंजी प्रबंधन
- नेटवर्क सुरक्षा कॉन्फ़िगरेशन

### **चर्चा बिंदु:** AI के लिए ये पैटर्न क्यों महत्वपूर्ण हैं

- **सेवा निर्भरता**: AI एप्लिकेशन अक्सर कई समन्वित सेवाओं की जरूरत होती है
- **सुरक्षा**: API कुंजी और एंडपॉइंट का सुरक्षित प्रबंधन आवश्यक
- **स्केलेबिलिटी**: AI वर्कलोड के लिए अनूठी स्केलिंग आवश्यकताएं होती हैं
- **लागत प्रबंधन**: यदि ठीक से कॉन्फ़िगर न किया जाए तो AI सेवाएं महंगी हो सकती हैं

## मॉड्यूल 2: अपनी पहली AI एप्लिकेशन डिप्लॉय करें

### चरण 2.1: पर्यावरण आरंभ करें

1. **एक नया AZD पर्यावरण बनाएं:**
```bash
azd env new myai-workshop
```

2. **आवश्यक पैरामीटर्स सेट करें:**
```bash
# अपनी पसंदीदा Azure क्षेत्र सेट करें
azd env set AZURE_LOCATION eastus

# वैकल्पिक: विशिष्ट OpenAI मॉडल सेट करें
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### चरण 2.2: इन्फ्रास्ट्रक्चर और एप्लिकेशन डिप्लॉय करें

1. **AZD के साथ डिप्लॉय करें:**
```bash
azd up
```

**`azd up` के दौरान क्या होता है:**
- ✅ Microsoft Foundry Models सेवा प्रोवाइड होती है
- ✅ Azure AI Search सेवा क्रिएट होती है
- ✅ वेब एप्लिकेशन के लिए App Service सेटअप होता है
- ✅ नेटवर्किंग और सुरक्षा कॉन्फ़िगर होती है
- ✅ एप्लिकेशन कोड डिप्लॉय होता है
- ✅ मॉनिटरिंग और लॉगिंग सेटअप होता है

2. **डिप्लॉयमेंट प्रगति की निगरानी करें** और बन रहे संसाधनों को नोट करें।

### चरण 2.3: अपनी डिप्लॉयमेंट की पुष्टि करें

1. **डिप्लॉय किए गए संसाधनों की जांच करें:**
```bash
azd show
```

2. **डिप्लॉय की गई एप्लिकेशन खोलें:**
```bash
azd show
```

वेब एंडपॉइंट खोलें जो `azd show` आउटपुट में दिखाया गया है।

3. **AI कार्यक्षमता का परीक्षण करें:**
   - वेब एप्लिकेशन पर जाएं
   - नमूना प्रश्न आजमाएं
   - सुनिश्चित करें AI प्रतिक्रियाएँ सही काम कर रही हैं

### **लैब अभ्यास 2.1: समस्या निवारण अभ्यास**

**परिदृश्य**: आपकी डिप्लॉयमेंट सफल हुई, लेकिन AI प्रतिक्रिया नहीं दे रहा है।

**चेक करने वाले सामान्य मुद्दे:**
1. **OpenAI API कुंजी**: सही सेट हैं या नहीं जाँचें
2. **मॉडल उपलब्धता**: देखें क्या आपका क्षेत्र मॉडल को सपोर्ट करता है
3. **नेटवर्क कनेक्टिविटी**: सुनिश्चित करें कि सेवाएं संवाद कर पा रही हैं
4. **RBAC अनुमतियां**: ऐप के पास OpenAI का एक्सेस है या नहीं जांचें

**डिबगिंग कमांड:**
```bash
# पर्यावरण चर जांचें
azd env get-values

# तैनाती लॉग देखें
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# OpenAI तैनाती की स्थिति जांचें
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## मॉड्यूल 3: अपनी आवश्यकताओं के लिए AI एप्लिकेशन कस्टमाइज़ करना

### चरण 3.1: AI कॉन्फ़िगरेशन संशोधित करें

1. **OpenAI मॉडल अपडेट करें:**
```bash
# एक अलग मॉडल में बदलें (यदि आपके क्षेत्र में उपलब्ध हो)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# नई कॉन्फ़िगरेशन के साथ पुनः तैनात करें
azd deploy
```

2. **अतिरिक्त AI सेवाएं जोड़ें:**

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

### चरण 3.2: पर्यावरण-विशेष कॉन्फ़िगरेशन

**सर्वोत्तम अभ्यास**: विकास और प्रोडक्शन के लिए अलग-अलग कॉन्फ़िगरेशन।

1. **प्रोडक्शन पर्यावरण बनाएँ:**
```bash
azd env new myai-production
```

2. **प्रोडक्शन-विशेष पैरामीटर्स सेट करें:**
```bash
# उत्पादन आमतौर पर उच्चतर SKU का उपयोग करता है
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# अतिरिक्त सुरक्षा सुविधाएँ सक्षम करें
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **लैब अभ्यास 3.1: लागत अनुकूलन**

**चुनौती**: लागत-कुशल विकास के लिए टेम्पलेट कॉन्फ़िगर करें।

**कार्य:**
1. पहचानें कि कौन से SKU फ्री/बेसिक टियर पर सेट किए जा सकते हैं
2. न्यूनतम लागत के लिए पर्यावरण चर कॉन्फ़िगर करें
3. प्रोडक्शन कॉन्फ़िगरेशन के साथ लागत की तुलना करें और डिप्लॉय करें

**समाधान संकेत:**
- संभव हो तो Azure AI Services के लिए F0 (फ्री) टियर उपयोग करें
- विकास में Search सेवा के लिए बेसिक टियर उपयोग करें
- Functions के लिए Consumption प्लान का विचार करें

## मॉड्यूल 4: सुरक्षा और प्रोडक्शन सर्वोत्तम अभ्यास

### चरण 4.1: सुरक्षित क्रेडेंशियल प्रबंधन

**वर्तमान चुनौती**: कई AI ऐप्स API कुंजियों को हार्डकोड करते हैं या असुरक्षित संग्रह का उपयोग करते हैं।

**AZD समाधान**: प्रबंधित पहचान + की वॉल्ट इंटीग्रेशन।

1. **अपने टेम्पलेट में सुरक्षा कॉन्फ़िगरेशन की समीक्षा करें:**
```bash
# की वॉल्ट और प्रबंधित आइडेंटिटी कॉन्फ़िगरेशन खोजें
grep -r "keyVault\|managedIdentity" infra/
```

2. **प्रबंधित पहचान काम कर रही है या नहीं जांचें:**
```bash
# जांचें कि वेब ऐप में सही पहचान कॉन्फ़िगरेशन है या नहीं
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### चरण 4.2: नेटवर्क सुरक्षा

1. **प्राइवेट एंडपॉइंट सक्षम करें** (यदि पहले से कॉन्फ़िगर न हो):

अपने बाइसप टेम्पलेट में जोड़ें:
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

### चरण 4.3: निगरानी और अवलोकन

1. **Application Insights कॉन्फ़िगर करें:**
```bash
# एप्लीकेशन इंसाइट्स को स्वचालित रूप से कॉन्फ़िगर किया जाना चाहिए
# कॉन्फ़िगरेशन जांचें:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **AI-विशिष्ट मॉनिटरिंग सेट करें:**

AI ऑपरेशंस के लिए कस्टम मेट्रिक्स जोड़ें:
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

**कार्य**: अपनी डिप्लॉयमेंट की सुरक्षा सर्वोत्तम प्रथाओं के लिए समीक्षा करें।

**चेकलिस्ट:**
- [ ] कोड या कॉन्फ़िगरेशन में कोई हार्डकोडेड सीक्रेट नहीं
- [ ] सेवा-से-सेवा ऑथेंटिकेशन के लिए प्रबंधित पहचान का उपयोग
- [ ] की वॉल्ट संवेदनशील कॉन्फ़िगरेशन संग्रहीत करता है
- [ ] नेटवर्क एक्सेस ठीक से प्रतिबंधित है
- [ ] मॉनिटरिंग और लॉगिंग सक्षम हैं

## मॉड्यूल 5: अपनी AI एप्लिकेशन को कन्वर्ट करना

### चरण 5.1: मूल्यांकन कार्यपत्रक

**अपनी ऐप को कन्वर्ट करने से पहले**, इन प्रश्नों का उत्तर दें:

1. **एप्लिकेशन आर्किटेक्चर:**
   - आपकी ऐप कौन सी AI सेवाओं का उपयोग करती है?
   - इसे कौन से कंप्यूट संसाधनों की आवश्यकता है?
   - क्या इसे डेटाबेस की जरूरत है?
   - सेवाओं के बीच क्या निर्भरता है?

2. **सुरक्षा आवश्यकताएँ:**
   - आपकी ऐप कौन से संवेदनशील डेटा संभालती है?
   - आपकी कौन से अनुपालन आवश्यकताएँ हैं?
   - क्या आपको प्राइवेट नेटवर्किंग चाहिए?

3. **स्केलिंग आवश्यकताएँ:**
   - आपका अपेक्षित लोड क्या है?
   - क्या आपको ऑटो-स्केलिंग चाहिए?
   - क्या क्षेत्रीय आवश्यकताएँ हैं?

### चरण 5.2: अपनी AZD टेम्पलेट बनाएं

**अपनी ऐप को कन्वर्ट करने के लिए इस पैटर्न का पालन करें:**

1. **बेसिक संरचना बनाएँ:**
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

### **लैब अभ्यास 5.1: टेम्पलेट निर्माण की चुनौती**

**चुनौती**: एक दस्तावेज़ प्रसंस्करण AI ऐप के लिए AZD टेम्पलेट बनाएं।

**आवश्यकताएँ:**
- कंटेंट विश्लेषण के लिए Microsoft Foundry Models
- OCR के लिए Document Intelligence
- दस्तावेज़ अपलोड के लिए Storage Account
- प्रोसेसिंग लॉजिक के लिए Function App
- यूज़र इंटरफ़ेस के लिए वेब ऐप

**बोनस पॉइंट्स:**
- उचित त्रुटि हैंडलिंग जोड़ें
- लागत अनुमान शामिल करें
- मॉनिटरिंग डैशबोर्ड सेट करें

## मॉड्यूल 6: सामान्य समस्याओं का निवारण

### सामान्य डिप्लॉयमेंट समस्याएं

#### समस्या 1: OpenAI सेवा कोटा पार हो गया
**लक्षण:** कोटा त्रुटि के साथ डिप्लॉयमेंट विफल
**समाधान:**
```bash
# वर्तमान कोटा जांचें
az cognitiveservices usage list --location eastus

# कोटा वृद्धि का अनुरोध करें या किसी अन्य क्षेत्र का प्रयास करें
azd env set AZURE_LOCATION westus2
azd up
```

#### समस्या 2: मॉडल क्षेत्र में उपलब्ध नहीं
**लक्षण:** AI प्रतिक्रिया विफल या मॉडल डिप्लॉयमेंट त्रुटियाँ
**समाधान:**
```bash
# क्षेत्र द्वारा मॉडल उपलब्धता जांचें
az cognitiveservices model list --location eastus

# उपलब्ध मॉडल पर अपडेट करें
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### समस्या 3: अनुमतियों की समस्या
**लक्षण:** AI सेवाओं को कॉल करते समय 403 फॉरबिडन त्रुटि
**समाधान:**
```bash
# भूमिका असाइनमेंट की जांच करें
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# गुम भूमिका जोड़ें
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### प्रदर्शन संबंधी समस्याएं

#### समस्या 4: AI प्रतिक्रियाएँ धीमी हैं
**जांच के चरण:**
1. Application Insights में प्रदर्शन मेट्रिक्स देखें
2. Azure पोर्टल में OpenAI सेवा मेट्रिक्स समीक्षा करें
3. नेटवर्क कनेक्टिविटी और विलंबता सत्यापित करें

**समाधान:**
- सामान्य प्रश्नों के लिए कैशिंग लागू करें
- अपने उपयोग के लिए उचित OpenAI मॉडल का उपयोग करें
- उच्च-लोड स्थितियों के लिए रीड रेप्लिका का विचार करें

### **लैब अभ्यास 6.1: डिबगिंग चुनौती**

**परिदृश्य**: आपकी डिप्लॉयमेंट सफल हुई, लेकिन एप्लिकेशन 500 त्रुटियाँ दिखा रहा है।

**डिबगिंग कार्य:**
1. एप्लिकेशन लॉग जांचें
2. सेवा कनेक्टिविटी सत्यापित करें
3. प्रमाणीकरण का परीक्षण करें
4. कॉन्फ़िगरेशन की समीक्षा करें

**उपयोग करने के उपकरण:**
- `azd show` डिप्लॉयमेंट अवलोकन के लिए
- Azure पोर्टल सेवा लॉग के लिए
- एप्लिकेशन टेलीमेट्री के लिए Application Insights

## मॉड्यूल 7: निगरानी और अनुकूलन

### चरण 7.1: व्यापक मॉनिटरिंग सेट करें

1. **कस्टम डैशबोर्ड बनाएँ:**

Azure पोर्टल पर जाएं और निम्न के साथ डैशबोर्ड बनाएं:
- OpenAI अनुरोध संख्या और विलंबता
- एप्लिकेशन त्रुटि दर
- संसाधन उपयोग
- लागत ट्रैकिंग

2. **अलर्ट सेट करें:**
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

1. **वर्तमान लागतों का विश्लेषण करें:**
```bash
# लागत डेटा प्राप्त करने के लिए Azure CLI का उपयोग करें
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **लागत नियंत्रण लागू करें:**
- बजट अलर्ट सेट करें
- ऑटोस्केलिंग नीतियाँ उपयोग करें
- अनुरोध कैशिंग लागू करें
- OpenAI टोकन उपयोग मॉनिटर करें

### **लैब अभ्यास 7.1: प्रदर्शन अनुकूलन**

**कार्य**: अपने AI एप्लिकेशन को प्रदर्शन और लागत दोनों के लिए अनुकूलित करें।

**बेहतर करने के लिए मेट्रिक्स:**
- औसत प्रतिक्रिया समय 20% कम करें
- मासिक लागत 15% कम करें
- 99.9% अपटाइम बनाए रखें

**कोशिश करने के लिए रणनीतियाँ:**
- प्रतिक्रिया कैशिंग लागू करें
- टोकन दक्षता के लिए प्रॉम्प्ट ऑप्टिमाइज़ करें
- उपयुक्त कंप्यूट SKU का उपयोग करें
- उचित ऑटोस्केलिंग सेट करें

## अंतिम चुनौती: एंड-टू-एंड कार्यान्वयन

### चुनौती परिदृश्य

आपको एक प्रोडक्शन-तैयार AI- संचालित ग्राहक सेवा चैटबॉट बनाने का कार्य दिया गया है जिसमें ये आवश्यकताएँ हैं:

**कार्यात्मक आवश्यकताएँ:**
- ग्राहक इंटरैक्शन के लिए वेब इंटरफ़ेस
- प्रतिक्रियाओं के लिए Microsoft Foundry Models के साथ एकीकरण
- Azure AI Search का उपयोग करके दस्तावेज़ खोज क्षमता
- मौजूदा ग्राहक डेटाबेस के साथ एकीकरण
- बहु-भाषा समर्थन

**गैर-कार्यात्मक आवश्यकताएँ:**
- 1000 समकालीन उपयोगकर्ताओं को संभालना
- 99.9% अपटाइम SLA
- SOC 2 अनुपालन
- $500/माह से कम लागत
- कई पर्यावरणों (डेव, स्टेजिंग, प्रोड) में डिप्लॉय करना

### कार्यान्वयन चरण

1. **आर्किटेक्चर डिज़ाइन करें**
2. **AZD टेम्पलेट बनाएँ**
3. **सुरक्षा उपाय लागू करें**
4. **मॉनिटरिंग और अलर्टिंग सेट करें**
5. **डिप्लॉयमेंट पाइपलाइन्स बनाएं**
6. **समाधान का दस्तावेजीकरण करें**

### मूल्यांकन मानदंड

- ✅ **कार्यात्मकता**: क्या यह सभी आवश्यकताओं को पूरा करता है?
- ✅ **सुरक्षा**: क्या सर्वोत्तम प्रथाएँ लागू हैं?
- ✅ **स्केलेबिलिटी**: क्या यह लोड संभाल सकता है?
- ✅ **रखरखाव योग्यता**: क्या कोड और इन्फ्रास्ट्रक्चर अच्छी तरह संगठित है?
- ✅ **लागत**: क्या यह बजट के भीतर रहता है?

## अतिरिक्त संसाधन

### Microsoft दस्तावेज़ीकरण
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### नमूना टेम्पलेट्स
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)

- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### समुदाय संसाधन
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 समापन प्रमाणपत्र

बधाई हो! आपने AI कार्यशाला प्रयोगशाला पूरी कर ली है। अब आपको सक्षम होना चाहिए:

- ✅ मौजूदा AI अनुप्रयोगों को AZD टेम्प्लेट में परिवर्तित करना
- ✅ प्रोडक्शन-तैयार AI अनुप्रयोगों को तैनात करना
- ✅ AI कार्यभार के लिए सुरक्षा सर्वोत्तम अभ्यास लागू करना
- ✅ AI अनुप्रयोग प्रदर्शन की निगरानी और अनुकूलन करना
- ✅ सामान्य तैनाती समस्याओं का निवारण करना

### अगले कदम
1. इन पैटर्न को अपने स्वयं के AI परियोजनाओं पर लागू करें
2. टेम्प्लेट समुदाय को वापस प्रदान करें
3. निरंतर समर्थन के लिए Microsoft Foundry Discord से जुड़ें
4. मल्टी-क्षेत्र तैनाती जैसे उन्नत विषयों का अन्वेषण करें

---

**कार्यशाला प्रतिक्रिया**: कृपया अपने अनुभव को [Microsoft Foundry Discord #Azure channel](https://discord.gg/microsoft-azure) पर साझा करके इस कार्यशाला को बेहतर बनाने में हमारी सहायता करें।

---

**अध्याय नेविगेशन:**
- **📚 कोर्स होम**: [AZD For Beginners](../../README.md)
- **📖 वर्तमान अध्याय**: अध्याय 2 - AI-प्रथम विकास
- **⬅️ पिछला**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ अगला**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 अगला अध्याय**: [अध्याय 3: कॉन्फ़िगरेशन](../chapter-03-configuration/configuration.md)

**मदद चाहिए?** AZD और AI तैनाती के बारे में सहायता और चर्चा के लिए हमारे समुदाय में शामिल हों।

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
इस दस्तावेज़ का अनुवाद AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके किया गया है। जबकि हम सटीकता के लिए प्रयास करते हैं, कृपया ध्यान दें कि स्वचालित अनुवादों में त्रुटियाँ या अशुद्धियाँ हो सकती हैं। मूल दस्तावेज़ अपनी मूल भाषा में ही प्रामाणिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए, पेशेवर मानव अनुवाद की सिफारिश की जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए हम उत्तरदायी नहीं हैं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->