# AI Workshop Lab: Making Your AI Solutions AZD-Deployable

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: চ্যাপটার 2 - এআই-প্রথম উন্নয়ন
- **⬅️ Previous**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Next**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 Next Chapter**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

## Workshop Overview

এই হ্যান্ডস-অন ল্যাব ডেভেলপারদের একটি বিদ্যমান এআই টেমপ্লেট নিয়ে Azure Developer CLI (AZD) ব্যবহার করে এটি ডিপ্লয় করার প্রক্রিয়ায় গাইড করে। আপনি Microsoft Foundry সার্ভিস ব্যবহার করে প্রোডাকশন-স্তরের এআই ডিপ্লয়মেন্টের জন্য গুরুত্বপূর্ণ প্যাটার্নগুলি শিখবেন।

**Duration:** 2-3 hours  
**Level:** Intermediate  
**Prerequisites:** Basic Azure knowledge, familiarity with AI/ML concepts

## 🎓 Learning Objectives

ওয়ার্কশপের শেষে, আপনি সক্ষম হবেন:
- ✅ একটি বিদ্যমান এআই অ্যাপ্লিকেশনকে AZD টেমপ্লেট ব্যবহার করার জন্য রূপান্তর করা
- ✅ AZD দিয়ে Microsoft Foundry সার্ভিস কনফিগার করা
- ✅ এআই সার্ভিসের জন্য নিরাপদ ক্রেডেনশিয়াল ম্যানেজমেন্ট বাস্তবায়ন করা
- ✅ মনিটরিংসহ প্রোডাকশন-রেডি এআই অ্যাপ্লিকেশন ডিপ্লয় করা
- ✅ সাধারণ এআই ডিপ্লয়মেন্ট সমস্যা সমাধান করা

## Prerequisites

### Required Tools
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) ইনস্টল করা আছে
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) ইনস্টল করা আছে
- [Git](https://git-scm.com/) ইনস্টল করা আছে
- কোড এডিটর (VS Code সুপারিশ করা হয়)

### Azure Resources
- contributor access সহ Azure subscription
- Azure OpenAI সার্ভিসে অ্যাক্সেস (অথবা অ্যাক্সেস অনুরোধ করার সক্ষমতা)
- Resource group তৈরি করার অনুমতি

### Knowledge Prerequisites
- Azure সার্ভিসগুলির মৌলিক ধারণা
- কমান্ড-লাইন ইন্টারফেসগুলোর পরিচিতি
- মৌলিক এআই/এমএল ধারণা (APIs, models, prompts)

## Lab Setup

### Step 1: Environment Preparation

1. **Verify tool installations:**
```bash
# AZD ইনস্টলেশন পরীক্ষা করুন
azd version

# Azure CLI পরীক্ষা করুন
az --version

# Azure-এ লগইন করুন
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

এআই-রেডি AZD টেমপ্লেটে মূল ফাইলগুলি অন্বেষণ করুন:

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
- সার্ভিস ডিফাইনেশনগুলি AI কম্পোনেন্টগুলোর জন্য
- পরিবেশ ভেরিয়েবল ম্যাপিং
- হোস্ট কনফিগারেশন

2. **Review the main.bicep infrastructure:**
```bash
cat infra/main.bicep
```

**Key AI patterns to identify:**
- Azure OpenAI সার্ভিস প্রোভিশনিং
- Cognitive Search ইন্টিগ্রেশন
- সিকিউর কী ম্যানেজমেন্ট
- নেটওয়ার্ক সিকিউরিটি কনফিগারেশন

### **Discussion Point:** Why These Patterns Matter for AI

- **Service Dependencies**: এআই অ্যাপগুলির প্রায়ই একাধিক সমন্বিত সার্ভিসের প্রয়োজন হয়
- **Security**: API কী এবং এন্ডপয়েন্টগুলিকে নিরাপদভাবে ম্যানেজ করা প্রয়োজন
- **Scalability**: এআই ওয়ার্কলোডের আলাদা স্কেলিং প্রয়োজনীয়তা রয়েছে
- **Cost Management**: সঠিকভাবে কনফিগার না করলে এআই সার্ভিসগুলি ব্যয়বহুল হতে পারে

## Module 2: Deploy Your First AI Application

### Step 2.1: Initialize the Environment

1. **Create a new AZD environment:**
```bash
azd env new myai-workshop
```

2. **Set required parameters:**
```bash
# আপনার পছন্দের Azure অঞ্চল সেট করুন
azd env set AZURE_LOCATION eastus

# ঐচ্ছিক: নির্দিষ্ট OpenAI মডেল সেট করুন
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### Step 2.2: Deploy the Infrastructure and Application

1. **Deploy with AZD:**
```bash
azd up
```

**What happens during `azd up`:**
- ✅ Azure OpenAI সার্ভিস প্রোভাইজন করা হয়
- ✅ Cognitive Search সার্ভিস তৈরি করা হয়
- ✅ ওয়েব অ্যাপ্লিকেশনের জন্য App Service সেট আপ করা হয়
- ✅ নেটওয়ার্কিং এবং সিকিউরিটি কনফিগার করা হয়
- ✅ অ্যাপ্লিকেশন কোড ডিপ্লয় করা হয়
- ✅ মনিটরিং এবং লগিং সেট আপ করা হয়

2. **Monitor the deployment progress** এবং তৈরি হওয়া রিসোর্সগুলো নোট করুন।

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
   - ওয়েব অ্যাপ্লিকেশনে নেভিগেট করুন
   - স্যাম্পল কুয়েরি চেষ্টা করুন
   - যাচাই করুন যে এআই উত্তরগুলি কাজ করছে

### **Lab Exercise 2.1: Troubleshooting Practice**

**Scenario**: আপনার ডিপ্লয়মেন্ট সফল হয়েছে কিন্তু এআই প্রতিক্রিয়া দিচ্ছে না।

**Common issues to check:**
1. **OpenAI API keys**: যাচাই করুন সেগুলি সঠিকভাবে সেট করা আছে কি না
2. **Model availability**: দেখুন আপনার রিজিয়ন মডেলটি সাপোর্ট করে কি না
3. **Network connectivity**: নিশ্চিত করুন সার্ভিসগুলো একে অপরের সাথে যোগাযোগ করতে পারছে
4. **RBAC permissions**: যাচাই করুন অ্যাপটি OpenAI অ্যাক্সেস করতে পারছে কি না

**Debugging commands:**
```bash
# পরিবেশ ভেরিয়েবলগুলো যাচাই করুন
azd env get-values

# ডিপ্লয়মেন্ট লগগুলি দেখুন
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# OpenAI ডিপ্লয়মেন্টের অবস্থা যাচাই করুন
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Module 3: Customizing AI Applications for Your Needs

### Step 3.1: Modify the AI Configuration

1. **Update the OpenAI model:**
```bash
# আপনার অঞ্চলে উপলব্ধ থাকলে ভিন্ন মডেলে পরিবর্তন করুন
azd env set AZURE_OPENAI_MODEL gpt-4

# নতুন কনফিগারেশন নিয়ে পুনরায় মোতায়েন করুন
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

**Best Practice**: development বনাম production-এর জন্য আলাদা কনফিগারেশন ব্যবহার করুন।

1. **Create a production environment:**
```bash
azd env new myai-production
```

2. **Set production-specific parameters:**
```bash
# উৎপাদনে সাধারণত উচ্চতর SKU ব্যবহার করা হয়
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# অতিরিক্ত নিরাপত্তা বৈশিষ্ট্য সক্ষম করুন
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Lab Exercise 3.1: Cost Optimization**

**Challenge**: ডেভেলপমেন্টের জন্য খরচ-সাশ্রয়ীভাবে টেমপ্লেট কনফিগার করুন।

**Tasks:**
1. শনাক্ত করুন কোন SKUs ফ্রি/বেসিক টিয়ারে সেট করা যেতে পারে
2. মিনিমাল খরচের জন্য পরিবেশ ভেরিয়েবল কনফিগার করুন
3. ডিপ্লয় করে প্রোডাকশন কনফিগারেশনের সাথে খরচ তুলনা করুন

**Solution hints:**
- সম্ভব হলে Cognitive Services-এর জন্য F0 (free) টিয়ার ব্যবহার করুন
- ডেভেলপমেন্টে Search Service-এর জন্য Basic টিয়ার ব্যবহার করুন
- Functions-এর জন্য Consumption প্ল্যান বিবেচনা করুন

## Module 4: Security and Production Best Practices

### Step 4.1: Secure Credential Management

**Current challenge**: অনেক এআই অ্যাপ API কী হার্ডকোড করে অথবা অনিরাপদ স্টোরেজ ব্যবহার করে।

**AZD Solution**: Managed Identity + Key Vault ইন্টিগ্রেশন।

1. **Review the security configuration in your template:**
```bash
# কী ভল্ট এবং ম্যানেজড আইডেন্টিটি কনফিগারেশন খুঁজুন
grep -r "keyVault\|managedIdentity" infra/
```

2. **Verify Managed Identity is working:**
```bash
# ওয়েব অ্যাপে সঠিক আইডেন্টিটি কনফিগারেশন আছে কিনা পরীক্ষা করুন
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Step 4.2: Network Security

1. **Enable private endpoints** (যদি ইতিমধ্যেই কনফিগার করা না থাকে):

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
# Application Insights স্বয়ংক্রিয়ভাবে কনফিগার করা উচিত
# কনফিগারেশন পরীক্ষা করুন:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Set up AI-specific monitoring:**

AI অপারেশনের জন্য কাস্টম মেট্রিক্স যোগ করুন:
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

**Task**: আপনার ডিপ্লয়মেন্টটি সিকিউরিটি বেস্ট প্র্যাকটিস অনুসারে রিভিউ করুন।

**Checklist:**
- [ ] কোড বা কনফিগারেশনে কোনো হার্ডকোডেড সিক্রেট নেই
- [ ] সার্ভিস-টু-সার্ভিস অথেন্টিকেশনের জন্য Managed Identity ব্যবহার করা হয়েছে
- [ ] সংবেদনশীল কনফিগারেশন Key Vault-এ সংরক্ষিত
- [ ] নেটওয়ার্ক অ্যাক্সেস উপযুক্তভাবে সীমাবদ্ধ
- [ ] মনিটরিং এবং লগিং সক্ষম করা হয়েছে

## Module 5: Converting Your Own AI Application

### Step 5.1: Assessment Worksheet

**Before converting your app**, এই প্রশ্নগুলোর উত্তর দিন:

1. **Application Architecture:**
   - আপনার অ্যাপ কোন এআই সার্ভিসগুলি ব্যবহার করে?
   - কোন কম্পিউট রিসোর্সগুলো প্রয়োজন?
   - কি ডাটাবেসের প্রয়োজন আছে?
   - সার্ভিসগুলির মধ্যে কী_dependencies_ আছে?

2. **Security Requirements:**
   - আপনার অ্যাপ কোন সংবেদনশীল ডেটা হ্যান্ডল করে?
   - আপনার কি কোনো কমপ্লায়েন্স প্রয়োজনীয়তা আছে?
   - আপনি কি প্রাইভেট নেটওয়ার্কিং প্রয়োজন?

3. **Scaling Requirements:**
   - আপনার প্রত্যাশিত লোড কত?
   - কি আপনাকে অটো-স্কেলিং দরকার?
   - কি কোন রিজিয়নাল চাহিদা আছে?

### Step 5.2: Create Your AZD Template

**Follow this pattern to convert your app:**

1. **Create the basic structure:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# AZD টেমপ্লেট ইনিশিয়ালাইজ করুন
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

**Challenge**: একটি ডকুমেন্ট প্রসেসিং এআই অ্যাপের জন্য AZD টেমপ্লেট তৈরি করুন।

**Requirements:**
- কনটেন্ট বিশ্লেষণের জন্য Azure OpenAI
- OCR-এর জন্য Document Intelligence
- ডকুমেন্ট আপলোডের জন্য Storage Account
- প্রসেসিং লজিকের জন্য Function App
- ইউজার ইন্টারফেসের জন্য Web app

**Bonus points:**
- উপযুক্ত এরর হ্যান্ডলিং যোগ করুন
- খরচের অনুমান অন্তর্ভুক্ত করুন
- মনিটরিং ড্যাশবোর্ড সেট আপ করুন

## Module 6: Troubleshooting Common Issues

### Common Deployment Issues

#### Issue 1: OpenAI Service Quota Exceeded
**Symptoms:** ডিপ্লয়মেন্ট কোটা ত্রুটির সঙ্গে ব্যর্থ হয়
**Solutions:**
```bash
# বর্তমান কোটাগুলো পরীক্ষা করুন
az cognitiveservices usage list --location eastus

# কোটা বৃদ্ধির অনুরোধ করুন অথবা ভিন্ন অঞ্চলে চেষ্টা করুন
azd env set AZURE_LOCATION westus2
azd up
```

#### Issue 2: Model Not Available in Region
**Symptoms:** এআই উত্তর ব্যর্থ হচ্ছে বা মডেল ডিপ্লয়মেন্ট ত্রুটি
**Solutions:**
```bash
# অঞ্চল অনুযায়ী মডেলের প্রাপ্যতা পরীক্ষা করুন
az cognitiveservices model list --location eastus

# উপলব্ধ মডেলে হালনাগাদ করুন
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### Issue 3: Permission Issues
**Symptoms:** AI সার্ভিস কল করার সময় 403 Forbidden ত্রুটি
**Solutions:**
```bash
# ভূমিকা বরাদ্দগুলি পরীক্ষা করুন
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# অনুপস্থিত ভূমিকাগুলি যোগ করুন
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Performance Issues

#### Issue 4: Slow AI Responses
**Investigation steps:**
1. Application Insights-এ পারফরম্যান্স মেট্রিক্স পরীক্ষা করুন
2. Azure পোর্টালে OpenAI সার্ভিস মেট্রিক্স রিভিউ করুন
3. নেটওয়ার্ক কানেক্টিভিটি এবং লেটেন্সি যাচাই করুন

**Solutions:**
- সাধারণ কুয়েরিগুলোর জন্য ক্যাশিং বাস্তবায়ন করুন
- আপনার ব্যবহারিক কেসের জন্য উপযুক্ত OpenAI মডেল ব্যবহার করুন
- উচ্চ লোডের জন্য রিড রেপ্লিকা বিবেচনা করুন

### **Lab Exercise 6.1: Debugging Challenge**

**Scenario**: আপনার ডিপ্লয়মেন্ট সফল হয়েছে, কিন্তু অ্যাপ্লিকেশন 500 ত্রুটি ফেরত দিচ্ছে।

**Debugging tasks:**
1. অ্যাপ্লিকেশন লগ চেক করুন
2. সার্ভিস কানেক্টিভিটি যাচাই করুন
3. অথেন্টিকেশন টেস্ট করুন
4. কনফিগারেশন রিভিউ করুন

**Tools to use:**
- ডিপ্লয়মেন্ট ওভারভিউর জন্য `azd show`
- বিস্তারিত সার্ভিস লগের জন্য Azure পোর্টাল
- অ্যাপ্লিকেশন টেলিমেট্রির জন্য Application Insights

## Module 7: Monitoring and Optimization

### Step 7.1: Set Up Comprehensive Monitoring

1. **Create custom dashboards:**

Azure পোর্টালে যান এবং একটি ড্যাশবোর্ড তৈরি করুন যার মধ্যে থাকবে:
- OpenAI অনুরোধের সংখ্যা এবং লেটেন্সি
- অ্যাপ্লিকেশন ত্রুটি হার
- রিসোর্স ব্যবহারের পরিমাপ
- ব্যয় ট্র্যাকিং

2. **Set up alerts:**
```bash
# উচ্চ ত্রুটি হারের জন্য সতর্কতা
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
# খরচের ডেটা সংগ্রহ করার জন্য Azure CLI ব্যবহার করুন
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Implement cost controls:**
- বাজেট এলার্ট সেট আপ করুন
- অটোস্কেলিং পলিসি ব্যবহার করুন
- অনুরোধ ক্যাশিং বাস্তবায়ন করুন
- OpenAI-এর টোকেন ব্যবহারের মনিটরিং করুন

### **Lab Exercise 7.1: Performance Optimization**

**Task**: আপনার এআই অ্যাপ্লিকেশনকে পারফরম্যান্স ও খরচ উভয় দিক থেকে অপ্টিমাইজ করুন।

**Metrics to improve:**
- গড় রেসপন্স টাইম 20% কমান
- মাসিক খরচ 15% কমান
- 99.9% আপটাইম বজায় রাখুন

**Strategies to try:**
- রেসপন্স ক্যাশিং বাস্তবায়ন করুন
- টোকেন দক্ষতার জন্য প্রম্পট অপ্টিমাইজ করুন
- উপযুক্ত কম্পিউট SKU ব্যবহার করুন
- উপযুক্ত অটোস্কেলিং সেট আপ করুন

## Final Challenge: End-to-End Implementation

### Challenge Scenario

আপনি একটি প্রোডাকশন-রেডি এআই-পাওয়ার্ড কাস্টমার সার্ভিস চ্যাটবট তৈরি করার জন্য দায়িত্বপ্রাপ্ত, নিম্নলিখিত চাহিদা সহ:

**Functional Requirements:**
- কাস্টমার ইন্টারঅ্যাকশনের জন্য ওয়েব ইন্টারফেস
- উত্তরগুলির জন্য Azure OpenAI ইন্টিগ্রেশন
- Cognitive Search ব্যবহার করে ডকুমেন্ট সার্চ সক্ষমতা
- বিদ্যমান কাস্টমার ডাটাবেসের সাথে ইন্টিগ্রেশন
- মাল্টি-ল্যাঙ্গুয়েজ সাপোর্ট

**Non-Functional Requirements:**
- 1000 সমসাময়িক ব্যবহারকারী হ্যান্ডেল করতে পারবে
- 99.9% আপটাইম SLA
- SOC 2 কমপ্লায়েন্স
- মাসিক খরচ $500-এর নিচে
- একাধিক পরিবেশে (dev, staging, prod) ডিপ্লয়

### Implementation Steps

1. আর্কিটেকচার ডিজাইন করুন
2. AZD টেমপ্লেট তৈরি করুন
3. সিকিউরিটি ব্যবস্থা বাস্তবায়ন করুন
4. মনিটরিং এবং এলার্টিং সেট আপ করুন
5. ডিপ্লয়মেন্ট পাইপলাইন তৈরি করুন
6. সল্যুশন ডকুমেন্ট করুন

### Evaluation Criteria

- ✅ **Functionality**: কি এটি সব চাহিদা পূরণ করে?
- ✅ **Security**: কি বেস্ট প্র্যাকটিসগুলি বাস্তবায়িত হয়েছে?
- ✅ **Scalability**: কি এটি লোড হ্যান্ডেল করতে পারে?
- ✅ **Maintainability**: কি কোড এবং ইন্ফ্রা ভালোভাবে সাজানো?
- ✅ **Cost**: কি এটি বাজেটের মধ্যে আছে?

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
Congratulations! You've completed the AI Workshop Lab. You should now be able to:

- ✅ কোনো বিদ্যমান AI অ্যাপ্লিকেশনগুলোকে AZD টেমপ্লেটে রূপান্তর করা
- ✅ প্রোডাকশন-ব্যবহারের জন্য প্রস্তুত AI অ্যাপ্লিকেশন ডিপ্লয় করা
- ✅ AI ওয়ার্কলোডের জন্য সিকিউরিটি সেরা অনুশীলনগুলো প্রয়োগ করা
- ✅ AI অ্যাপ্লিকেশনের পারফরম্যান্স পর্যবেক্ষণ এবং অপ্টিমাইজ করা
- ✅ সাধারণ ডিপ্লয়মেন্ট সমস্যা সমাধান করা

### পরবর্তী ধাপ
1. এই প্যাটার্নগুলো আপনার নিজস্ব AI প্রকল্পে প্রয়োগ করুন
2. টেমপ্লেটগুলো কমিউনিটিতে অবদান করুন
3. অবিরত সহায়তার জন্য Microsoft Foundry Discord-এ যোগ দিন
4. মাল্টি-রিজিয়ন ডিপ্লয়মেন্টের মতো উন্নত বিষয়গুলো অন্বেষণ করুন

---

**Workshop Feedback**: এই ওয়ার্কশপটি উন্নত করতে আপনার অভিজ্ঞতা [Microsoft Foundry Discord #Azure channel](https://discord.gg/microsoft-azure)-এ শেয়ার করে আমাদের সাহায্য করুন।

---

**Chapter Navigation:**
- **📚 Course Home**: [AZD নবশিক্ষার্থীদের জন্য](../../README.md)
- **📖 Current Chapter**: চ্যাপ্টার 2 - AI-প্রথম উন্নয়ন
- **⬅️ Previous**: [AI মডেল ডিপ্লয়মেন্ট](ai-model-deployment.md)
- **➡️ Next**: [প্রোডাকশন AI সেরা অনুশীলন](production-ai-practices.md)
- **🚀 Next Chapter**: [চ্যাপ্টার ৩: কনফিগারেশন](../chapter-03-configuration/configuration.md)

**সাহায্য দরকার?** AZD এবং AI ডিপ্লয়মেন্ট সম্পর্কে সমর্থন ও আলোচনা করার জন্য আমাদের কমিউনিটিতে যোগ দিন।

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
দায়-অস্বীকৃতি:
এই দলিলটি এআই অনুবাদ পরিষেবা Co-op Translator (https://github.com/Azure/co-op-translator) ব্যবহার করে অনুবাদ করা হয়েছে। আমরা যথাসাধ্য সঠিকতার চেষ্টা করি, তবুও অনুগ্রহ করে মনে রাখবেন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা ভুল থাকতে পারে। মূল নথিটি তার নিজ ভাষায় কর্তৃত্বপ্রাপ্ত উৎস হিসেবে বিবেচিত হওয়া উচিত। গুরুত্বপূর্ণ তথ্যের জন্য পেশাদার মানব অনুবাদ গ্রহণ করার পরামর্শ দেওয়া হয়। এই অনুবাদ ব্যবহারের ফলে উদ্ভূত কোনো ভুলবোঝাবুঝি বা ভ্রান্ত ব্যাখ্যার জন্য আমরা দায়ী নই।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->