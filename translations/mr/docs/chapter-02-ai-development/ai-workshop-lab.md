# एआय कार्यशाळा लॅब: तुमचे एआय सोल्यूशन्स AZD-डिप्लॉय करण्यायोग्य बनविणे

**अध्याय नेव्हिगेशन:**
- **📚 कोर्स होम**: [AZD For Beginners](../../README.md)
- **📖 चालू अध्याय**: अध्याय 2 - AI-First Development
- **⬅️ मागील**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ पुढील**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 पुढील अध्याय**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

## कार्यशाळा अवलोकन

हा हस्तगत लॅब विकसकांना विद्यमान AI टेम्प्लेट घेऊन त्याला Azure Developer CLI (AZD) वापरून डिप्लॉय करण्याच्या प्रक्रियेत मार्गदर्शन करतो. तुम्हाला Microsoft Foundry सेवांचा वापर करून उत्पादन-अनुकूल AI डिप्लॉयमेंटसाठी आवश्यक नमुने शिकायला मिळतील.

> **वैधता नोंद (2026-07-13):** ही कार्यशाळा `azd` `1.27.1` विरुद्ध तपासली गेली आहे. जर तुमची स्थानिक स्थापना जुनाट असेल, तर AZD अद्ययावत करा जेणेकरून प्रमाणीकरण, टेम्प्लेट, आणि डिप्लॉयमेंट कार्यप्रवाह खालील चरणांशी जुळेल.

**कालावधी:** 2-3 तास  
**पातळी:** मध्यम  
**पूर्वअटी:** मूलभूत Azure ज्ञान, AI/ML संकल्पना परिचय

## 🎓 शिकण्याचे उद्दिष्टे

या कार्यशाळेच्या शेवटी, तुम्ही पुढील गोष्टी करू शकाल:
- ✅ विद्यमान AI अनुप्रयोग AZD टेम्प्लेटमध्ये रूपांतरित करा
- ✅ AZD सह Microsoft Foundry सेवा कॉन्फिगर करा
- ✅ AI सेवांसाठी सुरक्षित क्रेडेन्शियल व्यवस्थापन करा
- ✅ निरीक्षणासह उत्पादन-अनुकूल AI अनुप्रयोग डिप्लॉय करा
- ✅ सामान्य AI डिप्लॉयमेंट समस्या निराकरण करा

## पूर्वअटी

### आवश्यक साधने
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) स्थापित
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) स्थापित
- [Git](https://git-scm.com/) स्थापित
- कोड संपादक (VS Code शिफारस)

### Azure संसाधने
- Azure सदस्यत्व योगदानकर्ता प्रवेशासह
- Microsoft Foundry Models सेवांसाठी प्रवेश (किंवा प्रवेश मागवण्याची क्षमता)
- संसाधन समूह तयार करण्याची परवानगी

### ज्ञान पूर्वअटी
- Azure सेवांचे मूलभूत समज
- कमांड-लाइन इंटरफेसची ओळख
- मूलभूत AI/ML संकल्पना (API, मॉडेल्स, प्रॉम्प्ट्स)

## लॅब सेटअप

### चरण 1: पर्यावरण तयारी

1. **साधने स्थापना तपासा:**
```bash
# AZD स्थापना तपासा
azd version

# Azure CLI तपासा
az --version

# AZD वर्कफ्लोसाठी Azure मध्ये लॉगिन करा
azd auth login

# निदानांच्या वेळी az कमांड्स चालवायचा विचार असल्यासच Azure CLI मध्ये लॉगिन करा
az login
```

जर तुम्ही अनेक टेनंट्सवर काम करत असाल किंवा तुमचे सदस्यत्व आपोआप ओळखले जाणार नाही, तर `azd auth login --tenant-id <tenant-id>` वापरून पुन्हा प्रयत्न करा.

2. **कार्यशाळा रिपॉजिटरी क्लोन करा:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## मॉड्यूल 1: AI अनुप्रयोगांसाठी AZD रचना समजून घेणे

### AI AZD टेम्प्लेटची रचना

AI-तयार AZD टेम्प्लेटमधील मुख्य फाइल्सवर लक्ष ठेवा:

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

### **लॅब व्यायाम 1.1: कॉन्फिगरेशन तपासा**

1. **azure.yaml फाइल तपासा:**
```bash
cat azure.yaml
```

**तपासण्यासाठी गोष्टी:**
- AI घटकांसाठी सेवा व्याख्या
- पर्यावरण चलन नकाशे
- होस्ट कॉन्फिगरेशन

2. **main.bicep इन्फ्रास्ट्रक्चरचे पुनरावलोकन करा:**
```bash
cat infra/main.bicep
```

**ओळखण्यासाठी महत्त्वाचे AI नमुने:**
- Microsoft Foundry Models सेवा पुरवठा
- Azure AI Search एकत्रीकरण
- सुरक्षित की व्यवस्थापन
- नेटवर्क सुरक्षा कॉन्फिगरेशन

### **चर्चा मुद्दा:** AI साठी हे नमुने का महत्त्वाचे आहेत

- **सेवा अवलंबित्व**: AI अनुप्रयोग बहुसेवांशी समन्वय साधणे आवश्यक असते
- **सुरक्षा**: API की आणि endpoints सुरक्षितपणे व्यवस्थापित करणे आवश्यक आहे
- **प्रमाणवाढ**: AI कार्यभारांना वेगळी प्रमाणवाढ आवश्यकता असते
- **खर्च व्यवस्थापन**: AI सेवा योग्यरित्या कॉन्फिगर केल्या नसतील तर महाग होऊ शकतात

## मॉड्यूल 2: तुमचा पहिला AI अनुप्रयोग डिप्लॉय करा

### चरण 2.1: पर्यावरण सुरू करा

1. **नवीन AZD पर्यावरण तयार करा:**
```bash
azd env new myai-workshop
```

2. **आवश्यक पॅरामीटर्स सेट करा:**
```bash
# आपला प्राधान्यी असलेला Azure प्रदेश सेट करा
azd env set AZURE_LOCATION eastus

# ऐच्छिक: विशिष्ट OpenAI मॉडेल सेट करा
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### चरण 2.2: इन्फ्रास्ट्रक्चर व अनुप्रयोग डिप्लॉय करा

1. **AZD वापरून डिप्लॉय करा:**
```bash
azd up
```

**`azd up` च्या वेळी काय होते:**
- ✅ Microsoft Foundry Models सेवा व्यवस्थापित करते
- ✅ Azure AI Search सेवा तयार करते
- ✅ वेब अनुप्रयोगासाठी App Service तयार करते
- ✅ नेटवर्किंग व सुरक्षा कॉन्फिगर करते
- ✅ अनुप्रयोग कोड डिप्लॉय करते
- ✅ निरीक्षण आणि लॉग तयार करते

2. **डिप्लॉयमेंट प्रगतीचे निरीक्षण करा** व तयार होणाऱ्या संसाधनांचा रेकॉर्ड ठेवा.

### चरण 2.3: तुमच्या डिप्लॉयमेंटचे सत्यापन करा

1. **तयार केलेल्या संसाधनांची तपासणी करा:**
```bash
azd show
```

2. **तयार केलेला अनुप्रयोग उघडा:**
```bash
azd show
```

`azd show` आउटपुटमध्ये दर्शविलेला वेब एंडपॉइंट उघडा.

3. **AI कार्यक्षमता तपासा:**
   - वेब अनुप्रयोगावर जा
   - नमुना प्रश्न विचारून पहा
   - AI प्रतिसाद कार्यरत असल्याची पुष्टी करा

### **लॅब व्यायाम 2.1: समस्या निवारण सराव**

**परिस्थिती**: तुमचे डिप्लॉयमेंट यशस्वी झाले पण AI प्रतिसाद देत नाही.

**सामान्य समस्या तपासण्याचे मुद्दे:**
1. **OpenAI API की**: त्यांची योग्य सेटिंग तपासा
2. **मॉडेल उपलब्धता**: तुमच्या प्रदेशात मॉडेल उपलब्ध आहे का हे तपासा
3. **नेटवर्क कनेक्टिव्हिटी**: सेवा एकमेकांशी जुळू शकतात का याची खात्री करा
4. **RBAC परवानग्या**: अनुप्रयोगाला OpenAI प्रवेश आहे का हे तपासा

**डिबगिंग कमांड्स:**
```bash
# पर्यावरण बदल तपासा
azd env get-values

# तैनाती नोंदी पहा
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# OpenAI तैनाती स्थिती तपासा
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## मॉड्यूल 3: तुमच्या गरजांसाठी AI अनुप्रयोग सानुकूलित करा

### चरण 3.1: AI कॉन्फिगरेशन सुधारित करा

1. **OpenAI मॉडेल अपडेट करा:**
```bash
# वेगळ्या मॉडेलवर बदला (जर तुमच्या प्रदेशात उपलब्ध असेल तर)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# नवीन सेटिंगसह पुन्हा तैनात करा
azd deploy
```

2. **अतिरिक्त AI सेवा जोडा:**

`infra/main.bicep` संपादित करा Document Intelligence जोडण्यासाठी:

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

### चरण 3.2: पर्यावरण-विशिष्ट कॉन्फिगरेशन

**सर्वोत्तम प्रथा**: विकास व उत्पादनासाठी वेगळ्या कॉन्फिगरेशनचा वापर करा.

1. **उत्पादन पर्यावरण तयार करा:**
```bash
azd env new myai-production
```

2. **उत्पादन-विशिष्ट पॅरामीटर्स सेट करा:**
```bash
# उत्पादन सामान्यतः उच्च SKUs वापरते
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# अतिरिक्त सुरक्षितता वैशिष्ट्ये सक्षम करा
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **लॅब व्यायाम 3.1: खर्च ऑप्टिमायझेशन**

**आव्हान**: खर्च-प्रभावी विकासासाठी टेम्प्लेट कॉन्फिगर करा.

**कार्य:**
1. कोणते SKU मोफत/मूलभूत टियरवर सेट करता येतील हे ओळखा
2. पर्यावरण चलन कमी खर्चासाठी कॉन्फिगर करा
3. डिप्लॉय करा व उत्पादन कॉन्फिगरेशनशी खर्च तुलना करा

**उपाय सूचना:**
- शक्यतो Azure AI सेवांसाठी F0 (मुक्त) टियर वापरा
- विकासात Search Service साठी बेसिक टियर वापरा
- Functions साठी Consumption प्लॅन वापरण्याचा विचार करा

## मॉड्यूल 4: सुरक्षा व उत्पादन सर्वोत्तम प्रथा

### चरण 4.1: सुरक्षित क्रेडेन्शियल व्यवस्थापन

**सध्याचा आव्हान:** अनेक AI अनुप्रयोग API की हार्डकोड करतात किंवा असुरक्षित संग्रहण वापरतात.

**AZD उपाय:** Managed Identity + Key Vault एकत्रीकरण.

1. **तुमच्या टेम्प्लेटमधील सुरक्षा कॉन्फिगरेशन तपासा:**
```bash
# की वॉल्ट आणि व्यवस्थापित ओळख संरचनेची तपासणी करा
grep -r "keyVault\|managedIdentity" infra/
```

2. **Managed Identity कार्यरत आहे का तपासा:**
```bash
# तपासा की वेब अॅपमध्ये योग्य ओळख कॉन्फिगरेशन आहे का
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### चरण 4.2: नेटवर्क सुरक्षा

1. **खाजगी एंडपॉइंट्स सक्षम करा** (जर आधी सेट न केले असल्यास):

तुमच्या बायसेप टेम्प्लेटमध्ये जोडा:
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

### चरण 4.3: निरीक्षण व पाहणी (Observability)

1. **Application Insights कॉन्फिगर करा:**
```bash
# Application Insights आपोआप कॉन्फिगर केले पाहिजे
# कॉन्फिगरेशन तपासा:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **AI-विशिष्ट निरीक्षण सेट करा:**

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

### **लॅब व्यायाम 4.1: सुरक्षा तपासणी**

**कार्य:** तुमच्या डिप्लॉयमेंटची सुरक्षा सर्वोत्तम प्रथांसाठी समीक्षा करा.

**तपासणी यादी:**
- [ ] कोड किंवा कॉन्फिगरेशनमध्ये हार्डकोडेड गुपिते नाहीत
- [ ] सेवा-सेवा प्रमाणीकरणासाठी Managed Identity वापरली आहे
- [ ] संवेदनशील कॉन्फिगरेशनसाठी Key Vault वापरला आहे
- [ ] नेटवर्क प्रवेश योग्यरित्या प्रतिबंधित आहे
- [ ] निरीक्षण आणि लॉगिंग सक्षम आहेत

## मॉड्यूल 5: तुमचा स्वतःचा AI अनुप्रयोग रूपांतरित करणे

### चरण 5.1: मूल्यांकन कार्यपत्रक

**रूपांतर करण्यापूर्वी तुमच्या app बद्दल उत्तर द्या:**

1. **अनुप्रयोग रचना:**
   - तुमचा app कोणत्या AI सेवांचा वापर करतो?
   - कोणते संगणन संसाधने आवश्यक आहेत?
   - त्या मध्ये डेटाबेस आवश्यक आहे का?
   - सेवांमधील अवलंबित्व काय आहे?

2. **सुरक्षा आवश्यकता:**
   - तुमचा app कोणते संवेदनशील डेटा हाताळतो?
   - कोणत्या अनुपालन आवश्यकतांचा विचार करावा लागतो?
   - तुम्हाला खाजगी नेटवर्किंग आवश्यक आहे का?

3. **प्रमाणवाढ आवश्यकता:**
   - अपेक्षित लोड काय आहे?
   - तुम्हाला ऑटो-स्केलिंग हवे आहे का?
   - प्रादेशिक आवश्यकता आहेत का?

### चरण 5.2: तुमचा AZD टेम्प्लेट तयार करा

**तुमचा app रूपांतरित करण्यासाठी हा नमुना वापरा:**

1. **मूलभूत रचना तयार करा:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# AZD टेम्प्लेट प्रारंभ करा
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

3. **इन्फ्रास्ट्रक्चर टेम्प्लेट तयार करा:**

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

### **लॅब व्यायाम 5.1: टेम्प्लेट तयार करण्याचा आव्हान**

**आव्हान**: दस्तऐवज प्रक्रियेसाठी AI app साठी AZD टेम्प्लेट तयार करा.

**आवश्यकता:**
- Microsoft Foundry Models सामग्री विश्लेषणासाठी
- OCR साठी Document Intelligence
- दस्तऐवज अपलोडसाठी Storage Account
- प्रक्रिया तर्कासाठी Function App
- वापरकर्ता इंटरफेससाठी वेब अनुप्रयोग

**बोनस गुण:**
- योग्य त्रुटी हाताळणी जोडा
- खर्च अंदाजाचा समावेश करा
- निरीक्षण डॅशबोर्ड सेट अप करा

## मॉड्यूल 6: सामान्य समस्या निवारण

### सामान्य डिप्लॉयमेंट समस्या

#### समस्या 1: OpenAI सेवा कोटा ओलांडले
**लक्षणे:** कोटा त्रुटीमुळे डिप्लॉयमेंट अयशस्वी
**उपाय:**
```bash
# वर्तमान कोटा तपासा
az cognitiveservices usage list --location eastus

# कोटा वाढीची विनंती करा किंवा वेगळा प्रदेश वापरून पहा
azd env set AZURE_LOCATION westus2
azd up
```

#### समस्या 2: मॉडेल क्षेत्रात उपलब्ध नाही
**लक्षणे:** AI प्रतिसाद अयशस्वी किंवा मॉडेल डिप्लॉयमेंट त्रुटी
**उपाय:**
```bash
# प्रदेशानुसार मॉडेलची उपलब्धता तपासा
az cognitiveservices model list --location eastus

# उपलब्ध मॉडेलसाठी अद्यतनित करा
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### समस्या 3: परवानगी समस्या
**लक्षणे:** AI सेवा कॉल करताना 403 निषिद्ध त्रुटी
**उपाय:**
```bash
# भूमिका नियुक्त्या तपासा
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# गहाळ भूमिका जोडा
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### कामगिरी समस्या

#### समस्या 4: AI प्रतिसाद मळवळ
**तपासणी पावले:**
1. कामगिरी मेट्रिक्ससाठी Application Insights तपासा
2. Azure पोर्टलमधील OpenAI सेवा मेट्रिक्स पुनरावलोकन करा
3. नेटवर्क कनेक्टिव्हिटी व विलंब तपासा

**उपाय:**
- सामान्य प्रश्नांसाठी कॅशिंग अंमलात आणा
- तुमच्या वापर प्रकरणासाठी योग्य OpenAI मॉडेल वापरा
- उच्च लोड प्रकरणांसाठी रीड रेप्लिका विचारात घ्या

### **लॅब व्यायाम 6.1: डिबगिंग आव्हान**

**परिस्थिती:** तुमचे डिप्लॉयमेंट यशस्वी झाले, पण अनुप्रयोग 500 त्रुटी परत करतो.

**डिबगिंग कार्य:**
1. अनुप्रयोग लॉग तपासा
2. सेवा कनेक्टिव्हिटी तपासा
3. प्रमाणीकरण तपासा
4. कॉन्फिगरेशन पुनरावलोकन करा

**वापरायची साधने:**
- `azd show` डिप्लॉयमेंट आढावा
- Azure पोर्टल साठी तपशीलवार सेवा लॉग
- Application Insights साठी अनुप्रयोग टेलीमेट्री

## मॉड्यूल 7: निरीक्षण आणि ऑप्टिमायझेशन

### चरण 7.1: सर्वसमावेशक निरीक्षण सेटअप करा

1. **कस्टम डॅशबोर्ड तयार करा:**

Azure पोर्टलमध्ये जा व खालील डॅशबोर्ड तयार करा:
- OpenAI विनंती संख्या व विलंब
- अनुप्रयोग त्रुटी दर
- संसाधन वापर
- खर्च ट्रॅकिंग

2. **अलर्ट कॉन्फिगर करा:**
```bash
# उच्च त्रुटी दरासाठी इशारा
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
# खर्च डेटा मिळवण्यासाठी Azure CLI वापरा
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **खर्च नियंत्रण अंमलात आणा:**
- बजेट अलर्ट सेट करा
- ऑटोस्केलिंग धोरणे वापरा
- विनंती कॅशिंग अंमलात आणा
- OpenAI टोकन वापर निरीक्षण करा

### **लॅब व्यायाम 7.1: कामगिरी ऑप्टिमायझेशन**

**कार्य:** तुमच्या AI अनुप्रयोगासाठी दोन्ही कामगिरी व खर्च ऑप्टिमाइझ करा.

**सुधारणीय मेट्रिक्स:**
- सरासरी प्रतिसाद वेळ 20% कमी करा
- मासिक खर्च 15% कमी करा
- 99.9% अपटाइम राखा

**कोशिंत उपाय:**
- प्रतिसाद कॅशिंग अंमलात आणा
- टोकन कार्यक्षमता वाढविण्यासाठी प्रॉम्प्ट्स सुधारित करा
- योग्य संगणन SKU वापरा
- योग्य ऑटोस्केलिंग सेट करा

## अंतिम आव्हान: सुरुवातीपासून अंतिम अंमलबजावणी

### आव्हान परिस्थिती

तुम्हाला उत्पादन-तयार AI-आधारित ग्राहक सेवा चॅटबॉट तयार करण्याचे काम देण्यात आले आहे ज्यासाठी या आवश्यकता आहेत:

**कार्यात्मक आवश्यकता:**
- ग्राहक संवादासाठी वेब इंटरफेस
- प्रतिसादांसाठी Microsoft Foundry Models एकत्रीकरण
- Azure AI Search वापरून दस्तऐवज शोध क्षमता
- विद्यमान ग्राहक डेटाबेसशी समाकलन
- बहुभाषिक समर्थन

**गैर-कार्यात्मक आवश्यकता:**
- 1000 समवयस्क वापरकर्त्यांना हाताळा
- 99.9% अपटाइम SLA
- SOC 2 अनुपालन
- $500/महिना पेक्षा कमी खर्च
- अनेक पर्यावरणांमध्ये डिप्लॉय (डेव्ह, स्टेज, प्रॉडक्शन)

### अंमलबजावणीचे टप्पे

1. **रचना डिझाइन करा**
2. **AZD टेम्प्लेट तयार करा**
3. **सुरक्षा उपाय अंमलात आणा**
4. **निरीक्षण व अलर्टिंग सेट करा**
5. **डिप्लॉयमेंट पाईपलाईन्स तयार करा**
6. **सोल्यूशन दस्तऐवज तयार करा**

### मुल्यमापन निकष

- ✅ **कार्यक्षमता**: सर्व आवश्यकता पूर्ण होते का?
- ✅ **सुरक्षा**: सर्वोत्तम प्रथा अंमलात आहेत का?
- ✅ **प्रमाणवाढ**: लोड हाताळू शकते का?
- ✅ **देखभाल योग्यता**: कोड व इन्फ्रास्ट्रक्चर व्यवस्थित आहे का?
- ✅ **खर्च**: बजेटमध्ये राहते का?

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

अभिनंदन! आपण AI कार्यशाळा लॅब पूर्ण केली आहे. आपण आता खालील गोष्टी करू शकता:

- ✅ विद्यमान AI अनुप्रयोगांना AZD टेम्प्लेट्समध्ये रूपांतर करा
- ✅ उत्पादनासाठी सज्ज AI अनुप्रयोग लागू करा
- ✅ AI वर्कलोडसाठी सुरक्षा सर्वोत्तम सराव अमलात आणा
- ✅ AI अनुप्रयोग कार्यक्षमता निरीक्षण आणि ऑप्टिमाइझ करा
- ✅ सामान्य तैनाती समस्यांचे निराकरण करा

### पुढील पावले
1. हे पॅटर्न आपले स्वतःचे AI प्रोजेक्टमध्ये लागू करा
2. टेम्प्लेट्स समुदायास परत योगदान द्या
3. सतत सहाय्यासाठी Microsoft Foundry Discord मध्ये सामील व्हा
4. बहु-प्रदेश तैनातीसारख्या प्रगत विषयांचा शोध घ्या

---

**कार्यशाळा अभिप्राय**: [Microsoft Foundry Discord #Azure channel](https://discord.gg/microsoft-azure) मध्ये आपला अनुभव शेअर करून आम्हाला ही कार्यशाळा सुधारण्यात मदत करा.

---

**प्रकरण नेव्हिगेशन:**
- **📚 कोर्स होम**: [AZD For Beginners](../../README.md)
- **📖 सद्य प्रकरण**: प्रकरण 2 - AI-प्रथम विकास
- **⬅️ मागील**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ पुढील**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 पुढील प्रकरण**: [प्रकरण 3: कॉन्फिगरेशन](../chapter-03-configuration/configuration.md)

**मदत हवी आहे का?** AZD आणि AI तैनातीसंबंधित समर्थन व चर्चांसाठी आमच्या समुदायामध्ये सामील व्हा.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
हा दस्तऐवज AI भाषांतर सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) चा वापर करून अनुवादित केला आहे. जरी आम्ही अचूकतेसाठी प्रयत्न करतो, तरी कृपया लक्षात घ्या की स्वयंचलित भाषांतरांमध्ये त्रुटी किंवा अचूकतेची कमतरता असू शकते. मूळ दस्तऐवज त्याच्या मूळ भाषेत अधिकृत स्रोत मानला पाहिजे. महत्त्वाची माहिती असल्यास, व्यावसायिक मानवी भाषांतराची शिफारस केली जाते. या भाषांतराच्या वापरामुळे उद्भवणाऱ्या कोणत्याही गैरसमज किंवा चुकीच्या अर्थलावणीसाठी आम्ही जबाबदार नाही.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->