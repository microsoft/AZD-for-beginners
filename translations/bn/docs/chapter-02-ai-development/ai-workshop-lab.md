# AI ওয়ার্কশপ ল্যাব: আপনার AI সমাধানগুলি AZD-Deployable করা

**অধ্যায় নেভিগেশন:**
- **📚 কোর্স হোম**: [AZD For Beginners](../../README.md)
- **📖 বর্তমান অধ্যায়**: অধ্যায় ২ - AI-প্রথম উন্নয়ন
- **⬅️ পূর্ববর্তী**: [AI মডেল ডেপ্লয়মেন্ট](ai-model-deployment.md)
- **➡️ পরবর্তী**: [প্রোডাকশন AI সেরা অনুশীলন](production-ai-practices.md)
- **🚀 পরবর্তী অধ্যায়**: [অধ্যায় ৩: কনফিগারেশন](../chapter-03-configuration/configuration.md)

## ওয়ার্কশপ ওভারভিউ

এই হ্যান্ডস-অন ল্যাবটি ডেভেলপারদের একটি বিদ্যমান AI টেমপ্লেট নিয়ে Azure Developer CLI (AZD) ব্যবহার করে ডেপ্লয়মেন্ট করার প্রক্রিয়া নির্দেশনা দেয়। আপনি Microsoft Foundry পরিষেবাগুলি ব্যবহার করে প্রোডাকশন AI ডেপ্লয়মেন্টের প্রয়োজনীয় ধরন শিখবেন।

> **ভ্যালিডেশন নোট (2026-03-25):** এই ওয়ার্কশপটি `azd` `1.23.12` এর বিরুদ্ধে পর্যালোচনা করা হয়েছে। আপনার লোকাল ইনস্টলেশন যদি পুরনো হয়, তাহলে নিচে দেওয়া ধাপগুলির সাথে_auth, টেমপ্লেট, এবং ডেপ্লয়মেন্ট ওয়ার্কফ্লো মেলানোর জন্য AZD আপডেট করুন।

**সময়কাল:** ২-৩ ঘণ্টা  
**স্তর:** মধ্যবর্তী  
**প্রয়োজনীয়তা:** মৌলিক Azure জ্ঞান, AI/ML ধারণায় পরিচিতি

## 🎓 শেখার লক্ষ্যসমূহ

এই ওয়ার্কশপের শেষে, আপনি পারবেন:
- ✅ একটি বিদ্যমান AI অ্যাপ্লিকেশনকে AZD টেমপ্লেটে রূপান্তর করা
- ✅ AZD দিয়ে Microsoft Foundry পরিষেবাগুলো কনফিগার করা
- ✅ AI পরিষেবাগুলির জন্য নিরাপদ ক্রেডেনশিয়াল ম্যানেজমেন্ট প্রয়োগ করা
- ✅ মনিটরিং সহ প্রোডাকশন-সাজানো AI অ্যাপগুলো ডেপ্লয় করা
- ✅ সাধারণ AI ডেপ্লয়মেন্ট সমস্যা সমাধান করা

## প্রয়োজনীয়তা

### প্রয়োজনীয় টুলসমূহ
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) ইনস্টল করা
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) ইনস্টল করা
- [Git](https://git-scm.com/) ইনস্টল করা
- কোড সম্পাদক (VS কোড সুপারিশকৃত)

### Azure রিসোর্সসমূহ
- Azure সাবস্ক্রিপশন সাথে কন্ট্রিবিউটর অ্যাক্সেস
- Microsoft Foundry Models পরিষেবার অ্যাক্সেস (অথবা অ্যাক্সেস অনুরোধ করার সক্ষমতা)
- রিসোর্স গ্রুপ তৈরির অনুমতি

### জ্ঞান প্রয়োজনীয়তা
- Azure পরিষেবাগুলোর মৌলিক ধারণা
- কমান্ড-লাইন ইন্টারফেস সম্পর্কে পরিচিতি
- মৌলিক AI/ML ধারণা (API, মডেল, প্রম্পট)

## ল্যাব সেটআপ

### ধাপ ১: পরিবেশ প্রস্তুতি

1. **টুল ইনস্টলেশন যাচাই করুন:**
```bash
# AZD ইনস্টলেশন পরীক্ষা করুন
azd version

# Azure CLI পরীক্ষা করুন
az --version

# AZD ওয়ার্কফ্লোগুলির জন্য Azure-এ লগইন করুন
azd auth login

# ডায়াগনস্টিক চলাকালীন az কমান্ড চালানোর পরিকল্পনা থাকলে কেবলমাত্র Azure CLI-এ লগইন করুন
az login
```

যদি আপনি একাধিক টেন্যান্টে কাজ করেন বা আপনার সাবস্ক্রিপশন স্বয়ংক্রিয়ভাবে সনাক্ত না হয়, `azd auth login --tenant-id <tenant-id>` দিয়ে আবার চেষ্টা করুন।

2. **ওয়ার্কশপ রেপোসিটরি ক্লোন করুন:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## মডিউল ১: AI অ্যাপ্লিকেশনের জন্য AZD কাঠামো বোঝা

### AI AZD টেমপ্লেটের গঠন শারীরবিদ্যা

একটি AI-রেডি AZD টেমপ্লেটের মূল ফাইলগুলো অন্বেষণ করুন:

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

### **ল্যাব অনুশীলন ১.১: কনফিগারেশন অন্বেষণ**

1. **azure.yaml ফাইল পর্যালোচনা করুন:**
```bash
cat azure.yaml
```

**যা দেখতে হবে:**
- AI উপাদানগুলোর জন্য সার্ভিস ডেফিনিশন
- পরিবেশ ভেরিয়েবল ম্যাপিং
- হোস্ট কনফিগারেশন

2. **main.bicep অবকাঠামো পর্যালোচনা করুন:**
```bash
cat infra/main.bicep
```

**সনাক্ত করার প্রধান AI ধরণ:**
- Microsoft Foundry Models সার্ভিস প্রোভিশনিং
- Cognitive Search ইন্টিগ্রেশন
- নিরাপদ কী ম্যানেজমেন্ট
- নেটওয়ার্ক সিকিউরিটি কনফিগারেশন

### **আলোচনা বিষয়:** কেন এই ধরণগুলি AI এর জন্য গুরুত্বপূর্ণ

- **সার্ভিস নির্ভরতা**: AI অ্যাপগুলো প্রায়শই একাধিক সমন্বিত পরিষেবা প্রয়োজন
- **নিরাপত্তা**: API কী এবং এন্ডপয়েন্ট নিরাপদ ব্যবস্থাপনা প্রয়োজন
- **স্কেলেবিলিটি**: AI ওয়ার্কলোডের অনন্য স্কেলিং প্রয়োজনীয়তা রয়েছে
- **মূল্য ব্যবস্থাপনা**: AI পরিষেবাগুলো সঠিকভাবে কনফিগার না করলে ব্যয়বহুল হতে পারে

## মডিউল ২: আপনার প্রথম AI অ্যাপ্লিকেশন ডেপ্লয় করুন

### ধাপ ২.১: পরিবেশ ইনিশিয়ালাইজ করুন

1. **নতুন AZD পরিবেশ তৈরি করুন:**
```bash
azd env new myai-workshop
```

2. **প্রয়োজনীয় প্যারামিটার সেট করুন:**
```bash
# আপনার পছন্দসই Azure অঞ্চল নির্ধারণ করুন
azd env set AZURE_LOCATION eastus

# ঐচ্ছিক: নির্দিষ্ট OpenAI মডেল সেট করুন
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### ধাপ ২.২: অবকাঠামো এবং অ্যাপ্লিকেশন ডেপ্লয় করুন

1. **AZD দিয়ে ডেপ্লয় করুন:**
```bash
azd up
```

**`azd up` চলাকালীন যা ঘটে:**
- ✅ Microsoft Foundry Models সার্ভিস প্রোভিশন করা হয়
- ✅ Cognitive Search সার্ভিস তৈরি হয়
- ✅ ওয়েব অ্যাপ্লিকেশনের জন্য App Service কনফিগার করা হয়
- ✅ নেটওয়ার্কিং এবং সিকিউরিটি সেটআপ করা হয়
- ✅ অ্যাপ্লিকেশন কোড ডেপ্লয় করা হয়
- ✅ মনিটরিং এবং লগিং সেটআপ করা হয়

2. **ডেপ্লয়মেন্ট প্রগতি মনিটর করুন** এবং তৈরি হওয়া রিসোর্সগুলি লক্ষ্য করুন।

### ধাপ ২.৩: আপনার ডেপ্লয়মেন্ট যাচাই করুন

1. **ডেপ্লয় হওয়া রিসোর্স চেক করুন:**
```bash
azd show
```

2. **ডেপ্লয় হওয়া অ্যাপ্লিকেশন খুলুন:**
```bash
azd show
```

`azd show` আউটপুটে প্রদর্শিত ওয়েব এন্ডপয়েন্টটি খুলুন।

3. **AI কার্যকারিতা পরীক্ষা করুন:**
   - ওয়েব অ্যাপ্লিকেশনে যান
   - নমুনা প্রশ্নসমূহ চেষ্টা করুন
   - নিশ্চিত করুন AI প্রতিক্রিয়া কাজ করছে

### **ল্যাব অনুশীলন ২.১: সমস্যা সমাধান অনুশীলন**

**পরিস্থিতি:** আপনার ডেপ্লয়মেন্ট সফল হয়েছে কিন্তু AI প্রতিক্রিয়া দিচ্ছে না।

**সাধারণ সমস্যা পরীক্ষা করুন:**
1. **OpenAI API কী**: সঠিকভাবে সেট আছে কিনা যাচাই করুন
2. **মডেল উপলব্ধতা**: আপনার অঞ্চল মডেল সমর্থন করে কিনা দেখুন
3. **নেটওয়ার্ক সংযোগ**: পরিষেবাগুলোকে যোগাযোগ করার অনুমতি আছে কিনা নিশ্চিত করুন
4. **RBAC অনুমতি**: অ্যাপ্লিকেশন OpenAI অ্যাক্সেস করতে পারে কিনা যাচাই করুন

**ডিবাগ কমান্ডসমূহ:**
```bash
# পরিবেশ ভেরিয়েবলগুলি চেক করুন
azd env get-values

# ডিপ্লয়মেন্ট লগগুলি দেখুন
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# OpenAI ডিপ্লয়মেন্ট স্থিতি চেক করুন
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## মডিউল ৩: আপনার প্রয়োজন অনুযায়ী AI অ্যাপ্লিকেশন কাস্টমাইজেশন

### ধাপ ৩.১: AI কনফিগারেশন পরিবর্তন

1. **OpenAI মডেল আপডেট করুন:**
```bash
# একটি ভিন্ন মডেলে পরিবর্তন করুন (যদি আপনার অঞ্চলে পাওয়া যায়)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# নতুন সংরচনার সাথে পুনরায় নিয়োগ করুন
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

**সেরা অনুশীলন:** উন্নয়ন এবং প্রোডাকশন বিভিন্ন কনফিগারেশন ব্যবহার করা।

1. **প্রোডাকশন পরিবেশ তৈরি করুন:**
```bash
azd env new myai-production
```

2. **প্রোডাকশন-নির্দিষ্ট প্যারামিটার সেট করুন:**
```bash
# উৎপাদনে সাধারণত বেশি SKU ব্যবহৃত হয়
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# অতিরিক্ত সুরক্ষা বৈশিষ্ট্য সক্রিয় করুন
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **ল্যাব অনুশীলন ৩.১: খরচ অপ্টিমাইজেশন**

**চ্যালেঞ্জ:** খরচ সাশ্রয়ী উন্নয়নের জন্য টেমপ্লেট কনফিগার করা।

**কাজ:**
1. কোন SKUs বিনামূল্যে/বেসিক স্তরে সেট করা যাবে সনাক্ত করুন
2. পরিমিত খরচের জন্য পরিবেশ ভেরিয়েবল কনফিগার করুন
3. ডেপ্লয় করে প্রোডাকশন কনফিগারেশনের সাথে খরচ তুলনা করুন

**সমাধানের সূত্র:**
- সম্ভব হলে Cognitive Services এর জন্য F0 (ফ্রি) স্তর ব্যবহার করুন
- উন্নয়নে Search Service এর জন্য Basic tier ব্যবহার করুন
- Functions এর জন্য Consumption প্ল্যান বিবেচনা করুন

## মডিউল ৪: সিকিউরিটি এবং প্রোডাকশন সেরা অনুশীলন

### ধাপ ৪.১: নিরাপদ ক্রেডেনশিয়াল ম্যানেজমেন্ট

**বর্তমান সমস্যা:** অনেক AI অ্যাপ API কী হার্ডকোড করে বা অসুরক্ষিত সংরক্ষণ ব্যবহার করে।

**AZD সমাধান:** Managed Identity + Key Vault ইন্টিগ্রেশন।

1. **আপনার টেমপ্লেটে নিরাপত্তা কনফিগারেশন পর্যালোচনা করুন:**
```bash
# কী ভল্ট এবং ম্যানেজড আইডেন্টিটি কনফিগারেশন খুঁজুন
grep -r "keyVault\|managedIdentity" infra/
```

2. **Managed Identity কাজ করছে কিনা যাচাই করুন:**
```bash
# যাচাই করুন ওয়েব অ্যাপের সঠিক পরিচয় কনফিগারেশন আছে কিনা
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### ধাপ ৪.২: নেটওয়ার্ক সিকিউরিটি

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
# অ্যাপ্লিকেশন ইনসাইটস স্বয়ংক্রিয়ভাবে কনফিগার করা উচিত
# কনফিগারেশন পরীক্ষা করুন:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **AI-নির্দিষ্ট মনিটরিং সেটআপ করুন:**

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

### **ল্যাব অনুশীলন ৪.১: সিকিউরিটি অডিট**

**কাজ:** আপনার ডেপ্লয়মেন্টের সিকিউরিটি সেরা অনুশীলন পর্যালোচনা করুন।

**চেকলিস্ট:**
- [ ] কোড বা কনফিগারেশনে কোনও হার্ডকোডেড সিক্রেট নেই
- [ ] সার্ভিস-টু-সার্ভিস অথেনটিকেশনের জন্য Managed Identity ব্যবহৃত
- [ ] Key Vault সংবেদনশীল কনফিগারেশন সংরক্ষণ করে
- [ ] নেটওয়ার্ক অ্যাক্সেস সঠিকভাবে সীমাবদ্ধ
- [ ] মনিটরিং এবং লগিং সক্রিয়

## মডিউল ৫: আপনার নিজস্ব AI অ্যাপ্লিকেশন রূপান্তর

### ধাপ ৫.১: মূল্যায়ন ওয়ার্কশিট

**আপনার অ্যাপ রূপান্তর করার আগে**, এই প্রশ্নগুলোর উত্তর দিন:

1. **অ্যাপ্লিকেশন স্থাপত্য:**
   - আপনার অ্যাপ কোন AI পরিষেবা ব্যবহার করে?
   - এটি কোন কম্পিউট রিসোর্স প্রয়োজন?
   - কি এটি ডাটাবেস প্রয়োজন?
   - পরিষেবাগুলোর মধ্যে নির্ভরতা কী কী?

2. **নিরাপত্তা প্রয়োজনীয়তা:**
   - আপনার অ্যাপ কোন সংবেদনশীল ডেটা পরিচালনা করে?
   - আপনার প্রশাসনিক নিয়ম কী কী?
   - কি প্রাইভেট নেটওয়ার্কিং প্রয়োজন?

3. **স্কেলিং প্রয়োজনীয়তা:**
   - আপনার প্রত্যাশিত লোড কত?
   - কি অটো-স্কেলিং দরকার?
   - কি আঞ্চলিক প্রয়োজনীয়তা আছে?

### ধাপ ৫.২: আপনার AZD টেমপ্লেট তৈরি করুন

**এই ধরণ অনুসরণ করে আপনার অ্যাপ রূপান্তর করুন:**

1. **মৌলিক কাঠামো তৈরি করুন:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# AZD টেমপ্লেট শুরু করুন
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

### **ল্যাব অনুশীলন ৫.১: টেমপ্লেট তৈরির চ্যালেঞ্জ**

**চ্যালেঞ্জ:** ডকুমেন্ট প্রোসেসিং AI অ্যাপের জন্য AZD টেমপ্লেট তৈরি করুন।

**প্রয়োজনীয়তা:**
- কনটেন্ট বিশ্লেষণের জন্য Microsoft Foundry Models
- OCR জন্য Document Intelligence
- ডকুমেন্ট আপলোডের জন্য Storage Account
- প্রোসেসিং লজিকের জন্য Function App
- ব্যবহারকারী ইন্টারফেসের জন্য ওয়েব অ্যাপ

**বোনাস পয়েন্ট:**
- সঠিক ত্রুটি পরিচালনা যোগ করুন
- খরচের অনুমান অন্তর্ভুক্ত করুন
- মনিটরিং ড্যাশবোর্ড সেটআপ করুন

## মডিউল ৬: সাধারণ সমস্যা সমাধান

### সাধারণ ডেপ্লয়মেন্ট সমস্যা

#### সমস্যা ১: OpenAI সার্ভিস কোটা ছাড়িয়ে গেছে
**লক্ষণ:** কোটা এররে ডেপ্লয়মেন্ট ব্যর্থ হয়
**সমাধান:**
```bash
# বর্তমান কোটা পরীক্ষা করুন
az cognitiveservices usage list --location eastus

# কোটা বাড়ানোর জন্য অনুরোধ করুন অথবা অন্য অঞ্চল চেষ্টা করুন
azd env set AZURE_LOCATION westus2
azd up
```

#### সমস্যা ২: অঞ্চলভিত্তিক মডেল উপলব্ধ নয়
**লক্ষণ:** AI প্রতিক্রিয়া ব্যর্থ বা মডেল ডেপ্লয়মেন্ট এরর
**সমাধান:**
```bash
# অঞ্চল অনুযায়ী মডেল উপলব্ধতা পরীক্ষা করুন
az cognitiveservices model list --location eastus

# উপলব্ধ মডেলে আপডেট করুন
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### সমস্যা ৩: অনুমতি সমস্যা
**লক্ষণ:** AI পরিষেবাগুলো কল করার সময় 403 ফরবিডেন এরর
**সমাধান:**
```bash
# ভূমিকা বরাদ্দ পরীক্ষা করুন
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# অনুপস্থিত ভূমিকা যোগ করুন
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### পারফরমেন্স সমস্যা

#### সমস্যা ৪: ধীর AI প্রতিক্রিয়া
**অনুসন্ধান ধাপ:**
1. পারফরমেন্স মেট্রিক্সের জন্য Application Insights পরীক্ষা করুন
2. Azure পোর্টালে OpenAI সার্ভিস মেট্রিক্স পর্যালোচনা করুন
3. নেটওয়ার্ক সংযোগ এবং লেটেন্সি যাচাই করুন

**সমাধান:**
- সাধারণ কুয়েরিগুলোর জন্য ক্যাশিং প্রয়োগ করুন
- আপনার ক্ষেত্রে উপযুক্ত OpenAI মডেল ব্যবহার করুন
- উচ্চ লোডের জন্য রিড রেপ্লিকা ব্যবহার বিবেচনা করুন

### **ল্যাব অনুশীলন ৬.১: ডিবাগিং চ্যালেঞ্জ**

**পরিস্থিতি:** ডেপ্লয়মেন্ট সফল হয়েছে, তবে অ্যাপ্লিকেশন ৫০০ এরর দেয়।

**ডিবাগিং কাজসমূহ:**
1. অ্যাপ্লিকেশন লগস চেক করুন
2. সার্ভিস সংযোগ যাচাই করুন
3. অথেন্টিকেশন পরীক্ষা করুন
4. কনফিগারেশন পর্যালোচনা করুন

**ব্যবহারযোগ্য টুলস:**
- ডেপ্লয়মেন্ট ওভারভিউর জন্য `azd show`
- বিস্তারিত সার্ভিস লগের জন্য Azure পোর্টাল
- অ্যাপ্লিকেশন টেলিমেট্রির জন্য Application Insights

## মডিউল ৭: মনিটরিং এবং অপ্টিমাইজেশন

### ধাপ ৭.১: ব্যাপক মনিটরিং সেটআপ করুন

1. **কাস্টম ড্যাশবোর্ড তৈরি করুন:**

Azure পোর্টালে যান এবং নিম্নলিখিত বিষয়ের একটি ড্যাশবোর্ড তৈরি করুন:
- OpenAI রিকোয়েস্ট গণনা এবং লেটেন্সি
- অ্যাপ্লিকেশন এরর রেট
- রিসোর্স ব্যবহারের হার
- খরচ ট্র্যাকিং

2. **অ্যালার্ট সেট করুন:**
```bash
# উচ্চ ত্রুটি হারের জন্য সতর্কতা
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
# Azure CLI ব্যবহার করে খরচের তথ্য পাওয়া
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **খরচ নিয়ন্ত্রণ প্রয়োগ করুন:**
- বাজেট অ্যালার্ট সেট করুন
- অটো-স্কেলিং নীতি ব্যবহার করুন
- রিকোয়েস্ট ক্যাশিং প্রয়োগ করুন
- OpenAI টোকেন ব্যবহারের মনিটরিং করুন

### **ল্যাব অনুশীলন ৭.১: পারফরমেন্স অপ্টিমাইজেশন**

**কাজ:** আপনার AI অ্যাপ্লিকেশন পারফরমেন্স এবং খরচ উভয়ই অপ্টিমাইজ করুন।

**উন্নতির পরিমাপ:**
- গড় প্রতিক্রিয়া সময় ২০% কমানো
- মাসিক খরচ ১৫% কমানো
- ৯৯.৯% আপটাইম বজায় রাখা

**পরীক্ষার কৌশলসমূহ:**
- প্রতিক্রিয়া ক্যাশিং প্রয়োগ করুন
- টোকেন দক্ষতার জন্য প্রম্পট অপ্টিমাইজ করুন
- উপযুক্ত কম্পিউট SKUs ব্যবহার করুন
- সঠিক অটো-স্কেলিং সেটআপ করুন

## চূড়ান্ত চ্যালেঞ্জ: এন্ড-টু-এন্ড ইমপ্লিমেন্টেশন

### চ্যালেঞ্জ পরিস্থিতি

আপনি একটি প্রোডাকশন-রেডি AI-চালিত কাস্টমার সার্ভিস চ্যাটবট তৈরি করার জন্য দায়িত্বপ্রাপ্ত, নিম্নলিখিত প্রয়োজনীয়তাসহ:

**কার্যকরী প্রয়োজনীয়তা:**
- কাস্টমার ইন্টারঅ্যাকশনের জন্য ওয়েব ইন্টারফেস
- Microsoft Foundry Models এর সাথে ইন্টিগ্রেশন প্রতিক্রিয়ার জন্য
- Cognitive Search ব্যবহার করে ডকুমেন্ট সার্চ ক্ষমতা
- বিদ্যমান কাস্টমার ডাটাবেসের সাথে ইন্টিগ্রেশন
- মাল্টি-ল্যাঙ্গুয়েজ সাপোর্ট

**অকার্যকরী প্রয়োজনীয়তা:**
- ১০০০ সমসাময়িক ব্যবহারকারী পরিচালনা করতে সক্ষম
- ৯৯.৯% আপটাইম SLA
- SOC ২ সম্মতি
- মাসিক $৫০০ এর নিচে খরচ
- একাধিক পরিবেশে ডেপ্লয়মেন্ট (ডেভ, স্টেজিং, প্রোড)

### ইমপ্লিমেন্টেশন ধাপসমূহ

1. আর্কিটেকচার ডিজাইন করুন  
2. AZD টেমপ্লেট তৈরি করুন  
3. নিরাপত্তা ব্যবস্থা প্রয়োগ করুন  
4. মনিটরিং এবং অ্যালার্টিং সেটআপ করুন  
5. ডেপ্লয়মেন্ট পাইপলাইন তৈরি করুন  
6. সমাধান ডকুমেন্ট করুন  

### মূল্যায়ন মানদণ্ড

- ✅ **কার্যকারিতা**: সব প্রয়োজনীয়তা পূরণ করে?  
- ✅ **নিরাপত্তা**: সেরা অনুশীলন প্রয়োগ হয়েছে?  
- ✅ **স্কেলেবিলিটি**: লোড পরিচালনা করতে পারে?  
- ✅ **রক্ষণাবেক্ষণযোগ্যতা**: কোড ও অবকাঠামো সুশৃঙ্খল?  
- ✅ **খরচ**: বাজেটের মধ্যে আছে?

## অতিরিক্ত সম্পদ

### Microsoft ডকুমেন্টেশন
- [Azure Developer CLI ডকুমেন্টেশন](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models সার্ভিস ডকুমেন্টেশন](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry ডকুমেন্টেশন](https://learn.microsoft.com/azure/ai-studio/)

### নমুনা টেমপ্লেটসমূহ
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### কমিউনিটি রিসোর্সেস
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 সম্পূর্ণতার সার্টিফিকেট

অভিনন্দন! আপনি AI ওয়ার্কশপ ল্যাব সফলভাবে সম্পন্ন করেছেন। এখন আপনি সক্ষম হওয়া উচিত:

- ✅ বিদ্যমান AI অ্যাপ্লিকেশনগুলি AZডি টেম্পলেটসে রূপান্তর করা
- ✅ প্রোডাকশন-রেডি AI অ্যাপ্লিকেশন স্থাপন করা
- ✅ AI ওয়ার্কলোডের জন্য সুরক্ষার সেরা অনুশীলন প্রয়োগ করা
- ✅ AI অ্যাপ্লিকেশনের কর্মক্ষমতা পর্যবেক্ষণ এবং অপ্টিমাইজেশন করা
- ✅ সাধারণ ডিপ্লয়মেন্ট সমস্যাগুলি সমাধান করা

### পরবর্তী ধাপসমূহ
1. আপনার নিজস্ব AI প্রকল্পে এই প্যাটার্নগুলি প্রয়োগ করুন
2. টেম্পলেটগুলি সম্প্রদায়ের কাছে অবদান রাখুন
3. চলমান সহায়তার জন্য Microsoft Foundry Discord-এ যোগ দিন
4. মাল্টি-রিজিয়ন ডিপ্লয়মেন্টের মতো উন্নত বিষয়গুলি অন্বেষণ করুন

---

**ওয়ার্কশপ ফিডব্যাক**: এই ওয়ার্কশপ উন্নত করতে আমাদের সাহায্য করুন আপনার অভিজ্ঞতা [Microsoft Foundry Discord #Azure channel](https://discord.gg/microsoft-azure) এ শেয়ার করে।

---

**অধ্যায় নেভিগেশন:**
- **📚 কোর্স হোম**: [AZD For Beginners](../../README.md)
- **📖 বর্তমান অধ্যায়**: অধ্যায় ২ - AI-প্রথম উন্নয়ন
- **⬅️ পূর্ববর্তী**: [AI মডেল ডিপ্লয়মেন্ট](ai-model-deployment.md)
- **➡️ পরবর্তী**: [প্রোডাকশন AI সেরা অনুশীলন](production-ai-practices.md)
- **🚀 পরবর্তী অধ্যায়**: [অধ্যায় ৩: কনফিগারেশন](../chapter-03-configuration/configuration.md)

**সহায়তার প্রয়োজন?** AZD এবং AI ডিপ্লয়মেন্ট সম্পর্কে সমর্থন ও আলোচনা করতে আমাদের কমিউনিটিতে যোগ দিন।

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**অস্বীকৃতি**:
এই ডকুমেন্টটি AI অনুবাদ সেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনূদিত হয়েছে। আমরা যথাসাধ্য সঠিকতার জন্য চেষ্টা করি, তবে অনুগ্রহ করে জেনে রাখুন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসঙ্গতি থাকতে পারে। মূল ডকুমেন্টটি তার স্বদেশী ভাষায়ই কর্তৃত্বপূর্ণ উৎস হিসেবে বিবেচিত হওয়া উচিত। গুরুত্বপূর্ণ তথ্যের জন্য পেশাদার মানব অনুবাদ সুপারিশ করা হয়। এই অনুবাদের ব্যবহারে সৃষ্ট যে কোন ভুল বোঝাবুঝি বা বিভ্রাটের জন্য আমরা দায়ী হই না।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->