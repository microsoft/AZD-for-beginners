<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ed84aca3294b926341ef9e0a5a78059e",
  "translation_date": "2025-09-17T19:20:24+00:00",
  "source_file": "docs/ai-foundry/ai-workshop-lab.md",
  "language_code": "bn"
}
-->
# AI Workshop Lab: আপনার AI সমাধানকে AZD-Deployable করার জন্য

**অধ্যায় নেভিগেশন:**
- **📚 কোর্স হোম**: [AZD For Beginners](../../README.md)
- **📖 বর্তমান অধ্যায়**: অধ্যায় ২ - AI-প্রথম উন্নয়ন
- **⬅️ পূর্ববর্তী**: [AI মডেল ডিপ্লয়মেন্ট](ai-model-deployment.md)
- **➡️ পরবর্তী**: [প্রোডাকশন AI সেরা অনুশীলন](production-ai-practices.md)
- **🚀 পরবর্তী অধ্যায়**: [অধ্যায় ৩: কনফিগারেশন](../getting-started/configuration.md)

## ওয়ার্কশপের সংক্ষিপ্ত বিবরণ

এই হাতে-কলমে ল্যাবটি ডেভেলপারদের একটি বিদ্যমান AI অ্যাপ্লিকেশনকে Azure Developer CLI (AZD) ব্যবহার করে ডিপ্লয়যোগ্য করার প্রক্রিয়ার মাধ্যমে গাইড করে। আপনি Azure AI Foundry পরিষেবাগুলি ব্যবহার করে প্রোডাকশন AI ডিপ্লয়মেন্টের জন্য প্রয়োজনীয় প্যাটার্ন শিখবেন।

**সময়কাল:** ২-৩ ঘণ্টা  
**স্তর:** মধ্যম  
**প্রয়োজনীয়তা:** Azure সম্পর্কে প্রাথমিক জ্ঞান, AI/ML ধারণার সাথে পরিচিতি

## 🎓 শেখার লক্ষ্যসমূহ

এই ওয়ার্কশপ শেষে, আপনি সক্ষম হবেন:
- ✅ একটি বিদ্যমান AI অ্যাপ্লিকেশনকে AZD টেমপ্লেটে রূপান্তর করতে
- ✅ AZD ব্যবহার করে Azure AI Foundry পরিষেবাগুলি কনফিগার করতে
- ✅ AI পরিষেবাগুলির জন্য নিরাপদ ক্রেডেনশিয়াল ব্যবস্থাপনা বাস্তবায়ন করতে
- ✅ মনিটরিং সহ প্রোডাকশন-রেডি AI অ্যাপ্লিকেশন ডিপ্লয় করতে
- ✅ সাধারণ AI ডিপ্লয়মেন্ট সমস্যাগুলি সমাধান করতে

## প্রয়োজনীয়তা

### প্রয়োজনীয় টুলস
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) ইনস্টল করা
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) ইনস্টল করা
- [Git](https://git-scm.com/) ইনস্টল করা
- কোড এডিটর (VS Code সুপারিশকৃত)

### Azure রিসোর্স
- কন্ট্রিবিউটর অ্যাক্সেস সহ Azure সাবস্ক্রিপশন
- Azure OpenAI পরিষেবাগুলিতে অ্যাক্সেস (অথবা অ্যাক্সেসের জন্য অনুরোধ করার ক্ষমতা)
- রিসোর্স গ্রুপ তৈরির অনুমতি

### জ্ঞানের প্রয়োজনীয়তা
- Azure পরিষেবাগুলির প্রাথমিক ধারণা
- কমান্ড-লাইন ইন্টারফেসের সাথে পরিচিতি
- AI/ML ধারণার প্রাথমিক জ্ঞান (API, মডেল, প্রম্পট)

## ল্যাব সেটআপ

### ধাপ ১: পরিবেশ প্রস্তুতি

1. **টুল ইনস্টলেশন যাচাই করুন:**
```bash
# Check AZD installation
azd version

# Check Azure CLI
az --version

# Login to Azure
az login
azd auth login
```

2. **ওয়ার্কশপ রিপোজিটরি ক্লোন করুন:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## মডিউল ১: AI অ্যাপ্লিকেশনের জন্য AZD স্ট্রাকচার বোঝা

### AI-রেডি AZD টেমপ্লেটের গঠন

AI-রেডি AZD টেমপ্লেটের মূল ফাইলগুলি অন্বেষণ করুন:

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

### **ল্যাব অনুশীলন ১.১: কনফিগারেশন অন্বেষণ করুন**

1. **azure.yaml ফাইল পরীক্ষা করুন:**
```bash
cat azure.yaml
```

**যা খুঁজতে হবে:**
- AI কম্পোনেন্টগুলির জন্য পরিষেবা সংজ্ঞা
- পরিবেশ ভেরিয়েবল ম্যাপিং
- হোস্ট কনফিগারেশন

2. **main.bicep অবকাঠামো পর্যালোচনা করুন:**
```bash
cat infra/main.bicep
```

**AI প্যাটার্নগুলির মূল বিষয়গুলি চিহ্নিত করুন:**
- Azure OpenAI পরিষেবা প্রভিশনিং
- Cognitive Search ইন্টিগ্রেশন
- নিরাপদ কী ব্যবস্থাপনা
- নেটওয়ার্ক নিরাপত্তা কনফিগারেশন

### **আলোচনার বিষয়:** কেন এই প্যাটার্নগুলি AI-এর জন্য গুরুত্বপূর্ণ

- **পরিষেবা নির্ভরতা:** AI অ্যাপ্লিকেশন প্রায়ই একাধিক সমন্বিত পরিষেবার প্রয়োজন হয়
- **নিরাপত্তা:** API কী এবং এন্ডপয়েন্টগুলির নিরাপদ ব্যবস্থাপনা প্রয়োজন
- **স্কেলযোগ্যতা:** AI ওয়ার্কলোডের অনন্য স্কেলিং প্রয়োজনীয়তা থাকে
- **খরচ ব্যবস্থাপনা:** AI পরিষেবাগুলি সঠিকভাবে কনফিগার না করলে ব্যয়বহুল হতে পারে

## মডিউল ২: আপনার প্রথম AI অ্যাপ্লিকেশন ডিপ্লয় করুন

### ধাপ ২.১: পরিবেশ ইনিশিয়ালাইজ করুন

1. **একটি নতুন AZD পরিবেশ তৈরি করুন:**
```bash
azd env new myai-workshop
```

2. **প্রয়োজনীয় প্যারামিটার সেট করুন:**
```bash
# Set your preferred Azure region
azd env set AZURE_LOCATION eastus

# Optional: Set specific OpenAI model
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### ধাপ ২.২: অবকাঠামো এবং অ্যাপ্লিকেশন ডিপ্লয় করুন

1. **AZD দিয়ে ডিপ্লয় করুন:**
```bash
azd up
```

**`azd up` চলাকালীন যা ঘটে:**
- ✅ Azure OpenAI পরিষেবা প্রভিশন করে
- ✅ Cognitive Search পরিষেবা তৈরি করে
- ✅ ওয়েব অ্যাপ্লিকেশনের জন্য App Service সেট আপ করে
- ✅ নেটওয়ার্কিং এবং নিরাপত্তা কনফিগার করে
- ✅ অ্যাপ্লিকেশন কোড ডিপ্লয় করে
- ✅ মনিটরিং এবং লগিং সেট আপ করে

2. **ডিপ্লয়মেন্ট অগ্রগতি পর্যবেক্ষণ করুন** এবং তৈরি হওয়া রিসোর্সগুলি নোট করুন।

### ধাপ ২.৩: আপনার ডিপ্লয়মেন্ট যাচাই করুন

1. **ডিপ্লয় করা রিসোর্সগুলি পরীক্ষা করুন:**
```bash
azd show
```

2. **ডিপ্লয় করা অ্যাপ্লিকেশন খুলুন:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **AI কার্যকারিতা পরীক্ষা করুন:**
   - ওয়েব অ্যাপ্লিকেশনে যান
   - নমুনা প্রশ্ন চেষ্টা করুন
   - যাচাই করুন AI প্রতিক্রিয়া কাজ করছে

### **ল্যাব অনুশীলন ২.১: সমস্যা সমাধানের অনুশীলন**

**পরিস্থিতি:** আপনার ডিপ্লয়মেন্ট সফল হয়েছে কিন্তু AI প্রতিক্রিয়া দিচ্ছে না।

**সাধারণ সমস্যাগুলি পরীক্ষা করুন:**
1. **OpenAI API কী:** সঠিকভাবে সেট করা হয়েছে কিনা যাচাই করুন
2. **মডেলের প্রাপ্যতা:** আপনার অঞ্চলে মডেল সমর্থিত কিনা পরীক্ষা করুন
3. **নেটওয়ার্ক সংযোগ:** পরিষেবাগুলি যোগাযোগ করতে পারছে কিনা নিশ্চিত করুন
4. **RBAC অনুমতি:** অ্যাপ্লিকেশন OpenAI অ্যাক্সেস করতে পারছে কিনা যাচাই করুন

**ডিবাগিং কমান্ড:**
```bash
# Check environment variables
azd env get-values

# View deployment logs
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Check OpenAI deployment status
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## মডিউল ৩: আপনার AI অ্যাপ্লিকেশন কাস্টমাইজ করুন

### ধাপ ৩.১: AI কনফিগারেশন পরিবর্তন করুন

1. **OpenAI মডেল আপডেট করুন:**
```bash
# Change to a different model (if available in your region)
azd env set AZURE_OPENAI_MODEL gpt-4

# Redeploy with the new configuration
azd deploy
```

2. **অতিরিক্ত AI পরিষেবা যোগ করুন:**

`infra/main.bicep` সম্পাদনা করে Document Intelligence যোগ করুন:

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

### ধাপ ৩.২: পরিবেশ-নির্দিষ্ট কনফিগারেশন

**সেরা অনুশীলন:** ডেভেলপমেন্ট এবং প্রোডাকশনের জন্য আলাদা কনফিগারেশন।

1. **একটি প্রোডাকশন পরিবেশ তৈরি করুন:**
```bash
azd env new myai-production
```

2. **প্রোডাকশন-নির্দিষ্ট প্যারামিটার সেট করুন:**
```bash
# Production typically uses higher SKUs
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Enable additional security features
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **ল্যাব অনুশীলন ৩.১: খরচ অপ্টিমাইজেশন**

**চ্যালেঞ্জ:** ডেভেলপমেন্টের জন্য টেমপ্লেটটি খরচ-সাশ্রয়ীভাবে কনফিগার করুন।

**কাজগুলো:**
1. কোন SKUs ফ্রি/বেসিক টিয়ারে সেট করা যেতে পারে তা চিহ্নিত করুন
2. পরিবেশ ভেরিয়েবলগুলি ন্যূনতম খরচের জন্য কনফিগার করুন
3. ডিপ্লয় করুন এবং প্রোডাকশন কনফিগারেশনের সাথে খরচ তুলনা করুন

**সমাধানের ইঙ্গিত:**
- সম্ভব হলে Cognitive Services-এর জন্য F0 (ফ্রি) টিয়ার ব্যবহার করুন
- ডেভেলপমেন্টে Search Service-এর জন্য Basic টিয়ার ব্যবহার করুন
- Functions-এর জন্য Consumption প্ল্যান বিবেচনা করুন

## মডিউল ৪: নিরাপত্তা এবং প্রোডাকশন সেরা অনুশীলন

### ধাপ ৪.১: নিরাপদ ক্রেডেনশিয়াল ব্যবস্থাপনা

**বর্তমান চ্যালেঞ্জ:** অনেক AI অ্যাপ্লিকেশন API কী হার্ডকোড করে বা অনিরাপদ স্টোরেজ ব্যবহার করে।

**AZD সমাধান:** Managed Identity + Key Vault ইন্টিগ্রেশন।

1. **আপনার টেমপ্লেটে নিরাপত্তা কনফিগারেশন পর্যালোচনা করুন:**
```bash
# Look for Key Vault and Managed Identity configuration
grep -r "keyVault\|managedIdentity" infra/
```

2. **Managed Identity কাজ করছে কিনা যাচাই করুন:**
```bash
# Check if the web app has the correct identity configuration
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### ধাপ ৪.২: নেটওয়ার্ক নিরাপত্তা

1. **প্রাইভেট এন্ডপয়েন্ট সক্রিয় করুন** (যদি ইতিমধ্যে কনফিগার না করা থাকে):

আপনার bicep টেমপ্লেটে যোগ করুন:
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

### ধাপ ৪.৩: মনিটরিং এবং পর্যবেক্ষণযোগ্যতা

1. **Application Insights কনফিগার করুন:**
```bash
# Application Insights should be automatically configured
# Check the configuration:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **AI-নির্দিষ্ট মনিটরিং সেট আপ করুন:**

AI অপারেশনের জন্য কাস্টম মেট্রিক যোগ করুন:
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

### **ল্যাব অনুশীলন ৪.১: নিরাপত্তা অডিট**

**কাজ:** আপনার ডিপ্লয়মেন্ট নিরাপত্তার সেরা অনুশীলনের জন্য পর্যালোচনা করুন।

**চেকলিস্ট:**
- [ ] কোড বা কনফিগারেশনে হার্ডকোড করা সিক্রেট নেই
- [ ] পরিষেবা-টু-পরিষেবা প্রমাণীকরণের জন্য Managed Identity ব্যবহার করা হয়েছে
- [ ] Key Vault সংবেদনশীল কনফিগারেশন সংরক্ষণ করে
- [ ] নেটওয়ার্ক অ্যাক্সেস সঠিকভাবে সীমাবদ্ধ
- [ ] মনিটরিং এবং লগিং সক্রিয়

## মডিউল ৫: আপনার নিজস্ব AI অ্যাপ্লিকেশন রূপান্তর করুন

### ধাপ ৫.১: মূল্যায়ন ওয়ার্কশিট

**আপনার অ্যাপ রূপান্তর করার আগে**, এই প্রশ্নগুলির উত্তর দিন:

1. **অ্যাপ্লিকেশন আর্কিটেকচার:**
   - আপনার অ্যাপ কোন AI পরিষেবা ব্যবহার করে?
   - এটি কোন কম্পিউট রিসোর্স প্রয়োজন?
   - এটি কি একটি ডাটাবেস প্রয়োজন?
   - পরিষেবাগুলির মধ্যে নির্ভরতা কী?

2. **নিরাপত্তার প্রয়োজনীয়তা:**
   - আপনার অ্যাপ কোন সংবেদনশীল ডেটা পরিচালনা করে?
   - আপনার কোন সম্মতি প্রয়োজনীয়তা আছে?
   - আপনার কি প্রাইভেট নেটওয়ার্কিং দরকার?

3. **স্কেলিং প্রয়োজনীয়তা:**
   - আপনার প্রত্যাশিত লোড কী?
   - আপনার কি অটো-স্কেলিং দরকার?
   - আঞ্চলিক প্রয়োজনীয়তা আছে কি?

### ধাপ ৫.২: আপনার AZD টেমপ্লেট তৈরি করুন

**আপনার অ্যাপ রূপান্তর করতে এই প্যাটার্ন অনুসরণ করুন:**

1. **মৌলিক স্ট্রাকচার তৈরি করুন:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Initialize AZD template
azd init --template minimal
```

2. **azure.yaml তৈরি করুন:**
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

3. **অবকাঠামো টেমপ্লেট তৈরি করুন:**

**infra/main.bicep** - প্রধান টেমপ্লেট:
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

**infra/modules/openai.bicep** - OpenAI মডিউল:
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

### **ল্যাব অনুশীলন ৫.১: টেমপ্লেট তৈরির চ্যালেঞ্জ**

**চ্যালেঞ্জ:** একটি ডকুমেন্ট প্রসেসিং AI অ্যাপের জন্য AZD টেমপ্লেট তৈরি করুন।

**প্রয়োজনীয়তা:**
- বিষয়বস্তু বিশ্লেষণের জন্য Azure OpenAI
- OCR-এর জন্য Document Intelligence
- ডকুমেন্ট আপলোডের জন্য Storage Account
- প্রসেসিং লজিকের জন্য Function App
- ব্যবহারকারীর ইন্টারফেসের জন্য ওয়েব অ্যাপ

**বোনাস পয়েন্ট:**
- সঠিক ত্রুটি পরিচালনা যোগ করুন
- খরচ অনুমান অন্তর্ভুক্ত করুন
- মনিটরিং ড্যাশবোর্ড সেট আপ করুন

## মডিউল ৬: সাধারণ সমস্যার সমাধান

### সাধারণ ডিপ্লয়মেন্ট সমস্যা

#### সমস্যা ১: OpenAI পরিষেবা কোটা অতিক্রম করেছে
**লক্ষণ:** ডিপ্লয়মেন্ট কোটা ত্রুটির সাথে ব্যর্থ হয়
**সমাধান:**
```bash
# Check current quotas
az cognitiveservices usage list --location eastus

# Request quota increase or try different region
azd env set AZURE_LOCATION westus2
azd up
```

#### সমস্যা ২: মডেল অঞ্চলে উপলব্ধ নয়
**লক্ষণ:** AI প্রতিক্রিয়া ব্যর্থ বা মডেল ডিপ্লয়মেন্ট ত্রুটি
**সমাধান:**
```bash
# Check model availability by region
az cognitiveservices model list --location eastus

# Update to available model
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### সমস্যা ৩: অনুমতির সমস্যা
**লক্ষণ:** AI পরিষেবাগুলিতে কল করার সময় 403 নিষিদ্ধ ত্রুটি
**সমাধান:**
```bash
# Check role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Add missing roles
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### কর্মক্ষমতা সমস্যা

#### সমস্যা ৪: AI প্রতিক্রিয়া ধীর
**তদন্তের ধাপ:**
1. Application Insights-এ কর্মক্ষমতার মেট্রিক পরীক্ষা করুন
2. Azure পোর্টালে OpenAI পরিষেবার মেট্রিক পর্যালোচনা করুন
3. নেটওয়ার্ক সংযোগ এবং লেটেন্সি যাচাই করুন

**সমাধান:**
- সাধারণ প্রশ্নের জন্য ক্যাশিং বাস্তবায়ন করুন
- আপনার ব্যবহারের জন্য উপযুক্ত OpenAI মডেল ব্যবহার করুন
- উচ্চ-লোড পরিস্থিতির জন্য রিড রিপ্লিকা বিবেচনা করুন

### **ল্যাব অনুশীলন ৬.১: ডিবাগিং চ্যালেঞ্জ**

**পরিস্থিতি:** আপনার ডিপ্লয়মেন্ট সফল হয়েছে, কিন্তু অ্যাপ্লিকেশন 500 ত্রুটি ফেরত দেয়।

**ডিবাগিং কাজগুলো:**
1. অ্যাপ্লিকেশন লগ পরীক্ষা করুন
2. পরিষেবা সংযোগ যাচাই করুন
3. প্রমাণীকরণ পরীক্ষা করুন
4. কনফিগারেশন পর্যালোচনা করুন

**ব্যবহার করার টুলস:**
- `azd show` ডিপ্লয়মেন্ট ওভারভিউয়ের জন্য
- পরিষেবার বিস্তারিত লগের জন্য Azure পোর্টাল
- অ্যাপ্লিকেশন টেলিমেট্রির জন্য Application Insights

## মডিউল ৭: মনিটরিং এবং অপ্টিমাইজেশন

### ধাপ ৭.১: ব্যাপক মনিটরিং সেট আপ করুন

1. **কাস্টম ড্যাশবোর্ড তৈরি করুন:**

Azure পোর্টালে যান এবং একটি ড্যাশবোর্ড তৈরি করুন যেখানে থাকবে:
- OpenAI অনুরোধ সংখ্যা এবং লেটেন্সি
- অ্যাপ্লিকেশন ত্রুটির হার
- রিসোর্স ব্যবহার
- খরচ ট্র্যাকিং

2. **অ্যালার্ট সেট আপ করুন:**
```bash
# Alert for high error rate
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### ধাপ ৭.২: খরচ অপ্টিমাইজেশন

1. **বর্তমান খরচ বিশ্লেষণ করুন:**
```bash
# Use Azure CLI to get cost data
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **খরচ নিয়ন্ত্রণ বাস্তবায়ন করুন:**
- বাজেট অ্যালার্ট সেট করুন
- অটোস্কেলিং নীতি ব্যবহার করুন
- অনুরোধ ক্যাশিং বাস্তবায়ন করুন
- OpenAI-এর জন্য টোকেন ব্যবহারের মনিটরিং করুন

### **ল্যাব অনুশীলন ৭.১: কর্মক্ষমতা অপ্টিমাইজেশন**

**কাজ:** আপনার AI অ্যাপ্লিকেশন কর্মক্ষমতা এবং খরচের জন্য অপ্টিমাইজ করুন।

**উন্নত করার মেট্রিক:**
- গড় প্রতিক্রিয়া সময় ২০% কমান
- মাসিক খরচ ১৫% কমান
- ৯৯.৯% আপটাইম বজায় রাখুন

**পরীক্ষার কৌশল:**
- প্রতিক্রিয়া ক্যাশিং বাস্তবায়ন করুন
- টোকেন দক্ষতার জন্য প্রম্পট অপ্টিমাইজ করুন
- উপযুক্ত কম্পিউট SKUs ব্যবহার করুন
- সঠিক অটোস্কেলিং সেট আপ করুন

## চূড়ান্ত চ্যালেঞ্জ: সম্পূর্ণ বাস্তবায়ন

### চ্যালেঞ্জ পরিস্থিতি

আপনাকে একটি প্রোডাকশন-রেডি AI-চালিত কাস্টমার সার্ভিস চ্যাটবট তৈরি করতে বলা হয়েছে যার প্রয়োজনীয়তা:

**কার্যকরী প্রয়োজনীয়তা:**
- গ্রাহক ইন্টারঅ্যাকশনের জন্য ওয়েব ইন্টারফেস
- প্রতিক্রিয়ার জন্য Azure OpenAI-এর সাথে ইন্টিগ্রেশন
- Cognitive Search ব্যবহার করে ডকুমেন্ট অনুসন্ধানের ক্ষমতা
- বিদ্যমান গ্রাহক ডাটাবেস
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 সমাপ্তি সনদ

অভিনন্দন! আপনি AI ওয়ার্কশপ ল্যাব সম্পন্ন করেছেন। এখন আপনি সক্ষম:

- ✅ বিদ্যমান AI অ্যাপ্লিকেশনগুলোকে AZD টেমপ্লেটে রূপান্তর করতে
- ✅ প্রোডাকশন-রেডি AI অ্যাপ্লিকেশন ডিপ্লয় করতে
- ✅ AI ওয়ার্কলোডের জন্য সুরক্ষার সেরা পদ্ধতি প্রয়োগ করতে
- ✅ AI অ্যাপ্লিকেশনের পারফরম্যান্স পর্যবেক্ষণ ও অপ্টিমাইজ করতে
- ✅ সাধারণ ডিপ্লয়মেন্ট সমস্যাগুলো সমাধান করতে

### পরবর্তী পদক্ষেপ
1. এই প্যাটার্নগুলো আপনার নিজস্ব AI প্রকল্পে প্রয়োগ করুন
2. কমিউনিটিতে টেমপ্লেটগুলো ফিরিয়ে দিন
3. চলমান সহায়তার জন্য Azure AI Foundry Discord-এ যোগ দিন
4. মাল্টি-রিজিয়ন ডিপ্লয়মেন্টের মতো উন্নত বিষয়গুলো অন্বেষণ করুন

---

**ওয়ার্কশপ প্রতিক্রিয়া**: এই ওয়ার্কশপটি উন্নত করতে আমাদের অভিজ্ঞতা শেয়ার করুন [Azure AI Foundry Discord #Azure চ্যানেলে](https://discord.gg/microsoft-azure)।

---

**অধ্যায় নেভিগেশন:**
- **📚 কোর্স হোম**: [AZD For Beginners](../../README.md)
- **📖 বর্তমান অধ্যায়**: অধ্যায় ২ - AI-প্রথম উন্নয়ন
- **⬅️ পূর্ববর্তী**: [AI মডেল ডিপ্লয়মেন্ট](ai-model-deployment.md)
- **➡️ পরবর্তী**: [প্রোডাকশন AI সেরা পদ্ধতি](production-ai-practices.md)
- **🚀 পরবর্তী অধ্যায়**: [অধ্যায় ৩: কনফিগারেশন](../getting-started/configuration.md)

**সহায়তা প্রয়োজন?** AZD এবং AI ডিপ্লয়মেন্ট নিয়ে আলোচনা ও সহায়তার জন্য আমাদের কমিউনিটিতে যোগ দিন।

---

**অস্বীকৃতি**:  
এই নথিটি AI অনুবাদ পরিষেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনুবাদ করা হয়েছে। আমরা যথাসাধ্য সঠিকতা নিশ্চিত করার চেষ্টা করি, তবে অনুগ্রহ করে মনে রাখবেন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসঙ্গতি থাকতে পারে। মূল ভাষায় থাকা নথিটিকে প্রামাণিক উৎস হিসেবে বিবেচনা করা উচিত। গুরুত্বপূর্ণ তথ্যের জন্য, পেশাদার মানব অনুবাদ সুপারিশ করা হয়। এই অনুবাদ ব্যবহারের ফলে কোনো ভুল বোঝাবুঝি বা ভুল ব্যাখ্যা হলে আমরা দায়বদ্ধ থাকব না।