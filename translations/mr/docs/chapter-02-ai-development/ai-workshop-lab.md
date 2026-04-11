# AI वर्कशॉप लॅब: आपल्या AI सोल्यूशन्सना AZD-ने डिप्लॉय करण्यायोग्य बनविणे

**प्रकरण नेव्हिगेशन:**
- **📚 कोर्स मुख्यपृष्ठ**: [AZD For Beginners](../../README.md)
- **📖 सध्याचे प्रकरण**: प्रकरण 2 - AI-प्रथम विकास
- **⬅️ मागील**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ पुढे**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 पुढचे प्रकरण**: [प्रकरण 3: कॉन्फिगरेशन](../chapter-03-configuration/configuration.md)

## कार्यशाळा अवलोकन

ही हस्तगत लॅब विकसकांना विद्यमान AI टेम्पलेट घेऊन Azure Developer CLI (AZD) वापरून ते कसे डिप्लॉय करायचे हे मार्गदर्शन करते. आपण Microsoft Foundry सेवांचा वापर करून उत्पादन-स्तरावरील AI डिप्लॉयमेंटसाठी आवश्यक पॅटर्न शिकलात.

> **वैधता नोट (2026-03-25):** या कार्यशाळेचे पुनरावलोकन `azd` `1.23.12` यांच्या विरुद्ध केले गेले आहे. जर तुमची स्थानिक स्थापना जुनी असेल, तर सुरुवात करण्यापूर्वी AZD अद्ययावत करा जेणेकरून प्रमाणीकरण, टेम्पलेट आणि डिप्लॉयमेंट कार्यप्रवाह खालील पायर्‍यांसह जुळतील.

**कालावधी:** 2-3 तास  
**पातळी:** मध्यम  
**पूर्वअट:** Azure ची मूलभूत समज, AI/ML संकल्पनांचे परिचय

## 🎓 शिकण्याची उद्दिष्टे

या कार्यशाळेच्या शेवटी, आपण सक्षम असाल:
- ✅ विद्यमान AI अनुप्रयोग AZD टेम्पलेट्स वापरण्यासाठी रूपांतरित करणे
- ✅ AZD सह Microsoft Foundry सेवांची कॉन्फिगरेशन करणे
- ✅ AI सेवांसाठी सुरक्षित क्रेडेन्शिअल व्यवस्थापन अंमलात आणणे
- ✅ मॉनिटरिंगसह उत्पादन-तयार AI अनुप्रयोग डिप्लॉय करणे
- ✅ सामान्य AI डिप्लॉयमेंट समस्या निवारण करणे

## पूर्वअट

### आवश्यक साधने
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) स्थापित
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) स्थापित
- [Git](https://git-scm.com/) स्थापित
- कोड एडिटर (VS Code शिफारस)

### Azure संसाधने
- Contributor प्रवेश असलेली Azure सबस्क्रिप्शन
- Microsoft Foundry Models सेवांमध्ये प्रवेश (किंवा प्रवेशाची विनंती करण्याची क्षमता)
- रिसोर्स ग्रुप तयार करण्याची परवानगी

### ज्ञानपूर्वअट
- Azure सेवांची मूलभूत समज
- कमांड-लाइन इंटरफेसचे परिचय
- AI/ML मूलभूत संकल्पना (API, मॉडेल, प्रॉम्प्ट)

## लॅब सेटअप

### पाऊल 1: पर्यावरण तयारी

1. **साधने स्थापित असल्याची पडताळणी करा:**
```bash
# AZD स्थापना तपासा
azd version

# Azure CLI तपासा
az --version

# AZD वर्कफ्लोजसाठी Azure मध्ये लॉगिन करा
azd auth login

# डायग्नोस्टिक्स दरम्यान az कमांड्स चालवण्याचा विचार असल्यासच Azure CLI मध्ये लॉगिन करा
az login
```

जर तुम्ही अनेक tenants मध्ये काम करत असाल किंवा तुमची subscription आपोआप ओळखली जात नसेल, तर पुन्हा प्रयत्न करा `azd auth login --tenant-id <tenant-id>`.

2. **वर्कशॉप रिपॉझिटरी क्लोन करा:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## मॉड्यूल 1: AI अनुप्रयोगांसाठी AZD संरचना समजून घेणे

### AI AZD टेम्पलेटचे रचना

AI-तयार AZD टेम्पलेटमधील मुख्य फायली एक्सप्लोर करा:

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

### **लॅब व्यायाम 1.1: कॉन्फिगरेशनचा शोध**

1. **azure.yaml फाइल तपासा:**
```bash
cat azure.yaml
```

**काय पहायचे:**
- AI घटकांसाठी सेवा परिभाषा
- पर्यावरण चलांचे (environment variables) मॅपिंग
- होस्ट कॉन्फिगरेशन

2. **main.bicep इन्फ्रास्ट्रक्चर पुनरावलोकन करा:**
```bash
cat infra/main.bicep
```

**ओळखण्यासारख्या प्रमुख AI पॅटर्न्स:**
- Microsoft Foundry Models सेवा प्रोव्हिजनिंग
- Cognitive Search एकत्रीकरण
- सुरक्षित की व्यवस्थापन
- नेटवर्क सुरक्षा कॉन्फिगरेशन

### **चर्चा बिंदू:** AI साठी हे पॅटर्न का महत्वाचे आहेत

- **सेवा अवलंबित्व**: AI अॅप्सना बहुतेक वेळा अनेक समन्वित सेवांची आवश्यकता असते
- **सुरक्षा**: API की आणि एंडपॉइंट्सचे सुरक्षित व्यवस्थापन आवश्यक आहे
- **स्केलेबिलिटी**: AI वर्कलोडसाठी वेगळ्या प्रकारचे स्केलिंग आवश्यकता असते
- **खर्च व्यवस्थापन**: AI सेवा योग्यरित्या कॉन्फिगर न केल्या तर महाग पडू शकतात

## मॉड्यूल 2: आपला पहिला AI अनुप्रयोग डिप्लॉय करा

### पाऊल 2.1: पर्यावरण प्रारंभ करा

1. **नवीन AZD वातावरण तयार करा:**
```bash
azd env new myai-workshop
```

2. **आवश्यक पॅरामीटर्स सेट करा:**
```bash
# आपला प्राधान्यकृत Azure प्रदेश सेट करा
azd env set AZURE_LOCATION eastus

# ऐच्छिक: विशिष्ट OpenAI मॉडेल सेट करा
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### पाऊल 2.2: इन्फ्रास्ट्रक्चर आणि अनुप्रयोग डिप्लॉय करा

1. **AZD सह डिप्लॉय करा:**
```bash
azd up
```

**`azd up` दरम्यान काय होते:**
- ✅ Microsoft Foundry Models सेवा प्रोव्हिजन केली जाते
- ✅ Cognitive Search सेवा तयार होते
- ✅ वेब अनुप्रयोगासाठी App Service सेटअप केले जाते
- ✅ नेटवर्किंग आणि सुरक्षा कॉन्फिगर केले जाते
- ✅ अनुप्रयोग कोड डिप्लॉय केला जातो
- ✅ मॉनिटरिंग आणि लॉगिंग सेटअप केले जाते

2. **डिप्लॉयमेंट प्रगतीचे निरीक्षण करा** आणि निर्माण होत असलेल्या संसाधनांची नोंद ठेवा.

### पाऊल 2.3: आपले डिप्लॉयमेंट सत्यापित करा

1. **डिप्लॉय केलेले संसाधने तपासा:**
```bash
azd show
```

2. **डिप्लॉय केलेला अनुप्रयोग उघडा:**
```bash
azd show
```

`azd show` आउटपुटमध्ये दाखवलेला वेब एंडपॉइंट उघडा.

3. **AI कार्यक्षमता तपासा:**
   - वेब अनुप्रयोगावर जा
   - नमुना क्वेरीजची चाचणी करा
   - AI प्रतिसाद योग्यरित्या काम करत आहेत का तपासा

### **लॅब व्यायाम 2.1: समस्यासोधन सराव**

**परिस्थिती**: तुमचे डिप्लॉयमेंट यशस्वी झाले परंतु AI प्रतिसाद देत नाही.

**तपासण्यासाठी सामान्य समस्या:**
1. **OpenAI API keys**: तपासा की त्या योग्यरित्या सेट केल्या आहेत
2. **मॉडेल उपलब्धता**: तुमच्या प्रदेशात मॉडेल समर्थन आहे का तपासा
3. **नेटवर्क कनेक्टिव्हिटी**: सेवांमधील संवाद सुनिश्चित करा
4. **RBAC परवानग्या**: अॅपला OpenAI ऍक्सेस आहे का ते तपासा

**डीबगिंग कमांड्स:**
```bash
# पर्यावरण चल तपासा
azd env get-values

# तैनाती नोंदी पहा
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# OpenAI तैनातीची स्थिती तपासा
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## मॉड्यूल 3: तुमच्या गरजांसाठी AI अनुप्रयोग सानुकूल करा

### पाऊल 3.1: AI कॉन्फिगरेशन बदला

1. **OpenAI मॉडेल अद्ययावत करा:**
```bash
# वेगळ्या मॉडेलवर बदला (जर आपल्या प्रदेशात उपलब्ध असेल तर)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# नवीन संरचनेसह पुन्हा तैनात करा
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

### पाऊल 3.2: वातावरण-विशिष्ट कॉन्फिगरेशन

**सर्वोत्तम पद्धत:** विकास आणि उत्पादनासाठी वेगवेगळ्या कॉन्फिगरेशन असाव्यात.

1. **उत्पादन वातावरण तयार करा:**
```bash
azd env new myai-production
```

2. **उत्पादन-विशिष्ट पॅरामीटर्स सेट करा:**
```bash
# उत्पादनामध्ये सामान्यतः उच्च SKUs वापरल्या जातात
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# अतिरिक्त सुरक्षा वैशिष्ट्ये सक्षम करा
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **लॅब व्यायाम 3.1: खर्च ऑप्टिमायझेशन**

**आव्हान:** विकासासाठी खर्च-प्रभावीपणे टेम्पलेट कॉन्फिगर करा.

**कार्यक्षेत्रे:**
1. कुठले SKU फ्री/बेसिक टियरवर सेट होऊ शकतात ते ओळखा
2. किमान खर्चासाठी पर्यावरण चल सेट करा
3. डिप्लॉय करा आणि उत्पादन कॉन्फिगरेशनसह खर्चांची तुलना करा

**उपायसूचना:**
- शक्य असल्यास Cognitive Services साठी F0 (फ्री) टियर वापरा
- विकासासाठी Search Service साठी Basic टियर वापरा
- Functions साठी Consumption प्लॅन विचारात घ्या

## मॉड्यूल 4: सुरक्षा आणि उत्पादन सर्वोत्तम पद्धती

### पाऊल 4.1: सुरक्षित क्रेडेन्शिअल व्यवस्थापन

**सध्याची आव्हाने:** बर्‍याच AI अॅप्समध्ये API की हार्डकोड केल्या जातात किंवा असुरक्षित स्टोरेज वापरला जातो.

**AZD उपाय:** Managed Identity + Key Vault एकत्रीकरण.

1. **तुमच्या टेम्पलेटमधील सुरक्षा कॉन्फिगरेशन पुनरावलोकन करा:**
```bash
# Key Vault आणि Managed Identity कॉन्फिगरेशन शोधा
grep -r "keyVault\|managedIdentity" infra/
```

2. **Managed Identity कार्यरत आहे याची पडताळणी करा:**
```bash
# वेब अ‍ॅपची ओळख कॉन्फिगरेशन योग्य आहे का ते तपासा
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### पाऊल 4.2: नेटवर्क सुरक्षा

1. **प्रायव्हेट एंडपॉइंट सक्षम करा** (जर आधीच कॉन्फिगर केले नसेल तर):

तुमच्या bicep टेम्पलेटमध्ये जोडा:
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
# Application Insights स्वयंचलितपणे कॉन्फिगर केलेले असावे
# कॉन्फिगरेशन तपासा:
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

**कार्य:** तुमच्या डिप्लॉयमेंटची सुरक्षा सर्वोत्तम पद्धतींसाठी पुनरावलोकन करा.

**चेकलिस्ट:**
- [ ] कोड किंवा कॉन्फिगरेशनमध्ये हार्डकोड केलेले सिक्रेट नाहीत
- [ ] सेवा-ते-सेवा प्रमाणीकरणासाठी Managed Identity वापरले गेले आहे
- [ ] संवेदनशील कॉन्फिगरेशन Key Vault मध्ये संग्रहित आहे
- [ ] नेटवर्क प्रवेश योग्यरित्या मर्यादित आहे
- [ ] मॉनिटरिंग आणि लॉगिंग सक्षम केले गेले आहे

## मॉड्यूल 5: तुमचा स्वतःचा AI अनुप्रयोग रूपांतरित करणे

### पाऊल 5.1: मूल्यांकन वर्कशीट

**तुमचा अॅप रूपांतरित करण्यापूर्वी**, या प्रश्नांची उत्तरे द्या:

1. **अनुप्रयोग आर्किटेक्चर:**
   - तुमचा अॅप कोणत्या AI सेवांचा वापर करतो?
   - त्याला कोणत्या कंप्यूट संसाधनांची आवश्यकता आहे?
   - त्याला डेटाबेसची गरज आहे का?
   - सेवांमधील अवलंबित्व काय आहेत?

2. **सुरक्षा आवश्यकताः**
   - तुमचा अॅप कोणती संवेदनशील माहिती हाताळतो?
   - कोणती अनुपालन आवश्यकता आहेत?
   - तुम्हाला प्रायव्हेट नेटवर्किंगची गरज आहे का?

3. **स्केलिंग आवश्यकता:**
   - तुमचा अपेक्षित लोड किती आहे?
   - तुम्हाला ऑटो-स्केलिंगची गरज आहे का?
   - क्षेत्रीय (regional) आवश्यकता आहेत का?

### पाऊल 5.2: तुमचे AZD टेम्पलेट तयार करा

**तुमचा अॅप रूपांतरित करण्यासाठी या पॅटर्नचे अनुसरण करा:**

1. **मुळ रचना तयार करा:**
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

### **लॅब व्यायाम 5.1: टेम्पलेट तयार करण्याची आव्हान**

**आव्हान:** दस्तऐवज प्रक्रिया करणाऱ्या AI अॅपसाठी AZD टेम्पलेट तयार करा.

**अट:**
- Microsoft Foundry Models सामग्री विश्लेषणासाठी
- OCR साठी Document Intelligence
- दस्तऐवज अपलोडसाठी Storage Account
- प्रोसेसिंग लॉजिकसाठी Function App
- यूजर इंटरफेससाठी Web app

**बोनस गुण:**
- योग्य त्रुटी हाताळणी जोडा
- खर्च अंदाज समाविष्ट करा
- मॉनिटरिंग डॅशबोर्ड सेटअप करा

## मॉड्यूल 6: सामान्य समस्या निवारण

### सामान्य डिप्लॉयमेंट समस्या

#### समस्या 1: OpenAI सेवा कोटा ओलांडला
**लक्षणे:** डिप्लॉयमेंट कोटा त्रुटीसह अयशस्वी होते
**उपाय:**
```bash
# सध्याचे कोटे तपासा
az cognitiveservices usage list --location eastus

# कोटा वाढविण्याची विनंती करा किंवा वेगळ्या प्रदेशात प्रयत्न करा
azd env set AZURE_LOCATION westus2
azd up
```

#### समस्या 2: मॉडेल प्रदेशात उपलब्ध नाही
**लक्षणे:** AI प्रतिसाद अयशस्वी किंवा मॉडेल डिप्लॉयमेंट त्रुटी
**उपाय:**
```bash
# प्रांतानुसार मॉडेलची उपलब्धता तपासा
az cognitiveservices model list --location eastus

# उपलब्ध मॉडेलवर अद्यतन करा
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### समस्या 3: परवानगी समस्या
**लक्षणे:** AI सेवांना कॉल करताना 403 Forbidden त्रुटी
**उपाय:**
```bash
# भूमिका वाटप तपासा
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# गहाळ भूमिका जोडा
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### कामगिरीच्या (Performance) समस्या

#### समस्या 4: मंद AI प्रतिसाद
**तपासणी पावले:**
1. कार्यक्षमता मेट्रिक्ससाठी Application Insights तपासा
2. Azure पोर्टलमध्ये OpenAI सेवा मेट्रिक्स पुनरावलोकन करा
3. नेटवर्क कनेक्टिव्हिटी आणि लेटन्सी तपासा

**उपाय:**
- सामान्य क्वेरीजसाठी कॅशिंग लागू करा
- तुमच्या वापरासाठी योग्य OpenAI मॉडेल वापरा
- उच्च लोड परिस्थितीसाठी रीड रेप्लिका विचारात घ्या

### **लॅब व्यायाम 6.1: डीबगिंग आव्हान**

**परिस्थिती**: तुमचे डिप्लॉयमेंट यशस्वी झाले, परंतु अनुप्रयोग 500 त्रुटी परत देत आहे.

**डीबगिंग कार्य:**
1. अनुप्रयोग लॉग तपासा
2. सेवा कनेक्टिव्हिटी तपासा
3. प्रमाणीकरणाची चाचणी करा
4. कॉन्फिगरेशन पुनरावलोकन करा

**वापरायची साधने:**
- डिप्लॉयमेंट आराखड्यासाठी `azd show`
- तपशीलवार सेवा लॉगसाठी Azure पोर्टल
- अनुप्रयोग टेलीमेट्रीसाठी Application Insights

## मॉड्यूल 7: मॉनिटरिंग आणि ऑप्टिमायझेशन

### पाऊल 7.1: सर्वसमावेशक मॉनिटरिंग सेट करा

1. **कस्टम डॅशबोर्ड तयार करा:**

Azure पोर्टलमध्ये जा आणि खालीलांसह डॅशबोर्ड तयार करा:
- OpenAI विनंती संख्या आणि लेटन्सी
- अनुप्रयोग त्रुटी दर
- रिसोर्स वापर
- खर्च ट्रॅकिंग

2. **अलर्ट सेट करा:**
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

1. **आत्ताच्या खर्चाचे विश्लेषण करा:**
```bash
# Azure CLI वापरून खर्च डेटा मिळवा
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **खर्च नियंत्रण अंमलात आणा:**
- बजेट अलर्ट सेट करा
- ऑटोस्केलिंग धोरणे वापरा
- विनंत्यांसाठी कॅशिंग लागू करा
- OpenAI साठी टोकन वापराचे निरीक्षण करा

### **लॅब व्यायाम 7.1: कामगिरी ऑप्टिमायझेशन**

**कार्य:** कामगिरी आणि खर्च दोन्ही सुधारण्यासाठी तुमच्या AI अनुप्रयोगाचे ऑप्टिमायझेशन करा.

**सुधारण्यास असलेली मेट्रिक्स:**
- सरासरी प्रतिसाद वेळ 20% कमी करा
- मासिक खर्च 15% कमी करा
- 99.9% अपटाइम राखा

**परीक्षणासाठी धोरणे:**
- प्रतिसाद कॅशिंग अंमलात आणा
- टोकन कार्यक्षमतेसाठी प्रॉम्प्ट ऑप्टिमाइझ करा
- योग्य कंप्यूट SKUs वापरा
- योग्य ऑटोस्केलिंग सेटअप करा

## अंतिम आव्हान: एंड-टू-एंड अंमलबजावणी

### आव्हान परिस्थिती

आपण उत्पादन-तयार AI-चालित कस्टमर सर्व्हिस चॅटबॉट तयार करण्याचे कार्य दिले गेले आहे ज्याच्या आवशकता खालीलप्रमाणे आहेत:

**कार्यात्मक आवश्यकता:**
- ग्राहक संवादासाठी वेब इंटरफेस
- प्रतिसादांसाठी Microsoft Foundry Models सह एकत्रीकरण
- Cognitive Search वापरून दस्तऐवज शोध क्षमता
- विद्यमान ग्राहक डेटाबेससह एकत्रीकरण
- बहुभाषिक समर्थन

**अकार्यात्मक आवश्यकता:**
- 1000 समांतर वापरकर्त्यांना हाताळता येणे
- 99.9% अपटाइम SLA
- SOC 2 अनुपालन
- मासिक खर्च $500 पेक्षा कमी
- अनेक वातावरणांवर डिप्लॉय (dev, staging, prod)

### अंमलबजावणी पायऱ्या

1. आर्किटेक्चर डिझाइन करा
2. AZD टेम्पलेट तयार करा
3. सुरक्षा उपाय अंमलात आणा
4. मॉनिटरिंग आणि अलर्टिंग सेट करा
5. डिप्लॉयमेंट पाइपलाईन्स तयार करा
6. सोल्यूशनचे दस्तऐवजीकरण करा

### मूल्यांकन निकष

- ✅ **कार्यक्षमता**: सर्व आवश्यकता पूर्ण होतात का?
- ✅ **सुरक्षा**: सर्वोत्तम पद्धती लागू केल्या आहेत का?
- ✅ **स्केलेबिलिटी**: लोड हाताळता येतो का?
- ✅ **देखभालयोग्यता**: कोड आणि इन्फ्रास्ट्रक्चर व्यवस्थित आहे का?
- ✅ **खर्च**: बजेटमध्ये राहतो का?

## अतिरिक्त स्रोत

### Microsoft दस्तऐवजीकरण
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### नमुना टेम्पलेट्स
- [Microsoft Foundry Models चॅट अॅप](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI चॅट अॅप क्विकस्टार्ट](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso चॅट](https://github.com/Azure-Samples/contoso-chat)

### समुदाय संसाधने
- [Microsoft Foundry डिस्कॉर्ड](https://discord.gg/microsoft-azure)
- [Azure डेवलपर CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD टेम्पलेट्स](https://azure.github.io/awesome-azd/)

## 🎓 पूर्णता प्रमाणपत्र

अभिनंदन! आपण एआय वर्कशॉप लॅब पूर्ण केले आहे. आता आपण हे करू शकता:

- ✅ अस्तित्वात असलेल्या एआय अनुप्रयोगांना AZD टेम्पलेट्समध्ये रूपांतरित करा
- ✅ उत्पादन-तयार एआय अनुप्रयोग तैनात करा
- ✅ एआय वर्कलोडसाठी सुरक्षा सर्वोत्तम पद्धती लागू करा
- ✅ एआय अनुप्रयोगाचे कार्यप्रदर्शन निरीक्षण व ऑप्टिमाइझ करा
- ✅ सामान्य तैनाती समस्यांचे निवारण करा

### पुढील पावले
1. या पॅटर्नना आपल्या स्वतःच्या एआय प्रकल्पांवर लागू करा
2. टेम्पलेट्स समुदायात परत योगदान द्या
3. सतत समर्थनासाठी Microsoft Foundry डिस्कॉर्डमध्ये सामील व्हा
4. बहु-प्रदेशीय तैनातीसारख्या प्रगत विषयांचा शोध घ्या

---

**वर्कशॉप अभिप्राय**: आपण आपला अनुभव [Microsoft Foundry डिस्कॉर्ड #Azure चॅनेल](https://discord.gg/microsoft-azure) मध्ये शेअर करून या वर्कशॉपला सुधारण्यात मदत करा.

---

**प्रकरण नेव्हिगेशन:**
- **📚 कोर्स होम**: [AZD नवशिक्यांसाठी](../../README.md)
- **📖 चालू प्रकरण**: प्रकरण 2 - एआय-प्रथम विकास
- **⬅️ मागील**: [एआय मॉडेल तैनाती](ai-model-deployment.md)
- **➡️ पुढे**: [उत्पादन एआय सर्वोत्तम पद्धती](production-ai-practices.md)
- **🚀 पुढचे प्रकरण**: [प्रकरण 3: कॉन्फिगरेशन](../chapter-03-configuration/configuration.md)

**मदतीची गरज आहे का?** AZD आणि एआय तैनातींबद्दल समर्थन आणि चर्चेसाठी आमच्या समुदायात सामील व्हा.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
हा दस्तऐवज AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) चा वापर करून अनुवादित केला आहे. जरी आम्ही अचूकतेसाठी प्रयत्न करतो, तरी कृपया लक्षात ठेवा की स्वयंचलित अनुवादांमध्ये चुका किंवा त्रुटी असू शकतात. मूळ दस्तऐवज त्याच्या मूळ भाषेत अधिकृत स्रोत म्हणून मानला जावा. महत्त्वाच्या माहितीच्या बाबतीत व्यावसायिक मानवी अनुवादाची शिफारस केली जाते. या अनुवादाच्या वापरामुळे उद्भवणाऱ्या कोणत्याही गैरसमजांबद्दल किंवा चुकीच्या अर्थनिर्वचनाबद्दल आम्ही जबाबदार नाही.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->