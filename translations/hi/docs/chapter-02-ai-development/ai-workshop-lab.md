# AI Workshop Lab: Making Your AI Solutions AZD-Deployable

**Chapter Navigation:**
- **📚 Course Home**: [AZD शुरुआती के लिए](../../README.md)
- **📖 Current Chapter**: अध्याय 2 - AI-प्रथम विकास
- **⬅️ Previous**: [AI मॉडल परिनियोजन](ai-model-deployment.md)
- **➡️ Next**: [उत्पादन AI सर्वोत्तम अभ्यास](production-ai-practices.md)
- **🚀 Next Chapter**: [अध्याय 3: विन्यास](../chapter-03-configuration/configuration.md)

## Workshop Overview

यह हैंड्स-ऑन लैब डेवलपर्स को मौजूदा AI टेम्पलेट लेकर Azure Developer CLI (AZD) का उपयोग करके उसे परिनियोजित करने की प्रक्रिया के माध्यम से मार्गदर्शन करती है। आप Microsoft Foundry सेवाओं का उपयोग कर production AI परिनियोजन के लिए आवश्यक पैटर्न सीखेंगे।

**Duration:** 2-3 hours  
**Level:** Intermediate  
**Prerequisites:** Basic Azure knowledge, familiarity with AI/ML concepts

## 🎓 Learning Objectives

By the end of this workshop, you will be able to:
- ✅ मौजूदा AI एप्लिकेशन को AZD टेम्पलेट्स का उपयोग करने के लिए परिवर्तित करें
- ✅ Microsoft Foundry सेवाओं को AZD के साथ कॉन्फ़िगर करें
- ✅ AI सेवाओं के लिए सुरक्षित क्रेडेंशियल प्रबंधन लागू करें
- ✅ मॉनिटरिंग के साथ उत्पादन-तैयार AI एप्लिकेशन परिनियोजित/परिनियोजित करें
- ✅ सामान्य AI परिनियोजन समस्याओं का निवारण करें

## Prerequisites

### Required Tools
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) स्थापित
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) स्थापित
- [Git](https://git-scm.com/) स्थापित
- कोड एडिटर (VS Code की सिफारिश)

### Azure Resources
- Contributor पहुँच के साथ Azure सदस्यता
- Azure OpenAI सेवाओं तक पहुंच (या पहुंच का अनुरोध करने की क्षमता)
- Resource group बनाने की अनुमतियाँ

### Knowledge Prerequisites
- Azure सेवाओं की बुनियादी समझ
- कमांड-लाइन इंटरफेस से परिचितता
- AI/ML की बुनियादी अवधारणाएँ (APIs, models, prompts)

## Lab Setup

### Step 1: Environment Preparation

1. **Verify tool installations:**
```bash
# AZD इंस्टॉलेशन जांचें
azd version

# Azure CLI जांचें
az --version

# Azure में लॉगिन करें
az login
azd auth login
```

2. **Clone the workshop repository:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Module 1: Understanding AZD Structure for AI Applications

### Anatomy of an AI AZD Template

Explore the key files in an AI-ready AZD template:

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

### **Lab Exercise 1.1: Explore the Configuration**

1. **Examine the azure.yaml file:**
```bash
cat azure.yaml
```

**What to look for:**
- AI घटकों के लिए सेवा परिभाषाएँ
- पर्यावरण वेरिएबल मैपिंग
- होस्ट कॉन्फ़िगरेशन

2. **Review the main.bicep infrastructure:**
```bash
cat infra/main.bicep
```

**Key AI patterns to identify:**
- Azure OpenAI सेवा का प्रावधान
- Cognitive Search एकीकरण
- सुरक्षित कुंजी प्रबंधन
- नेटवर्क सुरक्षा कॉन्फ़िगरेशन

### **Discussion Point:** Why These Patterns Matter for AI

- **Service Dependencies**: AI एप्लिकेशंस अक्सर कई समन्वित सेवाओं की आवश्यकता रखते हैं
- **Security**: API keys और endpoints को सुरक्षित तरीके से प्रबंधित करने की आवश्यकता होती है
- **Scalability**: AI वर्कलोड के लिए अनन्य स्केलिंग आवश्यकताएँ होती हैं
- **Cost Management**: यदि सही तरीके से कॉन्फ़िगर नहीं किया गया तो AI सेवाएँ महंगी हो सकती हैं

## Module 2: Deploy Your First AI Application

### Step 2.1: Initialize the Environment

1. **Create a new AZD environment:**
```bash
azd env new myai-workshop
```

2. **Set required parameters:**
```bash
# अपना पसंदीदा Azure क्षेत्र सेट करें
azd env set AZURE_LOCATION eastus

# वैकल्पिक: विशिष्ट OpenAI मॉडल सेट करें
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### Step 2.2: Deploy the Infrastructure and Application

1. **Deploy with AZD:**
```bash
azd up
```

**What happens during `azd up`:**
- ✅ Azure OpenAI सेवा प्रोविजन होती है
- ✅ Cognitive Search सेवा बनती है
- ✅ वेब एप्लिकेशन के लिए App Service सेट अप होता है
- ✅ नेटवर्किंग और सुरक्षा कॉन्फ़िगर होती है
- ✅ एप्लिकेशन कोड परिनियोजित होता है
- ✅ मॉनिटरिंग और लॉगिंग सेट अप होती है

2. **Monitor the deployment progress** और बनाए जा रहे संसाधनों को नोट करें।

### Step 2.3: Verify Your Deployment

1. **Check the deployed resources:**
```bash
azd show
```

2. **Open the deployed application:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **Test the AI functionality:**
   - वेब एप्लिकेशन पर नेविगेट करें
   - नमूना प्रश्न आजमाएँ
   - सत्यापित करें कि AI प्रतिक्रियाएँ काम कर रही हैं

### **Lab Exercise 2.1: Troubleshooting Practice**

**Scenario**: आपका डिप्लॉयमेंट सफल हुआ लेकिन AI प्रतिक्रिया नहीं दे रहा है।

**Common issues to check:**
1. **OpenAI API keys**: सुनिश्चित करें कि वे सही तरीके से सेट हैं
2. **Model availability**: जांचें कि आपका क्षेत्र मॉडल का समर्थन करता है या नहीं
3. **Network connectivity**: सुनिश्चित करें कि सेवाएँ संवाद कर सकती हैं
4. **RBAC permissions**: सत्यापित करें कि ऐप OpenAI तक पहुँच सकता है

**Debugging commands:**
```bash
# पर्यावरण चर जांचें
azd env get-values

# परिनियोजन लॉग देखें
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# OpenAI परिनियोजन की स्थिति जांचें
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Module 3: Customizing AI Applications for Your Needs

### Step 3.1: Modify the AI Configuration

1. **Update the OpenAI model:**
```bash
# यदि आपके क्षेत्र में उपलब्ध हो तो किसी अलग मॉडल में बदलें
azd env set AZURE_OPENAI_MODEL gpt-4

# नई कॉन्फ़िगरेशन के साथ पुनः तैनात करें
azd deploy
```

2. **Add additional AI services:**

Edit `infra/main.bicep` to add Document Intelligence:

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

**Best Practice**: विकास और उत्पादन के लिए अलग-अलग कॉन्फ़िगरेशन रखें।

1. **Create a production environment:**
```bash
azd env new myai-production
```

2. **Set production-specific parameters:**
```bash
# उत्पादन में आम तौर पर उच्च SKUs का उपयोग किया जाता है
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# अतिरिक्त सुरक्षा सुविधाओं को सक्षम करें
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Lab Exercise 3.1: Cost Optimization**

**Challenge**: लागत-कुशल विकास के लिए टेम्पलेट कॉन्फ़िगर करें।

**Tasks:**
1. पहचानें कि कौन से SKUs को free/basic टियर पर सेट किया जा सकता है
2. न्यूनतम लागत के लिए एनवायरनमेंट वेरिएबल कॉन्फ़िगर करें
3. परिनियोजित करें और उत्पादन कॉन्फ़िगरेशन के साथ लागत की तुलना करें

**Solution hints:**
- संभव हो तो Cognitive Services के लिए F0 (free) टियर का उपयोग करें
- विकास में Search Service के लिए Basic टियर का उपयोग करें
- Functions के लिए Consumption plan पर विचार करें

## Module 4: Security and Production Best Practices

### Step 4.1: Secure Credential Management

**Current challenge**: कई AI ऐप्स API keys को हार्डकोड करते हैं या असुरक्षित स्टोरेज का उपयोग करते हैं।

**AZD Solution**: Managed Identity + Key Vault एकीकरण।

1. **Review the security configuration in your template:**
```bash
# Key Vault और Managed Identity कॉन्फ़िगरेशन की तलाश करें
grep -r "keyVault\|managedIdentity" infra/
```

2. **Verify Managed Identity is working:**
```bash
# जांचें कि वेब ऐप की पहचान कॉन्फ़िगरेशन सही है
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Step 4.2: Network Security

1. **Enable private endpoints** (if not already configured):

Add to your bicep template:
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

1. **Configure Application Insights:**
```bash
# Application Insights स्वचालित रूप से कॉन्फ़िगर होना चाहिए
# कॉन्फ़िगरेशन की जाँच करें:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Set up AI-specific monitoring:**

Add custom metrics for AI operations:
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

**Task**: अपने डिप्लॉयमेंट की सुरक्षा सर्वोत्तम प्रथाओं के लिए समीक्षा करें।

**Checklist:**
- [ ] कोड या कॉन्फ़िगरेशन में कोई हार्डकोडेड सीक्रेट नहीं है
- [ ] Managed Identity का उपयोग सेवा-से-सेवा प्रमाणीकरण के लिए किया गया है
- [ ] Key Vault संवेदनशील कॉन्फ़िगरेशन संग्रहीत करता है
- [ ] नेटवर्क एक्सेस सही तरीके से प्रतिबंधित है
- [ ] मॉनिटरिंग और लॉगिंग सक्षम हैं

## Module 5: Converting Your Own AI Application

### Step 5.1: Assessment Worksheet

**Before converting your app**, इन प्रश्नों के उत्तर दें:

1. **Application Architecture:**
   - आपका ऐप कौन सी AI सेवाएँ उपयोग करता है?
   - इसके लिए किस प्रकार के compute संसाधनों की आवश्यकता है?
   - क्या इसे डेटाबेस की आवश्यकता है?
   - सेवाओं के बीच निर्भरताएँ क्या हैं?

2. **Security Requirements:**
   - आपका ऐप किस संवेदनशील डेटा को संभालता है?
   - आपके पास कौन से अनुपालन आवश्यकताएं हैं?
   - क्या आपको निजी नेटवर्किंग की आवश्यकता है?

3. **Scaling Requirements:**
   - आपकी अपेक्षित लोड क्या है?
   - क्या आपको ऑटो-स्केलिंग की आवश्यकता है?
   - क्या क्षेत्रीय आवश्यकताएँ हैं?

### Step 5.2: Create Your AZD Template

**Follow this pattern to convert your app:**

1. **Create the basic structure:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# AZD टेम्पलेट प्रारंभ करें
azd init --template minimal
```

2. **Create azure.yaml:**
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

3. **Create infrastructure templates:**

**infra/main.bicep** - Main template:
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

**infra/modules/openai.bicep** - OpenAI module:
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

**Challenge**: एक डॉ큐मेंट प्रोसेसिंग AI ऐप के लिए AZD टेम्पलेट बनाएं।

**Requirements:**
- कंटेंट विश्लेषण के लिए Azure OpenAI
- OCR के लिए Document Intelligence
- दस्तावेज़ अपलोड के लिए Storage Account
- प्रोसेसिंग लॉजिक के लिए Function App
- उपयोगकर्ता इंटरफ़ेस के लिए Web app

**Bonus points:**
- उचित त्रुटि हैंडलिंग जोड़ें
- लागत अनुमान शामिल करें
- मॉनिटरिंग डैशबोर्ड सेट अप करें

## Module 6: Troubleshooting Common Issues

### Common Deployment Issues

#### Issue 1: OpenAI Service Quota Exceeded
**Symptoms:** परिनियोजन कोटा त्रुटि के साथ विफल होता है  
**Solutions:**
```bash
# वर्तमान कोटा जाँचें
az cognitiveservices usage list --location eastus

# कोटा वृद्धि का अनुरोध करें या किसी अन्य क्षेत्र को आज़माएँ
azd env set AZURE_LOCATION westus2
azd up
```

#### Issue 2: Model Not Available in Region
**Symptoms:** AI प्रतिक्रियाएँ विफल होती हैं या मॉडल परिनियोजन त्रुटियाँ आती हैं  
**Solutions:**
```bash
# क्षेत्र के अनुसार मॉडल की उपलब्धता जाँचें
az cognitiveservices model list --location eastus

# उपलब्ध मॉडल पर अपडेट करें
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### Issue 3: Permission Issues
**Symptoms:** AI सेवाओं को कॉल करते समय 403 Forbidden त्रुटियाँ  
**Solutions:**
```bash
# भूमिका आवंटन जांचें
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# लापता भूमिकाएँ जोड़ें
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Performance Issues

#### Issue 4: Slow AI Responses
**Investigation steps:**
1. प्रदर्शन मेट्रिक्स के लिए Application Insights जाँचें
2. Azure पोर्टल में OpenAI सेवा मेट्रिक्स की समीक्षा करें
3. नेटवर्क कनेक्टिविटी और लेटेंसी सत्यापित करें

**Solutions:**
- सामान्य प्रश्नों के लिए कैशिंग लागू करें
- अपने उपयोग के केस के लिए उपयुक्त OpenAI मॉडल चुनें
- उच्च लोड पर पढ़ने के लिए रीड रेप्लिका पर विचार करें

### **Lab Exercise 6.1: Debugging Challenge**

**Scenario**: आपका डिप्लॉयमेंट सफल हुआ, लेकिन एप्लिकेशन 500 त्रुटियाँ返 देता है।

**Debugging tasks:**
1. एप्लिकेशन लॉग जाँचें
2. सेवा कनेक्टिविटी सत्यापित करें
3. प्रमाणीकरण का परीक्षण करें
4. कॉन्फ़िगरेशन की समीक्षा करें

**Tools to use:**
- `azd show` परिनियोजन अवलोकन के लिए
- विस्तृत सेवा लॉग के लिए Azure पोर्टल
- एप्लिकेशन टेलीमेट्री के लिए Application Insights

## Module 7: Monitoring and Optimization

### Step 7.1: Set Up Comprehensive Monitoring

1. **Create custom dashboards:**

Azure पोर्टल पर नेविगेट करें और एक डैशबोर्ड बनाएं जिसमें:
- OpenAI अनुरोध संख्या और विलंबता
- एप्लिकेशन त्रुटि दरें
- संसाधन उपयोग
- लागत ट्रैकिंग

2. **Set up alerts:**
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

1. **Analyze current costs:**
```bash
# Azure CLI का उपयोग करके लागत डेटा प्राप्त करें
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Implement cost controls:**
- बजट अलर्ट सेट करें
- ऑटोस्केलिंग नीतियों का उपयोग करें
- अनुरोध कैशिंग लागू करें
- OpenAI के लिए टोकन उपयोग की निगरानी करें

### **Lab Exercise 7.1: Performance Optimization**

**Task**: अपने AI एप्लिकेशन को प्रदर्शन और लागत दोनों के लिए अनुकूलित करें।

**Metrics to improve:**
- औसत प्रतिक्रिया समय को 20% कम करें
- मासिक लागत को 15% कम करें
- 99.9% अपटाइम बनाए रखें

**Strategies to try:**
- रिस्पॉन्स कैशिंग लागू करें
- टोकन दक्षता के लिए प्रॉम्प्ट्स अनुकूलित करें
- उपयुक्त compute SKUs का उपयोग करें
- सही ऑटोस्केलिंग सेट करें

## Final Challenge: End-to-End Implementation

### Challenge Scenario

आपको एक production-तैयार AI-पावर्ड ग्राहक सेवा चैटबॉट बनाने का कार्य दिया गया है जिनकी आवश्यकताएँ निम्न हैं:

**Functional Requirements:**
- ग्राहक इंटरैक्शन के लिए वेब इंटरफ़ेस
- प्रतिक्रियाओं के लिए Azure OpenAI के साथ एकीकरण
- Cognitive Search का उपयोग करके दस्तावेज़ खोज क्षमता
- मौजूदा ग्राहक डेटाबेस के साथ एकीकरण
- बहु-भाषा समर्थन

**Non-Functional Requirements:**
- 1000 समकालिक उपयोगकर्ताओं को हैंडल करें
- 99.9% अपटाइम SLA
- SOC 2 अनुपालन
- $500/माह से कम लागत
- कई एनवायरनमेंट (dev, staging, prod) में परिनियोजित करें

### Implementation Steps

1. आर्किटेक्चर डिज़ाइन करें
2. AZD टेम्पलेट बनाएं
3. सुरक्षा उपाय लागू करें
4. मॉनिटरिंग और अलर्टिंग सेट अप करें
5. परिनियोजन पाइपलाइन्स बनाएं
6. समाधान का दस्तावेज़ीकरण करें

### Evaluation Criteria

- ✅ **Functionality**: क्या यह सभी आवश्यकताओं को पूरा करता है?
- ✅ **Security**: क्या सर्वोत्तम प्रथाएँ लागू की गई हैं?
- ✅ **Scalability**: क्या यह लोड संभाल सकता है?
- ✅ **Maintainability**: क्या कोड और इन्फ्रास्ट्रक्चर सुव्यवस्थित हैं?
- ✅ **Cost**: क्या यह बजट के भीतर है?

## Additional Resources

### Microsoft Documentation
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

## 🎓 Completion Certificate
बधाई हो! आप AI Workshop Lab पूरा कर चुके हैं। अब आप निम्न कार्य कर सकने में सक्षम होने चाहिए:

- ✅ मौजूदा AI एप्लिकेशन को AZD टेम्पलेट्स में परिवर्तित करना
- ✅ प्रोडक्शन-तैयार AI एप्लिकेशन तैनात करना
- ✅ AI वर्कलोड के लिए सुरक्षा सर्वोत्तम प्रथाओं को लागू करना
- ✅ AI एप्लिकेशन के प्रदर्शन की निगरानी और अनुकूलन करना
- ✅ सामान्य तैनाती समस्याओं का निवारण करना

### अगले कदम
1. अपनी AI परियोजनाओं में इन पैटर्नों को लागू करें
2. टेम्पलेट्स को समुदाय में योगदान करें
3. सतत समर्थन के लिए Microsoft Foundry Discord में शामिल हों
4. मल्टी-रीजन तैनाती जैसे उन्नत विषयों का अन्वेषण करें

---

**Workshop Feedback**: कृपया अपना अनुभव [Microsoft Foundry Discord #Azure चैनल](https://discord.gg/microsoft-azure) में साझा करके इस वर्कशॉप को बेहतर बनाने में हमारी मदद करें।

---

**अध्याय नेविगेशन:**
- **📚 Course Home**: [AZD शुरुआती के लिए](../../README.md)
- **📖 वर्तमान अध्याय**: अध्याय 2 - AI-प्रथम विकास
- **⬅️ पिछला**: [AI मॉडल तैनाती](ai-model-deployment.md)
- **➡️ अगला**: [प्रोडक्शन AI सर्वोत्तम प्रथाएँ](production-ai-practices.md)
- **🚀 अगला अध्याय**: [अध्याय 3: कॉन्फ़िगरेशन](../chapter-03-configuration/configuration.md)

**मदद चाहिए?** हमारे समुदाय में शामिल होकर AZD और AI तैनाती के बारे में समर्थन और चर्चा प्राप्त करें।

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
अस्वीकरण:
यह दस्तावेज़ AI अनुवाद सेवा Co-op Translator (https://github.com/Azure/co-op-translator) का उपयोग करके अनुवादित किया गया है। हम सटीकता के लिए प्रयासशील हैं, फिर भी कृपया ध्यान रखें कि स्वचालित अनुवादों में त्रुटियाँ या अशुद्धियाँ हो सकती हैं। मूल भाषा में उपलब्ध दस्तावेज़ को ही प्राधिकृत/अधिकारिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए पेशेवर मानव अनुवाद की सिफारिश की जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या भ्रामक व्याख्या के लिए हम उत्तरदायी नहीं हैं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->