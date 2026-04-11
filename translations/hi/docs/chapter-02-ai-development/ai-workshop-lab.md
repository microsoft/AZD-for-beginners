# AI कार्यशाला लैब: अपने AI समाधानों को AZD-Deployable बनाना

**अध्याय नेविगेशन:**
- **📚 कोर्स होम**: [AZD For Beginners](../../README.md)
- **📖 वर्तमान अध्याय**: अध्याय 2 - AI-प्रथम विकास
- **⬅️ पिछला**: [AI मॉडल तैनाती](ai-model-deployment.md)
- **➡️ अगला**: [उत्पादन AI सर्वोत्तम अभ्यास](production-ai-practices.md)
- **🚀 अगला अध्याय**: [अध्याय 3: कॉन्फ़िगरेशन](../chapter-03-configuration/configuration.md)

## कार्यशाला अवलोकन

यह हैंड्स-ऑन लैब डेवलपर्स को एक मौजूदा AI टेम्पलेट लेने और इसे Azure Developer CLI (AZD) का उपयोग करके तैनात करने की प्रक्रिया के माध्यम से मार्गदर्शन करता है। आप Microsoft Foundry सेवाओं का उपयोग करके उत्पादन AI तैनाती के लिए आवश्यक पैटर्न सीखेंगे।

> **मूल्यांकन नोट (2026-03-25):** इस कार्यशाला की समीक्षा `azd` `1.23.12` के खिलाफ की गई थी। यदि आपकी स्थानीय स्थापना पुरानी है, तो आरंभ करने से पहले AZD को अपडेट करें ताकि प्रमाणीकरण, टेम्पलेट, और तैनाती वर्कफ़्लो नीचे दिए गए चरणों के अनुरूप हों।

**अवधि:** 2-3 घंटे  
**स्तर:** मध्यम  
**पूर्वापेक्षाएँ:** बुनियादी Azure ज्ञान, AI/ML अवधारणाओं से परिचित

## 🎓 सीखने के उद्देश्य

इस कार्यशाला के अंत तक, आप सक्षम होंगे:
- ✅ मौजूदा AI एप्लिकेशन को AZD टेम्पलेट्स में परिवर्तित करना
- ✅ AZD के साथ Microsoft Foundry सेवाओं को कॉन्फ़िगर करना
- ✅ AI सेवाओं के लिए सुरक्षित क्रेडेंशियल प्रबंधन लागू करना
- ✅ निगरानी के साथ उत्पादन-तैयार AI एप्लिकेशन तैनात करना
- ✅ सामान्य AI तैनाती समस्याओं का निवारण करना

## पूर्वापेक्षाएँ

### आवश्यक उपकरण
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) स्थापित
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) स्थापित
- [Git](https://git-scm.com/) स्थापित
- कोड एडिटर (VS Code अनुशंसित)

### Azure संसाधन
- योगदानकर्ता पहुंच के साथ Azure सब्सक्रिप्शन
- Microsoft Foundry Models सेवाओं तक पहुंच (या पहुंच का अनुरोध करने की क्षमता)
- संसाधन समूह बनाने के अनुमति

### ज्ञान पूर्वापेक्षाएँ
- Azure सेवाओं की बुनियादी समझ
- कमांड-लाइन इंटरफेस के साथ परिचय
- बुनियादी AI/ML अवधारणाएँ (API, मॉडल, प्रॉम्प्ट)

## लैब सेटअप

### चरण 1: वातावरण तैयारी

1. **टूल इंस्टॉलेशन सत्यापित करें:**
```bash
# AZD इंस्टॉलेशन जांचें
azd version

# Azure CLI जांचें
az --version

# AZD वर्कफ़्लो के लिए Azure में लॉगिन करें
azd auth login

# केवल तब Azure CLI में लॉगिन करें यदि आप डायग्नोस्टिक्स के दौरान az कमांड चलाने की योजना बना रहे हैं
az login
```

यदि आप एक से अधिक टेनेंट्स पर काम करते हैं या आपकी सदस्यता स्वचालित रूप से पता नहीं चलती है, तो पुनः प्रयास करें `azd auth login --tenant-id <tenant-id>` के साथ।

2. **वर्कशॉप रिपोजिटरी क्लोन करें:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## मॉड्यूल 1: AI एप्लीकेशंस के लिए AZD संरचना समझना

### AI AZD टेम्पलेट की संरचना

AI-तैयार AZD टेम्पलेट की प्रमुख फाइलों का अन्वेषण करें:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   └── modules/            # Reusable Bicep modules
│       ├── openai.bicep    # Microsoft Foundry Models configuration
│       ├── search.bicep    # Cognitive Search setup
│       └── webapp.bicep    # Web app configuration
├── app/                    # Application code
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

### **लैब अभ्यास 1.1: कॉन्फ़िगरेशन का अन्वेषण करें**

1. **azure.yaml फाइल की जाँच करें:**
```bash
cat azure.yaml
```

**देखने के लिए बातें:**
- AI घटकों के लिए सेवा परिभाषाएं
- पर्यावरण चर मानचित्रण
- होस्ट विन्यास

2. **main.bicep इन्फ्रास्ट्रक्चर की समीक्षा करें:**
```bash
cat infra/main.bicep
```

**पहचाने जाने वाले मुख्य AI पैटर्न:**
- Microsoft Foundry Models सेवा प्रावधान
- Cognitive Search संयोजन
- सुरक्षित कुंजी प्रबंधन
- नेटवर्क सुरक्षा विन्यास

### **चर्चा बिंदु:** AI के लिए ये पैटर्न क्यों महत्वपूर्ण हैं

- **सेवा निर्भरताएँ**: AI ऐप्स को अक्सर कई समन्वित सेवाओं की जरूरत होती है
- **सुरक्षा**: API कुंजियाँ और एंडपॉइंट्स का सुरक्षित प्रबंधन आवश्यक है
- **स्केलेबिलिटी**: AI वर्कलोड की अद्वितीय स्केलिंग आवश्यकताएँ होती हैं
- **लागत प्रबंधन**: AI सेवाएँ सही कॉन्फ़िगर न होने पर महंगी हो सकती हैं

## मॉड्यूल 2: अपनी पहली AI एप्लीकेशन तैनात करें

### चरण 2.1: पर्यावरण प्रारंभ करें

1. **नया AZD पर्यावरण बनाएँ:**
```bash
azd env new myai-workshop
```

2. **ज़रूरी पैरामीटर सेट करें:**
```bash
# अपनी पसंदीदा Azure क्षेत्र सेट करें
azd env set AZURE_LOCATION eastus

# वैकल्पिक: विशिष्ट OpenAI मॉडल सेट करें
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### चरण 2.2: इन्फ्रास्ट्रक्चर और एप्लीकेशन तैनात करें

1. **AZD के साथ तैनात करें:**
```bash
azd up
```

**`azd up` के दौरान क्या होता है:**
- ✅ Microsoft Foundry Models सेवा प्रदान करता है
- ✅ Cognitive Search सेवा बनाता है
- ✅ वेब एप्लीकेशन के लिए App Service सेट करता है
- ✅ नेटवर्किंग और सुरक्षा कॉन्फ़िगर करता है
- ✅ एप्लिकेशन कोड तैनात करता है
- ✅ मॉनिटरिंग और लॉगिंग सेट करता है

2. **तैनाती की प्रगति की निगरानी करें** और बनाए जा रहे संसाधनों को नोट करें।

### चरण 2.3: अपनी तैनाती सत्यापित करें

1. **तैनात संसाधनों की जाँच करें:**
```bash
azd show
```

2. **तैनात एप्लिकेशन खोलें:**
```bash
azd show
```

`azd show` आउटपुट में दिखाए गए वेब एंडपॉइंट को खोलें।

3. **AI कार्यक्षमता का परीक्षण करें:**
   - वेब एप्लीकेशन पर जाएँ
   - नमूना प्रश्न आज़माएँ
   - सुनिश्चित करें कि AI प्रतिक्रियाएँ सही काम कर रही हैं

### **लैब अभ्यास 2.1: समस्या निवारण अभ्यास**

**परिदृश्य**: आपकी तैनाती सफल हुई लेकिन AI प्रतिक्रिया नहीं दे रहा।

**सामान्य समस्याएँ जांचें:**
1. **OpenAI API कुंजियां**: जांचें कि वे सही सेट हैं
2. **मॉडल उपलब्धता**: सुनिश्चित करें कि आपका क्षेत्र मॉडल का समर्थन करता है
3. **नेटवर्क कनेक्टिविटी**: सुनिश्चित करें कि सेवाएं आपस में संवाद कर सकती हैं
4. **RBAC अनुमतियाँ**: सत्यापित करें कि ऐप OpenAI तक पहुंच सकता है

**डिबगिंग कमांड्स:**
```bash
# पर्यावरण चर जांचें
azd env get-values

# तैनाती लॉग देखें
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# OpenAI तैनाती स्थिति जांचें
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## मॉड्यूल 3: अपनी आवश्यकताओं के लिए AI एप्लीकेशंस को अनुकूलित करना

### चरण 3.1: AI कॉन्फ़िगरेशन संशोधित करें

1. **OpenAI मॉडल अपडेट करें:**
```bash
# एक अलग मॉडल में बदलें (यदि आपके क्षेत्र में उपलब्ध हो)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# नई कॉन्फ़िगरेशन के साथ पुनः तैनात करें
azd deploy
```

2. **अतिरिक्त AI सेवाएं जोड़ें:**

`infra/main.bicep` में Document Intelligence जोड़ें:

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

### चरण 3.2: वातावरण-विशिष्ट कॉन्फ़िगरेशन

**सर्वोत्तम अभ्यास**: विकास और उत्पादन के लिए अलग-अलग कॉन्फ़िगरेशन।

1. **उत्पादन पर्यावरण बनाएँ:**
```bash
azd env new myai-production
```

2. **उत्पादन-विशिष्ट पैरामीटर सेट करें:**
```bash
# उत्पादन में आमतौर पर उच्च SKUs का उपयोग किया जाता है
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# अतिरिक्त सुरक्षा सुविधाएँ सक्षम करें
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **लैब अभ्यास 3.1: लागत अनुकूलन**

**चुनौती**: लागत-कुशल विकास के लिए टेम्पलेट कॉन्फ़िगर करें।

**कार्य:**
1. पहचानें कौन से SKUs को फ्री/बेसिक टियर में सेट किया जा सकता है
2. न्यूनतम लागत के लिए पर्यावरण चर कॉन्फ़िगर करें
3. तैनात करें और उत्पादन कॉन्फ़िगरेशन के साथ लागत तुलना करें

**समाधान सुझाव:**
- Cognitive Services के लिए संभव होने पर F0 (फ्री) टियर का उपयोग करें
- विकास में Search Service के लिए Basic टियर का उपयोग करें
- Functions हेतु Consumption प्लान पर विचार करें

## मॉड्यूल 4: सुरक्षा और उत्पादन सर्वोत्तम अभ्यास

### चरण 4.1: सुरक्षित क्रेडेंशियल प्रबंधन

**वर्तमान चुनौती**: कई AI ऐप्स एपीआई कुंजी हार्डकोड करते हैं या असुरक्षित भंडारण का उपयोग करते हैं।

**AZD समाधान**: प्रबंधित आइडेंटिटी + Key Vault एकीकरण।

1. **अपने टेम्पलेट में सुरक्षा कॉन्फ़िगरेशन की समीक्षा करें:**
```bash
# की वॉल्ट और प्रबंधित पहचान विन्यास खोजें
grep -r "keyVault\|managedIdentity" infra/
```

2. **सत्यापित करें कि मेनेज्ड आइडेंटिटी काम कर रही है:**
```bash
# जांचें कि वेब ऐप में सही पहचान विन्यास है या नहीं
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### चरण 4.2: नेटवर्क सुरक्षा

1. **प्राइवेट एंडपॉइंट सक्षम करें** (यदि पहले से कॉन्फ़िगर नहीं हैं):

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

### चरण 4.3: मॉनिटरिंग और निगरानी

1. **Application Insights कॉन्फ़िगर करें:**
```bash
# एप्लिकेशन इनसाइट्स को स्वचालित रूप से कॉन्फ़िगर किया जाना चाहिए
# कॉन्फ़िगरेशन की जाँच करें:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **AI-विशिष्ट मॉनिटरिंग सेट करें:**

AI संचालन के लिए कस्टम मीट्रिक्स जोड़ें:
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

**कार्य**: सुरक्षित सर्वोत्तम अभ्यास के लिए अपनी तैनाती की समीक्षा करें।

**चेकलिस्ट:**
- [ ] कोड या कॉन्फ़िगरेशन में कोई हार्डकोडेड सीक्रेट नहीं
- [ ] सेवा-से-सेवा प्रमाणीकरण के लिए Managed Identity का उपयोग
- [ ] Key Vault में संवेदनशील कॉन्फ़िगरेशन संग्रहित
- [ ] नेटवर्क एक्सेस ठीक से प्रतिबंधित
- [ ] मॉनिटरिंग और लॉगिंग सक्षम

## मॉड्यूल 5: अपनी AI एप्लीकेशन को कन्वर्ट करना

### चरण 5.1: आकलन वर्कशीट

**अपने ऐप को कन्वर्ट करने से पहले**, इन प्रश्नों के उत्तर दें:

1. **एप्लिकेशन आर्किटेक्चर:**
   - आपका ऐप कौन-कौन सी AI सेवाएँ उपयोग करता है?
   - इसे किस कंप्यूट संसाधन की आवश्यकता है?
   - क्या इसे किसी डेटाबेस की जरूरत है?
   - सेवाओं के बीच निर्भरताएं क्या हैं?

2. **सुरक्षा आवश्यकताएं:**
   - आपका ऐप कौन सा संवेदनशील डेटा हैंडल करता है?
   - आपकी अनुपालन आवश्यकताएँ क्या हैं?
   - क्या आपको प्राइवेट नेटवर्किंग की जरूरत है?

3. **स्केलिंग आवश्यकताएँ:**
   - आपका अपेक्षित लोड क्या है?
   - क्या आपको ऑटो-स्केलिंग चाहिए?
   - क्या क्षेत्रीय आवश्यकताएं हैं?

### चरण 5.2: अपना AZD टेम्पलेट बनाएँ

**अपने ऐप को कन्वर्ट करने के लिए इस पैटर्न का पालन करें:**

1. **मूल संरचना बनाएँ:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# AZD टेम्पलेट प्रारंभ करें
azd init --template minimal
```

2. **azure.yaml बनाएं:**
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

3. **इन्फ्रास्ट्रक्चर टेम्पलेट्स बनाएँ:**

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

**आवश्यकताएं:**
- सामग्री विश्लेषण के लिए Microsoft Foundry Models
- OCR के लिए Document Intelligence
- दस्तावेज़ अपलोड के लिए Storage Account
- प्रसंस्करण लॉजिक के लिए Function App
- उपयोगकर्ता इंटरफ़ेस के लिए वेब ऐप

**बोनस अंक:**
- उचित त्रुटि हैंडलिंग जोड़ें
- लागत आकलन शामिल करें
- मॉनिटरिंग डैशबोर्ड सेटअप करें

## मॉड्यूल 6: सामान्य समस्याओं का निवारण

### सामान्य तैनाती समस्याएँ

#### समस्या 1: OpenAI सेवा कोटा पूर्ण
**लक्षण:** तैनाती कोटा त्रुटि के साथ विफल होती है
**समाधान:**
```bash
# वर्तमान कोटा जांचें
az cognitiveservices usage list --location eastus

# कोटा वृद्धि का अनुरोध करें या अलग क्षेत्र आज़माएं
azd env set AZURE_LOCATION westus2
azd up
```

#### समस्या 2: क्षेत्र में मॉडल उपलब्ध नहीं
**लक्षण:** AI प्रतिक्रियाएं विफल या मॉडल तैनाती त्रुटियाँ
**समाधान:**
```bash
# क्षेत्र के अनुसार मॉडल उपलब्धता जांचें
az cognitiveservices model list --location eastus

# उपलब्ध मॉडल में अपडेट करें
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### समस्या 3: अनुमति समस्याएँ
**लक्षण:** AI सेवाओं को कॉल करते समय 403 निषेध त्रुटियाँ
**समाधान:**
```bash
# भूमिका असाइनमेंट जांचें
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# गुम भूमिका जोड़ें
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### प्रदर्शन समस्याएँ

#### समस्या 4: धीमी AI प्रतिक्रियाएं
**जाँच के कदम:**
1. Application Insights में प्रदर्शन मीट्रिक्स देखें
2. Azure पोर्टल में OpenAI सेवा मीट्रिक्स की समीक्षा करें
3. नेटवर्क कनेक्टिविटी और विलंबता सत्यापित करें

**समाधान:**
- सामान्य प्रश्नों के लिए कैशिंग लागू करें
- अपने उपयोग केस के लिए उपयुक्त OpenAI मॉडल का उपयोग करें
- उच्च लोड परिदृश्यों के लिए रीड रेप्लिका पर विचार करें

### **लैब अभ्यास 6.1: डिबगिंग चुनौती**

**परिदृश्य**: आपकी तैनाती सफल हुई, लेकिन एप्लिकेशन 500 त्रुटियां वापस कर रहा है।

**डिबगिंग कार्य:**
1. एप्लिकेशन लॉग जांचें
2. सेवा कनेक्टिविटी सत्यापित करें
3. प्रमाणीकरण परीक्षण करें
4. कॉन्फ़िगरेशन की समीक्षा करें

**उपयोग के उपकरण:**
- तैनाती अवलोकन के लिए `azd show`
- सेवा लॉग के लिए Azure पोर्टल
- एप्लिकेशन टेलीमेट्री के लिए Application Insights

## मॉड्यूल 7: मॉनिटरिंग और अनुकूलन

### चरण 7.1: व्यापक मॉनिटरिंग सेट करें

1. **कस्टम डैशबोर्ड बनाएँ:**

Azure पोर्टल पर जाएं और डैशबोर्ड बनाएं जिसमें हों:
- OpenAI अनुरोध गणना और विलंबता
- एप्लिकेशन त्रुटि दर
- संसाधन उपयोग
- लागत ट्रैकिंग

2. **अलर्ट सेट करें:**
```bash
# उच्च त्रुटि दर के लिए सूचित करें
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
- ऑटोस्केलिंग नीतियां उपयोग करें
- अनुरोध कैशिंग लागू करें
- OpenAI के लिए टोकन उपयोग की निगरानी करें

### **लैब अभ्यास 7.1: प्रदर्शन अनुकूलन**

**कार्य**: अपने AI एप्लिकेशन को प्रदर्शन और लागत दोनों के लिए अनुकूलित करें।

**सुधारने के लिए मीट्रिक्स:**
- औसत प्रतिक्रिया समय में 20% कमी
- मासिक लागत में 15% कमी
- 99.9% अपटाइम बनाए रखना

**आजमाने के लिए रणनीतियाँ:**
- प्रतिक्रिया कैशिंग लागू करें
- टोकन दक्षता के लिए प्रॉम्प्ट अनुकूलित करें
- उपयुक्त कंप्यूट SKUs का उपयोग करें
- उचित ऑटोस्केलिंग सेट करें

## अंतिम चुनौती: एंड-टू-एंड कार्यान्वयन

### चुनौती परिदृश्य

आपको एक उत्पादन-तैयार AI-संचालित ग्राहक सेवा चैटबॉट बनाने का कार्य दिया गया है, जिसमें ये आवश्यकताएं हैं:

**कार्यात्मक आवश्यकताएं:**
- ग्राहक इंटरैक्शन के लिए वेब इंटरफ़ेस
- प्रतिक्रियाओं के लिए Microsoft Foundry Models के साथ एकीकरण
- Cognitive Search द्वारा दस्तावेज़ खोज क्षमता
- मौजूदा ग्राहक डेटाबेस के साथ एकीकरण
- बहुभाषी समर्थन

**गैर-कार्यात्मक आवश्यकताएं:**
- 1000 समवर्ती उपयोगकर्ताओं को संभालना
- 99.9% अपटाइम SLA
- SOC 2 अनुपालन
- मासिक $500 से कम लागत
- बहु-पर्यावरण तैनाती (डेव, स्टेजिंग, प्रोड)

### कार्यान्वयन चरण

1. आर्किटेक्चर डिज़ाइन करें  
2. AZD टेम्पलेट बनाएं  
3. सुरक्षा उपाय लागू करें  
4. मॉनिटरिंग और अलर्ट सेट करें  
5. तैनाती पाइपलाइंस बनाएं  
6. समाधान का दस्तावेज़ीकरण करें  

### मूल्यांकन मानदंड

- ✅ **कार्यप्रणाली**: क्या यह सभी आवश्यकताओं को पूरा करता है?
- ✅ **सुरक्षा**: क्या सर्वश्रेष्ठ अभ्यास लागू हैं?
- ✅ **स्केलेबिलिटी**: क्या यह लोड संभाल सकता है?
- ✅ **रखरखाव**: क्या कोड और इन्फ्रास्ट्रक्चर सुव्यवस्थित हैं?
- ✅ **लागत**: क्या यह बजट के भीतर है?

## अतिरिक्त संसाधन

### Microsoft दस्तावेज़ीकरण
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### नमूना टेम्पलेट्स
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### कम्युनिटी संसाधन
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 पूर्णता प्रमाणपत्र

बधाई हो! आपने AI वर्कशॉप लैब पूरा कर लिया है। अब आप सक्षम होंगे:

- ✅ मौजूदा AI एप्लिकेशन को AZD टेम्प्लेट्स में परिवर्तित करना
- ✅ उत्पादन-तयार AI एप्लिकेशन तैनात करना
- ✅ AI वर्कलोड के लिए सुरक्षा सर्वोत्तम प्रथाओं को लागू करना
- ✅ AI एप्लिकेशन के प्रदर्शन की निगरानी और अनुकूलन करना
- ✅ सामान्य तैनाती मुद्दों का निवारण करना

### अगले कदम
1. इन पैटर्न्स को अपने खुद के AI प्रोजेक्ट्स पर लागू करें
2. टेम्प्लेट्स को वापस कम्युनिटी में योगदान करें
3. निरंतर समर्थन के लिए Microsoft Foundry Discord में शामिल हों
4. मल्टी-रीजन तैनाती जैसे उन्नत विषयों का अन्वेषण करें

---

**वर्कशॉप प्रतिक्रिया**: कृपया अपने अनुभव को [Microsoft Foundry Discord #Azure चैनल](https://discord.gg/microsoft-azure) में साझा करके इस वर्कशॉप को बेहतर बनाने में मदद करें।

---

**अध्याय नेविगेशन:**
- **📚 कोर्स होम**: [AZD फॉर बिगिनर्स](../../README.md)
- **📖 वर्तमान अध्याय**: अध्याय 2 - AI-फर्स्ट डेवलपमेंट
- **⬅️ पिछला**: [AI मॉडल तैनाती](ai-model-deployment.md)
- **➡️ अगला**: [प्रोडक्शन AI बेहतरीन प्रथाएं](production-ai-practices.md)
- **🚀 अगला अध्याय**: [अध्याय 3: कॉन्फ़िगरेशन](../chapter-03-configuration/configuration.md)

**मदद चाहिए?** AZD और AI तैनाती के लिए समर्थन और चर्चाओं हेतु हमारी कम्युनिटी में शामिल हों।

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:  
यह दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके अनूदित किया गया है। जबकि हम सटीकता के लिए प्रयासरत हैं, कृपया ध्यान दें कि स्वचालित अनुवादों में त्रुटियाँ या अशुद्धियाँ हो सकती हैं। मूल दस्तावेज़ अपने मूल भाषा में अधिकारिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए, पेशेवर मानव अनुवाद की अनुशंसा की जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए हम जिम्मेदार नहीं हैं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->