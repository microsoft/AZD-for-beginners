<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "668bc93b35c9249e52245a0b037b6011",
  "translation_date": "2025-09-12T17:30:13+00:00",
  "source_file": "docs/ai-foundry/ai-workshop-lab.md",
  "language_code": "hi"
}
-->
# एआई वर्कशॉप लैब: अपनी एआई सॉल्यूशन्स को AZD-डिप्लॉयबल बनाना

**पिछला:** [एआई मॉडल डिप्लॉयमेंट](ai-model-deployment.md) | **अगला:** [प्रोडक्शन एआई प्रैक्टिसेस](production-ai-practices.md)

## वर्कशॉप का अवलोकन

यह हैंड्स-ऑन लैब डेवलपर्स को एक मौजूदा एआई एप्लिकेशन को लेकर उसे Azure Developer CLI (AZD) का उपयोग करके डिप्लॉयबल बनाने की प्रक्रिया सिखाता है। आप Azure AI Foundry सेवाओं का उपयोग करके प्रोडक्शन एआई डिप्लॉयमेंट के लिए आवश्यक पैटर्न सीखेंगे।

**अवधि:** 2-3 घंटे  
**स्तर:** इंटरमीडिएट  
**पूर्व आवश्यकताएँ:** Azure का बुनियादी ज्ञान, एआई/एमएल अवधारणाओं की समझ

## 🎓 सीखने के उद्देश्य

इस वर्कशॉप के अंत तक, आप सक्षम होंगे:
- ✅ मौजूदा एआई एप्लिकेशन को AZD टेम्पलेट्स का उपयोग करने के लिए परिवर्तित करना
- ✅ AZD के साथ Azure AI Foundry सेवाओं को कॉन्फ़िगर करना
- ✅ एआई सेवाओं के लिए सुरक्षित क्रेडेंशियल प्रबंधन लागू करना
- ✅ मॉनिटरिंग के साथ प्रोडक्शन-रेडी एआई एप्लिकेशन डिप्लॉय करना
- ✅ सामान्य एआई डिप्लॉयमेंट समस्याओं का समाधान करना

## पूर्व आवश्यकताएँ

### आवश्यक टूल्स
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) इंस्टॉल किया हुआ
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) इंस्टॉल किया हुआ
- [Git](https://git-scm.com/) इंस्टॉल किया हुआ
- कोड एडिटर (VS Code अनुशंसित)

### Azure संसाधन
- कंट्रीब्यूटर एक्सेस के साथ Azure सब्सक्रिप्शन
- Azure OpenAI सेवाओं तक पहुंच (या पहुंच का अनुरोध करने की क्षमता)
- रिसोर्स ग्रुप बनाने की अनुमति

### ज्ञान आवश्यकताएँ
- Azure सेवाओं की बुनियादी समझ
- कमांड-लाइन इंटरफेस की जानकारी
- एआई/एमएल की बुनियादी अवधारणाएँ (एपीआई, मॉडल, प्रॉम्प्ट्स)

## लैब सेटअप

### चरण 1: पर्यावरण की तैयारी

1. **टूल इंस्टॉलेशन की पुष्टि करें:**
```bash
# Check AZD installation
azd version

# Check Azure CLI
az --version

# Login to Azure
az login
azd auth login
```

2. **वर्कशॉप रिपॉजिटरी क्लोन करें:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## मॉड्यूल 1: एआई एप्लिकेशन के लिए AZD संरचना को समझना

### एआई-रेडी AZD टेम्पलेट की संरचना

एआई-रेडी AZD टेम्पलेट में प्रमुख फाइलों का अन्वेषण करें:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   └── modules/            # Reusable Bicep modules
│       ├── openai.bicep    # Azure OpenAI configuration
│       ├── search.bicep    # Cognitive Search setup
│       └── webapp.bicep    # Web app configuration
├── app/                    # Application code
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

### **लैब अभ्यास 1.1: कॉन्फ़िगरेशन का अन्वेषण करें**

1. **azure.yaml फाइल की जांच करें:**
```bash
cat azure.yaml
```

**क्या देखना है:**
- एआई घटकों के लिए सेवा परिभाषाएँ
- पर्यावरण वेरिएबल मैपिंग
- होस्ट कॉन्फ़िगरेशन

2. **main.bicep इंफ्रास्ट्रक्चर की समीक्षा करें:**
```bash
cat infra/main.bicep
```

**पहचानने के लिए प्रमुख एआई पैटर्न:**
- Azure OpenAI सेवा का प्रावधान
- कॉग्निटिव सर्च इंटीग्रेशन
- सुरक्षित कुंजी प्रबंधन
- नेटवर्क सुरक्षा कॉन्फ़िगरेशन

### **चर्चा बिंदु:** एआई के लिए ये पैटर्न क्यों महत्वपूर्ण हैं

- **सेवा निर्भरता**: एआई एप्लिकेशन अक्सर कई समन्वित सेवाओं की आवश्यकता होती है
- **सुरक्षा**: एपीआई कुंजियाँ और एंडपॉइंट्स को सुरक्षित प्रबंधन की आवश्यकता होती है
- **स्केलेबिलिटी**: एआई वर्कलोड्स के लिए अद्वितीय स्केलिंग आवश्यकताएँ होती हैं
- **लागत प्रबंधन**: एआई सेवाएँ सही तरीके से कॉन्फ़िगर न होने पर महंगी हो सकती हैं

## मॉड्यूल 2: अपना पहला एआई एप्लिकेशन डिप्लॉय करें

### चरण 2.1: पर्यावरण को प्रारंभ करें

1. **नया AZD पर्यावरण बनाएं:**
```bash
azd env new myai-workshop
```

2. **आवश्यक पैरामीटर सेट करें:**
```bash
# Set your preferred Azure region
azd env set AZURE_LOCATION eastus

# Optional: Set specific OpenAI model
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### चरण 2.2: इंफ्रास्ट्रक्चर और एप्लिकेशन को डिप्लॉय करें

1. **AZD के साथ डिप्लॉय करें:**
```bash
azd up
```

**`azd up` के दौरान क्या होता है:**
- ✅ Azure OpenAI सेवा का प्रावधान करता है
- ✅ कॉग्निटिव सर्च सेवा बनाता है
- ✅ वेब एप्लिकेशन के लिए ऐप सेवा सेट करता है
- ✅ नेटवर्किंग और सुरक्षा कॉन्फ़िगर करता है
- ✅ एप्लिकेशन कोड डिप्लॉय करता है
- ✅ मॉनिटरिंग और लॉगिंग सेट करता है

2. **डिप्लॉयमेंट प्रगति की निगरानी करें** और बनाए जा रहे संसाधनों को नोट करें।

### चरण 2.3: अपने डिप्लॉयमेंट को सत्यापित करें

1. **डिप्लॉय किए गए संसाधनों की जांच करें:**
```bash
azd show
```

2. **डिप्लॉय किए गए एप्लिकेशन को खोलें:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **एआई कार्यक्षमता का परीक्षण करें:**
   - वेब एप्लिकेशन पर जाएं
   - नमूना क्वेरी आज़माएं
   - सुनिश्चित करें कि एआई प्रतिक्रियाएँ काम कर रही हैं

### **लैब अभ्यास 2.1: समस्या निवारण अभ्यास**

**परिदृश्य**: आपका डिप्लॉयमेंट सफल हुआ लेकिन एआई प्रतिक्रिया नहीं दे रहा है।

**जांचने के लिए सामान्य समस्याएँ:**
1. **OpenAI API कुंजियाँ**: सुनिश्चित करें कि वे सही तरीके से सेट हैं
2. **मॉडल उपलब्धता**: जांचें कि आपका क्षेत्र मॉडल का समर्थन करता है या नहीं
3. **नेटवर्क कनेक्टिविटी**: सुनिश्चित करें कि सेवाएँ संवाद कर सकती हैं
4. **RBAC अनुमतियाँ**: सुनिश्चित करें कि ऐप OpenAI तक पहुंच सकता है

**डिबगिंग कमांड्स:**
```bash
# Check environment variables
azd env get-values

# View deployment logs
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Check OpenAI deployment status
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## मॉड्यूल 3: अपने एआई एप्लिकेशन को अपनी आवश्यकताओं के अनुसार अनुकूलित करें

### चरण 3.1: एआई कॉन्फ़िगरेशन को संशोधित करें

1. **OpenAI मॉडल को अपडेट करें:**
```bash
# Change to a different model (if available in your region)
azd env set AZURE_OPENAI_MODEL gpt-4

# Redeploy with the new configuration
azd deploy
```

2. **अतिरिक्त एआई सेवाएँ जोड़ें:**

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

**सर्वोत्तम अभ्यास**: विकास और प्रोडक्शन के लिए अलग-अलग कॉन्फ़िगरेशन।

1. **प्रोडक्शन पर्यावरण बनाएं:**
```bash
azd env new myai-production
```

2. **प्रोडक्शन-विशिष्ट पैरामीटर सेट करें:**
```bash
# Production typically uses higher SKUs
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Enable additional security features
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **लैब अभ्यास 3.1: लागत अनुकूलन**

**चुनौती**: विकास के लिए टेम्पलेट को लागत प्रभावी तरीके से कॉन्फ़िगर करें।

**कार्य:**
1. पहचानें कि कौन से SKUs को मुफ्त/बेसिक टियर पर सेट किया जा सकता है
2. न्यूनतम लागत के लिए पर्यावरण वेरिएबल्स कॉन्फ़िगर करें
3. डिप्लॉय करें और प्रोडक्शन कॉन्फ़िगरेशन के साथ लागत की तुलना करें

**समाधान संकेत:**
- जब संभव हो तो कॉग्निटिव सेवाओं के लिए F0 (मुफ्त) टियर का उपयोग करें
- विकास में सर्च सेवा के लिए बेसिक टियर का उपयोग करें
- फंक्शन्स के लिए कंजम्प्शन प्लान का उपयोग करने पर विचार करें

## मॉड्यूल 4: सुरक्षा और प्रोडक्शन सर्वोत्तम अभ्यास

### चरण 4.1: सुरक्षित क्रेडेंशियल प्रबंधन

**वर्तमान चुनौती**: कई एआई एप्लिकेशन एपीआई कुंजियों को हार्डकोड करते हैं या असुरक्षित स्टोरेज का उपयोग करते हैं।

**AZD समाधान**: Managed Identity + Key Vault इंटीग्रेशन।

1. **अपने टेम्पलेट में सुरक्षा कॉन्फ़िगरेशन की समीक्षा करें:**
```bash
# Look for Key Vault and Managed Identity configuration
grep -r "keyVault\|managedIdentity" infra/
```

2. **सुनिश्चित करें कि Managed Identity काम कर रहा है:**
```bash
# Check if the web app has the correct identity configuration
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### चरण 4.2: नेटवर्क सुरक्षा

1. **प्राइवेट एंडपॉइंट्स सक्षम करें** (यदि पहले से कॉन्फ़िगर नहीं किया गया है):

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

### चरण 4.3: मॉनिटरिंग और ऑब्ज़र्वेबिलिटी

1. **Application Insights कॉन्फ़िगर करें:**
```bash
# Application Insights should be automatically configured
# Check the configuration:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **एआई-विशिष्ट मॉनिटरिंग सेट करें:**

एआई ऑपरेशन्स के लिए कस्टम मेट्रिक्स जोड़ें:
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

**कार्य**: अपने डिप्लॉयमेंट की सुरक्षा सर्वोत्तम अभ्यासों के लिए समीक्षा करें।

**चेकलिस्ट:**
- [ ] कोड या कॉन्फ़िगरेशन में कोई हार्डकोडेड सीक्रेट्स नहीं
- [ ] सेवा-से-सेवा प्रमाणीकरण के लिए Managed Identity का उपयोग किया गया है
- [ ] Key Vault संवेदनशील कॉन्फ़िगरेशन को स्टोर करता है
- [ ] नेटवर्क एक्सेस सही तरीके से प्रतिबंधित है
- [ ] मॉनिटरिंग और लॉगिंग सक्षम हैं

## मॉड्यूल 5: अपने एआई एप्लिकेशन को परिवर्तित करना

### चरण 5.1: मूल्यांकन वर्कशीट

**अपने ऐप को परिवर्तित करने से पहले**, इन सवालों का जवाब दें:

1. **एप्लिकेशन आर्किटेक्चर:**
   - आपका ऐप कौन-कौन सी एआई सेवाओं का उपयोग करता है?
   - इसे कौन-कौन से कंप्यूट संसाधनों की आवश्यकता है?
   - क्या इसे डेटाबेस की आवश्यकता है?
   - सेवाओं के बीच क्या निर्भरता है?

2. **सुरक्षा आवश्यकताएँ:**
   - आपका ऐप कौन-कौन सा संवेदनशील डेटा संभालता है?
   - आपके पास कौन-कौन से अनुपालन आवश्यकताएँ हैं?
   - क्या आपको प्राइवेट नेटवर्किंग की आवश्यकता है?

3. **स्केलिंग आवश्यकताएँ:**
   - आपका अपेक्षित लोड क्या है?
   - क्या आपको ऑटो-स्केलिंग की आवश्यकता है?
   - क्या क्षेत्रीय आवश्यकताएँ हैं?

### चरण 5.2: अपना AZD टेम्पलेट बनाएं

**अपने ऐप को परिवर्तित करने के लिए इस पैटर्न का पालन करें:**

1. **बुनियादी संरचना बनाएं:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Initialize AZD template
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

3. **इंफ्रास्ट्रक्चर टेम्पलेट्स बनाएं:**

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

**चुनौती**: एक डॉक्यूमेंट प्रोसेसिंग एआई ऐप के लिए AZD टेम्पलेट बनाएं।

**आवश्यकताएँ:**
- कंटेंट एनालिसिस के लिए Azure OpenAI
- OCR के लिए Document Intelligence
- डॉक्यूमेंट अपलोड के लिए स्टोरेज अकाउंट
- प्रोसेसिंग लॉजिक के लिए Function App
- उपयोगकर्ता इंटरफेस के लिए वेब ऐप

**बोनस अंक:**
- उचित एरर हैंडलिंग जोड़ें
- लागत अनुमान शामिल करें
- मॉनिटरिंग डैशबोर्ड सेट करें

## मॉड्यूल 6: सामान्य समस्याओं का समाधान

### सामान्य डिप्लॉयमेंट समस्याएँ

#### समस्या 1: OpenAI सेवा कोटा समाप्त
**लक्षण:** डिप्लॉयमेंट कोटा त्रुटि के साथ विफल होता है  
**समाधान:**
```bash
# Check current quotas
az cognitiveservices usage list --location eastus

# Request quota increase or try different region
azd env set AZURE_LOCATION westus2
azd up
```

#### समस्या 2: मॉडल क्षेत्र में उपलब्ध नहीं
**लक्षण:** एआई प्रतिक्रियाएँ विफल या मॉडल डिप्लॉयमेंट त्रुटियाँ  
**समाधान:**
```bash
# Check model availability by region
az cognitiveservices model list --location eastus

# Update to available model
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### समस्या 3: अनुमति समस्याएँ
**लक्षण:** एआई सेवाओं को कॉल करते समय 403 Forbidden त्रुटियाँ  
**समाधान:**
```bash
# Check role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Add missing roles
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### प्रदर्शन समस्याएँ

#### समस्या 4: धीमी एआई प्रतिक्रियाएँ
**जांच के चरण:**
1. Application Insights में प्रदर्शन मेट्रिक्स की जांच करें
2. Azure पोर्टल में OpenAI सेवा मेट्रिक्स की समीक्षा करें
3. नेटवर्क कनेक्टिविटी और विलंबता सत्यापित करें

**समाधान:**
- सामान्य क्वेरी के लिए कैशिंग लागू करें
- अपने उपयोग केस के लिए उपयुक्त OpenAI मॉडल का उपयोग करें
- उच्च-लोड परिदृश्यों के लिए रीड रेप्लिका पर विचार करें

### **लैब अभ्यास 6.1: डिबगिंग चुनौती**

**परिदृश्य**: आपका डिप्लॉयमेंट सफल हुआ, लेकिन एप्लिकेशन 500 त्रुटियाँ लौटाता है।

**डिबगिंग कार्य:**
1. एप्लिकेशन लॉग्स की जांच करें
2. सेवा कनेक्टिविटी सत्यापित करें
3. प्रमाणीकरण का परीक्षण करें
4. कॉन्फ़िगरेशन की समीक्षा करें

**उपयोग करने के लिए टूल्स:**
- `azd show` डिप्लॉयमेंट अवलोकन के लिए
- विस्तृत सेवा लॉग्स के लिए Azure पोर्टल
- एप्लिकेशन टेलीमेट्री के लिए Application Insights

## मॉड्यूल 7: मॉनिटरिंग और अनुकूलन

### चरण 7.1: व्यापक मॉनिटरिंग सेट करें

1. **कस्टम डैशबोर्ड बनाएं:**

Azure पोर्टल पर जाएं और एक डैशबोर्ड बनाएं जिसमें शामिल हो:
- OpenAI अनुरोध संख्या और विलंबता
- एप्लिकेशन त्रुटि दरें
- संसाधन उपयोग
- लागत ट्रैकिंग

2. **अलर्ट सेट करें:**
```bash
# Alert for high error rate
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
# Use Azure CLI to get cost data
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **लागत नियंत्रण लागू करें:**
- बजट अलर्ट सेट करें
- ऑटोस्केलिंग नीतियों का उपयोग करें
- अनुरोध कैशिंग लागू करें
- OpenAI के लिए टोकन उपयोग की निगरानी करें

### **लैब अभ्यास 7.1: प्रदर्शन अनुकूलन**

**कार्य**: अपने एआई एप्लिकेशन को प्रदर्शन और लागत दोनों के लिए अनुकूलित करें।

**सुधारने के लिए मेट्रिक्स:**
- औसत प्रतिक्रिया समय को 20% तक कम करें
- मासिक लागत को 15% तक कम करें
- 99.9% अपटाइम बनाए रखें

**आजमाने की रणनीतियाँ:**
- प्रतिक्रिया कैशिंग लागू करें
- टोकन दक्षता के लिए प्रॉम्प्ट्स को अनुकूलित करें
- उपयुक्त कंप्यूट SKUs का उपयोग करें
- उचित ऑटोस्केलिंग सेट करें

## अंतिम चुनौती: एंड-टू-एंड कार्यान्वयन

### चुनौती परिदृश्य

आपको एक प्रोडक्शन-रेडी एआई-पावर्ड कस्टमर सर्विस चैटबॉट बनाने का कार्य सौंपा गया है, जिसमें ये आवश्यकताएँ हैं:

**कार्यात्मक आवश्यकताएँ:**
- ग्राहक इंटरैक्शन के लिए वेब इंटरफेस
- प्रतिक्रियाओं के लिए Azure OpenAI के साथ इंटीग्रेशन
- डॉक्यूमेंट सर्च क्षमता के लिए कॉग्निटिव सर्च
- मौजूदा ग्राहक डेटाबेस के साथ इंटीग्रेशन
- बहुभाषी समर्थन

**गैर-कार्यात्मक आवश्यकताएँ:**
- 1000 समवर्ती उपयोगकर्ताओं को संभालें
- 99.9% अपटाइम SLA
- SOC 2 अनुपालन
- $500/माह के तहत लागत
- कई पर्यावरणों (डेव, स्टेजिंग, प्रोड) में डिप्लॉय करें

### कार्यान्वयन चरण

1. **आर्किटेक्चर डिज़ाइन करें**
2. **AZD टेम्पलेट बनाएं**
3. **सुरक्षा उपाय लागू करें**
4. **मॉनिटरिंग और अलर्टिंग सेट करें**
5. **डिप्लॉयमेंट पाइपलाइंस बनाएं**
6. **समाधान का दस्तावेज़ीकरण करें**

### मूल्यांकन मानदंड

- ✅ **कार्यात्मकता**: क्या यह सभी आवश्यकताओं को पूरा करता है?
- ✅ **सुरक्षा**: क्या सर्वोत्तम अभ्यास लागू किए गए हैं?
- ✅ **स्केलेबिलिटी**: क्या यह लोड को संभाल सकता है?
- ✅ **रखरखाव**: क्या कोड और इंफ्रास्ट्रक्चर सुव्यवस्थित है?
- ✅ **लागत**: क्या यह बजट के भीतर रहता है?

## अतिरिक्त संसाधन

### Microsoft दस्तावेज़ीकरण
- [Azure Developer CLI दस्तावेज़ीकरण](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Azure OpenAI सेवा दस्तावेज़ीकरण](https://learn
- ✅ एआई वर्कलोड्स के लिए सुरक्षा सर्वोत्तम प्रथाओं को लागू करें  
- ✅ एआई एप्लिकेशन प्रदर्शन की निगरानी और अनुकूलन करें  
- ✅ सामान्य परिनियोजन समस्याओं का समाधान करें  

### अगले कदम  
1. इन पैटर्न्स को अपने एआई प्रोजेक्ट्स में लागू करें  
2. समुदाय के साथ टेम्पलेट्स साझा करें  
3. निरंतर सहायता के लिए Azure AI Foundry Discord से जुड़ें  
4. मल्टी-रीजन परिनियोजन जैसे उन्नत विषयों का अन्वेषण करें  

---

**कार्यशाला प्रतिक्रिया**: इस कार्यशाला को बेहतर बनाने में मदद करें और अपना अनुभव [Azure AI Foundry Discord #Azure चैनल](https://discord.gg/microsoft-azure) में साझा करें।  

---

**पिछला:** [एआई मॉडल परिनियोजन](ai-model-deployment.md) | **अगला:** [उत्पादन एआई प्रथाएं](production-ai-practices.md)  

**मदद चाहिए?** AZD और एआई परिनियोजन के बारे में समर्थन और चर्चाओं के लिए हमारे समुदाय से जुड़ें।  

---

**अस्वीकरण**:  
यह दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके अनुवादित किया गया है। जबकि हम सटीकता सुनिश्चित करने का प्रयास करते हैं, कृपया ध्यान दें कि स्वचालित अनुवाद में त्रुटियां या अशुद्धियां हो सकती हैं। मूल भाषा में उपलब्ध मूल दस्तावेज़ को प्रामाणिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए, पेशेवर मानव अनुवाद की सिफारिश की जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए हम उत्तरदायी नहीं हैं।