# AI वर्कशॉप लैब: आपकी AI सॉल्यूशंस को AZD-Deployable बनाना

**Chapter Navigation:**
- **📚 Course Home**: [AZD शुरुआती के लिए](../../README.md)
- **📖 Current Chapter**: अध्याय 2 - AI-प्रथम विकास
- **⬅️ Previous**: [AI मॉडल परिनियोजन](ai-model-deployment.md)
- **➡️ Next**: [प्रोडक्शन AI सर्वोत्तम प्रथाएँ](production-ai-practices.md)
- **🚀 Next Chapter**: [अध्याय 3: विन्यास](../chapter-03-configuration/configuration.md)

## वर्कशॉप अवलोकन

यह हैंड्स-ऑन लैब डेवलपर्स को मौजूदा AI टेम्पलेट लेकर Azure Developer CLI (AZD) का उपयोग करके उसे परिनियोजित करने की प्रक्रिया के माध्यम से मार्गदर्शन करती है। आप Microsoft Foundry सेवाओं का उपयोग करके प्रोडक्शन AI परिनियोजन के आवश्यक पैटर्न सीखेंगे।

**अवधि:** 2-3 घंटे  
**स्तर:** मध्यवर्ती  
**पूर्व-शर्तें:** बुनियादी Azure ज्ञान, AI/ML अवधारणाओं से परिचित

## 🎓 सीखने के उद्देश्य

इस वर्कशॉप के अंत तक, आप सक्षम होंगे:
- ✅ मौजूदा AI एप्लिकेशन को AZD टेम्पलेट्स का उपयोग करने के लिए परिवर्तित करना
- ✅ AZD के साथ Microsoft Foundry सेवाओं को कॉन्फ़िगर करना
- ✅ AI सेवाओं के लिए सुरक्षित क्रेडेंशियल प्रबंधन लागू करना
- ✅ मॉनिटरिंग के साथ प्रोडक्शन-रेडी AI एप्लिकेशन तैनात करना
- ✅ सामान्य AI परिनियोजन मुद्दों का निवारण करना

## पूर्व-आवश्यकताएँ

### आवश्यक उपकरण
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) इंस्टॉल किया हुआ
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) इंस्टॉल किया हुआ
- [Git](https://git-scm.com/) इंस्टॉल किया हुआ
- कोड एडिटर (VS Code अनुशंसित)

### Azure संसाधन
- कंटरिब्यूटर एक्सेस के साथ Azure सब्सक्रिप्शन
- Microsoft Foundry Models सेवाओं तक पहुंच (या पहुंच का अनुरोध करने की क्षमता)
- रिसोर्स ग्रुप बनाने की अनुमति

### ज्ञान पूर्व-आवश्यकताएँ
- Azure सेवाओं की बुनियादी समझ
- कमांड-लाइन इंटरफेस से परिचय
- AI/ML की बुनियादी अवधारणाएँ (APIs, मॉडल, प्रॉम्प्ट)

## लैब सेटअप

### Step 1: Environment Preparation

1. **टूल इंस्टॉलेशन सत्यापित करें:**
```bash
# AZD स्थापना की जाँच करें
azd version

# Azure CLI की जाँच करें
az --version

# Azure में लॉगिन करें
az login
azd auth login
```

2. **वर्कशॉप रिपॉजिटरी क्लोन करें:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Module 1: Understanding AZD Structure for AI Applications

### Anatomy of an AI AZD Template

AI-रेडी AZD टेम्पलेट में प्रमुख फ़ाइलों का अन्वेषण करें:

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

### **Lab Exercise 1.1: Explore the Configuration**

1. **azure.yaml फ़ाइल की जाँच करें:**
```bash
cat azure.yaml
```

**किस चीज़ पर ध्यान दें:**
- AI कंपोनेंट्स के लिए सर्विस परिभाषाएँ
- वातावरण चर (environment variable) मैपिंग
- होस्ट कॉन्फ़िगरेशन

2. **main.bicep इन्फ्रास्ट्रक्चर की समीक्षा करें:**
```bash
cat infra/main.bicep
```

**पहचानने के लिए प्रमुख AI पैटर्न:**
- Microsoft Foundry Models सेवा प्रोविजनिंग
- Cognitive Search एकीकरण
- सुरक्षित कुंजी प्रबंधन
- नेटवर्क सुरक्षा कॉन्फ़िगरेशन

### **चर्चा बिंदु:** AI के लिए ये पैटर्न क्यों महत्वपूर्ण हैं

- **सेवा निर्भरताएँ**: AI ऐप्स अक्सर कई समन्वित सेवाओं की आवश्यकता रखते हैं
- **सुरक्षा**: API कीज़ और एंडपॉइंट्स का सुरक्षित प्रबंधन आवश्यक है
- **स्केलबिलिटी**: AI वर्कलोड्स की अद्वितीय स्केलिंग आवश्यकताएँ होती हैं
- **लागत प्रबंधन**: AI सेवाएँ सही तरीके से कॉन्फ़िगर न होने पर महंगी हो सकती हैं

## Module 2: Deploy Your First AI Application

### Step 2.1: Initialize the Environment

1. **नया AZD वातावरण बनाएं:**
```bash
azd env new myai-workshop
```

2. **आवश्यक पैरामीटर सेट करें:**
```bash
# अपना पसंदीदा Azure क्षेत्र सेट करें
azd env set AZURE_LOCATION eastus

# वैकल्पिक: विशिष्ट OpenAI मॉडल सेट करें
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### Step 2.2: Deploy the Infrastructure and Application

1. **AZD के साथ परिनियोजित करें:**
```bash
azd up
```

**`azd up` के दौरान क्या होता है:**
- ✅ Microsoft Foundry Models सेवा प्रोविजन करता है
- ✅ Cognitive Search सेवा बनाता है
- ✅ वेब एप्लिकेशन के लिए App Service सेटअप करता है
- ✅ नेटवर्किंग और सुरक्षा कॉन्फ़िगर करता है
- ✅ एप्लिकेशन कोड को परिनियोजित करता है
- ✅ मॉनिटरिंग और लॉगिंग सेटअप करता है

2. **परिनियोजन प्रगति की निगरानी करें** और बने जा रहे संसाधनों को नोट करें।

### Step 2.3: Verify Your Deployment

1. **परिनियोजित संसाधनों की जाँच करें:**
```bash
azd show
```

2. **परिनियोजित एप्लिकेशन खोलें:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **AI कार्यक्षमता का परीक्षण करें:**
   - वेब एप्लिकेशन पर जाएँ
   - नमूना प्रश्न आज़माएँ
   - सत्यापित करें कि AI प्रतिक्रियाएँ काम कर रही हैं

### **Lab Exercise 2.1: Troubleshooting Practice**

**परिदृश्य**: आपका परिनियोजन सफल हुआ लेकिन AI प्रतिक्रिया नहीं दे रहा।

**सामान्य समस्याएँ जिनकी जाँच करें:**
1. **OpenAI API कीज़**: सत्यापित करें कि वे सही तरीके से सेट हैं
2. **मॉडल उपलब्धता**: जाँचें कि आपका क्षेत्र मॉडल को समर्थन करता है या नहीं
3. **नेटवर्क कनेक्टिविटी**: सुनिश्चित करें कि सेवाएँ संवाद कर सकती हैं
4. **RBAC अनुमतियाँ**: सत्यापित करें कि ऐप OpenAI तक पहुँच सकता है

**डिबगिंग कमांड्स:**
```bash
# पर्यावरण चर की जाँच करें
azd env get-values

# तैनाती लॉग देखें
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# OpenAI तैनाती की स्थिति की जाँच करें
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Module 3: Customizing AI Applications for Your Needs

### Step 3.1: Modify the AI Configuration

1. **OpenAI मॉडल अपडेट करें:**
```bash
# यदि आपके क्षेत्र में उपलब्ध हो तो किसी अन्य मॉडल में बदलें
azd env set AZURE_OPENAI_MODEL gpt-4.1

# नई कॉन्फ़िगरेशन के साथ पुनः तैनात करें
azd deploy
```

2. **अतिरिक्त AI सेवाएँ जोड़ें:**

`infra/main.bicep` संपादित करें और Document Intelligence जोड़ें:

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

### Step 3.2: Environment-Specific Configurations

**सर्वोत्तम प्रथा**: विकास और प्रोडक्शन के लिए अलग कॉन्फ़िगरेशन रखें।

1. **प्रोडक्शन वातावरण बनाएं:**
```bash
azd env new myai-production
```

2. **प्रोडक्शन-विशिष्ट पैरामीटर सेट करें:**
```bash
# उत्पादन आम तौर पर उच्च SKU का उपयोग करता है
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# अतिरिक्त सुरक्षा सुविधाएँ सक्षम करें
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Lab Exercise 3.1: Cost Optimization**

**चैलेंज**: विकास के लिए लागत-कुशल तरीके से टेम्पलेट कॉन्फ़िगर करें।

**कार्य:**
1. पहचानें कौन से SKU फ्री/बेसिक टियर्स पर सेट किए जा सकते हैं
2. न्यूनतम लागत के लिए वातावरण चर कॉन्फ़िगर करें
3. परिनियोजित करें और प्रोडक्शन कॉन्फ़िगरेशन के साथ लागतों की तुलना करें

**समाधान संकेत:**
- संभव होने पर Cognitive Services के लिए F0 (फ्री) टियर का उपयोग करें
- विकास में Search Service के लिए Basic टियर का उपयोग करें
- Functions के लिए Consumption प्लान पर विचार करें

## Module 4: Security and Production Best Practices

### Step 4.1: Secure Credential Management

**वर्तमान चुनौती**: कई AI ऐप्स में API कीज़ हार्डकोड्ड होती हैं या असुरक्षित स्टोरेज का उपयोग होता है।

**AZD समाधान**: Managed Identity + Key Vault एकीकरण।

1. **अपने टेम्पलेट में सुरक्षा कॉन्फ़िगरेशन की समीक्षा करें:**
```bash
# Key Vault और Managed Identity कॉन्फ़िगरेशन खोजें
grep -r "keyVault\|managedIdentity" infra/
```

2. **Managed Identity काम कर रही है यह सत्यापित करें:**
```bash
# जाँचें कि वेब ऐप की पहचान कॉन्फ़िगरेशन सही है
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Step 4.2: Network Security

1. **प्राइवेट एंडपॉइंट सक्षम करें** (यदि पहले से कॉन्फ़िगर नहीं है):

अपने bicep टेम्पलेट में जोड़ें:
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

### Step 4.3: Monitoring and Observability

1. **Application Insights कॉन्फ़िगर करें:**
```bash
# Application Insights को स्वचालित रूप से कॉन्फ़िगर किया जाना चाहिए
# कॉन्फ़िगरेशन की जाँच करें:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **AI-विशिष्ट मॉनिटरिंग सेट करें:**

AI ऑपरेशंस के लिए कस्टम मेट्रिक्स जोड़ें:
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

### **Lab Exercise 4.1: Security Audit**

**कार्य**: अपने परिनियोजन की सुरक्षा सर्वोत्तम प्रथाओं के लिए समीक्षा करें।

**चेकलिस्ट:**
- [ ] कोड या कॉन्फ़िगरेशन में कोई हार्डकोड्ड सीक्रेट्स नहीं
- [ ] सेवा-से-सेवा प्रमाणीकरण के लिए Managed Identity का उपयोग
- [ ] संवेदनशील कॉन्फ़िगरेशन Key Vault में संग्रहीत है
- [ ] नेटवर्क एक्सेस सही तरीके से प्रतिबंधित है
- [ ] मॉनिटरिंग और लॉगिंग सक्षम हैं

## Module 5: Converting Your Own AI Application

### Step 5.1: Assessment Worksheet

**अपने ऐप को परिवर्तित करने से पहले**, इन प्रश्नों के उत्तर दें:

1. **एप्लिकेशन आर्किटेक्चर:**
   - आपका ऐप कौन सी AI सेवाएँ उपयोग करता है?
   - इसे किन कंप्यूट संसाधनों की आवश्यकता है?
   - क्या इसे डेटाबेस की आवश्यकता है?
   - सेवाओं के बीच निर्भरताएँ क्या हैं?

2. **सुरक्षा आवश्यकताएँ:**
   - आपका ऐप कौन सा संवेदनशील डेटा संभालता है?
   - आपके पास कौन सी अनुपालन आवश्यकताएँ हैं?
   - क्या आपको प्राइवेट नेटवर्किंग की आवश्यकता है?

3. **स्केलिंग आवश्यकताएँ:**
   - आपका अपेक्षित लोड क्या है?
   - क्या आपको ऑटो-स्केलिंग चाहिए?
   - क्या क्षेत्रीय आवश्यकताएँ हैं?

### Step 5.2: Create Your AZD Template

**अपने ऐप को परिवर्तित करने के लिए इस पैटर्न का पालन करें:**

1. **बुनियादी संरचना बनाएँ:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# AZD टेम्पलेट प्रारंभ करें
azd init --template minimal
```

2. **azure.yaml बनाएँ:**
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

3. **इन्फ्रास्ट्रक्चर टेम्पलेट्स बनाएँ:**

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

### **Lab Exercise 5.1: Template Creation Challenge**

**चैलेंज**: एक दस्तावेज़ प्रोसेसिंग AI ऐप के लिए AZD टेम्पलेट बनाएं।

**आवश्यकताएँ:**
- सामग्री विश्लेषण के लिए Microsoft Foundry Models
- OCR के लिए Document Intelligence
- दस्तावेज़ अपलोड के लिए Storage Account
- प्रोसेसिंग लॉजिक के लिए Function App
- यूज़र इंटरफ़ेस के लिए वेब ऐप

**बोनस अंक:**
- उपयुक्त त्रुटि हैंडलिंग जोड़ें
- लागत अनुमान शामिल करें
- मॉनिटरिंग डैशबोर्ड्स सेटअप करें

## Module 6: Troubleshooting Common Issues

### Common Deployment Issues

#### Issue 1: OpenAI Service Quota Exceeded
**लक्षण:** परिनियोजन क्वोटा त्रुटि के साथ असफल होता है
**समाधान:**
```bash
# वर्तमान कोटा जांचें
az cognitiveservices usage list --location eastus

# कोटा बढ़ाने का अनुरोध करें या किसी अलग क्षेत्र को आज़माएँ
azd env set AZURE_LOCATION westus2
azd up
```

#### Issue 2: Model Not Available in Region
**लक्षण:** AI प्रतिक्रियाएँ असफल होती हैं या मॉडल परिनियोजन त्रुटियाँ आती हैं
**समाधान:**
```bash
# क्षेत्र के अनुसार मॉडल की उपलब्धता की जांच करें
az cognitiveservices model list --location eastus

# उपलब्ध मॉडल पर अपडेट करें
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### Issue 3: Permission Issues
**लक्षण:** AI सेवाओं को कॉल करते समय 403 Forbidden त्रुटियाँ
**समाधान:**
```bash
# भूमिका आवंटनों की जांच करें
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# अनुपस्थित भूमिकाएँ जोड़ें
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Performance Issues

#### Issue 4: Slow AI Responses
**जांच के चरण:**
1. प्रदर्शन मेट्रिक्स के लिए Application Insights देखें
2. Azure पोर्टल में OpenAI सेवा मेट्रिक्स की समीक्षा करें
3. नेटवर्क कनेक्टिविटी और लेटेंसी सत्यापित करें

**समाधान:**
- सामान्य प्रश्नों के लिए कैशिंग लागू करें
- अपने उपयोग मामले के लिए उपयुक्त OpenAI मॉडल का उपयोग करें
- उच्च-लोड परिदृश्यों के लिए रीड रेप्लिका पर विचार करें

### **Lab Exercise 6.1: Debugging Challenge**

**परिदृश्य**: आपका परिनियोजन सफल हुआ, लेकिन एप्लिकेशन 500 त्रुटियाँ दे रहा है।

**डिबगिंग कार्य:**
1. एप्लिकेशन लॉग्स की जाँच करें
2. सेवा कनेक्टिविटी सत्यापित करें
3. प्रमाणीकरण का परीक्षण करें
4. कॉन्फ़िगरेशन की समीक्षा करें

**उपयोग के लिए टूल्स:**
- परिनियोजन अवलोकन के लिए `azd show`
- विस्तृत सेवा लॉग्स के लिए Azure पोर्टल
- एप्लिकेशन टेलीमेट्री के लिए Application Insights

## Module 7: Monitoring and Optimization

### Step 7.1: Set Up Comprehensive Monitoring

1. **कस्टम डैशबोर्ड बनाएं:**

Azure पोर्टल पर नेविगेट करें और निम्न के साथ एक डैशबोर्ड बनाएं:
- OpenAI अनुरोध गणना और लेटेंसी
- एप्लिकेशन त्रुटि दरें
- संसाधन उपयोग
- लागत ट्रैकिंग

2. **अलर्ट सेट करें:**
```bash
# उच्च त्रुटि दर के लिए अलर्ट
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### Step 7.2: Cost Optimization

1. **वर्तमान लागतों का विश्लेषण करें:**
```bash
# Azure CLI का उपयोग करके लागत डेटा प्राप्त करें
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **लागत नियंत्रण लागू करें:**
- बजट अलर्ट सेट करें
- autoscaling नीतियों का उपयोग करें
- अनुरोध कैशिंग लागू करें
- OpenAI के लिए टोकन उपयोग की निगरानी करें

### **Lab Exercise 7.1: Performance Optimization**

**कार्य**: अपने AI एप्लिकेशन को प्रदर्शन और लागत दोनों के लिए अनुकूलित करें।

**सुधारने के लिए मेट्रिक्स:**
- औसत प्रतिक्रिया समय 20% तक कम करें
- मासिक लागत 15% तक कम करें
- 99.9% अपटाइम बनाये रखें

**कोशिश करने के रणनीतियाँ:**
- प्रतिक्रिया कैशिंग लागू करें
- टोकन दक्षता के लिए प्रॉम्प्ट्स का अनुकूलन करें
- उपयुक्त कंप्यूट SKUs का उपयोग करें
- उचित ऑटोस्केलिंग सेटअप करें

## Final Challenge: End-to-End Implementation

### Challenge Scenario

आपका कार्य एक प्रोडक्शन-रेडी AI-पावर्ड ग्राहक सेवा चैटबोट बनाना है जिनकी आवश्यकताएँ निम्न हैं:

**कार्यात्मक आवश्यकताएँ:**
- ग्राहक इंटरैक्शन के लिए वेब इंटरफ़ेस
- प्रतिक्रियाओं के लिए Microsoft Foundry Models के साथ एकीकरण
- Cognitive Search का उपयोग करके दस्तावेज़ खोज क्षमता
- मौजूदा ग्राहक डेटाबेस के साथ एकीकरण
- बहु-भाषा समर्थन

**गैर-कार्यात्मक आवश्यकताएँ:**
- 1000 समकालिक उपयोगकर्ताओं को संभालना
- 99.9% अपटाइम SLA
- SOC 2 अनुपालन
- $500/माह से कम लागत
- कई वातावरणों में परिनियोजित करना (dev, staging, prod)

### Implementation Steps

1. **आर्किटेक्चर डिज़ाइन करें**
2. **AZD टेम्पलेट बनाएँ**
3. **सुरक्षा उपाय लागू करें**
4. **मॉनिटरिंग और अलर्टिंग सेटअप करें**
5. **डिप्लॉयमेंट पाइपलाइन्स बनाएं**
6. **सोल्यूशन का दस्तावेज़ीकरण करें**

### मूल्यांकन मानदण्ड

- ✅ **फ़ंक्शनैलिटी**: क्या यह सभी आवश्यकताओं को पूरा करता है?
- ✅ **सुरक्षा**: क्या सर्वोत्तम प्रथाएँ लागू की गई हैं?
- ✅ **स्केलेबिलिटी**: क्या यह लोड संभाल सकता है?
- ✅ **रखरखाव योग्यता**: क्या कोड और इन्फ्रास्ट्रक्चर व्यवस्थित हैं?
- ✅ **लागत**: क्या यह बजट के भीतर है?

## अतिरिक्त संसाधन

### Microsoft प्रलेखन
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### नमूना टेम्पलेट्स
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### कम्युनिटी रिसोर्सेज
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Completion Certificate

बधाई हो! आपने AI वर्कशॉप लैब पूरा कर लिया है। अब आपको सक्षम होना चाहिए:
- ✅ मौजूदा AI अनुप्रयोगों को AZD टेम्पलेट्स में परिवर्तित करें
- ✅ उत्पादन-तैयार AI अनुप्रयोगों को डिप्लॉय करें
- ✅ AI वर्कलोड्स के लिए सुरक्षा सर्वोत्तम प्रथाओं को लागू करें
- ✅ AI अनुप्रयोग प्रदर्शन की निगरानी और अनुकूलन करें
- ✅ सामान्य डिप्लॉयमेंट समस्याओं का समाधान करें

### अगले कदम
1. इन पैटर्नों को अपने AI प्रोजेक्ट्स पर लागू करें
2. टेम्पलेट्स को समुदाय में वापस योगदान करें
3. निरंतर सहायता के लिए Microsoft Foundry Discord में शामिल हों
4. मल्टी-रीजन डिप्लॉयमेंट जैसे उन्नत विषयों का अन्वेषण करें

---

**वर्कशॉप प्रतिक्रिया**: कृपया अपने अनुभव को [Microsoft Foundry Discord #Azure चैनल](https://discord.gg/microsoft-azure) में साझा करके इस वर्कशॉप को बेहतर बनाने में हमारी मदद करें।

---

**अध्याय नेविगेशन:**
- **📚 पाठ्यक्रम होम**: [AZD शुरुआती के लिए](../../README.md)
- **📖 वर्तमान अध्याय**: अध्याय 2 - AI-प्रथम विकास
- **⬅️ पिछला**: [AI मॉडल डिप्लॉयमेंट](ai-model-deployment.md)
- **➡️ अगला**: [उत्पादन AI सर्वोत्तम प्रथाएँ](production-ai-practices.md)
- **🚀 अगला अध्याय**: [अध्याय 3: विन्यास](../chapter-03-configuration/configuration.md)

**क्या मदद चाहिए?** AZD और AI डिप्लॉयमेंट्स के बारे में सहायता और चर्चाओं के लिए हमारे समुदाय में शामिल हों।

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
यह दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके अनुवादित किया गया है। जबकि हम सटीकता के लिए प्रयास करते हैं, कृपया ध्यान रखें कि स्वचालित अनुवादों में त्रुटियाँ या असत्यताएँ हो सकती हैं। मूल दस्तावेज़ अपनी मूल भाषा में प्रामाणिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए, पेशेवर मानव अनुवाद की सिफारिश की जाती है। हम इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए उत्तरदायी नहीं हैं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->