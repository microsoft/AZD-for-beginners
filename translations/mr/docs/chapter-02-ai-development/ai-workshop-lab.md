# AI कार्यशाळा लॅब: आपल्या AI सोल्यूशन्सना AZD द्वारे तैनात करण्यायोग्य बनवणे

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 2 - AI-प्रथम विकास
- **⬅️ Previous**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Next**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 Next Chapter**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

## कार्यशाळा आढावा

हे हाताळण्यायोग्य लॅब विकसकांना एक विद्यमान AI टेम्पलेट घेऊन Azure Developer CLI (AZD) वापरून ते तैनात करण्याच्या प्रक्रियेत मार्गदर्शन करते. आपण Microsoft Foundry सेवांचा वापर करून प्रॉडक्शन AI तैनातींसाठी आवश्यक नमुने शिकाल.

**कालावधी:** 2-3 तास  
**पातळी:** मध्यम  
**पूर्वअट:** Azure ची मूलभूत माहिती, AI/ML संकल्पनांची ओळख

## 🎓 शिकण्याचे उद्दिष्टे

या कार्यशाळेच्या शेवटी आपण सक्षम असाल:
- ✅ विद्यमान AI अनुप्रयोग AZD टेम्पलेट्सचा वापर करण्यासाठी रूपांतरित करणे
- ✅ AZD सह Microsoft Foundry सेवा कॉन्फिगर करणे
- ✅ AI सेवांसाठी सुरक्षित प्रमाणपत्र व्यवस्थापन अमलात आणणे
- ✅ मॉनिटरिंगसह प्रॉडक्शन-तयार AI अनुप्रयोग तैनात करणे
- ✅ सामान्य AI तैनाती समस्यांचे समस्यामोचन करणे

## पूर्वअट

### आवश्यक साधने
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) स्थापित
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) स्थापित
- [Git](https://git-scm.com/) स्थापित
- कोड संपादक (VS Code शिफारस केलेले)

### Azure संसाधने
- कॉन्ट्रिब्युटर प्रवेशासह Azure सदस्यत्व
- Azure OpenAI सेवांमध्ये प्रवेश (किंवा प्रवेशाची विनंती करण्याची क्षमता)
- Resource group निर्माण करण्याच्या परवानग्या

### ज्ञानपूर्वआवश्यकता
- Azure सेवांविषयी मूलभूत समज
- कमांड-लाइन इंटरफेसची ओळख
- AI/ML मूलभूत संकल्पना (APIs, मॉडेल्स, प्रॉम्प्ट्स)

## लॅब सेटअप

### पाऊल 1: पर्यावरण तयारी

1. **साधनांची स्थापना तपासा:**
```bash
# AZD स्थापना तपासा
azd version

# Azure CLI तपासा
az --version

# Azure मध्ये लॉगिन करा
az login
azd auth login
```

2. **वर्कशॉप रिपॉझिटरी क्लोन करा:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## मॉड्यूल 1: AI अनुप्रयोगांसाठी AZD संरचना समजून घेणे

### AI AZD टेम्पलेटची रचना

AI-रेडी AZD टेम्पलेटमधील प्रमुख फाइल्स तपासा:

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

### **प्रयोगशाळा व्यायाम 1.1: कॉन्फिगरेशन तपासा**

1. **azure.yaml फाइल तपासा:**
```bash
cat azure.yaml
```

**कशाकडे लक्ष द्यायचे:**
- AI घटकांसाठी सेवा व्याख्या
- पर्यावरण चल नकाशे
- होस्ट कॉन्फिगरेशन

2. **main.bicep इन्फ्रास्ट्रक्चर पुनरावलोकन करा:**
```bash
cat infra/main.bicep
```

**ओळखण्यासाठी मुख्य AI नमुने:**
- Azure OpenAI सेवा प्रदान करणे
- Cognitive Search एकत्रीकरण
- सुरक्षित की व्यवस्थापन
- नेटवर्क सुरक्षा कॉन्फिगरेशन

### **चर्चेचा बिंदू:** AI साठी हे नमुने का महत्त्वाचे आहेत

- **सेवा अवलंबित्व**: AI अॅप्सना अनेक समन्वित सेवांची आवश्यकता असते
- **सुरक्षा**: API की आणि एंडपॉइंट्सची सुरक्षित व्यवस्थापन आवश्यक आहे
- **स्केलेबिलिटी**: AI वर्कलोडसाठी अनन्य स्केलिंग आवश्यकता असतात
- **खर्च व्यवस्थापन**: AI सेवा योग्यरित्या कॉन्फिगर केल्या नाहीत तर महाग पडू शकतात

## मॉड्यूल 2: आपले पहिले AI अनुप्रयोग तैनात करा

### पाऊल 2.1: पर्यावरण प्रारंभ करा

1. **नवीन AZD पर्यावरण तयार करा:**
```bash
azd env new myai-workshop
```

2. **आवश्यक पॅरामीटर्स सेट करा:**
```bash
# आपला प्राधान्याचा Azure प्रदेश सेट करा
azd env set AZURE_LOCATION eastus

# ऐच्छिक: विशिष्ट OpenAI मॉडेल सेट करा
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### पाऊल 2.2: इन्फ्रास्ट्रक्चर आणि अनुप्रयोग तैनात करा

1. **AZD सह तैनात करा:**
```bash
azd up
```

**`azd up` दरम्यान काय होते:**
- ✅ Azure OpenAI सेवा प्रदान केली जाते
- ✅ Cognitive Search सेवा तयार केली जाते
- ✅ वेब अनुप्रयोगासाठी App Service सेट अप केला जातो
- ✅ नेटवर्किंग आणि सुरक्षा कॉन्फिगर केली जाते
- ✅ अनुप्रयोग कोड तैनात केला जातो
- ✅ मॉनिटरिंग आणि लॉगिंग सेट अप केले जाते

2. **तैनाती प्रगतीचे निरीक्षण करा** आणि तयार होणाऱ्या संसाधनांची नोंद ठेवा.

### पाऊल 2.3: आपली तैनाती सत्यापित करा

1. **तैनात केलेले संसाधने तपासा:**
```bash
azd show
```

2. **तैनात केलेला अनुप्रयोग उघडा:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **AI कार्यक्षमता तपासा:**
   - वेब अनुप्रयोगावर जा
   - नमुना क्वेरीज प्रयत्न करा
   - AI प्रतिसाद कार्यरत आहेत का ते तपासा

### **प्रयोगशाळा व्यायाम 2.1: समस्या निवारण सराव**

**परिस्थिती**: आपली तैनाती यशस्वी झाली परंतु AI प्रतिसाद देत नाही.

**सामान्य समस्या तपासण्याचे:**
1. **OpenAI API keys**: त्या योग्यरित्या सेट केल्या आहेत की नाही ते सत्यापित करा
2. **मॉडेल उपलब्धता**: आपला प्रदेश मॉडेलला समर्थन देतो का ते तपासा
3. **नेटवर्क कनेक्टिव्हिटी**: सेवांमध्ये संवाद सुनिश्चित करा
4. **RBAC परवानग्या**: अॅपला OpenAI प्रवेश आहे का ते सत्यापित करा

**डिबगिंग आदेश:**
```bash
# पर्यावरण चल तपासा
azd env get-values

# डिप्लॉयमेंट लॉग पहा
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# OpenAI च्या डिप्लॉयमेंटची स्थिती तपासा
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## मॉड्यूल 3: आपल्या गरजांसाठी AI अनुप्रयोग सानुकूलित करणे

### पाऊल 3.1: AI कॉन्फिगरेशन बदला

1. **OpenAI मॉडेल अद्यतनित करा:**
```bash
# भिन्न मॉडेलवर बदला (जर ते तुमच्या प्रदेशात उपलब्ध असेल तर)
azd env set AZURE_OPENAI_MODEL gpt-4

# नवीन कॉन्फिगरेशनसह पुन्हा तैनात करा
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

### पाऊल 3.2: पर्यावरण-विशिष्ट कॉन्फिगरेशन

**सर्वोत्तम पद्धत**: विकास व उत्पादनासाठी वेगळ्या कॉन्फिगरेशन वापरा.

1. **उत्पादन पर्यावरण तयार करा:**
```bash
azd env new myai-production
```

2. **उत्पादन-विशिष्ट पॅरामीटर्स सेट करा:**
```bash
# उत्पादन सामान्यतः उच्च-स्तरीय SKUs वापरते
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# अतिरिक्त सुरक्षा वैशिष्ट्ये सक्षम करा
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **प्रयोगशाळा व्यायाम 3.1: खर्च ऑप्टिमायझेशन**

**आव्हान**: खर्च-प्रभावी विकासासाठी टेम्पलेट कॉन्फिगर करा.

**कार्ये:**
1. कोणते SKUs फ्री/बेसिक टियरवर सेट करता येतील ते ओळखा
2. किमान खर्चासाठी पर्यावरण चल कॉन्फिगर करा
3. तैनात करा आणि उत्पादन कॉन्फिगरेशनशी खर्चाची तुलना करा

**सोल्यूशन संकेत:**
- शक्य असल्यास Cognitive Services साठी F0 (फ्री) टियर वापरा
- विकासात Search Service साठी Basic टियर वापरा
- Functions साठी Consumption plan वापरण्याचा विचार करा

## मॉड्यूल 4: सुरक्षा आणि उत्पादनातील सर्वोत्तम पद्धती

### पाऊल 4.1: क्रेडेन्शियलचे सुरक्षित व्यवस्थापन

**सध्याचे आव्हान**: अनेक AI अॅप्स API की हार्डकोड करतात किंवा असुरक्षित स्टोरेज वापरतात.

**AZD समाधान**: Managed Identity + Key Vault एकत्रीकरण.

1. **आपल्या टेम्पलेटमधील सुरक्षा कॉन्फिगरेशन पुनरावलोकन करा:**
```bash
# Key Vault आणि Managed Identity कॉन्फिगरेशन शोधा
grep -r "keyVault\|managedIdentity" infra/
```

2. **Managed Identity कार्यरत आहे का ते सत्यापित करा:**
```bash
# वेब अॅपमध्ये योग्य ओळख कॉन्फिगरेशन आहे का ते तपासा
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### पाऊल 4.2: नेटवर्क सुरक्षा

1. **खाजगी एंडपॉइंट सक्षम करा** (जर आधीपासून कॉन्फिगर केले नसेल तर):

आपल्या bicep टेम्पलेटमध्ये जोडा:
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

### पाऊल 4.3: मॉनिटरिंग आणि ऑब्झर्वेबिलिटी

1. **Application Insights कॉन्फिगर करा:**
```bash
# Application Insights आपोआप कॉन्फिगर केले पाहिजे
# कॉन्फिगरेशन तपासा:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **AI-विशिष्ट मॉनिटरिंग सेट अप करा:**

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

### **प्रयोगशाळा व्यायाम 4.1: सुरक्षा ऑडिट**

**कार्य**: आपल्या तैनातीचे सुरक्षा सर्वोत्तम पद्धतींसाठी पुनरावलोकन करा.

**चेकलिस्ट:**
- [ ] कोड किंवा कॉन्फिगरेशनमध्ये कोणतेही हार्डकोडेड रहस्ये नसावीत
- [ ] सर्विस-टू-सर्विस प्रमाणीकरणासाठी Managed Identity वापरली गेली आहे
- [ ] Key Vault संवेदनशील कॉन्फिगरेशन साठवते
- [ ] नेटवर्क प्रवेश योग्यरित्या प्रतिबंधित आहे
- [ ] मॉनिटरिंग आणि लॉगिंग सक्षम केले आहे

## मॉड्यूल 5: आपले स्वतःचे AI अनुप्रयोग रूपांतरित करणे

### पाऊल 5.1: मूल्यांकन कार्यपत्र

**आपले अ‍ॅप रूपांतरित करण्यापूर्वी**, खालील प्रश्नांची उत्तरे द्या:

1. **अॅप्लिकेशन आर्किटेक्चर:**
   - आपले अॅप कोणत्या AI सेवांचा वापर करते?
   - याला कोणत्या कॉम्प्युट संसाधनांची आवश्यकता आहे?
   - याला डेटाबेसची आवश्यकता आहे का?
   - सेवांदरम्यान अवलंब्यता काय आहे?

2. **सुरक्षा आवश्यकता:**
   - आपले अॅप कोणते संवेदनशील डेटा हाताळते?
   - आपल्याकडे कोणत्या अनुपालन आवश्यकता आहेत?
   - आपल्याला खाजगी नेटवर्किंगची गरज आहे का?

3. **स्केलिंग आवश्यकता:**
   - आपला अपेक्षित लोड काय आहे?
   - आपल्याला ऑटो-स्केलिंगची आवश्यकता आहे का?
   - प्रदेशीय आवश्यकता आहेत का?

### पाऊल 5.2: आपले AZD टेम्पलेट तयार करा

**आपले अॅप रूपांतरित करण्यासाठी हा पॅटर्न अनुसरा:**

1. **मूळ रचना तयार करा:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# AZD टेम्पलेट प्रारंभ करा
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

3. **इन्फ्रास्ट्रक्चर टेम्पलेट तयार करा:**

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

### **प्रयोगशाळा व्यायाम 5.1: टेम्पलेट तयार करण्याचे आव्हान**

**आव्हान**: दस्तऐवज प्रक्रिया करणाऱ्या AI अॅपसाठी AZD टेम्पलेट तयार करा.

**आवश्यकता:**
- कंटेंट विश्लेषणासाठी Azure OpenAI
- OCR साठी Document Intelligence
- दस्तऐवज अपलोडसाठी Storage Account
- प्रक्रिया लॉजिकसाठी Function App
- वापरकर्ता इंटरफेससाठी वेब अॅप

**बोनस पॉईंट्स:**
- योग्य त्रुटी हाताळणी जोडा
- खर्चाचे अनुमान समाविष्ट करा
- मॉनिटरिंग डॅशबोर्ड सेट करा

## मॉड्यूल 6: सामान्य समस्या निवारण

### सामान्य तैनाती समस्या

#### समस्या 1: OpenAI सेवा कोटा ओलांडला
**लक्षणे:** तैनाती कोटा त्रुटीसह अयशस्वी होते
**उपाय:**
```bash
# सध्याचे कोटे तपासा
az cognitiveservices usage list --location eastus

# कोटा वाढविण्याची विनंती करा किंवा वेगळ्या प्रदेशात प्रयत्न करा
azd env set AZURE_LOCATION westus2
azd up
```

#### समस्या 2: मॉडेल प्रदेशात उपलब्ध नाही
**लक्षणे:** AI प्रतिसाद अयशस्वी किंवा मॉडेल तैनाती त्रुटी
**उपाय:**
```bash
# क्षेत्रानुसार मॉडेलची उपलब्धता तपासा
az cognitiveservices model list --location eastus

# उपलब्ध मॉडेलवर अद्यतन करा
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### समस्या 3: परवानगी समस्या
**लक्षणे:** AI सेवांना कॉल करताना 403 Forbidden त्रुटी
**उपाय:**
```bash
# भूमिका वाटप तपासा
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# हरवलेल्या भूमिका जोडा
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### कार्यप्रदर्शन समस्या

#### समस्या 4: AI प्रतिसाद मंद
**तपासणी पावले:**
1. Application Insights मध्ये कार्यप्रदर्शन मेट्रिक्स तपासा
2. Azure पोर्टलमधील OpenAI सेवा मेट्रिक्स पुनरावलोकन करा
3. नेटवर्क कनेक्टिव्हिटी आणि लेटन्सी सत्यापित करा

**उपाय:**
- सामान्य क्वेरीजसाठी कॅशिंग अंमलात आणा
- आपल्या वापर केससाठी योग्य OpenAI मॉडेल वापरा
- उच्च-लोड परिस्थितीसाठी रीड रेप्लिकांचा विचार करा

### **प्रयोगशाळा व्यायाम 6.1: डिबगिंग आव्हान**

**परिस्थिती**: आपली तैनाती यशस्वी झाली, परंतु अनुप्रयोग 500 त्रुटी परत देते.

**डिबगिंग कार्ये:**
1. अनुप्रयोग लॉग तपासा
2. सेवा कनेक्टिव्हिटी सत्यापित करा
3. प्रमाणीकरण तपासा
4. कॉन्फिगरेशन पुनरावलोकन करा

**वापरण्याचे टूल्स:**
- `azd show` for deployment overview
- Azure पोर्टल for detailed service logs
- Application Insights for application telemetry

## मॉड्यूल 7: मॉनिटरिंग आणि ऑप्टिमायझेशन

### पाऊल 7.1: व्यापक मॉनिटरिंग सेट अप करा

1. **कस्टम डॅशबोर्ड तयार करा:**

Azure पोर्टलवर जा आणि पुढील गोष्टींसह डॅशबोर्ड तयार करा:
- OpenAI विनंती संख्या आणि विलंब
- अनुप्रयोग त्रुटी दर
- संसाधन वापर
- खर्च ट्रॅकिंग

2. **अलर्ट सेट अप करा:**
```bash
# उच्च त्रुटी दरासाठी चेतावणी
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### पाऊल 7.2: खर्च ऑप्टिमायझेशन

1. **चालू खर्च विश्लेषण करा:**
```bash
# खर्च डेटा मिळवण्यासाठी Azure CLI वापरा
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **खर्च नियंत्रण अंमलात आणा:**
- बजेट अलर्ट सेट करा
- ऑटोस्केलिंग धोरणे वापरा
- विनंती कॅशिंग अंमलात आणा
- OpenAI साठी टोकन वापर ट्रॅक करा

### **प्रयोगशाळा व्यायाम 7.1: कार्यप्रदर्शन ऑप्टिमायझेशन**

**कार्य**: कार्यप्रदर्शन आणि खर्च दोन्हीसाठी आपल्या AI अनुप्रयोगाचे ऑप्टिमायझेशन करा.

**सुधारण्यासाठी मेट्रिक्स:**
- सरासरी प्रतिसाद वेळ 20% ने कमी करा
- मासिक खर्च 15% ने कमी करा
- 99.9% अपटाइम राखा

**प्रयत्न करण्याच्या धोरणे:**
- प्रतिसाद कॅशिंग अंमलात आणा
- टोकन कार्यक्षमतेसाठी प्रॉम्प्ट ऑप्टिमाइझ करा
- योग्य कॉम्प्यूट SKUs वापरा
- योग्य ऑटोस्केलिंग सेट अप करा

## अंतिम आव्हान: एंड-टू-एंड अंमलबजावणी

### आव्हान परिस्थिती

आपल्याला या आवश्यकतांसह उत्पादन-तयार AI-समर्थित ग्राहक सेवा चॅटबॉट तयार करण्याची जबाबदारी दिली आहे:

**कार्यात्मक आवश्यकता:**
- ग्राहक संवादासाठी वेब इंटरफेस
- प्रतिक्रियांसाठी Azure OpenAI सह एकत्रीकरण
- Cognitive Search वापरून दस्तऐवज शोध क्षमता
- विद्यमान ग्राहक डेटाबेससह एकत्रीकरण
- बहुभाषिक समर्थन

**गैर-कार्यात्मक आवश्यकता:**
- 1000 समकालिक वापरकर्त्यांना हाताळणे
- 99.9% अपटाइम SLA
- SOC 2 अनुपालन
- महिन्याला $500 पेक्षा कमी खर्च
- एकाहून जास्त वातावरणात तैनात करा (dev, staging, prod)

### अंमलबजावणी पावले

1. आर्किटेक्चर डिझाइन करा
2. AZD टेम्पलेट तयार करा
3. सुरक्षा उपाय अंमलात आणा
4. मॉनिटरिंग आणि अलर्ट सेट करा
5. तैनाती पाइपलाईन्स तयार करा
6. सोल्यूशनचे दस्तऐवजीकरण करा

### मूल्यमापन निकष

- ✅ **कार्यप्रदर्शन**: सर्व आवश्यकता पूर्ण आहेत का?
- ✅ **सुरक्षा**: सर्वोत्तम पद्धती लागू केल्या आहेत का?
- ✅ **स्केलेबिलिटी**: लोड हाताळू शकते का?
- ✅ **देखभालयोग्यता**: कोड आणि इन्फ्रास्ट्रक्चर नीट संघटित आहे का?
- ✅ **खर्च**: बजेटमध्ये आहे का?

## अतिरिक्त संसाधने

### Microsoft दस्तऐवजीकरण
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Azure OpenAI Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### Sample Templates
- [Azure OpenAI Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Community Resources
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 संपन्नता प्रमाणपत्र
अभिनंदन! आपण AI वर्कशॉप लॅब पूर्ण केले आहे. आता आपण खालील गोष्टी करू शकता:

- ✅ विद्यमान AI अनुप्रयोगांना AZD टेम्पलेट्समध्ये रूपांतरित करा
- ✅ उत्पादन-तयार AI अनुप्रयोग तैनात करा
- ✅ AI वर्कलोडसाठी सुरक्षा सर्वोत्तम पद्धती लागू करा
- ✅ AI अनुप्रयोगांची कार्यक्षमता निरीक्षण करा आणि ऑप्टिमाइझ करा
- ✅ सामान्य तैनाती समस्या निवारण करा

### पुढील पावले
1. ही पद्धती आपल्या स्वतःच्या AI प्रकल्पांवर लागू करा
2. टेम्पलेट्स समुदायात परत योगदान द्या
3. सततच्या समर्थनासाठी Microsoft Foundry Discord मध्ये सामील व्हा
4. मल्टी-रीजन तैनातीसारख्या प्रगत विषयांचा अभ्यास करा

---

**वर्कशॉप अभिप्राय**: कृपया आपल्या अनुभव शेअर करून या वर्कशॉपमध्ये सुधारणा करण्यास मदत करा [Microsoft Foundry Discord #Azure channel](https://discord.gg/microsoft-azure).

---

**अध्याय नेव्हिगेशन:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: अध्याय 2 - AI-प्रथम विकास
- **⬅️ Previous**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Next**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 Next Chapter**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

**मदत हवी आहे का?** AZD आणि AI तैनातींबाबत समर्थन व चर्चा साठी आमच्या समुदायात सामील व्हा.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
अस्वीकरण:
हा दस्तऐवज AI अनुवाद सेवा Co‑op Translator (https://github.com/Azure/co-op-translator) वापरून अनुवादित केला आहे. आम्ही अचूकतेसाठी प्रयत्न करत असलो तरी कृपया लक्षात घ्या की स्वयंचलित अनुवादात चुका किंवा अचूकतेची कमतरता असू शकते. मूळ दस्तऐवज त्याच्या मूळ भाषेत अधिकृत स्रोत म्हणून मानला जावा. महत्त्वाच्या माहितीसाठी व्यावसायिक मानवी अनुवाद शिफारस केला जातो. या अनुवादाच्या वापरामुळे उद्भवणाऱ्या कोणत्याही गैरसमजुतींसाठी किंवा चुकीच्या अर्थ लागण्याबद्दल आम्ही जबाबदार नाहीत.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->