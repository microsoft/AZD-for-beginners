# AI कार्यशाळा लॅब: तुमचे AI सोल्यूशन्स AZD-Deployable बनविणे

**अध्याय नेव्हिगेशन:**
- **📚 कोर्स होम**: [AZD For Beginners](../../README.md)
- **📖 चालू अध्याय**: अध्याय २ - AI-प्रथम विकास
- **⬅️ मागील**: [AI मॉडेल डिप्लॉयमेंट](ai-model-deployment.md)
- **➡️ पुढील**: [प्रॉडक्शन AI सर्वोत्तम पद्धती](production-ai-practices.md)
- **🚀 पुढील अध्याय**: [अध्याय ३: कॉन्फिगरेशन](../chapter-03-configuration/configuration.md)

## कार्यशाळा अवलोकन

ही हस्तचालित लॅब विकसकांना विद्यमान AI टेम्प्लेट घेऊन Azure Developer CLI (AZD) वापरून तैनात करण्याच्या प्रक्रियेत मार्गदर्शन करते. तुम्ही Microsoft Foundry सेवांचा वापर करून प्रॉडक्शन AI तैनातीसाठी आवश्यक नमुने शिकाल.

**कालावधी:** २-३ तास  
**पातळी:** मध्यम  
**पूर्वतयारी:** मूलभूत Azure ज्ञान, AI/ML संकल्पनांची ओळख

## 🎓 शिकण्याचे उद्दिष्टे

ही कार्यशाळा पूर्ण केल्यावर, तुम्ही सक्षम असाल:
- ✅ विद्यमान AI अनुप्रयोग AZD टेम्प्लेट्समध्ये रुपांतरित करणे
- ✅ AZD वापरून Microsoft Foundry सेवांची कॉन्फिगरेशन करणे
- ✅ AI सेवांसाठी सुरक्षित क्रेडेन्शियल व्यवस्थापन अंमलात आणणे
- ✅ मॉनिटरिंगसह प्रॉडक्शन-तयार AI अनुप्रयोग तैनात करणे
- ✅ सामान्य AI तैनात मुद्दे सोडवणे

## पूर्वतयारी

### आवश्यक साधने
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) इंस्टॉल केलेले
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) इंस्टॉल केलेले
- [Git](https://git-scm.com/) इंस्टॉल केलेले
- कोड एडिटर (VS Code शिफारसीय)

### Azure संसाधने
- कंट्रीब्यूटर अॅक्सेससह Azure सदस्यता
- Microsoft Foundry Models सेवांसाठी प्रवेश (किंवा प्रवेशासाठी विनंती करण्याची क्षमता)
- रिसोर्स ग्रुप तयार करण्याची परवानगी

### ज्ञान पूर्वतयारी
- Azure सेवांची मूलभूत समज
- कमांड-लाइन इंटरफेसची ओळख
- मूलभूत AI/ML संकल्पना (API, मॉडेल्स, प्रॉम्प्ट्स)

## लॅब सेटअप

### चरण १: पर्यावरण तयारी

1. **साधनांची इंस्टॉलेशन्स तपासा:**
```bash
# AZD स्थापना तपासा
azd version

# Azure CLI तपासा
az --version

# Azure मध्ये लॉगिन करा
az login
azd auth login
```

2. **कार्यशाळा रेपॉजिटरी क्लोन करा:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## मॉड्यूल १: AI अनुप्रयोगांसाठी AZD संरचनेची समज

### AI AZD टेम्प्लेटचा अवयव

AI-तयार AZD टेम्प्लेटमधील मुख्य फाइल्स शोधा:

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

### **लॅब व्यायाम १.१: कॉन्फिगरेशन एक्सप्लोर करा**

1. **azure.yaml फाइल तपासा:**
```bash
cat azure.yaml
```

**पाहण्यासारख्या गोष्टी:**
- AI घटकांसाठी सेवा व्याख्या
- पर्यावरण चल मॅपिंग्स
- होस्ट कॉन्फिगरेशन्स

2. **main.bicep इन्फ्रास्ट्रक्चर रिव्ह्यू करा:**
```bash
cat infra/main.bicep
```

**ओळखण्यासाठी मुख्य AI नमुने:**
- Microsoft Foundry Models सेवा प्रदान करणे
- Cognitive Search एकत्रीकरण
- सुरक्षित की व्यवस्थापन
- नेटवर्क सुरक्षा कॉन्फिगरेशन्स

### **चर्चा मुद्दा:** AI साठी हे नमुने का महत्त्वाचे आहेत

- **सेवा अवलंबित्वे:** AI अॅप्सना बहुविध समन्वित सेवा आवश्यक असतात
- **सुरक्षा:** API की आणि endpoints साठी सुरक्षित व्यवस्थापन आवश्यक आहे
- **स्केलेबिलिटी:** AI कामकाजासाठी अनन्य स्केलिंग गरजा असतात
- **खर्च व्यवस्थापन:** AI सेवा योग्यरित्या कॉन्फिगर केल्या नसल्यास महाग होऊ शकतात

## मॉड्यूल २: तुमचा पहिला AI अनुप्रयोग तैनात करा

### चरण २.१: पर्यावरण आरंभ करा

1. **नवीन AZD पर्यावरण तयार करा:**
```bash
azd env new myai-workshop
```

2. **आवश्यक पॅरामीटर्स सेट करा:**
```bash
# आपला प्राधान्य केलेला Azure प्रदेश सेट करा
azd env set AZURE_LOCATION eastus

# ऐच्छिक: विशिष्ट OpenAI मॉडेल सेट करा
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### चरण २.२: इन्फ्रास्ट्रक्चर आणि अनुप्रयोग तैनात करा

1. **AZD वापरून तैनाती करा:**
```bash
azd up
```

`azd up` दरम्यान काय होते:
- ✅ Microsoft Foundry Models सेवा प्रदान केली जाते
- ✅ Cognitive Search सेवा तयार केली जाते
- ✅ वेब अनुप्रयोगासाठी App Service सेटअप होतो
- ✅ नेटवर्किंग आणि सुरक्षा कॉन्फिगर केली जाते
- ✅ अनुप्रयोग कोड तैनात केला जातो
- ✅ मॉनिटरिंग आणि लॉगिंग सेटअप केले जाते

2. **तैनात प्रगतीचे मॉनिटरिंग करा** आणि तयार होणाऱ्या संसाधनांची नोंद ठेवा.

### चरण २.३: तुमच्या तैनातीची पडताळणी करा

1. **तैनात संसाधने तपासा:**
```bash
azd show
```

2. **तैनात अनुप्रयोग उघडा:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **AI कार्यक्षमता चाचणी करा:**
   - वेब अनुप्रयोगावर जा
   - नमुना प्रश्नांचा प्रयत्न करा
   - AI प्रतिसाद योग्य आहेत का ते तपासा

### **लॅब व्यायाम २.१: समस्या निवारण सराव**

**परिस्थिती:** तुमची तैनाती यशस्वी झाली परंतु AI प्रतिसाद देत नाही.

**सामान्य तपासण्याचे मुद्दे:**
1. **OpenAI API कीज:** योग्यरित्या सेट आहेत का तपासा
2. **मॉडेल उपलब्धता:** तुमच्या प्रदेशात मॉडेल उपलब्ध आहे का ते तपासा
3. **नेटवर्क कनेक्टिव्हिटी:** सेवा एकमेकांशी बोलू शकतात का याची खात्री करा
4. **RBAC परवानग्या:** अॅपला OpenAI वापरण्याची परवानगी आहे का ते तपासा

**डीबगging कमांड्स:**
```bash
# पर्यावरणचर बदल तपासा
azd env get-values

# तैनात लॉग पहा
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# OpenAI तैनात स्थिती तपासा
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## मॉड्यूल ३: तुमच्या गरजांसाठी AI अनुप्रयोग सानुकूलित करणे

### चरण ३.१: AI कॉन्फिगरेशन सुधारणा करा

1. **OpenAI मॉडेल अपडेट करा:**
```bash
# वेगळ्या मॉडेलवर बदला (जर तुमच्या प्रदेशात उपलब्ध असेल तर)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# नवीन संरचनेसह पुन्हा तैनात करा
azd deploy
```

2. **अतिरिक्त AI सेवा जोडा:**

`infra/main.bicep` संपादित करा आणि Document Intelligence जोडा:

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

### चरण ३.२: पर्यावरण-विशिष्ट कॉन्फिगरेशन्स

**सर्वोत्तम पद्धत:** विकासासाठी आणि प्रॉडक्शनसाठी वेगवेगळ्या कॉन्फिगरेशन्स वापरा.

1. **प्रॉडक्शन पर्यावरण तयार करा:**
```bash
azd env new myai-production
```

2. **प्रॉडक्शनसाठी विशिष्ट पॅरामीटर्स सेट करा:**
```bash
# उत्पादन सामान्यतः उच्चतम संख्यात्मक युनिट्स वापरतो
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# अतिरिक्त सुरक्षा वैशिष्ट्ये सक्रिय करा
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **लॅब व्यायाम ३.१: खर्च ऑप्टिमायझेशन**

**आव्हान:** खर्च-कमी विकासासाठी टेम्प्लेट कॉन्फिगर करा.

**कार्यक्षेत्रे:**
1. कोणत्या SKU ला फ्री/बेसिक टियरवर सेट करू शकता हे ओळखा
2. किमान खर्चासाठी पर्यावरण चल कॉन्फिगर करा
3. प्रॉडक्शन कॉन्फिगरेशनशी खर्च तुलना करा

**उपाय सूचना:**
- शक्य असल्यास Cognitive Services साठी F0 (फ्री) टियर वापरा
- विकासासाठी Search Service साठी Basic टियर वापरा
- Functions साठी Consumption योजना वापरण्याचा विचार करा

## मॉड्यूल ४: सुरक्षा आणि प्रॉडक्शन सर्वोत्तम पद्धती

### चरण ४.१: सुरक्षित क्रेडेन्शियल व्यवस्थापन

**सध्याचे आव्हान:** अनेक AI अॅप्समध्ये API की हार्डकोड केल्या जातात किंवा असुरक्षित स्टोरेज वापरली जाते.

**AZD सोल्यूशन:** Managed Identity + Key Vault एकत्रीकरण.

1. **टेम्प्लेटमधील सुरक्षा कॉन्फिगरेशन तपासा:**
```bash
# की वॉल्ट आणि व्यवस्थापित ओळख संरचनेसाठी शोधा
grep -r "keyVault\|managedIdentity" infra/
```

2. **Managed Identity कार्यरत आहे का ते तपासा:**
```bash
# वेब अ‍ॅपमध्ये योग्य ओळख कॉन्फिगरेशन आहे का ते तपासा
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### चरण ४.२: नेटवर्क सुरक्षा

1. **प्रायव्हेट एन्डपॉइंट्स सक्षम करा** (जर आधी सेट नाहीत तर):

तुमच्या बाइसप टेम्प्लेटमध्ये जोडा:
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

### चरण ४.३: मॉनिटरिंग आणि निरीक्षण

1. **Application Insights कॉन्फिगर करा:**
```bash
# अनुप्रयोग इनसाइट्स आपोआप कॉन्फिगर केले जावे
# कॉन्फिगरेशन तपासा:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **AI-विशेष मॉनिटरिंग सेट करा:**

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

### **लॅब व्यायाम ४.१: सुरक्षा ऑडिट**

**कार्यक्षेत्र:** सुरक्षा सर्वोत्तम पद्धतींसाठी तुझी तैनात पडताळणी करा.

**चेकलिस्ट:**
- [ ] कोड किंवा कॉन्फिगमध्ये कोणतेही हार्डकोड केलेले रहस्य नाही
- [ ] सेवा-सेवा प्रमाणीकरणासाठी Managed Identity वापरली आहे
- [ ] Key Vault संवेदनशील कॉन्फिगरेशन स्टोअर करतो
- [ ] नेटवर्क प्रवेश योग्यरीत्या प्रतिबंधित आहे
- [ ] मॉनिटरिंग आणि लॉगिंग सक्षम आहे

## मॉड्यूल ५: तुमचा स्वतःचा AI अनुप्रयोग रुपांतरित करणे

### चरण ५.१: मूल्यांकन कार्यपत्रक

**तुमचा अॅप रुपांतरित करण्यापूर्वी**, खालील प्रश्नांची उत्तरे द्या:

1. **अ‍ॅप्लिकेशन आर्किटेक्चर:**
   - तुमचा अॅप कोणत्या AI सेवांचा वापर करतो?
   - त्याला कोणत्या संगणकीय साधनांची गरज आहे?
   - त्याला डेटाबेस लागतो का?
   - सेवा यामध्ये कोणत्या अवलंबित्व आहेत?

2. **सुरक्षा आवश्यकता:**
   - तुमचा अॅप कोणती संवेदनशील माहिती हाताळतो?
   - कोणती अनुपालन आवश्यकता आहेत?
   - प्रायव्हेट नेटवर्किंगची गरज आहे का?

3. **स्केलिंग आवश्यकता:**
   - अपेक्षित लोड किती आहे?
   - ऑटो-स्केलिंग आवश्यक आहे का?
   - प्रादेशिक आवशकता आहेत का?

### चरण ५.२: तुमचा AZD टेम्प्लेट तयार करा

**अॅप रुपांतरित करण्यासाठी हा नमुना वापरा:**

1. **मूलभूत संरचना तयार करा:**
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

3. **इन्फ्रास्ट्रक्चर टेम्प्लेट्स तयार करा:**

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

### **लॅब व्यायाम ५.१: टेम्प्लेट तयार करण्याचे आव्हान**

**आव्हान:** दस्तऐवज प्रक्रिया AI अॅपसाठी AZD टेम्प्लेट तयार करा.

**आवश्यकता:**
- सामग्री विश्लेषणासाठी Microsoft Foundry Models
- OCR साठी Document Intelligence
- दस्तऐवज अपलोडसाठी Storage Account
- प्रक्रिया लॉजिकसाठी Function App
- वापरकर्ता इंटरफेससाठी वेब अॅप

**बोनस पॉइंट्स:**
- योग्य त्रुटी हाताळणी जोडा
- खर्चाचा अंदाज जोडा
- मॉनिटरिंग डॅशबोर्ड्स सेट करा

## मॉड्यूल ६: सामान्य समस्या निवारण

### सामान्य तैनाती समस्या

#### समस्या १: OpenAI सेवा कोटा ओलांडला
**लक्षणे:** तैनाती कोटा त्रुटीने अयशस्वी होते  
**उपाय:**
```bash
# सद्याचा कोटा तपासा
az cognitiveservices usage list --location eastus

# कोटा वाढीची विनंती करा किंवा वेगळ्या प्रदेशाचा प्रयत्न करा
azd env set AZURE_LOCATION westus2
azd up
```

#### समस्या २: मॉडेल क्षेत्रात उपलब्ध नाही
**लक्षणे:** AI प्रतिसाद अपयशी किंवा मॉडेल तैनात करणे अयशस्वी  
**उपाय:**
```bash
# प्रदेशानुसार मॉडेलची उपलब्धता तपासा
az cognitiveservices model list --location eastus

# उपलब्ध मॉडेलकडे अपडेट करा
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### समस्या ३: अनुमती समस्या
**लक्षणे:** AI सेवा कॉल करताना ४०३ प्रतिबंधित त्रुटी  
**उपाय:**
```bash
# भूमिका नियुक्‍ती तपासा
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# हरवलेल्या भूमिका जोडा
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### कार्यक्षमता समस्या

#### समस्या ४: हळू AI प्रतिसाद
**तपासणी पावले:**
1. Application Insights मध्ये कार्यक्षमता मेट्रिक्स तपासा
2. Azure पोर्टलमध्ये OpenAI सेवा मेट्रिक्स पहा
3. नेटवर्क कनेक्टिव्हिटी आणि विलंब तपासा

**उपाय:**
- सामान्य प्रश्नांसाठी कॅशिंग अंमलात आणा
- तुमच्या उपयोगासाठी योग्य OpenAI मॉडेल वापरा
- उच्च लोडच्या परिस्थितीसाठी रीड रिप्लिका वापराचा विचार करा

### **लॅब व्यायाम ६.१: डीबगिंग आव्हान**

**परिस्थिती:** तैनाती यशस्वी झाली, परंतु अनुप्रयोग ५०० त्रुटी देतो.

**डीबगिंग कार्ये:**
1. अनुप्रयोग लॉग तपासा
2. सेवा कनेक्टिव्हिटी तपासा
3. प्रमाणीकरण चाचणी करा
4. कॉन्फिगरेशन पुनरावलोकन करा

**वापरण्यासाठी साधने:**
- `azd show` तैनाती आढावा साठी
- तपशीलवार सेवा लॉगसाठी Azure पोर्टल
- अनुप्रयोग टेलीमेट्रीसाठी Application Insights

## मॉड्यूल ७: मॉनिटरिंग आणि ऑप्टिमायझेशन

### चरण ७.१: सर्वसमावेशक मॉनिटरिंग सेट करा

1. **कस्टम डॅशबोर्ड तयार करा:**

Azure पोर्टलमध्ये जा आणि खालीलासह डॅशबोर्ड तयार करा:
- OpenAI विनंती संख्या आणि विलंब
- अनुप्रयोग त्रुटी दर
- संसाधन वापर
- खर्च ट्रॅकिंग

2. **अलर्ट्स सेट करा:**
```bash
# उच्च त्रुटी दरासाठी सूचना
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### चरण ७.२: खर्च ऑप्टिमायझेशन

1. **सध्याचा खर्च विश्लेषण करा:**
```bash
# खर्च डेटा मिळवण्यासाठी Azure CLI वापरा
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **खर्च नियंत्रण अंमलात आणा:**
- बजेट अलर्ट्स सेट करा
- ऑटोस्केलिंग धोरणे वापरा
- विनंती कॅशिंग लागू करा
- OpenAI टोकन वापराचे निरीक्षण करा

### **लॅब व्यायाम ७.१: कार्यक्षमता ऑप्टिमायझेशन**

**कार्य:** तुमचा AI अनुप्रयोग कार्यक्षमता आणि खर्चासाठी ऑप्टिमाइझ करा.

**सुधारणेसाठी मेट्रिक्स:**
- सरासरी प्रतिसाद वेळ २०% कमी करा
- मासिक खर्च १५% कमी करा
- ९९.९% अपटाइम राखा

**प्रयत्न करण्यासाठी धोरणे:**
- प्रतिसाद कॅशिंग अंमलात आणा
- टोकन कार्यक्षमता सुधारण्यासाठी प्रॉम्प्ट ऑप्टिमाइझ करा
- योग्य संगणकीय SKU वापरा
- योग्य ऑटोस्केलिंग सेट करा

## अंतिम आव्हान: पूर्ण अंमलबजावणी

### आव्हान परिस्तिथी

तुम्हाला प्रॉडक्शन-तयार AI-शक्तिशाली ग्राहक सेवा चॅटबॉट तयार करण्याचे कार्य देण्यात आले आहे ज्यामध्ये हे आवश्यकताः

**कार्यात्मक आवश्यकता:**
- ग्राहक संवादासाठी वेब इंटरफेस
- प्रतिसादांसाठी Microsoft Foundry Models सह एकत्रीकरण
- Cognitive Search वापरून दस्तऐवज शोध क्षमता
- विद्यमान ग्राहक डेटाबेसशी एकत्रीकरण
- बहुभाषिक समर्थन

**अकार्यात्मक आवश्यकता:**
- १००० समवर्ती वापरकर्त्यांवर कार्यक्षम
- ९९.९% अपटाइम SLA
- SOC 2 अनुपालन
- $५००/महिना खर्चाअंतर्गत
- अनेक पर्यावरणांवर (डेव्ह, स्टेजिंग, प्रॉडक्शन) तैनात

### अंमलबजावणी पावले

1. आर्किटेक्चर डिझाइन करा  
2. AZD टेम्प्लेट तयार करा  
3. सुरक्षा उपाय अंमलात आणा  
4. मॉनिटरिंग आणि अलर्टिंग सेट करा  
5. तैनाती पाइपलाइन्स तयार करा  
6. सोल्युशन दस्तऐवज करा  

### मूल्यांकन निकष

- ✅ **कार्यक्षमता**: सर्व आवश्यकतांची पूर्तता आहे का?  
- ✅ **सुरक्षा**: सर्वोत्तम पद्धती अमलात आणल्या आहेत का?  
- ✅ **स्केलेबिलिटी**: लोड सांभाळू शकते का?  
- ✅ **देखभाल योग्यता**: कोड आणि इन्फ्रास्ट्रक्चर व्यवस्थित आहे का?  
- ✅ **खर्च**: बजेटमध्ये आहे का?

## अतिरिक्त संसाधने

### Microsoft दस्तऐवज
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### नमुना टेम्प्लेट्स
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### समुदाय संसाधने
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 पूर्णता प्रमाणपत्र

अभिनंदन! तुम्ही AI कार्यशाळा लॅब पूर्ण केली आहे. तुम्ही आता सक्षम असाल:
- ✅ विद्यमान AI अनुप्रयोगांना AZD टेम्पलेट्समध्ये रूपांतरित करा  
- ✅ उत्पादन-तयार AI अनुप्रयोग तैनात करा  
- ✅ AI वर्कलोडसाठी सुरक्षा सर्वोत्तम पद्धती अंमलात आणा  
- ✅ AI अनुप्रयोगाची कामगिरी निरीक्षण करा आणि अनुकूल करा  
- ✅ सामान्य तैनाती समस्यांचे निराकरण करा  

### पुढील पावले  
1. ही नमुने तुमच्या स्वतःच्या AI प्रकल्पांवर लागू करा  
2. टेम्पलेट्स परत समुदायाला दान करा  
3. सातत्यपूर्ण समर्थनासाठी Microsoft Foundry Discord मध्ये सहभागी व्हा  
4. बहु-प्रांतीय तैनातीसारख्या प्रगत विषयांचा शोध घ्या  

---

**कार्यशाळा अभिप्राय**: [Microsoft Foundry Discord #Azure channel](https://discord.gg/microsoft-azure) मध्ये आपला अनुभव शेअर करून या कार्यशाळेला सुधारण्यात मदत करा.

---

**अध्याय नेव्हिगेशन:**  
- **📚 कोर्स मुख्यपृष्ठ**: [AZD For Beginners](../../README.md)  
- **📖 सध्याचा अध्याय**: Chapter 2 - AI-First Development  
- **⬅️ मागील**: [AI Model Deployment](ai-model-deployment.md)  
- **➡️ पुढील**: [Production AI Best Practices](production-ai-practices.md)  
- **🚀 पुढील अध्याय**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)  

**मदतीची गरज आहे?** AZD आणि AI तैनातींबाबत समर्थन आणि चर्चा साठी आपल्या समुदायात सामील व्हा.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**गारंटी नाकारणी**:  
हा दस्तऐवज AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) वापरून अनुवादित केला आहे. आम्ही अचूकतेसाठी प्रयत्नशील असलो तरी, कृपया लक्षात ठेवा की स्वयंचलित अनुवादांमध्ये त्रुटी किंवा चुकीची माहिती असू शकते. मूळ दस्तऐवज त्याच्या स्थानिक भाषेत अधिकृत स्रोत मानला पाहिजे. महत्त्वाची माहिती असल्यास व्यावसायिक मानवी अनुवादाची शिफारशा केली जाते. या अनुवादाच्या वापरामुळे झालेल्या कुठल्याही गैरसमजुती किंवा चुकीच्या अर्थकनांबद्दल आम्ही जबाबदार नाही.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->