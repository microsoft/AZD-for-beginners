# AI कार्यशाला ल्याब: तपाईंको AI समाधानहरू AZD-Deployable कसरी बनाउने

**अध्याय नेभिगेशन:**
- **📚 कोर्स होम**: [AZD For Beginners](../../README.md)
- **📖 वर्तमान अध्याय**: अध्याय २ - AI-First विकास
- **⬅️ अघिल्लो**: [AI मोडेल डिप्लॉयमेन्ट](ai-model-deployment.md)
- **➡️ अर्को**: [प्रोडक्सन AI राम्रो अभ्यासहरू](production-ai-practices.md)
- **🚀 अर्को अध्याय**: [अध्याय ३: कन्फिगरेसन](../chapter-03-configuration/configuration.md)

## कार्यशाला अवलोकन

यो व्यावहारिक ल्याबले विकासकर्ताहरुलाई Azure Developer CLI (AZD) प्रयोग गरेर एक विद्यमान AI टेम्प्लेट लिइ त्यसलाई डिप्लॉय गर्ने प्रक्रियामा मार्गदर्शन गर्दछ। तपाईं Microsoft Foundry सेवाहरू प्रयोग गरी प्रोडक्सन AI डिप्लॉयमेन्टका आधारभूत ढाँचाहरू सिक्नुहुनेछ।

> **प्रमाणीकरण नोट (२०२६-०३-२५):** यो कार्यशाला `azd` को `1.23.12` भर्सनसँग समीक्षा गरिएको हो। यदि तपाईंको स्थानीय स्थापना पुरानो छ भने, auth, टेम्प्लेट र डिप्लॉयमेन्ट वर्कफ्लो तलका चरणहरूसँग मेल खानको लागि AZD अपडेट गरेर सुरु गर्नुहोस्।

**अवधि:** २-३ घण्टा  
**स्तर:** मध्यम  
**पूर्वशर्तहरू:** Azure को आधारभूत ज्ञान, AI/ML अवधारणाहरूको परिचितपन

## 🎓 सिकाइ उद्देश्यहरू

यो कार्यशाला सकिएपछि, तपाईं गर्न सक्नुहुनेछ:  
- ✅ विद्यमान AI एप्लिकेशनलाई AZD टेम्प्लेटमा रूपान्तरण गर्ने  
- ✅ AZD प्रयोग गरी Microsoft Foundry सेवाहरू कन्फिगर गर्ने  
- ✅ AI सेवाहरूको लागि सुरक्षित क्रेडेन्सियल व्यवस्थापन कार्यान्वयन गर्ने  
- ✅ निरीक्षण सहित प्रोडक्सन-तयार AI एप्लिकेशन डिप्लॉय गर्ने  
- ✅ सामान्य AI डिप्लॉयमेन्ट समस्याहरूको समाधान गर्ने

## पूर्वशर्तहरू

### आवश्यक उपकरणहरू
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) स्थापना गरिएको  
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) स्थापना गरिएको  
- [Git](https://git-scm.com/) स्थापना गरिएको  
- कोड सम्पादक (VS Code सिफारिस गरिएको)

### Azure स्रोतहरू
- Azure सदस्यता र योगदानकर्ता पहुँच  
- Microsoft Foundry Models सेवा पहुँच (वा पहुँचका लागि अनुरोध गर्ने क्षमता)  
- स्रोत समूह सिर्जना अनुमतिहरू

### ज्ञान पूर्वशर्तहरू
- Azure सेवाहरूको आधारभूत बुझाइ  
- कमाण्ड-लाइन इन्टरफेससँग परिचित  
- आधारभूत AI/ML अवधारणाहरू (API, मोडेल, प्रम्प्ट)

## ल्याब सेटअप

### चरण १: वातावरण तयारी

1. **उपकरण स्थापना प्रमाणित गर्नुहोस्:**  
```bash
# AZD स्थापना जाँच गर्नुहोस्
azd version

# Azure CLI जाँच गर्नुहोस्
az --version

# AZD कार्यप्रवाहहरूको लागि Azure मा लगइन गर्नुहोस्
azd auth login

# डाइग्नोस्टिक्सको समयमा az आदेशहरू चलाउने योजना भएमा मात्र Azure CLI मा लगइन गर्नुहोस्
az login
```
  
यदि तपाईं बहु टेनेन्टहरूमा काम गर्नुहुन्छ वा तपाईंको सदस्यता स्वचालित रूपमा डिटेक्टर हुँदैन भने, `azd auth login --tenant-id <tenant-id>` प्रयोग गरेर पुन: प्रयास गर्नुहोस्।

2. **कार्यशाला रिपोजिटरी क्लोन गर्नुहोस्:**  
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```
  
## मोड्युल १: AI एप्लिकेशनहरूको लागि AZD संरचनाको बुझाई

### AI AZD टेम्प्लेटको संरचना

AI-तयार AZD टेम्प्लेटका मुख्य फाइलहरू अन्वेषण गर्नुहोस्:  

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
  
### **ल्याब अभ्यास १.१: कन्फिगरेसन अन्वेषण**

1. **azure.yaml फाइल जाँच गर्नुहोस्:**  
```bash
cat azure.yaml
```
  
**के हेर्नुहोस्:**  
- AI कम्पोनेन्टहरूको सेवा परिभाषाहरू  
- वातावरण चरहरूको म्यापिङ  
- होस्ट कन्फिगरेसनहरू

2. **main.bicep पूर्वाधार समीक्षा गर्नुहोस्:**  
```bash
cat infra/main.bicep
```
  
**मुख्य AI ढाँचाहरू पहिचान गर्न:**  
- Microsoft Foundry Models सेवा प्रावधान  
- Cognitive Search एकीकरण  
- सुरक्षित कुञ्जी व्यवस्थापन  
- नेटवर्क सुरक्षा कन्फिगरेसनहरू

### **चर्चा बिन्दु:** यी ढाँचाहरू किन AI का लागि महत्त्वपूर्ण छन्

- **सेवा निर्भरताहरू:** AI एपहरू प्रायः धेरै समन्वित सेवाहरू आवश्यक पर्छन्  
- **सुरक्षा:** API कुञ्जी र अन्त बिन्दुहरूको सुरक्षित व्यवस्थापन आवश्यक हुन्छ  
- **स्केलेबिलिटी:** AI कार्यभारहरूका लागि अनन्य स्केलिङ आवश्यकताहरू हुन्छन्  
- **लागत व्यवस्थापन:** AI सेवाहरू सही प्रकारले कन्फिगर नगरिए महँगो पर्न सक्छ

## मोड्युल २: तपाईंको पहिलो AI एप्लिकेशन डिप्लॉय गर्नुहोस्

### चरण २.१: वातावरण इनिशियलाइज गर्नुहोस्

1. **नयाँ AZD वातावरण सिर्जना गर्नुहोस्:**  
```bash
azd env new myai-workshop
```
  
2. **आवश्यक प्यारामिटरहरू सेट गर्नुहोस्:**  
```bash
# तपाईंको रोजाइको Azure क्षेत्र सेट गर्नुहोस्
azd env set AZURE_LOCATION eastus

# वैकल्पिक: विशिष्ट OpenAI मोडेल सेट गर्नुहोस्
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```
  
### चरण २.२: पूर्वाधार र एप्लिकेशन डिप्लॉय गर्नुहोस्

1. **AZD बाट डिप्लॉय गर्नुहोस्:**  
```bash
azd up
```
  
**`azd up` गर्दा के हुन्छ:**  
- ✅ Microsoft Foundry Models सेवा प्रावधान हुन्छ  
- ✅ Cognitive Search सेवा सिर्जना हुन्छ  
- ✅ वेब एप्लिकेशनको लागि App Service सेटअप हुन्छ  
- ✅ नेटवर्किङ र सुरक्षा कन्फिगर हुन्छ  
- ✅ एप्लिकेशन कोड डिप्लॉय हुन्छ  
- ✅ निरीक्षण र लगिङ सेटअप हुन्छ

2. **डिप्लॉयमेन्ट प्रगति अनुगमन गर्नुहोस्** र सिर्जना हुँदै गएका स्रोतहरू नोट गर्नुहोस्।

### चरण २.३: तपाईंको डिप्लॉयमेन्ट प्रमाणित गर्नुहोस्

1. **डिप्लॉय भएका स्रोतहरू जाँच गर्नुहोस्:**  
```bash
azd show
```
  
2. **डिप्लॉय गरिएको एप्लिकेशन खोल्नुहोस्:**  
```bash
azd show
```
  
`azd show` आउटपुटमा देखाइएको वेब अन्तबिन्दु खोल्नुहोस्।

3. **AI कार्यक्षमता परीक्षण गर्नुहोस्:**  
   - वेब एप्लिकेशनमा जानुहोस्  
   - नमुना क्वेरीहरू प्रयास गर्नुहोस्  
   - AI प्रतिक्रियाहरू काम गरिरहेको छ कि छैन जाँच्नुहोस्

### **ल्याब अभ्यास २.१: समस्या समाधान अभ्यास**

**परिदृश्य:** तपाईंको डिप्लॉयमेन्ट सफल भयो तर AI प्रतिक्रिया दिँदैन।

**सामान्य जाँच्नुपर्ने समस्याहरू:**  
1. **OpenAI API कुञ्जीहरू:** सही रूपमा सेट छन् कि छैनन् जाँच गर्नुहोस्  
2. **मोडेल उपलब्धता:** तपाईंको क्षेत्रले मोडेल सपोर्ट गर्छ कि छैन जाँच गर्नुहोस्  
3. **नेटवर्क कनेक्टिभिटी:** सेवाहरू आपसमा सञ्चार गर्न सक्षम छन् कि छैन जाँच्नुहोस्  
4. **RBAC अनुमतिहरू:** एप्लिकेशन OpenAI पहुँच्न सक्छ कि छैन पुष्टि गर्नुहोस्

**समस्यासूचक कमाण्डहरू:**  
```bash
# वातावरण चरहरू जाँच गर्नुहोस्
azd env get-values

# परिनियोजन लगहरू हेर्नुहोस्
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# OpenAI परिनियोजन स्थिति जाँच गर्नुहोस्
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```
  
## मोड्युल ३: तपाईंको आवश्यकताका लागि AI एप्लिकेशन अनुकूलन गर्नुहोस्

### चरण ३.१: AI कन्फिगरेसन परिमार्जन गर्नुहोस्

1. **OpenAI मोडेल अपडेट गर्नुहोस्:**  
```bash
# फरक मोडेलमा परिवर्तन गर्नुहोस् (यदि तपाईंको क्षेत्रमा उपलब्ध छ भने)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# नयाँ कन्फिगरेसनसहित पुनः तैनाथ गर्नुहोस्
azd deploy
```
  
2. **थप AI सेवाहरू थप्नुहोस्:**

`infra/main.bicep` सम्पादन गर्न Document Intelligence थप्नुहोस्:  

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

**राम्रो अभ्यास:** विकास र प्रोडक्सनका लागि फरक कन्फिगरेसनहरू।

1. **प्रोडक्सन वातावरण सिर्जना गर्नुहोस्:**  
```bash
azd env new myai-production
```
  
2. **प्रोडक्सन-विशिष्ट प्यारामिटरहरू सेट गर्नुहोस्:**  
```bash
# उत्पादन सामान्यतया उच्च SKU हरू प्रयोग गर्छ
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# थप सुरक्षा सुविधाहरू सक्षम पार्नुहोस्
azd env set ENABLE_PRIVATE_ENDPOINTS true
```
  
### **ल्याब अभ्यास ३.१: लागत अनुकूलन**

**चुनौती:** लागत प्रभावकारी विकासका लागि टेम्प्लेट कन्फिगर गर्नुहोस्।

**कार्यहरू:**  
1. कुन SKUहरूलाई निःशुल्क/आधारभूत तहमा सेट गर्न सकिन्छ पहिचान गर्नुहोस्  
2. न्यूनतम लागतका लागि वातावरण चरहरू कन्फिगर गर्नुहोस्  
3. डिप्लॉय गरेर प्रोडक्सन कन्फिगरेसनसँग लागत तुलना गर्नुहोस्

**समाधान सङ्केतहरू:**  
- सम्भव भए Cognitive Services का लागि F0 (नि:शुल्क) तह प्रयोग गर्नुहोस्  
- विकासमा Search सेवाका लागि आधारभूत तह प्रयोग गर्नुहोस्  
- Functions का लागि Consumption योजना विचार गर्नुहोस्

## मोड्युल ४: सुरक्षा र प्रोडक्सन राम्रो अभ्यासहरू

### चरण ४.१: सुरक्षित क्रेडेन्सियल व्यवस्थापन

**वर्तमान चुनौती:** धेरै AI एपहरूले API कुञ्जीहरू हार्डकोड गर्छन् वा असुरक्षित भण्डारण गर्छन्।

**AZD समाधान:** Managed Identity + Key Vault एकीकरण।

1. ** तपाईंको टेम्प्लेटमा सुरक्षा कन्फिगरेसन समीक्षा गर्नुहोस्:**  
```bash
# की भल्ट र व्यवस्थापित पहिचान कन्फिगरेसन खोज्नुहोस्
grep -r "keyVault\|managedIdentity" infra/
```
  
2. **Managed Identity काम गरिरहेको छ कि छैन प्रमाणित गर्नुहोस्:**  
```bash
# वेब एपमा सही पहिचान कन्फिगरेसन छ कि छैन जाँच गर्नुहोस्
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```
  
### चरण ४.२: नेटवर्क सुरक्षा

1. **प्राइभेट अन्तबिन्दु सक्षम गर्नुहोस्** (यदि पहिले नै कन्फिगर गरिएको छैन भने):  

तपाईंको bicep टेम्प्लेटमा थप गर्नुहोस्:  
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
  
### चरण ४.३: निरीक्षण र अधिगम्यता

1. **Application Insights कन्फिगर गर्नुहोस्:**  
```bash
# आवेदन अन्तर्दृष्टिहरू स्वचालित रूपमा कन्फिगर गरिनु पर्छ
# कन्फिगरेसन जाँच गर्नुहोस्:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```
  
2. **AI-विशेष निगरानी सेटअप गर्नुहोस्:**

AI सञ्चालनहरूको लागि अनुकूल मेट्रिक्स थप्नुहोस्:  
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
  
### **ल्याब अभ्यास ४.१: सुरक्षा अडिट**

**कार्य:** तपाईंको डिप्लॉयमेन्टका लागि सुरक्षा राम्रो अभ्यासहरू समीक्षा गर्नुहोस्।

**चेकलिस्ट:**  
- [ ] कोड वा कन्फिगरेसनमा कुनै हार्डकोड गरिएको गोप्य जानकारी छैन  
- [ ] सेवा-देखि-सेवा प्रमाणीकरणका लागि Managed Identity प्रयोग गरिएको छ  
- [ ] संवेदनशील कन्फिगरेसनहरू Key Vault मा सुरक्षित गरिएको छ  
- [ ] नेटवर्क पहुँच उचित रूपमा प्रतिबन्धित छ  
- [ ] निरीक्षण र लगिङ सक्षम छ

## मोड्युल ५: तपाईंको आफ्नै AI एप्लिकेशन रूपान्तरण

### चरण ५.१: मूल्याङ्कन कार्यपत्र

**तपाईंको एप रूपान्तरण गर्नु अघि**, यी प्रश्नहरूको उत्तर दिनुहोस्:

1. **एप्लिकेशन वास्तुकला:**  
   - तपाईंको एपले कुन AI सेवाहरू प्रयोग गर्छ?  
   - यसलाई कुन कम्प्युट स्रोतहरू आवश्यक छन्?  
   - यसलाई डाटाबेस चाहिन्छ?  
   - सेवाहरूबीच कस्ता निर्भरता छन्?

2. **सुरक्षा आवश्यकताहरू:**  
   - तपाईंको एपले कुन संवेदनशील डेटा सम्हाल्छ?  
   - तपाईंका कता-कता अनुपालन आवश्यकताहरू छन्?  
   - तपाईंलाई निजी नेटवर्किङ चाहिन्छ?

3. **स्केलिङ आवश्यकताहरू:**  
   - तपाईंको अपेक्षित लोड कति हो?  
   - के तपाईंलाई स्वत: स्केलिङ चाहिन्छ?  
   - क्षेत्रीय आवश्यकताहरू के छन्?

### चरण ५.२: तपाईंको AZD टेम्प्लेट सिर्जना गर्नुहोस्

**तपाईंको एप रूपान्तरण गर्न यो ढाँचा पछ्याउनुहोस्:**

1. **आधारभूत संरचना सिर्जना गर्नुहोस्:**  
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# AZD टेम्प्लेट शुरू गर्नुहोस्
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
  
### **ल्याब अभ्यास ५.१: टेम्प्लेट सिर्जना चुनौती**

**चुनौती:** एउटा कागजात प्रशोधन AI एपका लागि AZD टेम्प्लेट सिर्जना गर्नुहोस्।

**आवश्यकताहरू:**  
- सामग्री विश्लेषणका लागि Microsoft Foundry Models  
- OCR का लागि Document Intelligence  
- कागजात अपलोडका लागि स्टोरेज अकाउन्ट  
- प्रशोधन तर्कका लागि Function App  
- प्रयोगकर्ता इन्टरफेसका लागि वेब एप

**बोनस पोइन्टहरू:**  
- उचित त्रुटि ह्यान्डलिंग थप्नुहोस्  
- लागत अनुमान समावेश गर्नुहोस्  
- अनुगमन ड्यासबोर्डहरू सेटअप गर्नुहोस्

## मोड्युल ६: सामान्य समस्याहरू समाधान

### सामान्य डिप्लॉयमेन्ट समस्याहरू

#### समस्या १: OpenAI सेवा क्वोटा अतिक्रमण  
**लक्षणहरू:** डिप्लॉय फेल हुन्छ क्वोटा त्रुटिसँग  
**समाधानहरू:**  
```bash
# हालको कोटा जाँच गर्नुहोस्
az cognitiveservices usage list --location eastus

# कोटा वृद्धि अनुरोध गर्नुहोस् वा फरक क्षेत्र प्रयास गर्नुहोस्
azd env set AZURE_LOCATION westus2
azd up
```
  
#### समस्या २: क्षेत्रमै मोडेल उपलब्ध छैन  
**लक्षणहरू:** AI प्रतिक्रिया असफल वा मोडेल डिप्लॉय त्रुटि  
**समाधानहरू:**  
```bash
# क्षेत्र अनुसार मोडेल उपलब्धता जाँच गर्नुहोस्
az cognitiveservices model list --location eastus

# उपलब्ध मोडेलमा अद्यावधिक गर्नुहोस्
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```
  
#### समस्या ३: अनुमति समस्या  
**लक्षणहरू:** AI सेवाहरू कल गर्दा 403 Forbidden त्रुटिहरू  
**समाधानहरू:**  
```bash
# भूमिका आवंटन जाँच गर्नुहोस्
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# हराएका भूमिकाहरू थप्नुहोस्
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```
  
### प्रदर्शन समस्याहरू

#### समस्या ४: AI प्रतिक्रियाहरू ढिला  
**जाँचका चरणहरू:**  
1. Application Insights मा प्रदर्शन मेट्रिक्स जाँच्नुहोस्  
2. Azure पोर्टलमा OpenAI सेवा मेट्रिक्स समीक्षा गर्नुहोस्  
3. नेटवर्क कनेक्टिभिटी र विलम्बता प्रमाणित गर्नुहोस्

**समाधानहरू:**  
- सामान्य क्वेरीका लागि क्याचिङ लागू गर्नुहोस्  
- तपाईंको प्रयोग केसमा उपयुक्त OpenAI मोडेल प्रयोग गर्नुहोस्  
- उच्च लोड परिस्थितिको लागि रिड रप्लिका विचार गर्नुहोस्

### **ल्याब अभ्यास ६.१: समस्या समाधान चुनौती**

**परिदृश्य:** तपाईंको डिप्लॉयमेन्ट सफल भयो, तर एप्लिकेशन 500 त्रुटि फर्काउँछ।

**समस्या समाधान कार्यहरू:**  
1. एप्लिकेशन लगहरू जाँच्नुहोस्  
2. सेवा कनेक्टिभिटी प्रमाणित गर्नुहोस्  
3. प्रमाणीकरण परीक्षण गर्नुहोस्  
4. कन्फिगरेसन समीक्षा गर्नुहोस्

**प्रयोग गर्ने उपकरणहरू:**  
- `azd show` डिप्लॉयमेन्ट अवलोकनका लागि  
- Azure पोर्टल विस्तृत सेवा लगका लागि  
- Application Insights एप्लिकेशन टेलिमेट्रीका लागि

## मोड्युल ७: निरीक्षण र अनुकूलन

### चरण ७.१: व्यापक निरीक्षण सेटअप गर्नुहोस्

1. **अनुकूल ड्यासबोर्डहरू सिर्जना गर्नुहोस्:**  

Azure पोर्टलमा जानुहोस् र यस्तो ड्यासबोर्ड बनाउनुहोस्:  
- OpenAI अनुरोध संख्या र विलम्बता  
- एप्लिकेशन त्रुटि दर  
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
  
### चरण ७.२: लागत अनुकूलन

1. **हालको लागत विश्लेषण गर्नुहोस्:**  
```bash
# लागत डेटा प्राप्त गर्न Azure CLI प्रयोग गर्नुहोस्
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```
  
2. **लागत नियन्त्रण लागू गर्नुहोस्:**  
- बजेट अलर्ट सेटअप गर्नुहोस्  
- स्वचालित स्केलिंग नीति प्रयोग गर्नुहोस्  
- अनुरोध क्याचिङ लागू गर्नुहोस्  
- OpenAI टोकन प्रयोग अनुगमन गर्नुहोस्

### **ल्याब अभ्यास ७.१: प्रदर्शन अनुकूलन**

**कार्य:** तपाईंको AI एप प्रदर्शनी र लागत दुवैका लागि अनुकूलन गर्नुहोस्।

**सुधार गर्नुपर्ने मेट्रिक्स:**  
- औसत प्रतिक्रिया समय २०% घटाउनुहोस्  
- मासिक लागत १५% घटाउनुहोस्  
- ९९.९% अपटाइम कायम राख्नुहोस्

**प्रयोग गर्नुपर्ने रणनीतिहरू:**  
- प्रतिक्रिया क्याचिङ लागू गर्नुहोस्  
- टोकन दक्षताका लागि प्रम्प्टहरू अनुकूलित गर्नुहोस्  
- उपयुक्त कम्प्युट SKU प्रयोग गर्नुहोस्  
- उचित स्वचालित स्केलिंग सेटअप गर्नुहोस्

## अन्तिम चुनौती: एन्ड-टु-एन्ड कार्यान्वयन

### चुनौती परिदृश्य

तपाईंलाई उत्पादन-तयार AI-चालित ग्राहक सेवा च्याटबोट बनाउन भनिएको छ जसमा यी आवश्यकताहरू छन्:

**कार्यात्मक आवश्यकताहरू:**  
- ग्राहक अन्तरक्रियाका लागि वेब अन्तरफलक  
- प्रतिक्रियाका लागि Microsoft Foundry Models एकीकरण  
- Cognitive Search प्रयोग गरी कागजात खोज क्षमता  
- अवस्थित ग्राहक डाटाबेसको साथ एकीकरण  
- बहुभाषी समर्थन

**गैर-कार्यात्मक आवश्यकताहरू:**  
- १००० समसामयिक प्रयोगकर्ताहरूको सम्हाल्ने क्षमता  
- ९९.९% अपटाइम SLA  
- SOC 2 अनुपालन  
- मासिक $५०० भित्र लागत  
- बहु वातावरणहरूमा डिप्लॉय (विकास, स्टेजिङ, प्रोडक्सन)

### कार्यान्वयन चरणहरू

1. आर्किटेक्चर डिजाइन गर्नुहोस्  
2. AZD टेम्प्लेट सिर्जना गर्नुहोस्  
3. सुरक्षा उपायहरू कार्यान्वयन गर्नुहोस्  
4. निरीक्षण र चेतावनी सेटअप गर्नुहोस्  
5. डिप्लॉयमेन्ट पाइपलाइनहरू सिर्जना गर्नुहोस्  
6. समाधान दस्तावेजीकरण गर्नुहोस्

### मूल्याङ्कन मापदण्ड

- ✅ **कार्यक्षमता:** के यसले सबै आवश्यकताहरू पूरा गर्दछ?  
- ✅ **सुरक्षा:** के राम्रो अभ्यासहरू लागू गरिएको छ?  
- ✅ **स्केलेबिलिटी:** के यसले लोड सम्हाल्न सक्छ?  
- ✅ **रखरखावयोग्यता:** के कोड र पूर्वाधार राम्रो संरचित छ?  
- ✅ **लागत:** के यो बजेट भित्र छ?

## थप स्रोतहरू

### Microsoft कागजातहरू
- [Azure Developer CLI कागजातहरू](https://learn.microsoft.com/azure/developer/azure-developer-cli/)  
- [Microsoft Foundry Models सेवा कागजात](https://learn.microsoft.com/azure/cognitive-services/openai/)  
- [Microsoft Foundry कागजात](https://learn.microsoft.com/azure/ai-studio/)

### नमुना टेम्प्लेटहरू
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### समुदाय स्रोतहरू
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 समाप्ति प्रमाणपत्र

बधाई छ! तपाईंले AI कार्यशाला प्रयोगशाला पूरा गर्नुभयो। अब तपाईंले गर्न सक्नुहुन्छ:

- ✅ विद्यमान AI एप्लिकेशनहरूलाई AZD टेम्प्लेटहरूमा रूपान्तरण गर्नुहोस्
- ✅ उत्पादन-तयार AI एप्लिकेशनहरू तैनाथ गर्नुहोस्
- ✅ AI कार्यभारहरूको लागि सुरक्षा उत्तम अभ्यासहरू कार्यान्वयन गर्नुहोस्
- ✅ AI एप्लिकेशन प्रदर्शनको अनुगमन र अनुकूलन गर्नुहोस्
- ✅ साधारण तैनाथ समस्या समाधान गर्नुहोस्

### पछिल्ला कदमहरू
1. यी पद्धतिहरू आफ्नो AI परियोजनाहरूमा लागू गर्नुहोस्
2. समुदायमा टेम्प्लेटहरू फिर्ता योगदान गर्नुहोस्
3. निरन्तर समर्थनको लागि Microsoft Foundry Discord मा सामेल हुनुहोस्
4. बहु-क्षेत्रीय तैनाथी जस्ता उन्नत विषयहरू अन्वेषण गर्नुहोस्

---

**कार्यशाला प्रतिक्रिया**: कृपया आफ्नो अनुभव [Microsoft Foundry Discord #Azure च्यानल](https://discord.gg/microsoft-azure) मा साझा गरेर हामीलाई यो कार्यशाला सुधार गर्न मद्दत गर्नुहोस्।

---

**अध्याय नेभिगेसन:**
- **📚 कोर्स होम**: [AZD प्रारम्भकर्ताहरूका लागि](../../README.md)
- **📖 वर्तमान अध्याय**: अध्याय २ - AI-प्रथम विकास
- **⬅️ पहिलेको**: [AI मोडेल तैनाथी](ai-model-deployment.md)
- **➡️ अर्को**: [उत्पादन AI उत्तम अभ्यासहरू](production-ai-practices.md)
- **🚀 अर्को अध्याय**: [अध्याय ३: कन्फिगरेसन](../chapter-03-configuration/configuration.md)

**मद्दत चाहिन्छ?** AZD र AI तैनाथीहरू बारे समर्थन र छलफलहरूको लागि हाम्रो समुदायमा सामेल हुनुहोस्।

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:  
यस दस्तावेज़लाई AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) प्रयोग गरी अनुवाद गरिएको छ। हामी शुद्धताको लागि प्रयासरत छौं, तर कृपया बुझ्नुहोस् कि स्वचालित अनुवादहरूमा त्रुटिहरू वा असठिकताहरू हुनसक्छन्। मूल दस्तावेज़ यसको मूल भाषामा विश्वसनीय स्रोत मानिनुपर्छ। महत्वपूर्ण जानकारीको लागि, व्यावसायिक मानवीय अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न कुनै पनि गलतफहमी वा गलत व्याख्याहरूका लागि हामी जिम्मेवार छैनौं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->