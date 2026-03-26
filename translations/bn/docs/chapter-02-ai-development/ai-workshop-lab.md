# AI ওয়ার্কশপ ল্যাব: আপনার AI সমাধানগুলিকে AZD-ডিপ্লয়যোগ্য করা

**অধ্যায় নেভিগেশন:**
- **📚 কোর্স হোম**: [AZD For Beginners](../../README.md)
- **📖 বর্তমান অধ্যায়**: Chapter 2 - AI-First Development
- **⬅️ পূর্ববর্তী**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ পরবর্তী**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 পরবর্তী অধ্যায়**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

## ওয়ার্কশপ ওভারভিউ

এই হ্যান্ডস-অন ল্যাব ডেভেলপারদের একটি বিদ্যমান AI টেমপ্লেট গ্রহণ করে Azure Developer CLI (AZD) ব্যবহার করে ডিপ্লয় করার প্রক্রিয়ায় গাইড করে। আপনি Microsoft Foundry পরিষেবাগুলি ব্যবহার করে প্রোডাকশন AI ডিপ্লয়মেন্টের জন্য প্রয়োজনীয় প্যাটার্নগুলি শিখবেন।

**দৈর্ঘ্য:** 2-3 ঘণ্টা  
**স্তর:** মধ্যবর্তী  
**পূর্বশর্ত:** প্রাথমিক Azure জ্ঞান, AI/ML ধারণাগুলির সাথে পরিচিতি

## 🎓 শেখার উদ্দেশ্য

ওয়ার্কশপের শেষে, আপনি সক্ষম হবেন:
- ✅ একটি বিদ্যমান AI অ্যাপ্লিকেশনকে AZD টেমপ্লেট ব্যবহার করার জন্য রূপান্তর করা
- ✅ AZD ব্যবহার করে Microsoft Foundry পরিষেবাগুলি কনফিগার করা
- ✅ AI পরিষেবাগুলির জন্য নিরাপদ ক্রেডেনশিয়াল ব্যবস্থাপনা বাস্তবায়ন করা
- ✅ মনিটরিং সহ প্রোডাকশন-রেডি AI অ্যাপ্লিকেশন ডিপ্লয় করা
- ✅ সাধারণ AI ডিপ্লয়মেন্ট সমস্যাগুলি সমাধান করা

## পূর্বশর্ত

### প্রয়োজনীয় টুলস
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) ইনস্টল করা
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) ইনস্টল করা
- [Git](https://git-scm.com/) ইনস্টল করা
- কোড সম্পাদক (VS Code সুপারিশ করা হয়)

### Azure রিসোর্স
- কন্ট্রিবিউটর অ্যাক্সেস সহ Azure সাবস্ক্রিপশন
- Microsoft Foundry Models পরিষেবাগুলির অ্যাক্সেস (অথবা অ্যাক্সেসের অনুরোধ করার সক্ষমতা)
- রিসোর্স গ্রুপ তৈরি করার অনুমতি

### প্রয়োজনীয় জ্ঞান
- Azure পরিষেবাগুলির মৌলিক ধারণা
- কমান্ড-লাইন ইন্টারফেসগুলির সাথে পরিচিতি
- AI/ML-এর মৌলিক ধারণা (API, মডেল, প্রম্পট)

## ল্যাব সেটআপ

### ধাপ 1: পরিবেশ প্রস্তুতি

1. **টুল ইনস্টলেশন যাচাই করুন:**
```bash
# AZD ইনস্টলেশন পরীক্ষা করুন
azd version

# Azure CLI পরীক্ষা করুন
az --version

# Azure-এ লগইন করুন
az login
azd auth login
```

2. **ওয়ার্কশপ রিপোজিটরি ক্লোন করুন:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## মডিউল 1: AI অ্যাপ্লিকেশনগুলির জন্য AZD কাঠামো বোঝা

### AI AZD টেমপ্লেটের গঠন

AI-রেডি AZD টেমপ্লেটের মূল ফাইলগুলো অন্বেষণ করুন:

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

### **ল্যাব অনুশীলন 1.1: কনফিগারেশন অন্বেষণ করুন**

1. **azure.yaml ফাইলটি পরীক্ষা করুন:**
```bash
cat azure.yaml
```

**যা খুঁজে দেখবেন:**
- AI কম্পোনেন্টগুলির জন্য সার্ভিস সংজ্ঞা
- পরিবেশ ভেরিয়েবল ম্যাপিং
- হোস্ট কনফিগারেশন

2. **main.bicep ইনফ্রাস্ট্রাকচার পর্যালোচনা করুন:**
```bash
cat infra/main.bicep
```

**চিহ্নিত করার জন্য মূল AI প্যাটার্নসমূহ:**
- Microsoft Foundry Models সার্ভিস প্রোভিশনিং
- Cognitive Search ইন্টিগ্রেশন
- নিরাপদ কী ম্যানেজমেন্ট
- নেটওয়ার্ক সিকিউরিটি কনফিগারেশন

### **আলোচনা পয়েন্ট:** AI-এর জন্য এই প্যাটার্নগুলির গুরুত্ব কেন

- **সার্ভিস নির্ভরতা**: AI অ্যাপগুলির প্রায়ই একাধিক সমন্বিত সার্ভিস প্রয়োজন
- **নিরাপত্তা**: API কী এবং এন্ডপয়েন্টগুলির নিরাপদ ব্যবস্থাপনা প্রয়োজন
- **স্কেলেবিলিটি**: AI ওয়ার্কলোডগুলির অনন্য স্কেলিং প্রয়োজনীয়তা থাকে
- **খরচ পরিচালনা**: উপযুক্ত কনফিগারেশন না থাকলে AI পরিষেবাগুলি ব্যয়বহুল হতে পারে

## মডিউল 2: আপনার প্রথম AI অ্যাপ্লিকেশন ডিপ্লয় করুন

### ধাপ 2.1: পরিবেশ ইনিশিয়ালাইজ করুন

1. **নতুন AZD পরিবেশ তৈরি করুন:**
```bash
azd env new myai-workshop
```

2. **প্রয়োজনীয় প্যারামিটার সেট করুন:**
```bash
# আপনার পছন্দের Azure অঞ্চল সেট করুন
azd env set AZURE_LOCATION eastus

# ঐচ্ছিক: নির্দিষ্ট OpenAI মডেল সেট করুন
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### ধাপ 2.2: ইনফ্রাস্ট্রাকচার এবং অ্যাপ্লিকেশন ডিপ্লয় করুন

1. **AZD দিয়ে ডিপ্লয় করুন:**
```bash
azd up
```

**`azd up` চলার সময় যা ঘটে:**
- ✅ Microsoft Foundry Models সার্ভিস প্রোভিশন করে
- ✅ Cognitive Search সার্ভিস তৈরি করে
- ✅ ওয়েব অ্যাপ্লিকেশনের জন্য App Service সেট আপ করে
- ✅ নেটওয়ার্কিং এবং সিকিউরিটি কনফিগার করে
- ✅ অ্যাপ্লিকেশন কোড ডিপ্লয় করে
- ✅ মনিটরিং এবং লগিং সেট আপ করে

2. **ডিপ্লয়মেন্ট প্রগ্রেস মনিটর করুন** এবং তৈরি হওয়া রিসোর্সগুলিকে নোট করুন।

### ধাপ 2.3: আপনার ডিপ্লয়মেন্ট যাচাই করুন

1. **ডিপ্লয় হওয়া রিসোর্সগুলো পরীক্ষা করুন:**
```bash
azd show
```

2. **ডিপ্লয় করা অ্যাপ্লিকেশনটি খুলুন:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **AI কার্যকারিতা টেস্ট করুন:**
   - ওয়েব অ্যাপ্লিকেশনে নেভিগেট করুন
   - নমুনা কুয়েরি চেষ্টা করুন
   - যাচাই করুন AI রেস্পন্স কাজ করছে কিনা

### **ল্যাব অনুশীলন 2.1: ট্রাবলশুটিং অনুশীলন**

**সিনারিও**: আপনার ডিপ্লয়মেন্ট সফল হয়েছে কিন্তু AI প্রতিক্রিয়া করছে না।

**সাধারণ সমস্যা যা পরীক্ষা করবেন:**
1. **OpenAI API কী**: যাচাই করুন এগুলো সঠিকভাবে সেট আছে কি না
2. **মডেলের প্রাপ্যতা**: আপনার রিজিওনটি মডেল সমর্থন করে কিনা দেখুন
3. **নেটওয়ার্ক সংযোগ**: নিশ্চিত করুন সার্ভিসগুলো সংযোগ করতে পারে
4. **RBAC অনুমতি**: যাচাই করুন অ্যাপটি OpenAI অ্যাক্সেস করতে পারে কি না

**ডিবাগিং কমান্ডসমূহ:**
```bash
# পরিবেশ ভেরিয়েবলগুলো পরীক্ষা করুন
azd env get-values

# ডিপ্লয়মেন্ট লগ দেখুন
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# OpenAI ডিপ্লয়মেন্ট স্থিতি পরীক্ষা করুন
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## মডিউল 3: আপনার প্রয়োজনের জন্য AI অ্যাপ্লিকেশন কাস্টমাইজ করা

### ধাপ 3.1: AI কনফিগারেশন পরিবর্তন করুন

1. **OpenAI মডেল আপডেট করুন:**
```bash
# আপনার অঞ্চলে উপলব্ধ থাকলে অন্য মডেলে পরিবর্তন করুন
azd env set AZURE_OPENAI_MODEL gpt-4.1

# নতুন কনফিগারেশন সহ পুনরায় স্থাপন করুন
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

### ধাপ 3.2: পরিবেশ-নির্দিষ্ট কনফিগারেশন

**সেরা অনুশীলন**: ডেভেলপমেন্ট বনাম প্রোডাকশনের জন্য ভিন্ন কনফিগারেশন থাকুক।

1. **প্রোডাকশন পরিবেশ তৈরি করুন:**
```bash
azd env new myai-production
```

2. **প্রোডাকশন-নির্দিষ্ট প্যারামিটার সেট করুন:**
```bash
# প্রোডাকশনে সাধারণত উচ্চতর SKU-গুলি ব্যবহার করা হয়
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# অতিরিক্ত নিরাপত্তা বৈশিষ্ট্য সক্রিয় করুন
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **ল্যাব অনুশীলন 3.1: খরচ অপ্টিমাইজেশন**

**চ্যালেঞ্জ**: ডেভেলপমেন্টের জন্য টেমপ্লেটটি খরচ-ফ্রেন্ডলি কনফিগার করুন।

**কাজসমূহ:**
1. কোন SKUs গুলো free/basic টিয়ারে সেট করা যায় তা চিহ্নিত করুন
2. ন্যূনতম খরচের জন্য পরিবেশ ভেরিয়েবল কনফিগার করুন
3. ডিপ্লয় করুন এবং প্রোডাকশন কনফিগারেশনের সাথে খরচ তুলনা করুন

**সমাধানের টিপস:**
- যেখানে সম্ভব Cognitive Services-এর জন্য F0 (ফ্রি) টিয়ার ব্যবহার করুন
- ডেভেলপমেন্টে Search Service-এর জন্য Basic টিয়ার ব্যবহার করুন
- Functions-এর জন্য Consumption প্ল্যান বিবেচনা করুন

## মডিউল 4: নিরাপত্তা এবং প্রোডাকশনের সেরা অনুশীলন

### ধাপ 4.1: নিরাপদ ক্রেডেনশিয়াল ব্যবস্থাপনা

**বর্তমান চ্যালেঞ্জ**: অনেক AI অ্যাপ API কী হার্ডকোড করে বা অনিরাপদ স্টোরেজ ব্যবহার করে।

**AZD সমাধান**: Managed Identity + Key Vault ইন্টিগ্রেশন।

1. **আপনার টেমপ্লেটের সিকিউরিটি কনফিগারেশন পর্যালোচনা করুন:**
```bash
# কী ভল্ট এবং ম্যানেজড আইডেন্টিটি কনফিগারেশন খুঁজুন
grep -r "keyVault\|managedIdentity" infra/
```

2. **Managed Identity কাজ করছে কিনা যাচাই করুন:**
```bash
# ওয়েব অ্যাপে সঠিক পরিচয় কনফিগারেশন আছে কি না পরীক্ষা করুন
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### ধাপ 4.2: নেটওয়ার্ক সিকিউরিটি

1. **প্রাইভেট এন্ডপয়েন্টগুলি সক্ষম করুন** (যদি ইতোমধ্যে কনফিগার করা না থাকে):

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

### ধাপ 4.3: মনিটরিং এবং অবজার্ভেবিলিটি

1. **Application Insights কনফিগার করুন:**
```bash
# Application Insights স্বয়ংক্রিয়ভাবে কনফিগার করা উচিত
# কনফিগারেশন পরীক্ষা করুন:
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

### **ল্যাব অনুশীলন 4.1: সিকিউরিটি অডিট**

**কাজ**: আপনার ডিপ্লয়মেন্টটি সিকিউরিটির সেরা অনুশীলনের জন্য পর্যালোচনা করুন।

**চেকলিস্ট:**
- [ ] কোড বা কনফিগারেশনে কোন হার্ডকোডেড সিক্রেট নেই
- [ ] সার্ভিস-টু-সার্ভিস অথেনটিকেশনের জন্য Managed Identity ব্যবহার করা হয়েছে
- [ ] সংবেদনশীল কনফিগারেশন Key Vault-এ সংরক্ষিত
- [ ] নেটওয়ার্ক অ্যাকসেস সঠিকভাবে সীমাবদ্ধ
- [ ] মনিটরিং এবং লগিং সক্ষম করা হয়েছে

## মডিউল 5: আপনার নিজস্ব AI অ্যাপ্লিকেশন কনভার্ট করা

### ধাপ 5.1: মূল্যায়ন ওয়ার্কশিট

**আপনার অ্যাপ রূপান্তরের আগে**, এই প্রশ্নগুলোর উত্তর দিন:

1. **অ্যাপ্লিকেশন আর্কিটেকচার:**
   - আপনার অ্যাপ কোন AI সার্ভিসগুলো ব্যবহার করে?
   - কোন কম্পিউট রিসোর্সগুলো প্রয়োজন?
   - এটি কি একটি ডাটাবেস প্রয়োজন?
   - সার্ভিসগুলোর মধ্যে নির্ভরতাগুলো কী?

2. **নিরাপত্তা প্রয়োজনীয়তা:**
   - আপনার অ্যাপ কোন সংবেদনশীল ডেটা হ্যান্ডেল করে?
   - আপনার কি কোন কমপ্লায়েন্স প্রয়োজনীয়তা আছে?
   - কি আপনার প্রাইভেট নেটওয়ার্কিং দরকার?

3. **স্কেলিং প্রয়োজনীয়তা:**
   - আপনার প্রত্যাশিত লোড কী?
   - কি আপনাকে অটো-স্কেলিং দরকার?
   - কোন আঞ্চলিক প্রয়োজনীয়তা আছে কি?

### ধাপ 5.2: আপনার AZD টেমপ্লেট তৈরি করুন

**আপনার অ্যাপ রূপান্তর করতে এই প্যাটার্নটি অনুসরণ করুন:**

1. **বেসিক স্ট্র্যাকচার তৈরি করুন:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# AZD টেমপ্লেট প্রাথমিকীকরণ করুন
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

3. **ইনফ্রাস্ট্রাকচার টেমপ্লেট তৈরি করুন:**

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

### **ল্যাব অনুশীলন 5.1: টেমপ্লেট তৈরি চ্যালেঞ্জ**

**চ্যালেঞ্জ**: ডকুমেন্ট প্রসেসিং AI অ্যাপের জন্য একটি AZD টেমপ্লেট তৈরি করুন।

**প্রয়োজনীয়তা:**
- কন্টেন্ট বিশ্লেষণের জন্য Microsoft Foundry Models
- OCR-এর জন্য Document Intelligence
- ডকুমেন্ট আপলোডের জন্য Storage Account
- প্রসেসিং লজিকের জন্য Function App
- ব্যবহারকারীর ইন্টারফেসের জন্য ওয়েব অ্যাপ

**বোনাস পয়েন্ট:**
- সঠিক এ্যারর হ্যান্ডলিং যোগ করুন
- খরচের অনুমান অন্তর্ভুক্ত করুন
- মনিটরিং ড্যাশবোর্ড সেট আপ করুন

## মডিউল 6: সাধারণ সমস্যাগুলি ডিসকভার ও ট্রাবলশুট করা

### সাধারণ ডিপ্লয়মেন্ট সমস্যা

#### সমস্যা 1: OpenAI সার্ভিস কোটা অতিক্রম
**লক্ষণীয়তা:** ডিপ্লয়মেন্ট কোটা এরর দিয়ে ব্যর্থ হয়
**সমাধানসমূহ:**
```bash
# বর্তমান কোটাগুলি পরীক্ষা করুন
az cognitiveservices usage list --location eastus

# কোটা বাড়ানোর অনুরোধ করুন অথবা ভিন্ন অঞ্চল চেষ্টা করুন
azd env set AZURE_LOCATION westus2
azd up
```

#### সমস্যা 2: মডেল রিজিওনে উপলব্ধ নয়
**লক্ষণীয়তা:** AI রেসপন্স ব্যর্থ হয় অথবা মডেল ডিপ্লয়মেন্ট ত্রুটি ঘটছে
**সমাধানসমূহ:**
```bash
# এলাকা অনুযায়ী মডেলের প্রাপ্যতা পরীক্ষা করুন
az cognitiveservices model list --location eastus

# প্রাপ্য মডেলে আপডেট করুন
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### সমস্যা 3: অনুমতি সমস্যা
**লক্ষণীয়তা:** AI সার্ভিস কল করার সময় 403 Forbidden এরর
**সমাধানসমূহ:**
```bash
# রোল বরাদ্দ পরীক্ষা করুন
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# অনুপস্থিত রোল যোগ করুন
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### পারফরম্যান্স সমস্যা

#### সমস্যা 4: ধীর AI রেসপন্স
**তদন্তের ধাপসমূহ:**
1. পারফরম্যান্স মেট্রিকের জন্য Application Insights চেক করুন
2. Azure পোর্টালে OpenAI সার্ভিস মেট্রিক পর্যালোচনা করুন
3. নেটওয়ার্ক সংযোগ এবং লেটেন্সি যাচাই করুন

**সমাধানসমূহ:**
- সাধারণ কুয়েরিগুলোর জন্য ক্যাশিং বাস্তবায়ন করুন
- আপনার ব্যবহার কেসের জন্য উপযুক্ত OpenAI মডেল ব্যবহার করুন
- উচ্চ-লোড পরিস্থিতির জন্য রিড রিপ্লিকা বিবেচনা করুন

### **ল্যাব অনুশীলন 6.1: ডিবাগিং চ্যালেঞ্জ**

**সিনারিও**: আপনার ডিপ্লয়মেন্ট সফল হয়েছে, কিন্তু অ্যাপ্লিকেশন 500 এরর রিটার্ন করছে।

**ডিবাগিং কাজসমূহ:**
1. অ্যাপ্লিকেশন লগ চেক করুন
2. সার্ভিস সংযোগ যাচাই করুন
3. অথেনটিকেশন টেস্ট করুন
4. কনফিগারেশন পর্যালোচনা করুন

**ব্যবহার করার টুলস:**
- ডিপ্লয়মেন্ট ওভারভিউ জন্য `azd show`
- বিস্তারিত সার্ভিস লগের জন্য Azure পোর্টাল
- অ্যাপ্লিকেশন টেলিমেট্রির জন্য Application Insights

## মডিউল 7: মনিটরিং এবং অপ্টিমাইজেশন

### ধাপ 7.1: সমগ্র মনিটরিং সেট আপ করুন

1. **কাস্টম ড্যাশবোর্ড তৈরি করুন:**

Azure পোর্টালে নেভিগেট করে নিম্নলিখিত সহ একটি ড্যাশবোর্ড তৈরি করুন:
- OpenAI অনুরোধ সংখ্যা এবং লেটেন্সি
- অ্যাপ্লিকেশন এরর রেট
- রিসোর্স ব্যবহারের পরিমাপ
- খরচ ট্র্যাকিং

2. **অ্যালার্ট সেট আপ করুন:**
```bash
# উচ্চ ত্রুটির হার সম্পর্কে সতর্কতা
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### ধাপ 7.2: খরচ অপ্টিমাইজেশন

1. **বর্তমান খরচ বিশ্লেষণ করুন:**
```bash
# খরচের তথ্য পেতে Azure CLI ব্যবহার করুন
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **খরচ নিয়ন্ত্রণ বাস্তবায়ন করুন:**
- বাজেট অ্যালার্ট সেট আপ করুন
- অটোস্কেলিং পলিসি ব্যবহার করুন
- অনুরোধ ক্যাশিং বাস্তবায়িত করুন
- OpenAI-এর জন্য টোকেন ব্যবহারের মনিটরিং করুন

### **ল্যাব অনুশীলন 7.1: পারফরম্যান্স অপ্টিমাইজেশন**

**কাজ**: আপনার AI অ্যাপ্লিকেশনকে পারফরম্যান্স এবং খরচ উভয়ের জন্য অপ্টিমাইজ করুন।

**উন্নত করার মেট্রিক্স:**
- গড় রেসপন্স টাইম 20% পর্যন্ত কমানো
- মাসিক খরচ 15% পর্যন্ত কমানো
- 99.9% আপটাইম বজায় রাখা

**চেষ্টা করার কৌশল:**
- রেসপন্স ক্যাশিং বাস্তবায়ন করুন
- টোকেন দক্ষতার জন্য প্রম্পট অপ্টিমাইজ করুন
- উপযুক্ত কম্পিউট SKUs ব্যবহার করুন
- সঠিক অটোস্কেলিং সেট আপ করুন

## চূড়ান্ত চ্যালেঞ্জ: এন্ড-টু-এন্ড ইমপ্লিমেন্টেশন

### চ্যালেঞ্জ সিনারিও

আপনি একটি প্রোডাকশন-রেডি AI-চালিত কাস্টমার সার্ভিস চ্যাটবট তৈরি করার দায়িত্ব পেলেন যার এই চাহিদাগুলো আছে:

**ফাংশনাল রিকোয়ারমেন্টস:**
- কাস্টমার ইন্টারঅ্যাকশনের জন্য ওয়েব ইন্টারফেস
- রেসপন্সের জন্য Microsoft Foundry Models এর ইন্টিগ্রেশন
- Cognitive Search ব্যবহার করে ডকুমেন্ট সার্চ ক্ষমতা
- বিদ্যমান কাস্টমার ডাটাবেসের সাথে ইন্টিগ্রেশন
- বহু-ভাষা সমর্থন

**নন-ফাংশনাল রিকোয়ারমেন্টস:**
- 1000 একযোগে কনকারেন্ট ব্যবহারকারী হ্যান্ডেল করতে সক্ষম
- 99.9% আপটাইম SLA
- SOC 2 কমপ্লায়েন্স
- মাসিক খরচ $500-এর নিচে
- একাধিক পরিবেশে ডিপ্লয় (dev, staging, prod)

### ইমপ্লিমেন্টেশন ধাপসমূহ

1. আর্কিটেকচার ডিজাইন করুন
2. AZD টেমপ্লেট তৈরি করুন
3. সিকিউরিটি ব্যবস্থা বাস্তবায়ন করুন
4. মনিটরিং এবং অ্যালার্টিং সেট আপ করুন
5. ডিপ্লয়মেন্ট পাইপলাইন তৈরি করুন
6. সলিউশনটি ডকুমেন্ট করুন

### মূল্যায়ন মানদণ্ড

- ✅ **কার্যকারিতা**: এটি কি সমস্ত রিকোয়ারমেন্ট পূরণ করে?
- ✅ **নিরাপত্তা**: সেরা অনুশীলনগুলো বাস্তবায়িত হয়েছে কি?
- ✅ **স্কেলেবিলিটি**: এটি লোড সামলাতে পারে কি?
- ✅ **রক্ষণাবেক্ষণযোগ্যতা**: কোড এবং ইনফ্রাস্ট্রাকচার কি ভালভাবে সংগঠিত?
- ✅ **খরচ**: এটি বাজেটের মধ্যে আছে কি?

## অতিরিক্ত রিসোর্স

### Microsoft ডকুমেন্টেশন
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### স্যাম্পল টেমপ্লেটস
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### কমিউনিটি রিসোর্স
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Completion Certificate

অভিনন্দন! আপনি AI ওয়ার্কশপ ল্যাব সম্পন্ন করেছেন। এখন আপনি সক্ষম হওয়া উচিত:
- ✅ বিদ্যমান AI অ্যাপ্লিকেশনগুলোকে AZD টেমপ্লেটে রূপান্তর করুন
- ✅ প্রোডাকশন-চালানোর জন্য প্রস্তুত AI অ্যাপ্লিকেশন ডিপ্লয় করুন
- ✅ AI ওয়ার্কলোডের জন্য নিরাপত্তার সেরা অনুশীলনগুলো বাস্তবায়ন করুন
- ✅ AI অ্যাপ্লিকেশনের পারফরম্যান্স পর্যবেক্ষণ এবং অপ্টিমাইজ করুন
- ✅ সাধারণ ডিপ্লয়মেন্ট সমস্যা নিদান ও সমাধান করুন

### পরবর্তী ধাপ
1. আপনার নিজস্ব AI প্রকল্পে এই প্যাটার্নগুলো প্রয়োগ করুন
2. টেমপ্লেটগুলো সম্প্রদায়ে অবদান করুন
3. চলমান সহায়তার জন্য Microsoft Foundry Discord-এ যোগ দিন
4. মাল্টি-রিজিয়ন ডিপ্লয়মেন্টের মতো উন্নত বিষয়গুলো অন্বেষণ করুন

---

**ওয়ার্কশপ প্রতিক্রিয়া**: আপনার অভিজ্ঞতা [Microsoft Foundry Discord #Azure চ্যানেল](https://discord.gg/microsoft-azure)-এ শেয়ার করে আমাদের এই ওয়ার্কশপটি উন্নত করতে সাহায্য করুন।

---

**অধ্যায় নেভিগেশন:**
- **📚 কোর্স হোম**: [নবীনদের জন্য AZD](../../README.md)
- **📖 বর্তমান অধ্যায়**: অধ্যায় 2 - AI-প্রথম উন্নয়ন
- **⬅️ পূর্ববর্তী**: [AI মডেল ডিপ্লয়মেন্ট](ai-model-deployment.md)
- **➡️ পরবর্তী**: [প্রোডাকশন AI সেরা অনুশীলন](production-ai-practices.md)
- **🚀 পরবর্তী অধ্যায়**: [অধ্যায় 3: কনফিগারেশন](../chapter-03-configuration/configuration.md)

**সহায়তা দরকার?** আমাদের সম্প্রদায়ে যোগ দিন AZD এবং AI ডিপ্লয়মেন্ট সম্পর্কিত সমর্থন ও আলোচনা পাওয়ার জন্য।

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
দায়-অস্বীকৃতি:
এই নথিটি কৃত্রিম বুদ্ধিমত্তা অনুবাদ সেবা Co-op Translator (https://github.com/Azure/co-op-translator) ব্যবহার করে অনুবাদ করা হয়েছে। আমরা যথাসাধ্য সঠিকতা বজায় রাখার চেষ্টা করি, তবু অনুগ্রহ করে জানুন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসামঞ্জস্য থাকতে পারে। মূল নথিটি তার স্থানীয় ভাষায় কর্তৃপক্ষ-স্বীকৃত উৎস হিসেবে বিবেচনা করা উচিত। গুরুত্বপূর্ণ তথ্যের জন্য পেশাদার মানব অনুবাদ করা উত্তম। এই অনুবাদ ব্যবহারের ফলে উদ্ভূত কোনো ভুলবোঝাবুঝি বা ব্যাখ্যাভ্রান্তির জন্য আমরা দায়ী নই।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->