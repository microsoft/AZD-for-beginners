<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "22e9deee2d82e70fc841c60f97627916",
  "translation_date": "2025-09-23T14:15:56+00:00",
  "source_file": "docs/ai-foundry/ai-workshop-lab.md",
  "language_code": "mr"
}
-->
# AI कार्यशाळा लॅब: तुमचे AI सोल्यूशन्स AZD-डिप्लॉय करण्यायोग्य बनवणे

**अध्याय नेव्हिगेशन:**
- **📚 कोर्स होम**: [AZD For Beginners](../../README.md)
- **📖 चालू अध्याय**: अध्याय 2 - AI-प्रथम विकास
- **⬅️ मागील**: [AI मॉडेल डिप्लॉयमेंट](ai-model-deployment.md)
- **➡️ पुढील**: [प्रॉडक्शन AI सर्वोत्तम पद्धती](production-ai-practices.md)
- **🚀 पुढील अध्याय**: [अध्याय 3: कॉन्फिगरेशन](../getting-started/configuration.md)

## कार्यशाळेचा आढावा

ही प्रॅक्टिकल लॅब डेव्हलपर्सना एक विद्यमान AI टेम्पलेट घेऊन Azure Developer CLI (AZD) वापरून डिप्लॉय करण्याच्या प्रक्रियेतून मार्गदर्शन करते. तुम्ही Azure AI Foundry सेवांचा वापर करून प्रॉडक्शन AI डिप्लॉयमेंटसाठी आवश्यक नमुने शिकाल.

**कालावधी:** 2-3 तास  
**स्तर:** मध्यम  
**पूर्वतयारी:** Azure ची मूलभूत माहिती, AI/ML संकल्पनांची ओळख

## 🎓 शिकण्याचे उद्दिष्ट

या कार्यशाळेच्या शेवटी, तुम्ही खालील गोष्टी करू शकाल:
- ✅ विद्यमान AI अॅप्लिकेशन AZD टेम्पलेट्स वापरून रूपांतरित करा
- ✅ AZD सह Azure AI Foundry सेवांचे कॉन्फिगरेशन करा
- ✅ AI सेवांसाठी सुरक्षित क्रेडेन्शियल व्यवस्थापन लागू करा
- ✅ मॉनिटरिंगसह प्रॉडक्शन-रेडी AI अॅप्लिकेशन्स डिप्लॉय करा
- ✅ सामान्य AI डिप्लॉयमेंट समस्यांचे निराकरण करा

## पूर्वतयारी

### आवश्यक साधने
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) स्थापित
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) स्थापित
- [Git](https://git-scm.com/) स्थापित
- कोड एडिटर (VS Code शिफारस केलेले)

### Azure संसाधने
- योगदानकर्ता प्रवेशासह Azure सदस्यता
- Azure OpenAI सेवांमध्ये प्रवेश (किंवा प्रवेशासाठी विनंती करण्याची क्षमता)
- संसाधन गट तयार करण्याची परवानगी

### ज्ञानाची पूर्वतयारी
- Azure सेवांची मूलभूत समज
- कमांड-लाइन इंटरफेसची ओळख
- मूलभूत AI/ML संकल्पना (API, मॉडेल्स, प्रॉम्प्ट्स)

## लॅब सेटअप

### चरण 1: वातावरणाची तयारी

1. **साधनांची स्थापना सत्यापित करा:**
```bash
# Check AZD installation
azd version

# Check Azure CLI
az --version

# Login to Azure
az login
azd auth login
```

2. **कार्यशाळेचे रेपॉजिटरी क्लोन करा:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```


## मॉड्यूल 1: AI अॅप्लिकेशन्ससाठी AZD संरचना समजून घेणे

### AI-रेडी AZD टेम्पलेटची रचना

AI-रेडी AZD टेम्पलेटमधील मुख्य फाइल्स एक्सप्लोर करा:

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


### **लॅब व्यायाम 1.1: कॉन्फिगरेशन एक्सप्लोर करा**

1. **azure.yaml फाइल तपासा:**
```bash
cat azure.yaml
```

**काय शोधायचे:**
- AI घटकांसाठी सेवा परिभाषा
- पर्यावरणीय व्हेरिएबल मॅपिंग
- होस्ट कॉन्फिगरेशन

2. **main.bicep इन्फ्रास्ट्रक्चर पुनरावलोकन करा:**
```bash
cat infra/main.bicep
```

**ओळखण्याचे मुख्य AI नमुने:**
- Azure OpenAI सेवा प्रोव्हिजनिंग
- Cognitive Search एकत्रीकरण
- सुरक्षित की व्यवस्थापन
- नेटवर्क सुरक्षा कॉन्फिगरेशन

### **चर्चेचा मुद्दा:** AI साठी हे नमुने का महत्त्वाचे आहेत

- **सेवा अवलंबित्व:** AI अॅप्सना अनेक समन्वयित सेवांची आवश्यकता असते
- **सुरक्षा:** API की आणि एंडपॉइंट्स सुरक्षित व्यवस्थापन आवश्यक आहे
- **स्केलेबिलिटी:** AI वर्कलोड्ससाठी अद्वितीय स्केलिंग आवश्यकता असते
- **खर्च व्यवस्थापन:** योग्य कॉन्फिगरेशनशिवाय AI सेवा महाग होऊ शकतात

## मॉड्यूल 2: तुमचे पहिले AI अॅप्लिकेशन डिप्लॉय करा

### चरण 2.1: वातावरण प्रारंभ करा

1. **नवीन AZD वातावरण तयार करा:**
```bash
azd env new myai-workshop
```

2. **आवश्यक पॅरामीटर्स सेट करा:**
```bash
# Set your preferred Azure region
azd env set AZURE_LOCATION eastus

# Optional: Set specific OpenAI model
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```


### चरण 2.2: इन्फ्रास्ट्रक्चर आणि अॅप्लिकेशन डिप्लॉय करा

1. **AZD सह डिप्लॉय करा:**
```bash
azd up
```

**`azd up` दरम्यान काय होते:**
- ✅ Azure OpenAI सेवा प्रोव्हिजन करते
- ✅ Cognitive Search सेवा तयार करते
- ✅ वेब अॅप्लिकेशनसाठी App Service सेट करते
- ✅ नेटवर्किंग आणि सुरक्षा कॉन्फिगर करते
- ✅ अॅप्लिकेशन कोड डिप्लॉय करते
- ✅ मॉनिटरिंग आणि लॉगिंग सेट करते

2. **डिप्लॉयमेंट प्रगती मॉनिटर करा** आणि तयार होणाऱ्या संसाधनांची नोंद ठेवा.

### चरण 2.3: तुमचे डिप्लॉयमेंट सत्यापित करा

1. **डिप्लॉय केलेली संसाधने तपासा:**
```bash
azd show
```

2. **डिप्लॉय केलेले अॅप्लिकेशन उघडा:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **AI कार्यक्षमता तपासा:**
   - वेब अॅप्लिकेशनवर जा
   - नमुना क्वेरी वापरून पहा
   - AI प्रतिसाद कार्यरत आहेत का ते सत्यापित करा

### **लॅब व्यायाम 2.1: समस्या निराकरण सराव**

**परिस्थिती:** तुमचे डिप्लॉयमेंट यशस्वी झाले आहे पण AI प्रतिसाद देत नाही.

**सामान्य समस्या तपासण्यासाठी:**
1. **OpenAI API की:** योग्यरित्या सेट आहेत का ते सत्यापित करा
2. **मॉडेल उपलब्धता:** तुमच्या प्रदेशात मॉडेल समर्थित आहे का ते तपासा
3. **नेटवर्क कनेक्टिव्हिटी:** सेवा संवाद साधू शकतात का ते सुनिश्चित करा
4. **RBAC परवानग्या:** अॅप OpenAI ऍक्सेस करू शकते का ते सत्यापित करा

**डिबगिंग कमांड्स:**
```bash
# Check environment variables
azd env get-values

# View deployment logs
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Check OpenAI deployment status
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```


## मॉड्यूल 3: तुमच्या गरजांसाठी AI अॅप्लिकेशन्स सानुकूलित करणे

### चरण 3.1: AI कॉन्फिगरेशन सुधारित करा

1. **OpenAI मॉडेल अपडेट करा:**
```bash
# Change to a different model (if available in your region)
azd env set AZURE_OPENAI_MODEL gpt-4

# Redeploy with the new configuration
azd deploy
```

2. **अतिरिक्त AI सेवा जोडा:**

Document Intelligence जोडण्यासाठी `infra/main.bicep` संपादित करा:

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


### चरण 3.2: वातावरण-विशिष्ट कॉन्फिगरेशन

**सर्वोत्तम पद्धत:** विकास आणि उत्पादनासाठी वेगवेगळ्या कॉन्फिगरेशन.

1. **उत्पादन वातावरण तयार करा:**
```bash
azd env new myai-production
```

2. **उत्पादन-विशिष्ट पॅरामीटर्स सेट करा:**
```bash
# Production typically uses higher SKUs
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Enable additional security features
azd env set ENABLE_PRIVATE_ENDPOINTS true
```


### **लॅब व्यायाम 3.1: खर्च ऑप्टिमायझेशन**

**आव्हान:** विकासासाठी खर्च-प्रभावी टेम्पलेट कॉन्फिगर करा.

**कार्ये:**
1. कोणते SKUs फ्री/बेसिक टियरवर सेट करता येतील ते ओळखा
2. पर्यावरणीय व्हेरिएबल्स खर्च कमी करण्यासाठी कॉन्फिगर करा
3. उत्पादन कॉन्फिगरेशनसह खर्चाची तुलना करा

**उपाय संकेत:**
- शक्य असल्यास Cognitive Services साठी F0 (फ्री) टियर वापरा
- विकासात Search Service साठी Basic टियर वापरा
- Functions साठी Consumption प्लॅन विचारात घ्या

## मॉड्यूल 4: सुरक्षा आणि उत्पादन सर्वोत्तम पद्धती

### चरण 4.1: सुरक्षित क्रेडेन्शियल व्यवस्थापन

**सध्याची समस्या:** अनेक AI अॅप्स API की हार्डकोड करतात किंवा असुरक्षित स्टोरेज वापरतात.

**AZD उपाय:** Managed Identity + Key Vault एकत्रीकरण.

1. **तुमच्या टेम्पलेटमधील सुरक्षा कॉन्फिगरेशन पुनरावलोकन करा:**
```bash
# Look for Key Vault and Managed Identity configuration
grep -r "keyVault\|managedIdentity" infra/
```

2. **Managed Identity कार्यरत आहे का ते सत्यापित करा:**
```bash
# Check if the web app has the correct identity configuration
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```


### चरण 4.2: नेटवर्क सुरक्षा

1. **खाजगी एंडपॉइंट्स सक्षम करा** (जर आधी कॉन्फिगर केलेले नसतील):

तुमच्या बायसेप टेम्पलेटमध्ये जोडा:
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


### चरण 4.3: मॉनिटरिंग आणि निरीक्षण

1. **Application Insights कॉन्फिगर करा:**
```bash
# Application Insights should be automatically configured
# Check the configuration:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **AI-विशिष्ट मॉनिटरिंग सेट करा:**

AI ऑपरेशन्ससाठी कस्टम मेट्रिक्स जोडा:
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


### **लॅब व्यायाम 4.1: सुरक्षा ऑडिट**

**कार्य:** तुमच्या डिप्लॉयमेंटसाठी सुरक्षा सर्वोत्तम पद्धतींचे पुनरावलोकन करा.

**चेकलिस्ट:**
- [ ] कोड किंवा कॉन्फिगरेशनमध्ये हार्डकोड केलेले सीक्रेट्स नाहीत
- [ ] सेवा-ते-सेवा प्रमाणीकरणासाठी Managed Identity वापरले आहे
- [ ] Key Vault संवेदनशील कॉन्फिगरेशन संचयित करते
- [ ] नेटवर्क ऍक्सेस योग्यरित्या मर्यादित आहे
- [ ] मॉनिटरिंग आणि लॉगिंग सक्षम आहे

## मॉड्यूल 5: तुमचे स्वतःचे AI अॅप्लिकेशन रूपांतरित करणे

### चरण 5.1: मूल्यांकन वर्कशीट

**तुमचे अॅप रूपांतरित करण्यापूर्वी**, या प्रश्नांची उत्तरे द्या:

1. **अॅप्लिकेशन आर्किटेक्चर:**
   - तुमचे अॅप कोणत्या AI सेवांचा वापर करते?
   - त्याला कोणते compute resources आवश्यक आहेत?
   - त्याला डेटाबेसची आवश्यकता आहे का?
   - सेवांमधील अवलंबित्व काय आहेत?

2. **सुरक्षा आवश्यकता:**
   - तुमचे अॅप कोणते संवेदनशील डेटा हाताळते?
   - तुमच्याकडे कोणत्या अनुपालन आवश्यकता आहेत?
   - तुम्हाला खाजगी नेटवर्किंगची आवश्यकता आहे का?

3. **स्केलिंग आवश्यकता:**
   - तुमचा अपेक्षित लोड काय आहे?
   - तुम्हाला ऑटो-स्केलिंगची आवश्यकता आहे का?
   - प्रादेशिक आवश्यकता आहेत का?

### चरण 5.2: तुमचे AZD टेम्पलेट तयार करा

**तुमचे अॅप रूपांतरित करण्यासाठी हा नमुना अनुसरण करा:**

1. **मूलभूत संरचना तयार करा:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Initialize AZD template
azd init --template minimal
```

2. **azure.yaml तयार करा:**
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

3. **इन्फ्रास्ट्रक्चर टेम्पलेट्स तयार करा:**

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


### **लॅब व्यायाम 5.1: टेम्पलेट तयार करण्याचे आव्हान**

**आव्हान:** दस्तऐवज प्रक्रिया AI अॅपसाठी AZD टेम्पलेट तयार करा.

**आवश्यकता:**
- सामग्री विश्लेषणासाठी Azure OpenAI
- OCR साठी Document Intelligence
- दस्तऐवज अपलोडसाठी Storage Account
- प्रक्रिया लॉजिकसाठी Function App
- वापरकर्ता इंटरफेससाठी वेब अॅप

**अतिरिक्त गुण:**
- योग्य एरर हँडलिंग जोडा
- खर्चाचा अंदाज समाविष्ट करा
- मॉनिटरिंग डॅशबोर्ड सेट करा

## मॉड्यूल 6: सामान्य समस्यांचे निराकरण

### सामान्य डिप्लॉयमेंट समस्या

#### समस्या 1: OpenAI सेवा कोटा ओलांडला
**लक्षणे:** डिप्लॉयमेंट कोटा त्रुटीसह अयशस्वी
**उपाय:**
```bash
# Check current quotas
az cognitiveservices usage list --location eastus

# Request quota increase or try different region
azd env set AZURE_LOCATION westus2
azd up
```


#### समस्या 2: मॉडेल प्रदेशात उपलब्ध नाही
**लक्षणे:** AI प्रतिसाद अयशस्वी किंवा मॉडेल डिप्लॉयमेंट त्रुटी
**उपाय:**
```bash
# Check model availability by region
az cognitiveservices model list --location eastus

# Update to available model
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```


#### समस्या 3: परवानगी समस्या
**लक्षणे:** AI सेवांना कॉल करताना 403 Forbidden त्रुटी
**उपाय:**
```bash
# Check role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Add missing roles
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```


### कार्यक्षमता समस्या

#### समस्या 4: AI प्रतिसाद मंद
**तपासणी चरण:**
1. Application Insights मध्ये कार्यक्षमता मेट्रिक्स तपासा
2. Azure पोर्टलमध्ये OpenAI सेवा मेट्रिक्स पुनरावलोकन करा
3. नेटवर्क कनेक्टिव्हिटी आणि विलंब सत्यापित करा

**उपाय:**
- सामान्य क्वेरीसाठी कॅशिंग लागू करा
- तुमच्या वापरासाठी योग्य OpenAI मॉडेल वापरा
- उच्च-लोड परिस्थितीसाठी वाचन प्रतिकृती विचारात घ्या

### **लॅब व्यायाम 6.1: डिबगिंग आव्हान**

**परिस्थिती:** तुमचे डिप्लॉयमेंट यशस्वी झाले आहे, पण अॅप्लिकेशन 500 त्रुटी परत करते.

**डिबगिंग कार्ये:**
1. अॅप्लिकेशन लॉग तपासा
2. सेवा कनेक्टिव्हिटी सत्यापित करा
3. प्रमाणीकरण चाचणी करा
4. कॉन्फिगरेशन पुनरावलोकन करा

**वापरण्यासाठी साधने:**
- `azd show` डिप्लॉयमेंट विहंगावलोकनासाठी
- तपशीलवार सेवा लॉगसाठी Azure पोर्टल
- अॅप्लिकेशन टेलीमेट्रीसाठी Application Insights

## मॉड्यूल 7: मॉनिटरिंग आणि ऑप्टिमायझेशन

### चरण 7.1: व्यापक मॉनिटरिंग सेट करा

1. **कस्टम डॅशबोर्ड तयार करा:**

Azure पोर्टलवर जा आणि खालील गोष्टींसह डॅशबोर्ड तयार करा:
- OpenAI विनंती संख्या आणि विलंब
- अॅप्लिकेशन त्रुटी दर
- संसाधन वापर
- खर्च ट्रॅकिंग

2. **अलर्ट सेट करा:**
```bash
# Alert for high error rate
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```


### चरण 7.2: खर्च ऑप्टिमायझेशन

1. **सध्याचा खर्च विश्लेषित करा:**
```bash
# Use Azure CLI to get cost data
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **खर्च नियंत्रण लागू करा:**
- बजेट अलर्ट सेट करा
- ऑटोस्केलिंग धोरणे वापरा
- विनंती कॅशिंग लागू करा
- OpenAI साठी टोकन वापर मॉनिटर करा

### **लॅब व्यायाम 7.1: कार्यक्षमता ऑप्टिमायझेशन**

**कार्य:** तुमचे AI अॅप्लिकेशन कार्यक्षमता आणि खर्चासाठी ऑप्टिमाइझ करा.

**सुधारण्यासाठी मेट्रिक्स:**
- सरासरी प्रतिसाद वेळ 20% कमी करा
- मासिक खर्च 15% कमी करा
- 99.9% अपटाइम राखा

**प्रयत्न करण्याच्या रणनीती:**
- प्रतिसाद कॅशिंग लागू करा
- टोकन कार्यक्षमतेसाठी प्रॉम्प्ट्स ऑप्टिमाइझ करा
- योग्य compute SKUs वापरा
- योग्य ऑटोस्केलिंग सेट करा

## अंतिम आव्हान: एंड-टू-एंड अंमलबजावणी

### आव्हान परिस्थिती

तुमच्यावर उत्पादन-रेडी AI-सक्षम ग्राहक सेवा चॅटबॉट तयार करण्याची जबाबदारी आहे ज्यामध्ये खालील आवश्यकता आहेत:

**कार्यात्मक आवश्यकता:**
- ग्राहक संवादांसाठी वेब इंटरफेस
- प्रतिसादांसाठी Azure OpenAI सह एकत्रीकरण
- Cognitive Search वापरून दस्तऐवज शोध क्षमता
- विद्यमान ग्राहक डेटाबेससह एकत्रीकरण
- बहुभाषिक समर्थन

**गैर-कार्यात्मक आवश्यकता:**
- 1000 एकत्रित वापरकर्त्यांना हाताळा
- 99.9% अपटाइम SLA
- SOC 2 अनुपालन
- $500/महिना अंतर्गत खर्च
- अनेक वातावरणांमध्ये (विकास, स्टेजिंग, उत्पादन) डिप्लॉय करा

### अंमलबजावणी चरण

1. **आर्किटेक्चर डिझाइन करा**
2. **AZD टेम्पलेट तयार करा**
3. **सुरक्षा उपाय लागू करा**
4. **मॉनिटरिंग आणि अलर्टिंग सेट करा**
5. **डिप्लॉयमेंट पाइपलाइन्स तयार करा**
6. **समाधानाचे दस्तऐवजीकरण करा**

### मूल्यांकन निकष

- ✅ **कार्यशीलता:** सर्व आवश्यकता पूर्ण करतो का?
- ✅ **सुरक्षा:** सर्वोत्तम पद्धती लागू केल्या आहेत का?
- ✅ **स्केलेबिलिटी:** लोड हाताळू शकतो का?
- ✅ **देखभाल
अभिनंदन! तुम्ही AI कार्यशाळा लॅब पूर्ण केली आहे. आता तुम्हाला खालील गोष्टी करता येतील:

- ✅ विद्यमान AI अनुप्रयोग AZD टेम्पलेट्समध्ये रूपांतरित करा
- ✅ उत्पादनासाठी तयार AI अनुप्रयोग तैनात करा
- ✅ AI वर्कलोडसाठी सुरक्षा सर्वोत्तम पद्धती अंमलात आणा
- ✅ AI अनुप्रयोगाची कार्यक्षमता निरीक्षण करा आणि अनुकूलित करा
- ✅ सामान्य तैनाती समस्यांचे निराकरण करा

### पुढील पावले
1. या पद्धती तुमच्या स्वतःच्या AI प्रकल्पांवर लागू करा
2. टेम्पलेट्स समुदायामध्ये परत योगदान द्या
3. सतत समर्थनासाठी Azure AI Foundry Discord मध्ये सामील व्हा
4. मल्टी-रीजन तैनातीसारख्या प्रगत विषयांचा अभ्यास करा

---

**कार्यशाळेचा अभिप्राय**: या कार्यशाळेला सुधारण्यासाठी तुमचा अनुभव [Azure AI Foundry Discord #Azure channel](https://discord.gg/microsoft-azure) मध्ये शेअर करा.

---

**अध्याय नेव्हिगेशन:**
- **📚 कोर्स होम**: [AZD For Beginners](../../README.md)
- **📖 चालू अध्याय**: अध्याय 2 - AI-प्रथम विकास
- **⬅️ मागील**: [AI मॉडेल तैनाती](ai-model-deployment.md)
- **➡️ पुढील**: [उत्पादन AI सर्वोत्तम पद्धती](production-ai-practices.md)
- **🚀 पुढील अध्याय**: [अध्याय 3: कॉन्फिगरेशन](../getting-started/configuration.md)

**मदतीची गरज आहे?** AZD आणि AI तैनातींविषयी समर्थन आणि चर्चेसाठी आमच्या समुदायामध्ये सामील व्हा.

---

