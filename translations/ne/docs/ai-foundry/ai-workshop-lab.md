<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "668bc93b35c9249e52245a0b037b6011",
  "translation_date": "2025-09-12T19:22:31+00:00",
  "source_file": "docs/ai-foundry/ai-workshop-lab.md",
  "language_code": "ne"
}
-->
# एआई कार्यशाला प्रयोगशाला: तपाईंको एआई समाधानलाई AZD-Deployable बनाउने

**अघिल्लो:** [एआई मोडेल परिनियोजन](ai-model-deployment.md) | **अर्को:** [उत्पादन एआई अभ्यासहरू](production-ai-practices.md)

## कार्यशाला अवलोकन

यो प्रयोगात्मक कार्यशालाले विकासकर्ताहरूलाई Azure Developer CLI (AZD) प्रयोग गरेर एउटा विद्यमान एआई एप्लिकेशनलाई परिनियोजन योग्य बनाउने प्रक्रियामा मार्गदर्शन गर्दछ। तपाईंले Azure AI Foundry सेवाहरू प्रयोग गरेर उत्पादन एआई परिनियोजनका लागि आवश्यक ढाँचाहरू सिक्नुहुनेछ।

**अवधि:** २-३ घण्टा  
**स्तर:** मध्यवर्ती  
**पूर्वापेक्षाहरू:** आधारभूत Azure ज्ञान, एआई/एमएल अवधारणासँग परिचितता

## 🎓 सिक्ने उद्देश्यहरू

यो कार्यशाला समाप्त भएपछि, तपाईं सक्षम हुनुहुनेछ:
- ✅ विद्यमान एआई एप्लिकेशनलाई AZD टेम्प्लेटहरूमा रूपान्तरण गर्नुहोस्
- ✅ AZD प्रयोग गरेर Azure AI Foundry सेवाहरू कन्फिगर गर्नुहोस्
- ✅ एआई सेवाहरूको लागि सुरक्षित प्रमाणपत्र व्यवस्थापन कार्यान्वयन गर्नुहोस्
- ✅ निगरानीसहित उत्पादन-तयार एआई एप्लिकेशनहरू परिनियोजन गर्नुहोस्
- ✅ सामान्य एआई परिनियोजन समस्याहरू समाधान गर्नुहोस्

## पूर्वापेक्षाहरू

### आवश्यक उपकरणहरू
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) स्थापना गरिएको
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) स्थापना गरिएको
- [Git](https://git-scm.com/) स्थापना गरिएको
- कोड सम्पादक (VS Code सिफारिस गरिएको)

### Azure स्रोतहरू
- योगदानकर्ताको पहुँचसहितको Azure सदस्यता
- Azure OpenAI सेवाहरूमा पहुँच (वा पहुँच अनुरोध गर्ने क्षमता)
- स्रोत समूह सिर्जना गर्ने अनुमति

### ज्ञान पूर्वापेक्षाहरू
- Azure सेवाहरूको आधारभूत समझ
- कमाण्ड-लाइन इन्टरफेसहरूसँग परिचितता
- आधारभूत एआई/एमएल अवधारणाहरू (एपीआईहरू, मोडेलहरू, प्रम्प्टहरू)

## प्रयोगशाला सेटअप

### चरण १: वातावरण तयारी

1. **उपकरण स्थापना पुष्टि गर्नुहोस्:**
```bash
# Check AZD installation
azd version

# Check Azure CLI
az --version

# Login to Azure
az login
azd auth login
```

2. **कार्यशाला रिपोजिटरी क्लोन गर्नुहोस्:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## मोड्युल १: एआई एप्लिकेशनहरूको लागि AZD संरचना बुझ्दै

### एआई AZD टेम्प्लेटको संरचना

एआई-तयार AZD टेम्प्लेटका प्रमुख फाइलहरू अन्वेषण गर्नुहोस्:

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

### **प्रयोगशाला अभ्यास १.१: कन्फिगरेसन अन्वेषण गर्नुहोस्**

1. **azure.yaml फाइल जाँच गर्नुहोस्:**
```bash
cat azure.yaml
```

**के हेर्ने:**
- एआई कम्पोनेन्टहरूको लागि सेवा परिभाषाहरू
- वातावरण चर म्यापिङहरू
- होस्ट कन्फिगरेसनहरू

2. **मुख्य.bicep पूर्वाधार समीक्षा गर्नुहोस्:**
```bash
cat infra/main.bicep
```

**पहिचान गर्नुपर्ने प्रमुख एआई ढाँचाहरू:**
- Azure OpenAI सेवा प्रावधान
- Cognitive Search एकीकरण
- सुरक्षित कुञ्जी व्यवस्थापन
- नेटवर्क सुरक्षा कन्फिगरेसनहरू

### **चर्चा बिन्दु:** यी ढाँचाहरू एआईका लागि किन महत्त्वपूर्ण छन्

- **सेवा निर्भरता:** एआई एप्लिकेशनहरूले प्रायः धेरै समन्वित सेवाहरू आवश्यक पर्दछ
- **सुरक्षा:** एपीआई कुञ्जीहरू र अन्तर्क्रियाहरूको सुरक्षित व्यवस्थापन आवश्यक छ
- **स्केलेबिलिटी:** एआई कार्यभारहरूको अद्वितीय स्केलिङ आवश्यकताहरू छन्
- **खर्च व्यवस्थापन:** एआई सेवाहरू उचित कन्फिगरेसन बिना महँगो हुन सक्छ

## मोड्युल २: तपाईंको पहिलो एआई एप्लिकेशन परिनियोजन गर्नुहोस्

### चरण २.१: वातावरण आरम्भ गर्नुहोस्

1. **नयाँ AZD वातावरण सिर्जना गर्नुहोस्:**
```bash
azd env new myai-workshop
```

2. **आवश्यक प्यारामिटरहरू सेट गर्नुहोस्:**
```bash
# Set your preferred Azure region
azd env set AZURE_LOCATION eastus

# Optional: Set specific OpenAI model
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### चरण २.२: पूर्वाधार र एप्लिकेशन परिनियोजन गर्नुहोस्

1. **AZD प्रयोग गरेर परिनियोजन गर्नुहोस्:**
```bash
azd up
```

**`azd up` को क्रममा के हुन्छ:**
- ✅ Azure OpenAI सेवा प्रावधान गर्दछ
- ✅ Cognitive Search सेवा सिर्जना गर्दछ
- ✅ वेब एप्लिकेशनको लागि App Service सेटअप गर्दछ
- ✅ नेटवर्किङ र सुरक्षा कन्फिगर गर्दछ
- ✅ एप्लिकेशन कोड परिनियोजन गर्दछ
- ✅ निगरानी र लगिङ सेटअप गर्दछ

2. **परिनियोजन प्रगति निगरानी गर्नुहोस्** र सिर्जना भइरहेका स्रोतहरू नोट गर्नुहोस्।

### चरण २.३: तपाईंको परिनियोजन पुष्टि गर्नुहोस्

1. **परिनियोजित स्रोतहरू जाँच गर्नुहोस्:**
```bash
azd show
```

2. **परिनियोजित एप्लिकेशन खोल्नुहोस्:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **एआई कार्यक्षमता परीक्षण गर्नुहोस्:**
   - वेब एप्लिकेशनमा नेभिगेट गर्नुहोस्
   - नमूना क्वेरीहरू प्रयास गर्नुहोस्
   - एआई प्रतिक्रियाहरू काम गरिरहेको पुष्टि गर्नुहोस्

### **प्रयोगशाला अभ्यास २.१: समस्या समाधान अभ्यास**

**परिदृश्य:** तपाईंको परिनियोजन सफल भयो तर एआई प्रतिक्रिया दिँदैन।

**जाँच गर्नुपर्ने सामान्य समस्याहरू:**
1. **OpenAI एपीआई कुञ्जीहरू:** सही सेट गरिएको छ कि छैन पुष्टि गर्नुहोस्
2. **मोडेल उपलब्धता:** तपाईंको क्षेत्रले मोडेल समर्थन गर्दछ कि छैन जाँच गर्नुहोस्
3. **नेटवर्क कनेक्टिभिटी:** सेवाहरूले संवाद गर्न सक्छन् कि छैन सुनिश्चित गर्नुहोस्
4. **RBAC अनुमति:** एप्लिकेशनले OpenAI पहुँच गर्न सक्छ कि छैन पुष्टि गर्नुहोस्

**डिबगिङ कमाण्डहरू:**
```bash
# Check environment variables
azd env get-values

# View deployment logs
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Check OpenAI deployment status
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## मोड्युल ३: तपाईंको आवश्यकताहरूका लागि एआई एप्लिकेशन अनुकूलन गर्दै

### चरण ३.१: एआई कन्फिगरेसन परिमार्जन गर्नुहोस्

1. **OpenAI मोडेल अपडेट गर्नुहोस्:**
```bash
# Change to a different model (if available in your region)
azd env set AZURE_OPENAI_MODEL gpt-4

# Redeploy with the new configuration
azd deploy
```

2. **थप एआई सेवाहरू थप्नुहोस्:**

Document Intelligence थप्न `infra/main.bicep` सम्पादन गर्नुहोस्:

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

### चरण ३.२: वातावरण-विशिष्ट कन्फिगरेसनहरू

**सर्वोत्तम अभ्यास:** विकास बनाम उत्पादनका लागि फरक कन्फिगरेसनहरू।

1. **उत्पादन वातावरण सिर्जना गर्नुहोस्:**
```bash
azd env new myai-production
```

2. **उत्पादन-विशिष्ट प्यारामिटरहरू सेट गर्नुहोस्:**
```bash
# Production typically uses higher SKUs
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Enable additional security features
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **प्रयोगशाला अभ्यास ३.१: लागत अनुकूलन**

**चुनौती:** विकासको लागि टेम्प्लेटलाई लागत-प्रभावकारी रूपमा कन्फिगर गर्नुहोस्।

**कार्यहरू:**
1. कुन SKUs लाई निःशुल्क/आधारभूत स्तरमा सेट गर्न सकिन्छ पहिचान गर्नुहोस्
2. न्यूनतम लागतको लागि वातावरण चरहरू कन्फिगर गर्नुहोस्
3. परिनियोजन गर्नुहोस् र उत्पादन कन्फिगरेसनसँग लागत तुलना गर्नुहोस्

**समाधान संकेतहरू:**
- सम्भव भएमा Cognitive Services को लागि F0 (निःशुल्क) स्तर प्रयोग गर्नुहोस्
- विकासमा Search Service को लागि Basic स्तर प्रयोग गर्नुहोस्
- Functions को लागि Consumption योजना विचार गर्नुहोस्

## मोड्युल ४: सुरक्षा र उत्पादनका सर्वोत्तम अभ्यासहरू

### चरण ४.१: सुरक्षित प्रमाणपत्र व्यवस्थापन

**हालको चुनौती:** धेरै एआई एप्लिकेशनहरूले एपीआई कुञ्जीहरू हार्डकोड गर्छन् वा असुरक्षित भण्डारण प्रयोग गर्छन्।

**AZD समाधान:** Managed Identity + Key Vault एकीकरण।

1. **तपाईंको टेम्प्लेटमा सुरक्षा कन्फिगरेसन समीक्षा गर्नुहोस्:**
```bash
# Look for Key Vault and Managed Identity configuration
grep -r "keyVault\|managedIdentity" infra/
```

2. **Managed Identity काम गरिरहेको छ कि छैन पुष्टि गर्नुहोस्:**
```bash
# Check if the web app has the correct identity configuration
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### चरण ४.२: नेटवर्क सुरक्षा

1. **निजी अन्तर्क्रियाहरू सक्षम गर्नुहोस्** (यदि पहिले नै कन्फिगर गरिएको छैन):

तपाईंको bicep टेम्प्लेटमा थप्नुहोस्:
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

### चरण ४.३: निगरानी र अवलोकनीयता

1. **Application Insights कन्फिगर गर्नुहोस्:**
```bash
# Application Insights should be automatically configured
# Check the configuration:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **एआई-विशिष्ट निगरानी सेटअप गर्नुहोस्:**

एआई अपरेसनहरूको लागि कस्टम मेट्रिक्स थप्नुहोस्:
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

### **प्रयोगशाला अभ्यास ४.१: सुरक्षा अडिट**

**कार्य:** सुरक्षा सर्वोत्तम अभ्यासहरूको लागि तपाईंको परिनियोजन समीक्षा गर्नुहोस्।

**चेकलिस्ट:**
- [ ] कोड वा कन्फिगरेसनमा कुनै हार्डकोड गरिएको गोप्य जानकारी छैन
- [ ] सेवा-देखि-सेवा प्रमाणीकरणको लागि Managed Identity प्रयोग गरिएको छ
- [ ] Key Vault संवेदनशील कन्फिगरेसन भण्डारण गर्दछ
- [ ] नेटवर्क पहुँच सही रूपमा प्रतिबन्धित छ
- [ ] निगरानी र लगिङ सक्षम गरिएको छ

## मोड्युल ५: तपाईंको आफ्नै एआई एप्लिकेशन रूपान्तरण गर्दै

### चरण ५.१: मूल्यांकन कार्यपत्र

**तपाईंको एप्लिकेशन रूपान्तरण गर्नु अघि**, यी प्रश्नहरूको उत्तर दिनुहोस्:

1. **एप्लिकेशन आर्किटेक्चर:**
   - तपाईंको एप्लिकेशनले कुन एआई सेवाहरू प्रयोग गर्दछ?
   - यसलाई कुन कम्प्युट स्रोतहरू आवश्यक छ?
   - यसलाई डेटाबेस चाहिन्छ?
   - सेवाहरू बीचको निर्भरता के हो?

2. **सुरक्षा आवश्यकताहरू:**
   - तपाईंको एप्लिकेशनले कुन संवेदनशील डाटा ह्यान्डल गर्दछ?
   - तपाईंलाई कुन अनुपालन आवश्यकताहरू छन्?
   - तपाईंलाई निजी नेटवर्किङ चाहिन्छ?

3. **स्केलिङ आवश्यकताहरू:**
   - तपाईंको अपेक्षित लोड के हो?
   - तपाईंलाई स्वतः-स्केलिङ चाहिन्छ?
   - क्षेत्रीय आवश्यकताहरू छन्?

### चरण ५.२: तपाईंको AZD टेम्प्लेट सिर्जना गर्नुहोस्

**तपाईंको एप्लिकेशन रूपान्तरण गर्न यो ढाँचा अनुसरण गर्नुहोस्:**

1. **आधारभूत संरचना सिर्जना गर्नुहोस्:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Initialize AZD template
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

3. **पूर्वाधार टेम्प्लेटहरू सिर्जना गर्नुहोस्:**

**infra/main.bicep** - मुख्य टेम्प्लेट:
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

### **प्रयोगशाला अभ्यास ५.१: टेम्प्लेट सिर्जना चुनौती**

**चुनौती:** दस्तावेज प्रशोधन एआई एप्लिकेशनको लागि AZD टेम्प्लेट सिर्जना गर्नुहोस्।

**आवश्यकताहरू:**
- सामग्री विश्लेषणको लागि Azure OpenAI
- OCR को लागि Document Intelligence
- दस्तावेज अपलोडको लागि Storage Account
- प्रशोधन तर्कको लागि Function App
- प्रयोगकर्ता इन्टरफेसको लागि वेब एप

**बोनस अंक:**
- उचित त्रुटि ह्यान्डलिङ थप्नुहोस्
- लागत अनुमान समावेश गर्नुहोस्
- निगरानी ड्यासबोर्ड सेटअप गर्नुहोस्

## मोड्युल ६: सामान्य समस्याहरू समाधान गर्दै

### सामान्य परिनियोजन समस्याहरू

#### समस्या १: OpenAI सेवा कोटा नाघ्यो
**लक्षणहरू:** परिनियोजन कोटा त्रुटिसँग असफल हुन्छ
**समाधानहरू:**
```bash
# Check current quotas
az cognitiveservices usage list --location eastus

# Request quota increase or try different region
azd env set AZURE_LOCATION westus2
azd up
```

#### समस्या २: मोडेल क्षेत्रमा उपलब्ध छैन
**लक्षणहरू:** एआई प्रतिक्रियाहरू असफल हुन्छन् वा मोडेल परिनियोजन त्रुटिहरू
**समाधानहरू:**
```bash
# Check model availability by region
az cognitiveservices model list --location eastus

# Update to available model
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### समस्या ३: अनुमति समस्याहरू
**लक्षणहरू:** एआई सेवाहरू कल गर्दा ४०३ निषेध त्रुटिहरू
**समाधानहरू:**
```bash
# Check role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Add missing roles
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### प्रदर्शन समस्याहरू

#### समस्या ४: एआई प्रतिक्रियाहरू ढिलो
**अनुसन्धान चरणहरू:**
1. प्रदर्शन मेट्रिक्सको लागि Application Insights जाँच गर्नुहोस्
2. Azure पोर्टलमा OpenAI सेवा मेट्रिक्स समीक्षा गर्नुहोस्
3. नेटवर्क कनेक्टिभिटी र विलम्बता पुष्टि गर्नुहोस्

**समाधानहरू:**
- सामान्य क्वेरीहरूको लागि क्यासिङ कार्यान्वयन गर्नुहोस्
- तपाईंको प्रयोग केसको लागि उपयुक्त OpenAI मोडेल प्रयोग गर्नुहोस्
- उच्च-लोड परिदृश्यहरूको लागि पढ्ने प्रतिकृतिहरू विचार गर्नुहोस्

### **प्रयोगशाला अभ्यास ६.१: डिबगिङ चुनौती**

**परिदृश्य:** तपाईंको परिनियोजन सफल भयो, तर एप्लिकेशनले ५०० त्रुटिहरू फिर्ता गर्दछ।

**डिबगिङ कार्यहरू:**
1. एप्लिकेशन लगहरू जाँच गर्नुहोस्
2. सेवा कनेक्टिभिटी पुष्टि गर्नुहोस्
3. प्रमाणीकरण परीक्षण गर्नुहोस्
4. कन्फिगरेसन समीक्षा गर्नुहोस्

**प्रयोग गर्नुपर्ने उपकरणहरू:**
- परिनियोजन अवलोकनको लागि `azd show`
- विस्तृत सेवा लगहरूको लागि Azure पोर्टल
- एप्लिकेशन टेलिमेट्रीको लागि Application Insights

## मोड्युल ७: निगरानी र अनुकूलन

### चरण ७.१: व्यापक निगरानी सेटअप गर्नुहोस्

1. **कस्टम ड्यासबोर्डहरू सिर्जना गर्नुहोस्:**

Azure पोर्टलमा नेभिगेट गर्नुहोस् र ड्यासबोर्ड सिर्जना गर्नुहोस्:
- OpenAI अनुरोध गणना र विलम्बता
- एप्लिकेशन त्रुटि दरहरू
- स्रोत उपयोग
- लागत ट्र्याकिङ

2. **अलर्टहरू सेटअप गर्नुहोस्:**
```bash
# Alert for high error rate
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### चरण ७.२: लागत अनुकूलन

1. **हालको लागत विश्लेषण गर्नुहोस्:**
```bash
# Use Azure CLI to get cost data
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **लागत नियन्त्रण कार्यान्वयन गर्नुहोस्:**
- बजेट अलर्ट सेट गर्नुहोस्
- स्वतः स्केलिङ नीतिहरू प्रयोग गर्नुहोस्
- अनुरोध क्यासिङ कार्यान्वयन गर्नुहोस्
- OpenAI को लागि टोकन प्रयोग निगरानी गर्नुहोस्

### **प्रयोगशाला अभ्यास ७.१: प्रदर्शन अनुकूलन**

**कार्य:** तपाईंको एआई एप्लिकेशनलाई प्रदर्शन र लागतका लागि अनुकूलित गर्नुहोस्।

**सुधार गर्नुपर्ने मेट्रिक्स:**
- औसत प्रतिक्रिया समय २०% ले घटाउनुहोस्
- मासिक लागत १५% ले घटाउनुहोस्
- ९९.९% अपटाइम कायम गर्नुहोस्

**प्रयास गर्नुपर्ने रणनीतिहरू:**
- प्रतिक्रिया क्यासिङ कार्यान्वयन गर्नुहोस्
- टोकन दक्षताका लागि प्रम्प्टहरू अनुकूलित गर्नुहोस्
- उपयुक्त कम्प्युट SKUs प्रयोग गर्नुहोस्
- उचित स्वतः स्केलिङ सेटअप गर्नुहोस्

## अन्तिम चुनौती: अन्त-देखि-अन्त कार्यान्वयन

### चुनौती परिदृश्य

तपाईंलाई यी आवश्यकताहरूका साथ उत्पादन-तयार एआई-संचालित ग्राहक सेवा च्याटबोट सिर्जना गर्न जिम्मा दिइएको छ:

**कार्यात्मक आवश्यकताहरू:**
- ग्राहक अन्तर्क्रियाहरूको लागि वेब इन्टरफेस
- प्रतिक्रियाहरूको लागि Azure OpenAI एकीकरण
- Cognitive Search प्रयोग गरेर दस्तावेज खोज क्षमता
- विद्यमान ग्राहक डेटाबेससँग एकीकरण
- बहुभाषा समर्थन

**गैर-कार्यात्मक आवश्यकताहरू:**
- १००० समवर्ती प्रयोगकर्ताहरूलाई ह्यान्डल गर्नुहोस्
- ९९.९% अपटाइम SLA
- SOC 2 अनुपालन
- $५००/महिना भन्दा कम लागत
- धेरै वातावरणहरूमा परिनियोजन गर्नुहोस् (विकास, स्टेजिङ, उत्पादन)

### कार्यान्वयन चरणहरू

1. **आर्किटेक्चर डिजाइन गर्नुहोस्**
2. **AZD टेम्प्लेट सिर्जना गर्नुहोस्**
3. **सुरक्षा उपायहरू कार्यान्वयन गर्नुहोस्**
4. **निगरानी र अलर्टिङ सेटअप गर्नुहोस्**
5. **परिनियोजन पाइपलाइनहरू सिर्जना गर्नुहोस्**
6. **समाधान दस्तावेज गर्नुहोस्**

### मूल्यांकन मापदण्ड

- ✅ **कार्यक्षमता:** के यसले सबै आवश्यकताहरू पूरा गर्दछ?
- ✅ **सुरक्षा:** के सर्वोत्तम अभ्यासहरू कार्यान्वित गरिएको छ?
- ✅ **स्केलेबिलिटी:** के यसले लोड ह्यान्डल गर्न सक्छ?
- ✅ **रखरखाव:** के कोड र पूर्वाधार राम्रोसँग व्यवस्थित छ?
- ✅ **लागत:** के यसले बजेटभित्र रहन्छ?

## थप स्रोतहरू

### Microsoft दस्तावेज
- [Azure Developer CLI दस्तावेज](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Azure OpenAI सेवा दस्तावेज](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Azure AI
- ✅ एआई कार्यभारको लागि सुरक्षा सम्बन्धी उत्कृष्ट अभ्यासहरू लागू गर्नुहोस्
- ✅ एआई अनुप्रयोगको प्रदर्शन अनुगमन र अनुकूलन गर्नुहोस्
- ✅ सामान्य परिनियोजन समस्याहरू समाधान गर्नुहोस्

### अगाडि के गर्ने
1. यी ढाँचाहरूलाई आफ्नै एआई परियोजनाहरूमा लागू गर्नुहोस्
2. समुदायमा टेम्प्लेटहरू फिर्ता योगदान गर्नुहोस्
3. निरन्तर सहयोगको लागि Azure AI Foundry Discord मा सामेल हुनुहोस्
4. बहु-क्षेत्र परिनियोजनजस्ता उन्नत विषयहरू अन्वेषण गर्नुहोस्

---

**कार्यशाला प्रतिक्रिया**: [Azure AI Foundry Discord #Azure च्यानल](https://discord.gg/microsoft-azure) मा आफ्नो अनुभव साझा गरेर यो कार्यशालालाई सुधार गर्न मद्दत गर्नुहोस्।

---

**अघिल्लो:** [AI Model Deployment](ai-model-deployment.md) | **अर्को:** [Production AI Practices](production-ai-practices.md)

**मद्दत चाहिन्छ?** AZD र एआई परिनियोजनबारे सहयोग र छलफलको लागि हाम्रो समुदायमा सामेल हुनुहोस्।

---

**अस्वीकरण**:  
यो दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) प्रयोग गरेर अनुवाद गरिएको छ। हामी शुद्धताको लागि प्रयास गर्छौं, तर कृपया ध्यान दिनुहोस् कि स्वचालित अनुवादमा त्रुटिहरू वा अशुद्धताहरू हुन सक्छ। यसको मूल भाषा मा रहेको मूल दस्तावेज़लाई आधिकारिक स्रोत मानिनुपर्छ। महत्वपूर्ण जानकारीको लागि, व्यावसायिक मानव अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न हुने कुनै पनि गलतफहमी वा गलत व्याख्याको लागि हामी जिम्मेवार हुने छैनौं।