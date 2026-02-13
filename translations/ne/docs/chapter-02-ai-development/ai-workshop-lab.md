# AI कार्यशाला ल्याब: तपाईंको AI समाधानहरू AZD मा डिप्लोय गर्न मिल्ने बनाउने

**अध्याय नेभिगेसन:**
- **📚 कोर्स होम**: [AZD For Beginners](../../README.md)
- **📖 हालको अध्याय**: अध्याय 2 - AI-प्रथम विकास
- **⬅️ अघिल्लो**: [AI मोडेल परिनियोजन](ai-model-deployment.md)
- **➡️ अर्को**: [उत्पादन AI उत्तम अभ्यासहरू](production-ai-practices.md)
- **🚀 अर्को अध्याय**: [अध्याय 3: कन्फिगरेसन](../chapter-03-configuration/configuration.md)

## कार्यशाला अवलोकन

यो प्रायोगिक ल्याब विकासकर्ताहरूलाई पहिले नै रहेको AI टेम्पलेट लिन र Azure Developer CLI (AZD) प्रयोग गरेर त्यसलाई डिप्लोय गर्ने प्रक्रियामा मार्गदर्शन गर्छ। तपाईं Microsoft Foundry सेवाहरू प्रयोग गरी उत्पादन-स्तरका AI डिप्लोयमेन्टका लागि आवश्यक ढाँचाहरू सिक्नुहुनेछ।

**समय:** 2-3 घण्टा  
**स्तर:** मध्यवर्ती  
**पूर्वापेक्षाहरू:** Azure को आधारभूत ज्ञान, AI/ML अवधारणासँग परिचित

## 🎓 सिकाइ उद्देश्यहरू

यस कार्यशालाको अन्त्यसम्म, तपाईं सक्षम हुनुहुनेछ:
- ✅ विद्यमान AI अनुप्रयोगलाई AZD टेम्पलेटमा रूपान्तरण गर्न
- ✅ AZD प्रयोग गरी Microsoft Foundry सेवाहरू कन्फिगर गर्न
- ✅ AI सेवाहरूका लागि सुरक्षित क्रेडेन्सियल व्यवस्थापन लागू गर्न
- ✅ निगरानीसहित उत्पादन-तयार AI अनुप्रयोगहरू डिप्लोय गर्न
- ✅ सामान्य AI डिप्लोयमेन्ट समस्याहरू समाधान/डिबग गर्न

## पूर्वापेक्षाहरू

### आवश्यक उपकरणहरू
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) स्थापना गरिएको
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) स्थापना गरिएको
- [Git](https://git-scm.com/) स्थापना गरिएको
- कोड सम्पादक (VS Code सिफारिस गरिएको)

### Azure स्रोतहरू
- contributor पहुँच भएको Azure सदस्यता
- Azure OpenAI सेवाहरूमा पहुँच (वा पहुँच अनुरोध गर्ने क्षमता)
- Resource group सिर्जना गर्ने अनुमति

### आवश्यक ज्ञान
- Azure सेवाहरूको आधारभूत समझ
- कमाण्ड-लाइन इन्टरफेससँग परिचित हुनु
- AI/ML का आधारभूत अवधारणाहरू (APIs, models, prompts)

## ल्याब सेटअप

### चरण 1: वातावरण तयारी

1. **उपकरणहरूको स्थापना जाँच गर्नुहोस्:**
```bash
# AZD स्थापना जाँच गर्नुहोस्
azd version

# Azure CLI जाँच गर्नुहोस्
az --version

# Azure मा लगइन गर्नुहोस्
az login
azd auth login
```

2. **कार्यशाला रिपोजिटरी क्लोन गर्नुहोस्:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## मोड्युल 1: AI अनुप्रयोगहरूको लागि AZD संरचना बुझ्नुहोस्

### AI AZD टेम्पलेटको संरचना

AI-तयार AZD टेम्पलेटमा मुख्य फाइलहरू अन्वेषण गर्नुहोस्:

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

### **ल्याब अभ्यास 1.1: कन्फिगरेसन अन्वेषण गर्नुहोस्**

1. **azure.yaml फाइल जाँच गर्नुहोस्:**
```bash
cat azure.yaml
```

**हेर्नु पर्ने कुरा:**
- AI कम्पोनेन्टहरूका लागि सेवा परिभाषाहरू
- वातावरण चर म्यापिङहरू
- होस्ट कन्फिगरेसनहरू

2. **main.bicep पूर्वाधार समीक्षा गर्नुहोस्:**
```bash
cat infra/main.bicep
```

**पहिचान गर्नुपर्ने प्रमुख AI ढाँचाहरू:**
- Azure OpenAI सेवा प्रोभिजनिङ
- Cognitive Search एकीकरण
- सुरक्षित कुञ्जी व्यवस्थापन
- नेटवर्क सुरक्षा कन्फिगरेसनहरू

### **चर्चा बिन्दु:** किन यी ढाँचाहरू AI का लागि महत्त्वपूर्ण छन्

- **सेवा निर्भरता**: AI अनुप्रयोगहरूले अक्सर बहु समन्वित सेवाहरू आवश्यक पार्छन्
- **सुरक्षा**: API कुञ्जीहरू र एन्डपोइन्टहरूको सुरक्षित व्यवस्थापन आवश्यक हुन्छ
- **स्केलेबिलिटी**: AI वर्कलोडहरूको विशेष स्केलिङ आवश्यकताहरू हुन्छन्
- **लागत व्यवस्थापन**: AI सेवाहरू ठीकसँग कन्फिगर नगरिए महँगो हुन सक्छन्

## मोड्युल 2: आफ्नो पहिलो AI अनुप्रयोग डिप्लोय गर्नुहोस्

### चरण 2.1: वातावरण इनिसियलाइज गर्नुहोस्

1. **नयाँ AZD वातावरण सिर्जना गर्नुहोस्:**
```bash
azd env new myai-workshop
```

2. **आवश्यक प्यारामिटरहरू सेट गर्नुहोस्:**
```bash
# आफ्नो मनपर्ने Azure क्षेत्र सेट गर्नुहोस्
azd env set AZURE_LOCATION eastus

# वैकल्पिक: विशिष्ट OpenAI मोडेल सेट गर्नुहोस्
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### चरण 2.2: पूर्वाधार र अनुप्रयोग डिप्लोय गर्नुहोस्

1. **AZD सँग डिप्लोय गर्नुहोस्:**
```bash
azd up
```

**`azd up` चलाउँदा के हुन्छ:**
- ✅ Azure OpenAI सेवा प्रोभिजन हुन्छ
- ✅ Cognitive Search सेवा सिर्जना गर्छ
- ✅ वेब अनुप्रयोगका लागि App Service सेटअप गर्दछ
- ✅ नेटवर्किङ र सुरक्षा कन्फिगर गर्छ
- ✅ अनुप्रयोग कोड डिप्लोय गर्छ
- ✅ निगरानी र लगिङ सेटअप गर्छ

2. **डिप्लोयमेन्ट प्रगति अनुगमन गर्नुहोस्** र सिर्जना भइरहेको स्रोतहरू नोट गर्नुहोस्।

### चरण 2.3: आफ्नो डिप्लोयमेन्ट जाँच गर्नुहोस्

1. **डिप्लोय गरिएको स्रोतहरू जाँच गर्नुहोस्:**
```bash
azd show
```

2. **डिप्लोय गरिएको अनुप्रयोग खोल्नुहोस्:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **AI कार्यक्षमता परीक्षण गर्नुहोस्:**
   - वेब अनुप्रयोगमा जानुहोस्
   - नमूना क्वेरीहरू प्रयास गर्नुहोस्
   - AI प्रतिक्रियाहरू काम गरिरहेका छन् भनी प्रमाणित गर्नुहोस्

### **ल्याब अभ्यास 2.1: समस्या निवारण अभ्यास**

**परिदृश्य**: तपाईंको डिप्लोयमेन्ट सफल भयो तर AI प्रतिक्रिया दिँदैन।

**जाँच गर्नुपर्ने सामान्य समस्याहरू:**
1. **OpenAI API कुञ्जीहरू**: तिनीहरू सही रूपमा सेट छन् कि छैनन् जाँच गर्नुहोस्
2. **मोडेल उपलब्धता**: तपाईंको क्षेत्रले मोडेललाई समर्थन गर्छ कि गर्दैन जाँच गर्नुहोस्
3. **नेटवर्क कनेक्टिविटी**: सेवाहरूले एकअर्कासँग संचार गर्न सक्षम छन् कि छैनन् सुनिश्चित गर्नुहोस्
4. **RBAC अनुमति**: अनुप्रयोगले OpenAI पहुँच गर्न सक्छ कि सक्दैन जाँच गर्नुहोस्

**डिबग गर्नका कमाण्डहरू:**
```bash
# पर्यावरण चरहरू जाँच गर्नुहोस्
azd env get-values

# डिप्लोयमेन्ट लगहरू हेर्नुहोस्
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# OpenAI को डिप्लोयमेन्ट स्थिति जाँच गर्नुहोस्
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## मोड्युल 3: तपाईंको आवश्यकताहरूका लागि AI अनुप्रयोगहरू अनुकूलन गर्नुहोस्

### चरण 3.1: AI कन्फिगरेसन परिमार्जन गर्नुहोस्

1. **OpenAI मोडेल अद्यावधिक गर्नुहोस्:**
```bash
# आफ्नो क्षेत्रमा उपलब्ध भएमा फरक मोडलमा परिवर्तन गर्नुहोस्
azd env set AZURE_OPENAI_MODEL gpt-4

# नयाँ कन्फिगरेसनसहित पुनः तैनाथ गर्नुहोस्
azd deploy
```

2. **थप AI सेवाहरू थप्नुहोस्:**

Document Intelligence थप्नका लागि `infra/main.bicep` सम्पादन गर्नुहोस्:

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

### चरण 3.2: वातावरण-विशिष्ट कन्फिगरेसनहरू

**सर्वोत्तम अभ्यास**: विकास र उत्पादनका लागि फरक कन्फिगरेसनहरू

1. **उत्पादन वातावरण सिर्जना गर्नुहोस्:**
```bash
azd env new myai-production
```

2. **उत्पादन-विशिष्ट प्यारामिटरहरू सेट गर्नुहोस्:**
```bash
# उत्पादनमा प्रायः उच्च SKUहरू प्रयोग गरिन्छ
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# अतिरिक्त सुरक्षा सुविधाहरू सक्षम गर्नुहोस्
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **ल्याब अभ्यास 3.1: लागत अनुकूलन**

**चुनौती**: लागत-कुशल विकासका लागि टेम्पलेट कन्फिगर गर्नुहोस्।

**कार्यहरू:**
1. कुन SKUs लाई फ्री/बेसिक टियरमा सेट गर्न सकिन्छ पहिचान गर्नुहोस्
2. न्यूनतम लागतका लागि वातावरण चरहरू कन्फिगर गर्नुहोस्
3. डिप्लोय गरी लागतलाई उत्पादन कन्फिगरेसनसँग तुलना गर्नुहोस्

**समाधान संकेतहरू:**
- सम्भव भएमा Cognitive Services मा F0 (फ्री) टियर प्रयोग गर्नुहोस्
- विकासमा Search Service का लागि Basic टियर प्रयोग गर्नुहोस्
- Functions का लागि Consumption योजना प्रयोग गर्ने विचार गर्नुहोस्

## मोड्युल 4: सुरक्षा र उत्पादनका सर्वोत्तम अभ्यासहरू

### चरण 4.1: सुरक्षित क्रेडेन्सियल व्यवस्थापन

**वर्तमान चुनौती**: धेरै AI अनुप्रयोगहरूले API कुञ्जीहरू हार्डकोड गर्छन् वा असुरक्षित भण्डारण प्रयोग गर्छन्।

**AZD समाधान**: Managed Identity + Key Vault एकीकरण।

1. **आफ्नो टेम्पलेटमा सुरक्षा कन्फिगरेसन समीक्षा गर्नुहोस्:**
```bash
# Key Vault र Managed Identity को कन्फिगरेसन खोज्नुहोस्
grep -r "keyVault\|managedIdentity" infra/
```

2. **Managed Identity काम गरिरहेको छ कि छैन जाँच गर्नुहोस्:**
```bash
# वेब एपमा सही पहिचान कन्फिगरेसन छ कि छैन जाँच गर्नुहोस्
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### चरण 4.2: नेटवर्क सुरक्षा

1. **प्राइभेट एन्डपोइन्टहरू सक्षम गर्नुहोस्** (यदि पहिले नै कन्फिगर गरिएको छैन भने):

आफ्नो bicep टेम्पलेटमा थप्नुहोस्:
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

### चरण 4.3: निगरानी र अवलोकनक्षमता

1. **Application Insights कन्फिगर गर्नुहोस्:**
```bash
# Application Insights स्वचालित रूपमा कन्फिगर हुनुपर्छ
# कन्फिगरेशन जाँच गर्नुहोस्:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **AI-विशिष्ट निगरानी सेटअप गर्नुहोस्:**

AI अपरेसनहरूको लागि कस्टम मेट्रिक्स थप्नुहोस्:
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

### **ल्याब अभ्यास 4.1: सुरक्षा अडिट**

**कार्य**: आफ्नो डिप्लोयमेन्टलाई सुरक्षा सर्वोत्तम अभ्यासहरूका लागि समीक्षा गर्नुहोस्।

**जाँच सूची:**
- [ ] कोड वा कन्फिगरेसनमा कुनै हार्डकोड गरिएको गोप्य जानकारी छैन
- [ ] सेवा-देखि-सेवा प्रमाणीकरणका लागि Managed Identity प्रयोग गरिएको छ
- [ ] Key Vault ले संवेदनशील कन्फिगरेसन भण्डारण गर्छ
- [ ] नेटवर्क पहुँच ठीकसँग सीमित गरिएको छ
- [ ] निगरानी र लगिङ सक्षम गरिएको छ

## मोड्युल 5: आफ्नै AI अनुप्रयोग रूपान्तरण गर्दै

### चरण 5.1: मूल्यांकन वर्कशीट

**आफ्नो अनुप्रयोग रूपान्तरण गर्नु अघि**, यी प्रश्नहरू उत्तर दिनुहोस्:

1. **अनुप्रयोग वास्तुकला:**
   - तपाईंको अनुप्रयोगले कुन AI सेवाहरू प्रयोग गर्छ?
   - यसले कुन कम्प्युट स्रोतहरू आवश्यक पर्छ?
   - के यसलाई डेटाबेस आवश्यक छ?
   - सेवाहरूबीच निर्भरताहरू के के छन्?

2. **सुरक्षा आवश्यकताहरू:**
   - तपाईंको अनुप्रयोग कुन संवेदनशील डाटा ह्यान्डल गर्छ?
   - तपाईंको कुन अनुपालन आवश्यकताहरू छन्?
   - के तपाईंलाई प्राइभेट नेटवकिंग चाहिन्छ?

3. **स्केलिङ आवश्यकताहरू:**
   - तपाईंको अपेक्षित लोड कति हो?
   - के तपाईंलाई ऑटो-स्केलिङ चाहिन्छ?
   - के क्षेत्रीय आवश्यकताहरू छन्?

### चरण 5.2: आफ्नो AZD टेम्पलेट सिर्जना गर्नुहोस्

**आफ्नो अनुप्रयोग रूपान्तरण गर्न यस ढाँचालाई पालन गर्नुहोस्:**

1. **आधारभूत संरचना सिर्जना गर्नुहोस्:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# AZD ढाँचा आरम्भ गर्नुहोस्
azd init --template minimal
```

2. **azure.yaml सिर्जना गर्नुहोस्:**
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

3. **पूर्वाधार टेम्पलेटहरू सिर्जना गर्नुहोस्:**

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

**infra/modules/openai.bicep** - OpenAI मोड्युल:
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

### **ल्याब अभ्यास 5.1: टेम्पलेट सिर्जना चुनौती**

**चुनौती**: डकुमेन्ट प्रोसेसिङ AI एपका लागि AZD टेम्पलेट सिर्जना गर्नुहोस्।

**आवश्यकताहरू:**
- सामग्री विश्लेषणका लागि Azure OpenAI
- OCR का लागि Document Intelligence
- डकुमेन्ट अपलोडका लागि Storage Account
- प्रोसेसिङ लॉजिकका लागि Function App
- प्रयोगकर्ता इन्टरफेसका लागि वेब एप

**बोनस पोइन्टहरू:**
- उपयुक्त त्रुटि ह्यान्डलिङ थप्नुहोस्
- लागत अनुमान समावेश गर्नुहोस्
- निगरानी ड्यासबोर्ड सेटअप गर्नुहोस्

## मोड्युल 6: सामान्य समस्याहरूको समस्या निवारण

### सामान्य डिप्लोयमेन्ट समस्याहरू

#### समस्या 1: OpenAI सेवा कोटा नाघियो
**लक्षणहरू:** कोटा त्रुटिसहित डिप्लोय असफल हुन्छ
**समाधानहरू:**
```bash
# हालको कोटा जाँच गर्नुहोस्
az cognitiveservices usage list --location eastus

# कोटा वृद्धिको अनुरोध गर्नुहोस् वा फरक क्षेत्रमा प्रयास गर्नुहोस्
azd env set AZURE_LOCATION westus2
azd up
```

#### समस्या 2: मोडेल क्षेत्र (Region) मा उपलब्ध छैन
**लक्षणहरू:** AI प्रतिक्रियाहरू असफल हुन्छन् वा मोडेल डिप्लोयमेन्ट त्रुटिहरू आउँछन्
**समाधानहरू:**
```bash
# क्षेत्र अनुसार मोडेल उपलब्धता जाँच गर्नुहोस्
az cognitiveservices model list --location eastus

# उपलब्ध मोडेलमा अपडेट गर्नुहोस्
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### समस्या 3: अनुमति सम्बन्धी समस्याहरू
**लक्षणहरू:** AI सेवाहरू कल गर्दा 403 Forbidden त्रुटिहरू
**समाधानहरू:**
```bash
# भूमिका आवंटनहरू जाँच गर्नुहोस्
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# अनुपस्थित भूमिकाहरू थप्नुहोस्
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### प्रदर्शन समस्याहरू

#### समस्या 4: AI प्रतिक्रियाहरू ढिला हुनु
**जाँच कदमहरू:**
1. प्रदर्शन मेट्रिक्सका लागि Application Insights जाँच गर्नुहोस्
2. Azure पोर्टलमा OpenAI सेवा मेट्रिक्स समीक्षा गर्नुहोस्
3. नेटवर्क कनेक्टिविटी र लेटेंसी सत्यापित गर्नुहोस्

**समाधानहरू:**
- सामान्य क्वेरीहरूको लागि क्याचिङ लागू गर्नुहोस्
- तपाईंको प्रयोग केसका लागि उपयुक्त OpenAI मोडेल प्रयोग गर्नुहोस्
- उच्च-लोड परिस्थितिहरूका लागि read replicas विचार गर्नुहोस्

### **ल्याब अभ्यास 6.1: डिबगिङ चुनौती**

**परिदृश्य**: तपाईंको डिप्लोय सफल भयो, तर अनुप्रयोगले 500 त्रुटिहरू फर्काउँछ।

**डिबगिङ कार्यहरू:**
1. अनुप्रयोग लगहरू जाँच गर्नुहोस्
2. सेवा कनेक्टिविटी सत्यापित गर्नुहोस्
3. प्रमाणीकरण परीक्षण गर्नुहोस्
4. कन्फिगरेसन समीक्षा गर्नुहोस्

**प्रयोग गर्ने उपकरणहरू:**
- डिप्लोयमेन्ट अवलोकनका लागि `azd show`
- विस्तृत सेवा लगहरूको लागि Azure पोर्टल
- अनुप्रयोग टेलिमेट्रीका लागि Application Insights

## मोड्युल 7: निगरानी र अनुकूलन

### चरण 7.1: व्यापक निगरानी सेटअप गर्नुहोस्

1. **कस्टम ड्यासबोर्डहरू सिर्जना गर्नुहोस्:**

Azure पोर्टलमा जानुहोस् र निम्नसहित ड्यासबोर्ड सिर्जना गर्नुहोस्:
- OpenAI अनुरोध गणना र लेटेंसी
- अनुप्रयोग त्रुटि दरहरू
- स्रोत उपयोग
- लागत ट्र्याकिङ

2. **अलर्टहरू सेटअप गर्नुहोस्:**
```bash
# उच्च त्रुटि दरको लागि चेतावनी
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### चरण 7.2: लागत अनुकूलन

1. **हालको लागत विश्लेषण गर्नुहोस्:**
```bash
# लागत डेटा प्राप्त गर्न Azure CLI प्रयोग गर्नुहोस्
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **लागत नियन्त्रण लागू गर्नुहोस्:**
- बजेट अलर्ट सेटअप गर्नुहोस्
- अटोस्केलिङ नीतिहरू प्रयोग गर्नुहोस्
- अनुरोध क्याचिङ लागू गर्नुहोस्
- OpenAI का लागि टोकन प्रयोग अनुगमन गर्नुहोस्

### **ल्याब अभ्यास 7.1: प्रदर्शन अनुकूलन**

**कार्य**: प्रदर्शन र लागत दुवैका लागि आफ्नो AI अनुप्रयोग अनुकूलन गर्नुहोस्।

**सुधार गर्ने मेट्रिक्स:**
- औसत प्रतिक्रिया समय 20% ले घटाउनुहोस्
- मासिक लागत 15% ले घटाउनुहोस्
- 99.9% अपटाइम कायम राख्नुहोस्

**कोशिश गर्ने रणनीतिहरू:**
- प्रतिक्रिया क्याचिङ लागू गर्नुहोस्
- टोकन दक्षताका लागि प्रम्प्टहरू अनुकूलन गर्नुहोस्
- उपयुक्त कम्प्युट SKU हरू प्रयोग गर्नुहोस्
- सहि अटोस्केलिङ सेटअप गर्नुहोस्

## अन्तिम चुनौती: अन्त देखि अन्त सम्म कार्यान्वयन

### चुनौती परिदृश्य

तपाईंलाई निम्न आवश्यकताहरू सहित उत्पादन-तयार AI-ड्राइभन ग्राहक सेवा च्याटबट सिर्जना गर्ने जिम्मेवारी दिइएको छ:

**कार्यात्मक आवश्यकताहरू:**
- ग्राहक अन्तरक्रियाका लागि वेब इन्टरफेस
- प्रतिक्रियाहरूको लागि Azure OpenAI सँग एकीकरण
- Cognitive Search प्रयोग गरी डकुमेन्ट खोज क्षमता
- अवस्थित ग्राहक डेटाबेससँग एकीकरण
- बहुभाषिक समर्थन

**गैर-कार्यात्मक आवश्यकताहरू:**
- 1000 समसामयिक प्रयोगकर्ताहरू ह्यान्डल गर्न सक्नुहोस्
- 99.9% अपटाइम SLA
- SOC 2 अनुपालन
- मासिक $500 भन्दा कम लागत
- बहु वातावरणहरूमा डिप्लोय गर्नुहोस् (dev, staging, prod)

### कार्यान्वयन चरणहरू

1. **वास्तुकला डिजाइन गर्नुहोस्**
2. **AZD टेम्पलेट सिर्जना गर्नुहोस्**
3. **सुरक्षा उपायहरू लागू गर्नुहोस्**
4. **निगरानी र अलर्टिङ सेटअप गर्नुहोस्**
5. **डिप्लोयमेन्ट पाइपलाइनहरू सिर्जना गर्नुहोस्**
6. **समाधान दस्तावेजीकरण गर्नुहोस्**

### मूल्यांकन मापदण्ड

- ✅ **कार्यक्षमता**: के यसले सबै आवश्यकताहरू पूर्ति गर्छ?
- ✅ **सुरक्षा**: के सर्वोत्तम अभ्यासहरू लागू गरिएको छ?
- ✅ **स्केलेबिलिटी**: के यसले लोड सम्हाल्न सक्छ?
- ✅ **रखरखावयोग्यता**: के कोड र पूर्वाधार राम्रोसँग व्यवस्थित छ?
- ✅ **लागत**: के यसले बजेट भित्रै रहन्छ?

## थप स्रोतहरू

### Microsoft दस्तावेजीकरण
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Azure OpenAI सेवा दस्तावेजीकरण](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry दस्तावेजीकरण](https://learn.microsoft.com/azure/ai-studio/)

### नमूना टेम्पलेटहरू
- [Azure OpenAI Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### समुदाय स्रोतहरू
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 समाप्ति प्रमाणपत्र
बधाई छ! तपाईंले AI कार्यशाला ल्याब पूरा गर्नुभएको छ। अब तपाईंले सक्षम हुनुपर्छ:

- ✅ अवस्थित AI अनुप्रयोगहरूलाई AZD टेम्प्लेटमा रूपान्तरण गर्न
- ✅ उत्पादन-तयार AI अनुप्रयोगहरू परिनियोजन गर्न
- ✅ AI वर्कलोडका लागि सुरक्षा उत्तम अभ्यासहरू लागू गर्न
- ✅ AI अनुप्रयोग प्रदर्शनको अनुगमन र अनुकूलन गर्न
- ✅ सामान्य परिनियोजन समस्याहरू सुल्झाउन

### अर्को कदमहरू
1. यी ढाँचाहरूलाई आफ्नै AI परियोजनाहरूमा लागू गर्नुहोस्
2. समुदायमा टेम्प्लेटहरू फिर्ता योगदान गर्नुहोस्
3. निरन्तर सहयोगका लागि Microsoft Foundry Discord मा सामेल हुनुहोस्
4. बहु-क्षेत्र परिनियोजन जस्ता उन्नत विषयहरू अन्वेषण गर्नुहोस्

---

**Workshop Feedback**: कृपया [Microsoft Foundry Discord #Azure channel](https://discord.gg/microsoft-azure) मा आफ्नो अनुभव साझा गरेर यस कार्यशालालाई सुधार गर्न मद्दत गर्नुहोस्।

---

**अध्याय नेभिगेसन:**
- **📚 पाठ्यक्रम गृह**: [AZD आरम्भकर्ताका लागि](../../README.md)
- **📖 वर्तमान अध्याय**: अध्याय 2 - AI-प्रथम विकास
- **⬅️ अघिल्लो**: [AI मोडेल परिनियोजन](ai-model-deployment.md)
- **➡️ अर्को**: [उत्पादन AI उत्तम अभ्यासहरू](production-ai-practices.md)
- **🚀 अर्को अध्याय**: [अध्याय 3: कन्फिगरेसन](../chapter-03-configuration/configuration.md)

**सहायता चाहिन्छ?** AZD र AI परिनियोजनहरू बारे समर्थन र छलफलका लागि हाम्रो समुदायमा सामेल हुनुहोस्।

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
अस्वीकरण:
यो कागजात AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) प्रयोग गरी अनुवाद गरिएको हो। हामी शुद्धताका लागि प्रयास गर्छौं, तर कृपया ध्यान दिनुहोस् कि स्वचालित अनुवादमा त्रुटि वा अशुद्धता हुन सक्छ। मूल कागजातलाई यसको मूल भाषामा अधिकारिक स्रोत मानिनुपर्छ। महत्वपूर्ण जानकारीका लागि पेशेवर मानव अनुवाद सिफारिश गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न कुनै पनि गलतफहमी वा गलत व्याख्याको लागि हामी जिम्मेवार हुने छैनौं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->