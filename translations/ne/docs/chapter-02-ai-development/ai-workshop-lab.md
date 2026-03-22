# AI Workshop Lab: AZD मार्फत तपाईंका AI समाधानहरू परिनियोजनयोग्य बनाउने

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 2 - AI-First Development
- **⬅️ Previous**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Next**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 Next Chapter**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

## Workshop Overview

यो हातेमालो प्रयोगशालाले विकासकर्ताहरूलाई विद्यमान AI टेम्पलेट लिएर Azure Developer CLI (AZD) प्रयोग गरी परिनियोजन गर्ने प्रक्रियामा मार्गदर्शन गर्छ। तपाईं Microsoft Foundry सेवाहरू प्रयोग गरी उत्पादन स्तरीय AI परिनियोजनका आधारभूत ढाँचाहरू सिक्नु हुनेछ।

**Duration:** 2-3 hours  
**Level:** Intermediate  
**Prerequisites:** Basic Azure knowledge, familiarity with AI/ML concepts

## 🎓 Learning Objectives

यस कार्यशालाको अन्त्यमा, तपाईं सक्षम हुनुहुनेछ:
- ✅ विद्यमान AI अनुप्रयोगलाई AZD टेम्पलेटहरू प्रयोग गर्न रूपान्तरण गर्ने
- ✅ AZD सँग Microsoft Foundry सेवाहरू कन्फिगर गर्ने
- ✅ AI सेवाहरूका लागि सुरक्षित प्रमाणपत्र व्यवस्थापन कार्यान्वयन गर्ने
- ✅ अवलोकनसहित उत्पादन-तैयार AI अनुप्रयोगहरू परिनियोजन गर्ने
- ✅ सामान्य AI परिनियोजन समस्याहरू ट्रबलशुट गर्ने

## Prerequisites

### Required Tools
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) इन्स्टल गरिएको
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) इन्स्टल गरिएको
- [Git](https://git-scm.com/) इन्स्टल गरिएको
- कोड सम्पादक (VS Code सिफारिस गरिएको)

### Azure Resources
- Contributor पहुँच भएको Azure सदस्यता
- Microsoft Foundry Models सेवाहरूको पहुँच (वा पहुँच अनुरोध गर्ने क्षमता)
- Resource group सिर्जना गर्ने अनुमति

### Knowledge Prerequisites
- Azure सेवाहरूको आधारभूत समझ
- कमाण्ड-लाइन इन्टरफेसहरूसँग परिचित
- AI/ML का आधारभूत अवधारणाहरू (APIs, मोडेलहरू, प्रम्प्टहरू)

## Lab Setup

### Step 1: Environment Preparation

1. **Verify tool installations:**
```bash
# AZD स्थापना जाँच गर्नुहोस्
azd version

# Azure CLI जाँच गर्नुहोस्
az --version

# Azure मा लगइन गर्नुहोस्
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

AI-तैयार AZD टेम्पलेटका प्रमुख फाइलहरू अन्वेषण गर्नुहोस्:

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

1. **Examine the azure.yaml file:**
```bash
cat azure.yaml
```

**के हेर्नुहोस्:**
- AI कम्पोनेन्टहरूको लागि सेवा परिभाषाहरू
- पर्यावरण भेरिएबल म्यापिङ
- होस्ट विन्यासहरू

2. **Review the main.bicep infrastructure:**
```bash
cat infra/main.bicep
```

**पहिचान गर्नुपर्ने प्रमुख AI ढाँचाहरू:**
- Microsoft Foundry Models सेवाको प्रोभिजनिङ
- Cognitive Search एकीकरण
- सुरक्षित कुञ्जी व्यवस्थापन
- नेटवर्क सुरक्षा विन्यासहरू

### **Discussion Point:** AI का लागि यी ढाँचाहरू किन महत्त्वपूर्ण छन्

- **Service Dependencies**: AI अनुप्रयोगहरूले प्रायः बहु समन्वित सेवाहरू आवश्यक पर्छन्
- **Security**: API कुञ्जीहरू र endpoints लाई सुरक्षित रूपमा व्यवस्थापन गर्न आवश्यक हुन्छ
- **Scalability**: AI कार्यभारहरूसँग सम्बन्धित विशिष्ट स्केलिङ आवश्यकताहरू हुन्छन्
- **Cost Management**: यदि ठीकसँग कन्फिगर नगरिए AI सेवाहरू महँगो हुन सक्छन्

## Module 2: Deploy Your First AI Application

### Step 2.1: Initialize the Environment

1. **Create a new AZD environment:**
```bash
azd env new myai-workshop
```

2. **Set required parameters:**
```bash
# आफ्नो मनपर्ने Azure क्षेत्र सेट गर्नुहोस्
azd env set AZURE_LOCATION eastus

# वैकल्पिक: विशिष्ट OpenAI मोडेल सेट गर्नुहोस्
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### Step 2.2: Deploy the Infrastructure and Application

1. **Deploy with AZD:**
```bash
azd up
```

**`azd up` गर्दा के हुन्छ:**
- ✅ Microsoft Foundry Models सेवा प्रोभिजन गर्छ
- ✅ Cognitive Search सेवा सिर्जना गर्छ
- ✅ वेब अनुप्रयोगको लागि App Service सेटअप गर्छ
- ✅ नेटवर्किङ र सुरक्षा कन्फिगर गर्छ
- ✅ अनुप्रयोग कोड परिनियोजन गर्छ
- ✅ अवलोकन र लगिङ सेटअप गर्छ

2. **परिनियोजन प्रगतिलाई अनुगमन गर्नुहोस्** र सिर्जना भइरहेका स्रोतहरूलाई नोट गर्नुहोस्।

### Step 2.3: Verify Your Deployment

1. **परिनियोजित स्रोतहरू जाँच गर्नुहोस्:**
```bash
azd show
```

2. **परिनियोजित अनुप्रयोग खोल्नुहोस्:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **AI कार्यक्षमता परीक्षण गर्नुहोस्:**
   - वेब अनुप्रयोगमा जानुहोस्
   - नमुना क्वेरीहरू प्रयास गर्नुहोस्
   - AI प्रतिक्रियाहरू ठीकसँग काम गरिरहेको छन् कि छैन जाँच गर्नुहोस्

### **Lab Exercise 2.1: Troubleshooting Practice**

**Scenario**: तपाईंको परिनियोजन सफल भयो तर AI प्रतिक्रिया दिँदैन।

**सामान्य समस्याहरू जाँच गर्न:**
1. **OpenAI API keys**: ती सही रूपमा सेट गरिएको छ कि छैन जाँच गर्नुहोस्
2. **Model availability**: तपाईंको क्षेत्रले मोडेल समर्थन गर्छ कि गर्दैन जाँच गर्नुहोस्
3. **Network connectivity**: सेवाहरूले सञ्चार गर्न सकिरहेका छन् कि छैन सुनिश्चित गर्नुहोस्
4. **RBAC permissions**: अनुप्रयोगले OpenAI पहुँच गर्न सक्छ कि होइन जाँच गर्नुहोस्

**Debugging commands:**
```bash
# वातावरण चरहरू जाँच गर्नुहोस्
azd env get-values

# तैनाती लगहरू हेर्नुहोस्
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# OpenAI तैनाती स्थिति जाँच गर्नुहोस्
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Module 3: Customizing AI Applications for Your Needs

### Step 3.1: Modify the AI Configuration

1. **OpenAI मोडेल अपडेट गर्नुहोस्:**
```bash
# भिन्न मोडेलमा परिवर्तन गर्नुहोस् (यदि तपाईंको क्षेत्रमा उपलब्ध छ भने)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# नयाँ कन्फिगरेसनसहित पुनः तैनात गर्नुहोस्
azd deploy
```

2. **थप AI सेवाहरू थप्नुहोस्:**

`infra/main.bicep` सम्पादन गरेर Document Intelligence थप्नुहोस्:

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

**राम्रो अभ्यास**: विकास र उत्पादनका लागि फरक विन्यासहरू राख्नुहोस्।

1. **उत्पादन वातावरण सिर्जना गर्नुहोस्:**
```bash
azd env new myai-production
```

2. **उत्पादन-विशिष्ट प्यारामिटरहरू सेट गर्नुहोस्:**
```bash
# उत्पादनमा सामान्यतया उच्च SKU हरू प्रयोग गरिन्छ
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# थप सुरक्षा सुविधाहरू सक्षम गर्नुहोस्
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Lab Exercise 3.1: Cost Optimization**

**Challenge**: विकासका लागि लागत-कुशल रूपमा टेम्पलेट कन्फिगर गर्नुहोस्।

**कार्यहरू:**
1. कुन SKUs निःशुल्क/बेसिक स्तरमा सेट गर्न सकिन्छ पहिचान गर्नुहोस्
2. न्यूनतम लागतका लागि वातावरण भेरिएबलहरू कन्फिगर गर्नुहोस्
3. परिनियोजन गरेर उत्पादन कन्फिगरेसनसँग लागत तुलना गर्नुहोस्

**समाधान संकेत:**
- सक्दो अवस्थामा Cognitive Services का लागि F0 (निःशुल्क) टियर प्रयोग गर्नुहोस्
- विकासमा Search Service का लागि Basic टियर प्रयोग गर्नुहोस्
- Functions का लागि Consumption plan विचार गर्नुहोस्

## Module 4: Security and Production Best Practices

### Step 4.1: Secure Credential Management

**हालको चुनौती**: धेरै AI एपहरूले API कुञ्जीहरू हार्डकोड गर्छन् वा असुरक्षित स्टोरेज प्रयोग गर्छन्।

**AZD समाधान**: Managed Identity + Key Vault एकीकरण।

1. **आफ्नो टेम्पलेटमा सुरक्षा कन्फिगरेसन समीक्षा गर्नुहोस्:**
```bash
# Key Vault र Managed Identity को कन्फिगरेसन खोज्नुहोस्
grep -r "keyVault\|managedIdentity" infra/
```

2. **Managed Identity काम गरिरहेको छ कि छैन प्रमाणित गर्नुहोस्:**
```bash
# वेब एपमा सही पहिचान कन्फिगरेसन छ कि छैन जाँच गर्नुहोस्
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Step 4.2: Network Security

1. **निजी endpoints सक्षम गर्नुहोस्** (यदि पहिले नै कन्फिगर नगरिएको भए):

आफ्नो bicep टेम्पलेटमा थप्नुहोस्:
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

1. **Application Insights कन्फिगर गर्नुहोस्:**
```bash
# Application Insights स्वचालित रूपमा कन्फिगर गरिनु पर्छ
# कन्फिगरेशन जाँच गर्नुहोस्:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **AI-विशिष्ट अनुगमन सेटअप गर्नुहोस्:**

AI अपरेसनहरूको लागि कस्टम मेट्रिक्स थप्नुहोस्:
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

**कार्य**: आफ्नो परिनियोजनलाई सुरक्षा उत्कृष्ट अभ्यासहरूका लागि समीक्षा गर्नुहोस्।

**जाँच सूची:**
- [ ] कोड वा कन्फिगरेसनमा कुनै हार्डकोडेड सिक्रेट छैन
- [ ] सेवा-देखि-सेवा प्रमाणिकरणका लागि Managed Identity प्रयोग गरिएको छ
- [ ] संवेदनशील कन्फिगरेसन Key Vault मा भण्डारण गरिएको छ
- [ ] नेटवर्क पहुँच ठीकसँग सीमित गरिएको छ
- [ ] अनुगमन र लगिङ सक्षम गरिएको छ

## Module 5: Converting Your Own AI Application

### Step 5.1: Assessment Worksheet

**आफ्नो अनुप्रयोग रूपान्तरण गर्नु अघि**, यी प्रश्नहरूको उत्तर दिनुहोस्:

1. **Application Architecture:**
   - तपाईंको एपले कुन AI सेवाहरू प्रयोग गर्छ?
   - यसलाई कुन compute स्रोतहरू आवश्यक छन्?
   - के यसलाई डेटाबेस आवश्यक छ?
   - सेवाहरूबीच के निर्भरताहरू छन्?

2. **Security Requirements:**
   - तपाईंको एप कुन संवेदनशील डाटा ह्यान्डल गर्छ?
   - कुन अनुपालन आवश्यकताहरू छन्?
   - के तपाईंलाई निजी नेटवर्किङ आवश्यक छ?

3. **Scaling Requirements:**
   - तपाईंको अपेक्षित लोड कति छ?
   - के तपाईंलाई auto-scaling चाहिन्छ?
   - के क्षेत्रीय आवश्यकताहरू छन्?

### Step 5.2: Create Your AZD Template

**आफ्नो एप रूपान्तरण गर्न यस ढाँचालाई पछ्याउनुहोस्:**

1. **बेसिक संरचना सिर्जना गर्नुहोस्:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# AZD ढाँचा आरम्भ गर्नुहोस्
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

3. **इन्फ्रास्ट्रक्चर टेम्पलेटहरू सिर्जना गर्नुहोस्:**

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

### **Lab Exercise 5.1: Template Creation Challenge**

**Challenge**: Document प्रोसेसिंग AI एपको लागि AZD टेम्पलेट सिर्जना गर्नुहोस्।

**आवश्यकताहरू:**
- सामग्री विश्लेषणका लागि Microsoft Foundry Models
- OCR का लागि Document Intelligence
- दस्तावेज अपलोडका लागि Storage Account
- प्रोसेसिङ लॉजिकका लागि Function App
- प्रयोगकर्ता इन्टरफेसका लागि वेब एप

**बोनस अंकहरू:**
- उचित त्रुटि ह्यान्डलिङ थप्नुहोस्
- लागत अनुमान समावेश गर्नुहोस्
- अनुगमन ड्यासबोर्डहरू सेटअप गर्नुहोस्

## Module 6: Troubleshooting Common Issues

### Common Deployment Issues

#### Issue 1: OpenAI Service Quota Exceeded
**लक्षण:** परिनियोजन quota त्रुटिसँग असफल हुन्छ
**समाधानहरू:**
```bash
# हालको कोटा जाँच गर्नुहोस्
az cognitiveservices usage list --location eastus

# कोटा वृद्धि अनुरोध गर्नुहोस् वा विभिन्न क्षेत्रमा प्रयास गर्नुहोस्
azd env set AZURE_LOCATION westus2
azd up
```

#### Issue 2: Model Not Available in Region
**लक्षण:** AI प्रतिक्रियाहरू असफल हुन्छन् वा मोडेल परिनियोजन त्रुटिहरू आउँछन्
**समाधानहरू:**
```bash
# क्षेत्रअनुसार मोडेल उपलब्धता जाँच गर्नुहोस्
az cognitiveservices model list --location eastus

# उपलब्ध मोडेलमा अपडेट गर्नुहोस्
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### Issue 3: Permission Issues
**लक्षण:** AI सेवाहरू कल गर्दा 403 Forbidden त्रुटिहरू आउँछन्
**समाधानहरू:**
```bash
# भूमिका तोकाइहरू जाँच गर्नुहोस्
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# गुमेका भूमिकाहरू थप्नुहोस्
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Performance Issues

#### Issue 4: Slow AI Responses
**जाँच गर्ने कदमहरू:**
1. Application Insights मा प्रदर्शन मेट्रिक्स जाँच गर्नुहोस्
2. Azure पोर्टलमा OpenAI सेवा मेट्रिक्स समीक्षा गर्नुहोस्
3. नेटवर्क कनेक्टिविटी र लेटेन्सी प्रमाणित गर्नुहोस्

**समाधानहरू:**
- सामान्य क्वेरीहरूको लागि क्यासिङ लागू गर्नुहोस्
- आफ्नो प्रयोग केसका लागि उपयुक्त OpenAI मोडेल प्रयोग गर्नुहोस्
- उच्च-लोड परिदृश्यका लागि रिड रेप्लिकाहरू विचार गर्नुहोस्

### **Lab Exercise 6.1: Debugging Challenge**

**Scenario**: तपाईंको परिनियोजन सफल भयो, तर अनुप्रयोगले 500 त्रुटि फर्काउँछ।

**डिबगिङ कार्यहरू:**
1. अनुप्रयोग लगहरू जाँच गर्नुहोस्
2. सेवा कनेक्टिभिटी प्रमाणित गर्नुहोस्
3. प्रमाणीकरण परीक्षण गर्नुहोस्
4. कन्फिगरेसन समीक्षा गर्नुहोस्

**प्रयोग गर्ने उपकरणहरू:**
- परिनियोजन अवलोकनका लागि `azd show`
- विस्तृत सेवा लगहरूको लागि Azure पोर्टल
- अनुप्रयोग टेलिमेट्रीका लागि Application Insights

## Module 7: Monitoring and Optimization

### Step 7.1: Set Up Comprehensive Monitoring

1. **कस्टम ड्यासबोर्डहरू सिर्जना गर्नुहोस्:**

Azure पोर्टलमा नेभिगेट गरेर निम्नको साथ ड्यासबोर्ड सिर्जना गर्नुहोस्:
- OpenAI अनुरोध गणना र लेटेन्सी
- एप्लिकेशन त्रुटि दरहरू
- स्रोत प्रयोग
- खर्च ट्र्याकिङ

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

### Step 7.2: Cost Optimization

1. **वर्तमान लागतहरू विश्लेषण गर्नुहोस्:**
```bash
# Azure CLI प्रयोग गरेर लागत डेटा प्राप्त गर्नुहोस्
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **लागत नियन्त्रणहरू कार्यान्वयन गर्नुहोस्:**
- बजेट अलर्टहरू सेट अप गर्नुहोस्
- autoscaling नीतिहरू प्रयोग गर्नुहोस्
- अनुरोध क्यासिङ लागू गर्नुहोस्
- OpenAI का token प्रयोग निगरानी गर्नुहोस्

### **Lab Exercise 7.1: Performance Optimization**

**कार्य**: आफ्नो AI एपलाई प्रदर्शन र लागत दुवैका लागि अनुकूलित गर्नुहोस्।

**सुधार गर्नुपर्ने मेट्रिक्स:**
- औसत प्रतिक्रिया समयमा 20% कमी ल्याउनुहोस्
- मासिक लागतहरूमा 15% घटाउनुहोस्
- 99.9% अपटाइम कायम राख्नुहोस्

**प्रयोग गर्ने रणनीतिहरू:**
- प्रतिक्रिया क्यासिङ कार्यान्वयन गर्नुहोस्
- टोकन दक्षताको लागि प्रम्प्टहरू अनुकूलन गर्नुहोस्
- उपयुक्त compute SKUs प्रयोग गर्नुहोस्
- उचित autoscaling सेटअप गर्नुहोस्

## Final Challenge: End-to-End Implementation

### Challenge Scenario

तपाईंलाई उत्पादन-तैयार AI-शक्ति ग्राहक सेवा च्याटबट सिर्जना गर्ने जिम्मेवारी दिइएको छ जुन यी आवश्यकताहरू पूरा गर्छ:

**Functional Requirements:**
- ग्राहक अन्तरक्रियाका लागि वेब इन्टरफेस
- प्रतिक्रियाहरूका लागि Microsoft Foundry Models सँग एकीकरण
- Cognitive Search प्रयोग गरेर दस्तावेज खोज क्षमता
- विद्यमान ग्राहक डेटाबेससँग एकीकरण
- बहु-भाषा समर्थन

**Non-Functional Requirements:**
- 1000 समकालीन प्रयोगकर्ताहरू ह्यान्डल गर्ने क्षमता
- 99.9% अपटाइम SLA
- SOC 2 अनुपालन
- मासिक $500 भन्दा कम लागत
- बहु वातावरणहरूमा परिनियोजन (dev, staging, prod)

### Implementation Steps

1. आर्किटेक्चर डिजाइन गर्नुहोस्
2. AZD टेम्पलेट सिर्जना गर्नुहोस्
3. सुरक्षा उपायहरू कार्यान्वयन गर्नुहोस्
4. अनुगमन र अलर्टिङ सेटअप गर्नुहोस्
5. परिनियोजन पाइपलाइनहरू सिर्जना गर्नुहोस्
6. समाधानलाई डकुमेन्ट गर्नुहोस्

### Evaluation Criteria

- ✅ **Functionality**: के यसले सबै आवश्यकताहरू पूरा गर्दछ?
- ✅ **Security**: के उत्कृष्ट अभ्यासहरू कार्यान्वयन गरिएको छ?
- ✅ **Scalability**: के यो लोड सम्हाल्न सक्छ?
- ✅ **Maintainability**: के कोड र इन्फ्रास्ट्रक्चर राम्रोसँग व्यवस्थित छ?
- ✅ **Cost**: के यो बजेट भित्र रहन्छ?

## Additional Resources

### Microsoft Documentation
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### Sample Templates
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Community Resources
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Completion Certificate

अभिनन्दन! तपाईंले AI Workshop Lab पूरा गर्नुभयो। अब तपाईं सक्षम हुनुहुन्छ:
- ✅ अस्तित्वमा रहेका AI अनुप्रयोगहरूलाई AZD टेम्पलेटहरूमा रूपान्तरण गर्नुहोस्
- ✅ उत्पादन-तयार AI अनुप्रयोगहरू तैनाथ गर्नुहोस्
- ✅ AI वर्कलोडका लागि सुरक्षा सर्वोत्तम अभ्यासहरू लागू गर्नुहोस्
- ✅ AI अनुप्रयोगको प्रदर्शन अनुगमन र अनुकूलन गर्नुहोस्
- ✅ सामान्य तैनाथी समस्याहरू समाधान गर्नुहोस्

### आगामी कदमहरू
1. यी ढाँचाहरू आफ्नै AI परियोजनाहरूमा लागू गर्नुहोस्
2. टेम्पलेटहरू समुदायमा फिर्ता योगदान गर्नुहोस्
3. लगातार समर्थनका लागि Microsoft Foundry Discord मा सामेल हुनुहोस्
4. बहु-क्षेत्र तैनाथी जस्ता उन्नत विषयहरू अन्वेषण गर्नुहोस्

---

**कार्यशाला प्रतिपुष्टि**: हामीलाई यो कार्यशाला सुधार गर्न मद्दत गर्नुहोस् — आफ्नो अनुभव [Microsoft Foundry Discord #Azure च्यानल](https://discord.gg/microsoft-azure) मा साझा गरेर।

---

**अध्याय नेभिगेसन:**
- **📚 पाठ्यक्रम गृह**: [AZD For Beginners](../../README.md)
- **📖 हालको अध्याय**: अध्याय 2 - AI-प्रथम विकास
- **⬅️ अघिल्लो**: [AI मोडेल परिनियोजन](ai-model-deployment.md)
- **➡️ अर्को**: [उत्पादन AI का सर्वोत्तम अभ्यासहरू](production-ai-practices.md)
- **🚀 अर्को अध्याय**: [अध्याय 3: विन्यास](../chapter-03-configuration/configuration.md)

**सहायता चाहिन्छ?** AZD र AI तैनाथीहरूका बारेमा समर्थन र छलफलका लागि हाम्रो समुदायमा सामेल हुनुहोस्।

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
यो दस्तावेज AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) मार्फत अनुवाद गरिएको हो। हामी शुद्धताको लागि प्रयास गर्छौं, तर कृपया ध्यान दिनुहोस् कि स्वचालित अनुवादमा त्रुटि वा असावधानी हुनसक्छ। मूल दस्तावेजलाई यसको मूल भाषामा आधिकारिक स्रोतको रूपमा मानिनुपर्छ। महत्वपूर्ण जानकारीका लागि व्यावसायिक मानव अनुवाद सिफारिस गरिन्छ। हामी यस अनुवादको प्रयोगबाट उत्पन्न हुने कुनै पनि गलतफहमी वा गलत व्याख्याका लागि जिम्मेवार छैनौं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->