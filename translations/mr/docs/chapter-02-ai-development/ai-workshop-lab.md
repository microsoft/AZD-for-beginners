# AI कार्यशाळा प्रयोगशाळा: तुमच्या AI सोल्यूशन्सना AZD-कायम करण्यायोग्य बनविणे

**अध्याय नेव्हिगेशन:**
- **📚 कोर्स होम**: [AZD फॉर बिगिनर्स](../../README.md)
- **📖 चालू अध्याय**: अध्याय 2 - AI-फर्स्ट डेव्हलपमेंट
- **⬅️ मागील**: [AI मॉडेल डिप्लॉयमेंट](ai-model-deployment.md)
- **➡️ पुढील**: [प्रॉडक्शन AI बेस्ट प्रॅक्टिसेस](production-ai-practices.md)
- **🚀 पुढील अध्याय**: [अध्याय 3: कॉन्फिगरेशन](../chapter-03-configuration/configuration.md)

## कार्यशाळा आढावा

हा हँड्स-ऑन लॅब डेव्हलपर्सना विद्यमान AI टेम्पलेट घेऊन Azure Developer CLI (AZD) वापरून डिप्लॉय करण्याच्या प्रक्रियेत मार्गदर्शन करतो. तुम्ही Microsoft Foundry सेवा वापरून प्रॉडक्शन AI डिप्लॉयमेंटसाठी आवश्यक पॅटर्न शिकाल.

> **प्रमाणित नोट (2026-03-25):** ही कार्यशाळा `azd` `1.23.12` वर तपासली गेली आहे. तुमच्या स्थानिक इंस्टॉलेशनची आवृत्ती जुन्या असल्यास, खालील चरणांशी जुळण्याकरिता AZD सुरू करण्यापूर्वी अपडेट करा.

**कालावधी:** 2-3 तास  
**स्तर:** मध्यम  
**पूर्वअटी:** बेसिक Azure ज्ञान, AI/ML संकल्पनांची ओळख

## 🎓 शिकण्याची उद्दिष्टे

या कार्यशाळेच्या अखेरीस तुम्ही सक्षम असाल:
- ✅ विद्यमान AI अनुप्रयोग AZD टेम्पलेटमध्ये रूपांतरित करणे
- ✅ Microsoft Foundry सेवा AZD ने कॉन्फिगर करणे
- ✅ AI सेवांसाठी सुरक्षित क्रेडेन्शियल व्यवस्थापन लागू करणे
- ✅ मॉनिटरिंगसह प्रॉडक्शन-तयार AI अनुप्रयोग डिप्लॉय करणे
- ✅ सामान्य AI डिप्लॉयमेंट समस्या सोडवणे

## पूर्वअटी

### आवश्यक साधने
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) इंस्टॉल केलेले
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) इंस्टॉल केलेले
- [Git](https://git-scm.com/) इंस्टॉल केलेले
- कोड एडिटर (VS Code शिफारसीय)

### Azure संसाधने
- कंत्रिब्युटर प्रवेशासहित Azure सबस्क्रिप्शन
- Microsoft Foundry Models सेवा प्रवेश (किंवा प्रवेशासाठी विनंती करण्याची क्षमता)
- रिसोर्स ग्रुप तयार करण्याची परवानगी

### ज्ञान पूर्वअटी
- Azure सेवांबद्दल प्राथमिक समज
- कमांड-लाईन इंटरफेसची ओळख
- AI/ML संकल्पना (APIs, मॉडेल्स, प्रॉम्प्ट्स) ची माहिती

## लॅब सेटअप

### टप्पा 1: पर्यावरण तयारी

1. **साधने तपासा:**
```bash
# AZD प्रतिष्ठापन तपासा
azd version

# Azure CLI तपासा
az --version

# AZD कार्यप्रवाहांसाठी Azure मध्ये लॉगिन करा
azd auth login

# निदानाच्या वेळी az आदेश चालविण्याची योजना असल्यासच Azure CLI मध्ये लॉगिन करा
az login
```

जर तुम्ही एकाधिक टेनंटवर काम करत असाल किंवा तुमची सबस्क्रिप्शन आपोआप आढळत नसेल, तर `azd auth login --tenant-id <tenant-id>` ने पुन्हा प्रयत्न करा.

2. **कार्यशाळा रिपॉजिटरी क्लोन करा:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## मॉड्यूल 1: AI अनुप्रयोगांसाठी AZD रचनेची समज

### AI AZD टेम्पलेटची रचना

AI-तयार AZD टेम्प्लेटमधील मुख्य फाइल्स शोधा:

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

1. **azure.yaml फाईल पाहा:**
```bash
cat azure.yaml
```

**काय पाहायचे:**
- AI घटकांसाठी सेवा व्याख्या
- पर्यावरण चलांचे मॅपिंग
- होस्ट कॉन्फिगरेशन्स

2. **main.bicep इन्फ्रास्ट्रक्चर तपासा:**
```bash
cat infra/main.bicep
```

**ओळखण्यासाठी मुख्य AI पॅटर्न:**
- Microsoft Foundry Models सेवा प्राव्हिज़निंग
- Azure AI Search एकत्रीकरण
- सुरक्षित की व्यवस्थापन
- नेटवर्क सुरक्षा कॉन्फिगरेशन्स

### **चर्चा विषय:** AI साठी हे पॅटर्न का महत्त्वाचे आहेत

- **सेवा अवलंबित्व:** AI अॅप्सना अनेक समन्वयित सेवांची गरज असते
- **सुरक्षा:** API की आणि एंडपॉइंट्स सुरक्षितपणे व्यवस्थापित करणे आवश्यक आहे
- **स्केलेबिलिटी:** AI वर्कलोडसाठी अनन्य स्केलिंग आवश्यकता आहेत
- **खर्च व्यवस्थापन:** योग्य कॉन्फिगरेशन न केल्यास AI सेवा महाग पडू शकतात

## मॉड्यूल 2: तुमचा पहिला AI अनुप्रयोग डिप्लॉय करा

### टप्पा 2.1: पर्यावरण सुरू करा

1. **नवीन AZD पर्यावरण तयार करा:**
```bash
azd env new myai-workshop
```

2. **आवश्यक पॅरामीटर्स सेट करा:**
```bash
# आपला पसंतीचा Azure प्रदेश सेट करा
azd env set AZURE_LOCATION eastus

# ऐच्छिक: विशिष्ट OpenAI मॉडेल सेट करा
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### टप्पा 2.2: इन्फ्रास्ट्रक्चर आणि अनुप्रयोग डिप्लॉय करा

1. **AZD वापरून डिप्लॉय करा:**
```bash
azd up
```

**`azd up` करताना काय होते:**
- ✅ Microsoft Foundry Models सेवा प्राव्हिज़न होते
- ✅ Azure AI Search सेवा तयार केली जाते
- ✅ वेब अनुप्रयोगासाठी App Service सेटअप होते
- ✅ नेटवर्किंग आणि सुरक्षा कॉन्फिगर केली जाते
- ✅ अनुप्रयोग कोड डिप्लॉय केला जातो
- ✅ मॉनिटरिंग आणि लॉगिंग सेटअप केले जाते

2. **डिप्लॉयमेंट प्रगतीवर लक्ष ठेवा** आणि निर्मित संसाधने नोंदवा.

### टप्पा 2.3: तुमचे डिप्लॉयमेंट तपासा

1. **डिप्लॉय केलेली संसाधने तपासा:**
```bash
azd show
```

2. **डिप्लॉय केलेला अनुप्रयोग उघडा:**
```bash
azd show
```

`azd show` आउटपुटमध्ये दाखवलेली वेब एंडपॉइंट उघडा.

3. **AI कार्यक्षमता तपासा:**
   - वेब अॅपमध्ये जा
   - नमुना क्वेरी वापरून पाहा
   - AI प्रतिसादांची कार्यक्षमता तपासा

### **लॅब व्यायाम 2.1: समस्या निवारण सराव**

**परिस्थिती:** तुमचे डिप्लॉयमेंट यशस्वी झाले, पण AI प्रतिसाद देत नाही.

**सामान्य समस्या तपासण्यासाठी:**
1. **OpenAI API कीज**: योग्यरित्या सेट आहेत का ते तपासा
2. **मॉडेल उपलब्धता:** तुमच्या प्रदेशात मॉडेल उपलब्ध आहे का ते पाहा
3. **नेटवर्क कनेक्टिव्हिटी:** सेवांमध्ये संवाद होतोय का खात्री करा
4. **RBAC परवानग्या:** अॅपला OpenAI पर्यंत पोहोचण्याची परवानगी आहे का तपासा

**डिबगिंग कमांडस्:**
```bash
# पर्यावरण चल मूल्य तपासा
azd env get-values

# तैनाती लॉग्ज पहा
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# OpenAI तैनाती स्थिती तपासा
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## मॉड्यूल 3: तुमच्या गरजांसाठी AI अनुप्रयोग सानुकूल करा

### टप्पा 3.1: AI कॉन्फिगरेशन बदला

1. **OpenAI मॉडेल अपडेट करा:**
```bash
# वेगळ्या मॉडेलवर बदला (जर तुमच्या भागात उपलब्ध असेल तर)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# नवीन संरचनेसह पुन्हा तैनात करा
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

### टप्पा 3.2: पर्यावरण विशिष्ट कॉन्फिगरेशन्स

**सर्वोत्तम सराव:** विकास आणि प्रॉडक्शनसाठी भिन्न कॉन्फिगरेशन.

1. **प्रॉडक्शन पर्यावरण तयार करा:**
```bash
azd env new myai-production
```

2. **प्रॉडक्शनसाठी विशिष्ट पॅरामीटर्स सेट करा:**
```bash
# उत्पादन सहसा जास्त SKUs वापरते
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# अतिरिक्त सुरक्षा वैशिष्ट्ये सक्षम करा
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **लॅब व्यायाम 3.1: खर्च ऑप्टिमायझेशन**

**आव्हान:** खर्च-कमी करणाऱ्या विकासासाठी टेम्पलेट कॉन्फिगर करा.

**कामे:**
1. कोणते SKU विनामूल्य/मूलभूत स्तरावर सेट करता येतील ते ओळखा
2. कमी खर्चासाठी पर्यावरण चल सेट करा
3. प्रॉडक्शन कॉन्फिगरेशनशी लागत तुलना करा

**सूचना:**
- शक्य असल्यास Azure AI सेवा F0 (मुफ्त) स्तर वापरा
- विकासासाठी Search सेवा बेसिक स्तर वापरा
- Functions साठी Consumption योजना वापरण्याचा विचार करा

## मॉड्यूल 4: सुरक्षा आणि प्रॉडक्शन सर्वोत्तम सराव

### टप्पा 4.1: सुरक्षित क्रेडेन्शियल व्यवस्थापन

**सध्याची समस्या:** अनेक AI अॅप्स API की हार्डकोड करतात किंवा असुरक्षित स्टोरेज वापरतात.

**AZD उपाय:** Managed Identity + Key Vault इंटिग्रेशन.

1. **तुमच्या टेम्पलेटमधील सुरक्षा कॉन्फिगरेशन तपासा:**
```bash
# की वॉल्ट आणि व्यवस्थापित ओळख कॉन्फिगरेशन शोधा
grep -r "keyVault\|managedIdentity" infra/
```

2. **Managed Identity कार्यरत आहे का ते तपासा:**
```bash
# वेब अनुप्रयोगात योग्य ओळख संरचना आहे का ते तपासा
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### टप्पा 4.2: नेटवर्क सुरक्षा

1. **खाजगी एंडपॉइंट सक्षम करा** (जर आधी सेट नसेल):

तुमच्या बिसेप टेम्पलेटमध्ये जोडा:
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

### टप्पा 4.3: मॉनिटरिंग आणि निरीक्षण

1. **Application Insights कॉन्फिगर करा:**
```bash
# Application Insights आपोआप कॉन्फिगर केले पाहिजे
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

**काम:** तुमच्या डिप्लॉयमेंटमधील सुरक्षा सर्वोत्तम सराव तपासा.

**चेकलिस्ट:**
- [ ] कोड किंवा कॉन्फिगरेशनमध्ये हार्डकोड केलेले गुपित नाहीत
- [ ] सेवा-सेवा प्रमाणपत्रासाठी Managed Identity वापरली आहे
- [ ] Key Vault संवेदनशील कॉन्फिगरेशन साठवते
- [ ] नेटवर्क प्रवेश व्यवस्थित मर्यादित आहे
- [ ] मॉनिटरिंग आणि लॉगिंग सक्षम केलेले आहेत

## मॉड्यूल 5: तुमचा स्वतःचा AI अनुप्रयोग रूपांतरित करा

### टप्पा 5.1: मूल्यांकन वर्कशीट

**तुमचा अॅप रूपांतरित करण्यापूर्वी**, या प्रश्नांची उत्तरे द्या:

1. **अॅप आर्किटेक्टचर:**
   - तुमचा अॅप कोणत्या AI सेवा वापरतो?
   - त्याला कोणते कॉम्प्युट संसाधने आवश्यक आहेत?
   - त्याला डेटाबेसची गरज आहे का?
   - सेवांमधील अवलंबित्व काय आहेत?

2. **सुरक्षा गरजा:**
   - तुमचा अॅप कोणते संवेदनशील डेटा हाताळतो?
   - कोणते अनुपालन आवश्यक आहे?
   - तुम्हाला खाजगी नेटवर्किंगची गरज आहे का?

3. **स्केलिंग गरजा:**
   - अपेक्षित लोड काय आहे?
   - ऑटो-स्केलिंगची गरज आहे का?
   - प्रादेशिक आवश्यकतां आहेत का?

### टप्पा 5.2: तुमचा AZD टेम्पलेट तयार करा

**तुमचा अॅप रूपांतरित करण्यासाठी ह्या पॅटर्नचे अनुसरण करा:**

1. **मूलभूत रचना तयार करा:**
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

### **लॅब व्यायाम 5.1: टेम्पलेट क्रिएशन आव्हान**

**आव्हान:** दस्तऐवज प्रक्रिया AI अॅपसाठी AZD टेम्पलेट तयार करा.

**अटी:**
- सामग्री विश्लेषणासाठी Microsoft Foundry Models
- OCR साठी Document Intelligence
- दस्तऐवज अपलोडसाठी स्टोरेज अकाउंट
- प्रक्रिया लॉजिकसाठी Function App
- वापरकर्ता इंटरफेससाठी वेब अॅप

**बोनस पॉइंट्स:**
- योग्य त्रुटी हाताळणी जोडा
- खर्च अंदाज समाविष्ट करा
- मॉनिटरिंग डॅशबोर्ड तयार करा

## मॉड्यूल 6: सामान्य समस्या निवारण

### सामान्य डिप्लॉयमेंट समस्या

#### समस्या 1: OpenAI सेवा कोटा ओलांडले
**लक्षणे:** डिप्लॉयमेंट कोटा त्रुटीने अयशस्वी होते  
**उपाय:**
```bash
# वर्तमान कोटा तपासा
az cognitiveservices usage list --location eastus

# कोटा वाढीची विनंती करा किंवा वेगळ्या प्रदेशाचा प्रयत्न करा
azd env set AZURE_LOCATION westus2
azd up
```

#### समस्या 2: प्रदेशात मॉडेल उपलब्ध नाही
**लक्षणे:** AI प्रतिसाद अयशस्वी किंवा मॉडेल डिप्लॉयमेंट त्रुटी  
**उपाय:**
```bash
# प्रदेशानुसार मॉडेल उपलब्धता तपासा
az cognitiveservices model list --location eastus

# उपलब्ध मॉडेलवर अद्यतन करा
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### समस्या 3: परवानगी समस्या
**लक्षणे:** AI सेवांना कॉल करताना 403 Forbidden त्रुटी  
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

### कार्यप्रदर्शन समस्या

#### समस्या 4: AI प्रतिसाद मंदी
**चाचणी टप्पे:**
1. Application Insights मधील परफॉर्मन्स मेट्रिक्स तपासा
2. Azure पोर्टलमधील OpenAI सेवा मेट्रिक्स पाहा
3. नेटवर्क कनेक्टिव्हिटी आणि विलंब तपासा

**उपाय:**
- सर्वसाधारण क्वेरीजसाठी कॅशिंग लागू करा
- आपल्या वापरासाठी योग्य OpenAI मॉडेल वापरा
- उच्च लोडसाठी रीड रेप्लिका वापरण्याचा विचार करा

### **लॅब व्यायाम 6.1: डिबगिंग आव्हान**

**परिस्थिती:** तुमचे डिप्लॉयमेंट यशस्वी झाले, पण अॅप 500 त्रुटी परत करत आहे.

**डिबगिंग कामे:**
1. अनुप्रयोग लॉग्स तपासा
2. सेवा कनेक्टिव्हिटी सत्यापित करा
3. प्रमाणीकरण तपासा
4. कॉन्फिगरेशन पुनरावलोकन करा

**वापरण्यासाठी साधने:**
- `azd show` डिप्लॉयमेंट आढावा
- Azure पोर्टलमध्ये सेवा लॉग्स तपासणी
- Application Insights सह अनुप्रयोग टेलीमेट्री

## मॉड्यूल 7: मॉनिटरिंग आणि ऑप्टिमायझेशन

### टप्पा 7.1: सर्वसमावेशक मॉनिटरिंग सेट करा

1. **कस्टम डॅशबोर्ड तयार करा:**

Azure पोर्टलमध्ये जाऊन खालीलांसह डॅशबोर्ड तयार करा:
- OpenAI विनंती संख्या व विलंब
- अनुप्रयोग त्रुटी दर
- संसाधन वापर
- खर्च ट्रॅकिंग

2. **अलर्ट सेट करा:**
```bash
# उच्च त्रुटी दरासाठी सूचना
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### टप्पा 7.2: खर्च ऑप्टिमायझेशन

1. **सध्याचा खर्च विश्लेषण करा:**
```bash
# किमतीचे डेटा मिळवण्यासाठी Azure CLI वापरा
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **खर्च नियंत्रण करा:**
- बजेट अलर्ट सेट करा
- ऑटोस्केलिंग धोरणे वापरा
- विनंती कॅशिंग लागू करा
- OpenAI टोकन वापर मॉनिटर करा

### **लॅब व्यायाम 7.1: कार्यप्रदर्शन ऑप्टिमायझेशन**

**काम:** कार्यप्रदर्शन आणि खर्च यासाठी तुमच्या AI अॅप्लिकेशनचे ऑप्टिमायझेशन करा.

**सुधारणेसाठी मेट्रिक्स:**
- सरासरी प्रतिसाद वेळ 20% कमी करा
- मासिक खर्च 15% कमी करा
- 99.9% अपटाइम राखा

**प्रयोगासाठी धोरणे:**
- प्रतिसाद कॅशिंग लागू करा
- टोकन कार्यक्षमता साठी प्रॉम्प्ट ऑप्टिमाइझ करा
- योग्य कॉम्प्युट SKU वापरा
- प्रभावी ऑटोस्केलिंग सेट करा

## अंतिम आव्हान: एंड-टू-एंड अंमलबजावणी

### आव्हान परिस्थिती

तुम्हाला उत्पादन-तयार AI-संचालित ग्राहक सेवा चॅटबॉट तयार करण्याचे काम देण्यात आले आहे ज्यामध्ये खालील गरजा आहेत:

**कार्यक्षम गरजा:**
- ग्राहक संवादासाठी वेब इंटरफेस
- उत्तरे देण्यासाठी Microsoft Foundry Models सह एकत्रीकरण
- Azure AI Search वापरून दस्तऐवज शोध क्षमता
- विद्यमान ग्राहक डेटाबेससह एकत्रीकरण
- बहुभाषिक समर्थन

**गैर-कार्यशील गरजा:**
- 1000 सहवर्ती वापरकर्त्यांना हाताळणे
- 99.9% अपटाइम SLA
- SOC 2 अनुपालन
- $500/महिना पेक्षा कमी खर्च
- विविध वातावरणांमध्ये (डेव्ह, स्टेजिंग, प्रॉडक्शन) डिप्लॉयमेंट

### अंमलबजावणी टप्पे

1. आर्किटेक्चर डिझाइन करा  
2. AZD टेम्पलेट तयार करा  
3. सुरक्षा उपाय लागू करा  
4. मॉनिटरिंग आणि अलर्टिंग सेट करा  
5. डिप्लॉयमेंट पाईपलाइन तयार करा  
6. सोल्युशनची दस्तऐवजीकरण करा  

### मूल्यांकन निकष

- ✅ **कार्यक्षमता:** सर्व गरजा पूर्ण होतात का?
- ✅ **सुरक्षा:** सर्वोत्तम सराव लागू आहेत का?
- ✅ **स्केलेबिलिटी:** लोड हाताळू शकतो का?
- ✅ **संसाधन व्यवस्थापन:** कोड व इन्फ्रास्ट्रक्चर सुव्यवस्थित आहे का?
- ✅ **खर्च:** बजेटमध्ये आहे का?

## अतिरिक्त संसाधने

### Microsoft दस्तऐवज
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### नमुना टेम्पलेट्स
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### समुदाय स्रोत
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 पूर्णता प्रमाणपत्र

अभिनंदन! आपण AI वर्कशॉप लॅब पूर्ण केली आहे. आपण आता सक्षम असले पाहिजे:

- ✅ विद्यमान AI अनुप्रयोगांना AZD टेम्पलेट्समध्ये रूपांतरित करा
- ✅ उत्पादनासाठी तयार AI अनुप्रयोग तैनात करा
- ✅ AI वर्कलोडसाठी सुरक्षा सर्वोत्तम पद्धती लागू करा
- ✅ AI अनुप्रयोगाच्या कामगिरीचे निरीक्षण आणि अनुकूलन करा
- ✅ सामान्य तैनाती समस्या सोडवा

### पुढील पावले
1. या नमुन्यांना आपल्या स्वत:च्या AI प्रकल्पांवर लागू करा
2. टेम्प्लेट्स समुदायाला परत योगदान द्या
3. सतत समर्थनासाठी Microsoft Foundry Discord मध्ये सहभागी व्हा
4. बहु-प्रदेशीय तैनातीसारख्या प्रगत विषयांचा अभ्यास करा

---

**वर्कशॉप अभिप्राय**: [Microsoft Foundry Discord #Azure channel](https://discord.gg/microsoft-azure) मध्ये आपला अनुभव सामायिक करून या वर्कशॉपला सुधारण्यात मदत करा.

---

**अध्याय नेव्हिगेशन:**
- **📚 कोर्स होम**: [AZD For Beginners](../../README.md)
- **📖 चालू अध्याय**: अध्याय 2 - AI-फर्स्ट विकास
- **⬅️ मागील**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ पुढील**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 पुढील अध्याय**: [अध्याय 3: संरचना](../chapter-03-configuration/configuration.md)

**मदत पाहिजे?** AZD आणि AI तैनातीसंबंधित चर्चा व सहाय्यासाठी आमच्या समुदायात सामील व्हा.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
हा दस्तऐवज AI भाषांतर सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) चा वापर करून अनुवादित केला आहे. जरी आम्ही अचूकतेसाठी प्रयत्न करतो, तरी कृपया लक्षात घ्या की स्वयंचलित भाषांतरांमध्ये त्रुटी किंवा अचूकतेची कमतरता असू शकते. मूळ दस्तऐवज त्याच्या मूळ भाषेत अधिकृत स्रोत मानला पाहिजे. महत्त्वाची माहिती असल्यास, व्यावसायिक मानवी भाषांतराची शिफारस केली जाते. या भाषांतराच्या वापरामुळे उद्भवणाऱ्या कोणत्याही गैरसमज किंवा चुकीच्या अर्थलावणीसाठी आम्ही जबाबदार नाही.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->