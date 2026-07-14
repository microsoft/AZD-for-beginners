# AI ওয়ার্কশপ ল্যাব: আপনার AI সমাধানগুলোকে AZD-Deployable করা

**অধ্যায় নেভিগেশন:**
- **📚 কোর্স হোম**: [শুরু করার জন্য AZD](../../README.md)
- **📖 বর্তমান অধ্যায়**: অধ্যায় ২ - AI-প্রথম উন্নয়ন
- **⬅️ পূর্ববর্তী**: [AI মডেল ডিপ্লয়মেন্ট](ai-model-deployment.md)
- **➡️ পরবর্তী**: [প্রোডাকশন AI সেরা অনুশীলন](production-ai-practices.md)
- **🚀 পরবর্তী অধ্যায়**: [অধ্যায় ৩: কনফিগারেশন](../chapter-03-configuration/configuration.md)

## ওয়ার্কশপ ওভারভিউ

এই ব্যবহারিক ল্যাবে ডেভেলপাররা একটি বিদ্যমান AI টেমপ্লেট গ্রহণ করে কিভাবে Azure Developer CLI (AZD) ব্যবহার করে সেটি ডিপ্লয় করতে পারে তা বোঝানো হবে। আপনি Microsoft Foundry সার্ভিস ব্যবহার করে প্রোডাকশন AI ডিপ্লয়মেন্টের জন্য গুরুত্বপূর্ণ প্যাটার্ন শিখবেন।

> **ভ্যালিডেশন নোট (২০২৬-০৭-১৩):** এই ওয়ার্কশপটি `azd` `1.27.1` সংস্করণের বিরুদ্ধে পর্যালোচিত হয়েছে। যদি আপনার লোকাল ইনস্টলেশন পুরোনো হয়, তাহলে শুরু করার আগে AZD আপডেট করুন যাতে অথেন্টিকেশন, টেমপ্লেট, এবং ডিপ্লয়মেন্ট ওয়ার্কফ্লো নিচের ধাপগুলোর সাথে মিলে যায়।

**সময়কাল:** ২-৩ ঘণ্টা  
**স্তর:** মধ্যবর্তী  
**প্রয়োজনীয়তা:** প্রাথমিক Azure জ্ঞান, AI/ML ধারণাগুলোর সাথে পরিচিতি

## 🎓 শেখার উদ্দেশ্যসমূহ

এই ওয়ার্কশপ শেষ করার সময়, আপনি পারবেন:
- ✅ একটি বিদ্যমান AI অ্যাপ্লিকেশনকে AZD টেমপ্লেট ব্যবহার করে রূপান্তর করা
- ✅ AZD দিয়ে Microsoft Foundry সার্ভিস কনফিগার করা
- ✅ AI সার্ভিসের জন্য নিরাপদ ক্রেডেনশিয়াল ব্যবস্থাপনা প্রয়োগ করা
- ✅ প্রোডাকশন-সক্ষম AI অ্যাপ্লিকেশন মনিটরিং সহ ডিপ্লয় করা
- ✅ সাধারণ AI ডিপ্লয়মেন্ট সমস্যা সমাধান করা

## প্রয়োজনীয়তা

### প্রয়োজনীয় সরঞ্জাম
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) ইনস্টল করা
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) ইনস্টল করা
- [Git](https://git-scm.com/) ইনস্টল করা
- কোড এডিটর (VS Code প্রস্তাবিত)

### Azure রিসোর্স
- কন্ট্রিবিউটর অ্যাক্সেস সহ Azure সাবস্ক্রিপশন
- Microsoft Foundry Models সার্ভিসে অ্যাক্সেস (অথবা অ্যাক্সেসের অনুরোধ করতে সক্ষম)
- রিসোর্স গ্রুপ তৈরি করার অনুমতি

### জ্ঞান সম্পর্কিত প্রয়োজনীয়তা
- Azure সার্ভিসের প্রাথমিক ধারণা
- কমান্ড-লাইন ইন্টারফেসগুলোর সাথে পরিচিতি
- প্রাথমিক AI/ML ধারণা (API, মডেল, প্রম্পট)

## ল্যাব সেটআপ

### ধাপ ১: পরিবেশ প্রস্তুতি

1. **টুল ইনস্টলেশন যাচাই করুন:**
```bash
# AZD ইন্সটলেশন চেক করুন
azd version

# Azure CLI চেক করুন
az --version

# AZD ওয়ার্কফ্লো করার জন্য Azure এ লগইন করুন
azd auth login

# নিম্নলিখিত ডায়াগনস্টিক চলাকালে az কমান্ড চালানোর পরিকল্পনা থাকলে শুধুমাত্র Azure CLI এ লগইন করুন
az login
```

আপনি যদি একাধিক টেনান্টের মধ্যে কাজ করেন বা আপনার সাবস্ক্রিপশন স্বয়ংক্রিয়ভাবে সনাক্ত না হয়, তাহলে `azd auth login --tenant-id <tenant-id>` দিয়ে আবার চেষ্টা করুন।

2. **ওয়ার্কশপ রিপোজিটরি ক্লোন করুন:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## মডিউল ১: AI অ্যাপ্লিকেশনের জন্য AZD স্ট্রাকচার বোঝা

### AI AZD টেমপ্লেটের গঠন

AI-রেডি AZD টেমপ্লেটের মূল ফাইলগুলি অন্বেষণ করুন:

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

### **ল্যাব অনুশীলন ১.১: কনফিগারেশন এক্সপ্লোর করা**

1. **azure.yaml ফাইল পরীক্ষা করুন:**
```bash
cat azure.yaml
```

**দেখার জন্য কী:**
- AI কম্পোনেন্টের জন্য সার্ভিস সংজ্ঞা
- পরিবেশ ভেরিয়েবল ম্যাপিং
- হোস্ট কনফিগারেশন

2. **main.bicep অবকাঠামো পর্যালোচনা করুন:**
```bash
cat infra/main.bicep
```

**সনাক্ত করার জন্য গুরুত্বপূর্ণ AI প্যাটার্ন:**
- Microsoft Foundry Models সার্ভিস প্রোভিশনিং
- Azure AI সার্চ ইন্টিগ্রেশন
- নিরাপদ কী ম্যানেজমেন্ট
- নেটওয়ার্ক সুরক্ষা কনফিগারেশন

### **আলোচনা পয়েন্ট:** কেন এই প্যাটার্নগুলি AI-এর জন্য গুরুত্বপূর্ণ

- **সার্ভিস নির্ভরশীলতা**: AI অ্যাপগুলো প্রায়শই একাধিক সমন্বিত সার্ভিসের প্রয়োজন
- **নিরাপত্তা**: API কী ও এন্ডপয়েন্ট নিরাপদভাবে পরিচালনা করা অত্যাবশ্যক
- **স্কেলেবিলিটি**: AI কাজের জন্য নির্দিষ্ট স্কেলিং প্রয়োজনীয়তা রয়েছে
- **খরচ ব্যবস্থাপনা**: AI সার্ভিস সঠিকভাবে কনফিগার না করলে ব্যয়বহুল হতে পারে

## মডিউল ২: আপনার প্রথম AI অ্যাপ্লিকেশন ডিপ্লয় করুন

### ধাপ ২.১: পরিবেশ ইনিশিয়ালাইজ করুন

1. **নতুন AZD পরিবেশ তৈরি করুন:**
```bash
azd env new myai-workshop
```

2. **প্রয়োজনীয় প্যারামিটার সেট করুন:**
```bash
# আপনার পছন্দসই Azure অঞ্চল সেট করুন
azd env set AZURE_LOCATION eastus

# ঐচ্ছিক: নির্দিষ্ট OpenAI মডেল সেট করুন
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### ধাপ ২.২: অবকাঠামো এবং অ্যাপ্লিকেশন ডিপ্লয় করুন

1. **AZD দিয়ে ডিপ্লয় করুন:**
```bash
azd up
```

**`azd up` চলার সময় কী ঘটে:**
- ✅ Microsoft Foundry Models সার্ভিস প্রোভিশনিং
- ✅ Azure AI সার্চ সার্ভিস তৈরি
- ✅ ওয়েব অ্যাপ্লিকেশনের জন্য অ্যাপ সার্ভিস সেটআপ
- ✅ নেটওয়ার্কিং এবং সিকিউরিটি কনফিগার
- ✅ অ্যাপ্লিকেশন কোড ডিপ্লয় করা হয়
- ✅ মনিটরিং ও লগিং সেটআপ করা হয়

2. **ডিপ্লয়মেন্ট প্রগতিতে নজর রাখুন** এবং তৈরি হওয়া রিসোর্সগুলো লক্ষ্য করুন।

### ধাপ ২.৩: আপনার ডিপ্লয়মেন্ট যাচাই করুন

1. **ডিপ্লয় হওয়া রিসোর্সগুলো পরীক্ষা করুন:**
```bash
azd show
```

2. **ডিপ্লয় হওয়া অ্যাপ্লিকেশনটি খুলুন:**
```bash
azd show
```

`azd show` আউটপুটে প্রদর্শিত ওয়েব এন্ডপয়েন্ট খুলুন।

3. **AI ফাংশনালিটি পরীক্ষা করুন:**
   - ওয়েব অ্যাপ্লিকেশনে যান
   - স্যাম্পল প্রশ্ন করুন
   - AI উত্তরগুলো কাজ করছে কিনা যাচাই করুন

### **ল্যাব অনুশীলন ২.১: সমস্যা সমাধানের অনুশীলন**

**পরিস্থিতি**: আপনার ডিপ্লয়মেন্ট সফল হয়েছে কিন্তু AI প্রতিক্রিয়া দিচ্ছে না।

**সাধারণ সমস্যাগুলো যাচাই করুন:**
1. **OpenAI API কী**: সঠিকভাবে সেট আছে কিনা পরীক্ষা করুন
2. **মডেল উপলব্ধতা**: আপনার অঞ্চলে মডেলটি সমর্থিত আছে কিনা দেখুন
3. **নেটওয়ার্ক সংযোগ**: সার্ভিসগুলো যোগাযোগ করতে পারছে কিনা নিশ্চিত করুন
4. **RBAC অনুমতি**: অ্যাপটি OpenAI-তে অ্যাক্সেস পাচ্ছে কিনা যাচাই করুন

**ডিবাগিং কমান্ড:**
```bash
# পরিবেশ ভেরিয়েবল পরীক্ষা করুন
azd env get-values

# ডিপ্লয়মেন্ট লগগুলি দেখুন
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# OpenAI ডিপ্লয়মেন্ট স্থিতি পরীক্ষা করুন
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## মডিউল ৩: আপনার প্রয়োজন অনুযায়ী AI অ্যাপ্লিকেশন কাস্টমাইজেশন

### ধাপ ৩.১: AI কনফিগারেশন পরিবর্তন করুন

1. **OpenAI মডেল আপডেট করুন:**
```bash
# অন্য একটি মডেলে পরিবর্তন করুন (যদি আপনার অঞ্চলে উপলব্ধ থাকে)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# নতুন কনফিগারেশন সহ পুনরায় ডিপ্লয় করুন
azd deploy
```

2. **অতিরিক্ত AI সার্ভিস যোগ করুন:**

ডকুমেন্ট ইন্টেলিজেন্স যোগ করতে `infra/main.bicep` এডিট করুন:

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

**সেরা অনুশীলন**: ডেভেলপমেন্ট এবং প্রোডাকশনের জন্য আলাদা কনফিগারেশন।

1. **একটি প্রোডাকশন পরিবেশ তৈরি করুন:**
```bash
azd env new myai-production
```

2. **প্রোডাকশন-নির্দিষ্ট প্যারামিটার সেট করুন:**
```bash
# উৎপাদনে সাধারণত উচ্চতর SKU ব্যবহার করা হয়
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# অতিরিক্ত নিরাপত্তা বৈশিষ্ট্য সক্রিয় করুন
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **ল্যাব অনুশীলন ৩.১: খরচ সাশ্রয়**

**চ্যালেঞ্জ:** উন্নয়নের জন্য টেমপ্লেটটি খরচ-সাশ্রয়ীভাবে কনফিগার করুন।

**কার্যের তালিকা:**
1. কোন SKUs ফ্রি/বেসিক টিয়ারে সেট করা যায় তা চিহ্নিত করুন
2. খরচ কমানোর জন্য পরিবেশ ভেরিয়েবল কনফিগার করুন
3. প্রোডাকশন কনফিগারেশনের সঙ্গে তুলনা করে ডিপ্লয় করুন

**সমাধান ইঙ্গিত:**
- সম্ভব হলে Azure AI সার্ভিসের জন্য F0 (ফ্রি) টিয়ার ব্যবহার করুন
- ডেভেলপমেন্টে সার্চ সার্ভিসের জন্য বেসিক টিয়ার ব্যবহার করুন
- ফাংশনের জন্য কনজাম্পশন প্ল্যান বিবেচনা করুন

## মডিউল ৪: নিরাপত্তা এবং প্রোডাকশন সেরা অনুশীলন

### ধাপ ৪.১: নিরাপদ ক্রেডেনশিয়াল ম্যানেজমেন্ট

**বর্তমান চ্যালেঞ্জ:** অনেক AI অ্যাপ হাডকোডেড API কী ব্যবহার করে বা অনিরাপদ স্টোরেজে সংরক্ষণ করে।

**AZD সমাধান:** Managed Identity + Key Vault ইন্টিগ্রেশন।

1. **আপনার টেমপ্লেটে নিরাপত্তা কনফিগারেশন পর্যালোচনা করুন:**
```bash
# কী ভল্ট এবং ম্যানেজড আইডেন্টিটি কনফিগারেশন খুঁজুন
grep -r "keyVault\|managedIdentity" infra/
```

2. **Managed Identity কাজ করছে কিনা যাচাই করুন:**
```bash
# চেক করুন ওয়েব অ্যাপটির সঠিক পরিচয় কনফিগারেশন রয়েছে কিনা
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### ধাপ ৪.২: নেটওয়ার্ক সিকিউরিটি

1. **প্রাইভেট এন্ডপয়েন্ট সক্ষম করুন** (যদি আগে কনফিগার না করা হয়):

আপনার বেসিক টেমপ্লেটে যোগ করুন:
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

### ধাপ ৪.৩: মনিটরিং এবং পর্যবেক্ষণ

1. **অ্যাপ্লিকেশন ইনসাইটস কনফিগার করুন:**
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

### **ল্যাব অনুশীলন ৪.১: নিরাপত্তা নিরীক্ষা**

**কাজ:** আপনার ডিপ্লয়মেন্টের নিরাপত্তা সেরা অনুশীলনগুলো পর্যালোচনা করুন।

**তালিকা:**
- [ ] কোড বা কনফিগারেশনে কোন হাডকোডেড সিক্রেট নেই
- [ ] সার্ভিস-টু-সার্ভিস অথেন্টিকেশনের জন্য Managed Identity ব্যবহৃত হয়েছে
- [ ] Key Vault সংবেদনশীল কনফিগারেশন সংরক্ষণ করে
- [ ] নেটওয়ার্ক প্রবেশাধিকার সঠিকভাবে সীমিত
- [ ] মনিটরিং এবং লগিং সক্ষম

## মডিউল ৫: আপনার নিজস্ব AI অ্যাপ্লিকেশন রূপান্তর

### ধাপ ৫.১: মূল্যায়ন ওয়ার্কশিট

**আপনার অ্যাপ রূপান্তরের আগে**, এই প্রশ্নগুলোর উত্তর দিন:

1. **অ্যাপ্লিকেশন আর্কিটেকচার:**
   - আপনার অ্যাপ কোন AI সার্ভিস ব্যবহার করে?
   - কোন কম্পিউট রিসোর্স দরকার?
   - কি ডেটাবেস দরকার?
   - সার্ভিসগুলোর মধ্যে নির্ভরশীলতা কী?

2. **নিরাপত্তা প্রয়োজনীয়তা:**
   - আপনার অ্যাপ কোন সংবেদনশীল তথ্য পরিচালনা করে?
   - কোন কমপ্লায়েন্স প্রয়োজন আছে?
   - প্রাইভেট নেটওয়ার্কিং দরকার?

3. **স্কেলিং প্রয়োজনীয়তা:**
   - আপনার প্রত্যাশিত লোড কত?
   - অটো-স্কেলিং দরকার?
   - আঞ্চলিক প্রয়োজনীয়তা আছে?

### ধাপ ৫.২: আপনার AZD টেমপ্লেট তৈরি করুন

**নিম্নলিখিত প্যাটার্ন অনুসরণ করুন:**

1. **মৌলিক স্ট্রাকচার তৈরি করুন:**
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

3. **ইনফ্রাসট্রাকচার টেমপ্লেট তৈরি করুন:**

**infra/main.bicep** - মেইন টেমপ্লেট:
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
- কন্টেন্ট বিশ্লেষণের জন্য Microsoft Foundry Models
- OCR এর জন্য ডকুমেন্ট ইন্টেলিজেন্স
- ডকুমেন্ট আপলোডের জন্য স্টোরেজ অ্যাকাউন্ট
- প্রসেসিং লজিকের জন্য ফাংশন অ্যাপ
- ব্যবহারকারী ইন্টারফেসের জন্য ওয়েব অ্যাপ

**বোনাস পয়েন্ট:**
- সঠিক ত্রুটি হ্যান্ডলিং যোগ করুন
- খরচের অনুমান অন্তর্ভুক্ত করুন
- মনিটরিং ড্যাশবোর্ড সেটআপ করুন

## মডিউল ৬: সাধারণ সমস্যা সমাধান

### সাধারণ ডিপ্লয়মেন্ট সমস্যা

#### সমস্যা ১: OpenAI সার্ভিস কোটা অতিক্রম
**লক্ষণ:** কোটা ত্রুটির কারণে ডিপ্লয়মেন্ট ব্যর্থ
**সমাধান:**
```bash
# বর্তমান কোটা পরীক্ষা করুন
az cognitiveservices usage list --location eastus

# কোটা বৃদ্ধি অনুরোধ করুন অথবা ভিন্ন অঞ্চল ট্রাই করুন
azd env set AZURE_LOCATION westus2
azd up
```

#### সমস্যা ২: অঞ্চলভিত্তিক মডেল অনুপলব্ধ
**লক্ষণ:** AI উত্তর ব্যর্থ বা মডেল ডিপ্লয়মেন্ট ত্রুটি
**সমাধান:**
```bash
# অঞ্চল অনুসারে মডেলের প্রাপ্যতা পরীক্ষা করুন
az cognitiveservices model list --location eastus

# প্রাপ্য মডেলে আপডেট করুন
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### সমস্যা ৩: অনুমতির সমস্যা
**লক্ষণ:** AI সার্ভিস কল করার সময় 403 ফরবিডেন ত্রুটি
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

### পারফরম্যান্স সমস্যা

#### সমস্যা ৪: ধীর AI উত্তর
**তদন্তের ধাপ:**
1. পারফরম্যান্স মেট্রিক্সের জন্য অ্যাপ্লিকেশন ইনসাইটস চেক করুন
2. Azure পোর্টালে OpenAI সার্ভিসের মেট্রিক্স পর্যালোচনা করুন
3. নেটওয়ার্ক সংযোগ ও ল্যাটেন্সি যাচাই করুন

**সমাধান:**
- সাধারণ প্রশ্নগুলোর জন্য ক্যাশিং প্রয়োগ করুন
- আপনার ব্যবহারের জন্য উপযুক্ত OpenAI মডেল ব্যবহার করুন
- উচ্চ-লোড পরিস্থিতির জন্য রিড রিপ্লিকা বিবেচনা করুন

### **ল্যাব অনুশীলন ৬.১: ডিবাগিং চ্যালেঞ্জ**

**পরিস্থিতি:** আপনার ডিপ্লয়মেন্ট সফল হয়েছে, কিন্তু অ্যাপ্লিকেশন 500 ত্রুটি ফিরিয়ে দিচ্ছে।

**ডিবাগিং কাজসমূহ:**
1. অ্যাপ্লিকেশন লগ চেক করুন
2. সার্ভিস সংযোগ যাচাই করুন
3. অথেন্টিকেশন পরীক্ষা করুন
4. কনফিগারেশন পর্যালোচনা করুন

**ব্যবহারযোগ্য সরঞ্জাম:**
- `azd show` ডিপ্লয়মেন্ট ওভারভিউ জন্য
- Azure পোর্টাল বিস্তারিত সার্ভিস লগ জন্য
- অ্যাপ্লিকেশন ইনসাইটস অ্যাপ্লিকেশন টেলিমেট্রি জন্য

## মডিউল ৭: মনিটরিং ও অপ্টিমাইজেশন

### ধাপ ৭.১: ব্যাপক মনিটরিং সেটআপ করুন

1. **কাস্টম ড্যাশবোর্ড তৈরি করুন:**

Azure পোর্টালে যান এবং নিম্নলিখিত বিষয়গুলোর জন্য ড্যাশবোর্ড তৈরি করুন:
- OpenAI অনুরোধ সংখ্যা ও ল্যাটেন্সি
- অ্যাপ্লিকেশন ত্রুটি হার
- রিসোর্স ব্যবহার
- খরচ ট্র্যাকিং

2. **সতর্কতা সেটআপ করুন:**
```bash
# উচ্চ ত্রুটি হারের জন্য সতর্কবার্তা
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
# খরচের তথ্য পেতে Azure CLI ব্যবহার করুন
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **খরচ নিয়ন্ত্রণ প্রয়োগ করুন:**
- বাজেট সতর্কতা সেটআপ করুন
- অটোস্কেলিং নীতি ব্যবহার করুন
- অনুরোধ ক্যাশিং প্রয়োগ করুন
- OpenAI টোকেন ব্যবহারের মনিটরিং করুন

### **ল্যাব অনুশীলন ৭.১: পারফরম্যান্স অপ্টিমাইজেশন**

**কাজ:** আপনার AI অ্যাপ্লিকেশন পারফরম্যান্স ও খরচ উভয়ের জন্য অপ্টিমাইজ করুন।

**উন্নতির জন্য মেট্রিক্স:**
- গড় উত্তর সময় ২০% কমান
- মাসিক খরচ ১৫% কমান
- ৯৯.৯% আপটাইম বজায় রাখুন

**পরীক্ষার জন্য কৌশলসমূহ:**
- উত্তর ক্যাশিং প্রয়োগ করুন
- টোকেন দক্ষতার জন্য প্রম্পট অপ্টিমাইজ করুন
- উপযুক্ত কম্পিউট SKUs ব্যবহার করুন
- সঠিক অটোস্কেলিং সেটআপ করুন

## চূড়ান্ত চ্যালেঞ্জ: সম্পূর্ণ বাস্তবায়ন

### চ্যালেঞ্জ পরিস্থিতি

আপনাকে একটি প্রোডাকশন-সক্ষম AI চালিত কাস্টমার সার্ভিস চ্যাটবট তৈরি করার কাজ দেওয়া হয়েছে যা নিম্নরূপ চাহিদা পূরণ করবে:

**কার্যকারিতা চাহিদা:**
- কাস্টমার ইন্টারঅ্যাকশনের জন্য ওয়েব ইন্টারফেস
- উত্তরগুলোর জন্য Microsoft Foundry Models এর ইন্টিগ্রেশন
- Azure AI সার্চ ব্যবহার করে ডকুমেন্ট সার্চ ক্ষমতা
- বিদ্যমান কাস্টমার ডেটাবেসের ইন্টিগ্রেশন
- বহুভাষিক সমর্থন

**অনির্বাচিত চাহিদা:**
- একসাথে ১০০০ ব্যবহারকারী হ্যান্ডেল করা
- ৯৯.৯% আপটাইম SLA
- SOC 2 কমপ্লায়েন্স
- প্রতি মাসে $৫০০-এর কম খরচ
- একাধিক পরিবেশে ডিপ্লয় (ডেভ, স্টেজিং, প্রোড)

### বাস্তবায়ন ধাপ

1. **আর্কিটেকচার ডিজাইন করুন**
2. **AZD টেমপ্লেট তৈরি করুন**
3. **নিরাপত্তা ব্যবস্থা প্রয়োগ করুন**
4. **মনিটরিং ও সতর্কতা সেটআপ করুন**
5. **ডিপ্লয়মেন্ট পাইপলাইন তৈরি করুন**
6. **সমাধান ডকুমেন্টেশন করুন**

### মূল্যায়ন মানদণ্ড

- ✅ **কার্যকারিতা:** সব প্রয়োজন মেটাচ্ছে কিনা?
- ✅ **নিরাপত্তা:** সেরা অনুশীলন বাস্তবায়িত হয়েছে কিনা?
- ✅ **স্কেলেবিলিটি:** লোড সামলাতে পারছে কিনা?
- ✅ **রক্ষণাবেক্ষণযোগ্যতা:** কোড ও অবকাঠামো সুশৃঙ্খল কিনা?
- ✅ **খরচ:** বাজেটের মধ্যে আছে কিনা?

## অতিরিক্ত সম্পদ

### Microsoft ডকুমেন্টেশন
- [Azure Developer CLI ডকুমেন্টেশন](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models সার্ভিস ডকুমেন্টেশন](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry ডকুমেন্টেশন](https://learn.microsoft.com/azure/ai-studio/)

### নমুনা টেমপ্লেট
- [Microsoft Foundry Models চ্যাট অ্যাপ](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI চ্যাট অ্যাপ দ্রুত শুরু](https://github.com/Azure-Samples/openai-chat-app-quickstart)

- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### কমিউনিটি রিসোর্সেস
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 সমাপ্তি সনদ

অভিনন্দন! আপনি AI ওয়ার্কশপ ল্যাব সম্পন্ন করেছেন। এখন আপনি সক্ষম হওয়া উচিত:

- ✅ বিদ্যমান AI অ্যাপ্লিকেশনগুলোকে AZD টেমপ্লেটে রূপান্তর করতে
- ✅ প্রোডাকশন-রেডি AI অ্যাপ্লিকেশন ডিপ্লয় করতে
- ✅ AI ওয়ার্কলোডের জন্য সিকিউরিটি সেরা অনুশীলন বাস্তবায়ন করতে
- ✅ AI অ্যাপ্লিকেশনের পারফরম্যান্স মনিটর এবং অপটিমাইজ করতে
- ✅ সাধারণ ডিপ্লয়মেন্ট সমস্যাগুলি সমাধান করতে

### পরবর্তী ধাপ
1. এই প্যাটার্নগুলি আপনার নিজস্ব AI প্রকল্পে প্রয়োগ করুন
2. টেমপ্লেটগুলি কমিউনিটিতে ফেরত দিন
3. চলমান সমর্থনের জন্য Microsoft Foundry Discord এ যোগ দিন
4. মাল্টি-রিজিয়ন ডিপ্লয়মেন্টের মত উন্নত বিষয়গুলো অন্বেষণ করুন

---

**ওয়ার্কশপ প্রতিক্রিয়া**: [Microsoft Foundry Discord #Azure channel](https://discord.gg/microsoft-azure) এ আপনার অভিজ্ঞতা শেয়ার করে আমাদের সাহায্য করুন এই ওয়ার্কশপ উন্নত করতে।

---

**চ্যাপ্টার নেভিগেশন:**
- **📚 কোর্স হোম**: [AZD For Beginners](../../README.md)
- **📖 বর্তমান চ্যাপ্টার**: চ্যাপ্টার 2 - AI-ফার্স্ট ডেভেলপমেন্ট
- **⬅️ পূর্ববর্তী**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ পরবর্তী**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 পরবর্তী চ্যাপ্টার**: [চ্যাপ্টার 3: কনফিগারেশন](../chapter-03-configuration/configuration.md)

**সাহায্য দরকার?** AZD এবং AI ডিপ্লয়মেন্ট সম্পর্কে সমর্থন ও আলোচনা জন্য আমাদের কমিউনিটিতে যোগ দিন।

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**অস্বীকৃতি**:
এই নথিটি AI অনুবাদ পরিষেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনূদিত হয়েছে। যদিও আমরা শুদ্ধতার জন্য চেষ্টা করি, অনুগ্রহ করে মনে রাখবেন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসঙ্গতি থাকতে পারে। মূল নথিটি তার স্বভাষায় কর্তৃত্বপূর্ণ উৎস হিসেবে বিবেচিত হওয়া উচিত। গুরুত্বপূর্ণ তথ্যের জন্য পেশাদার মানব অনুবাদ সুপারিশ করা হয়। এই অনুবাদের ব্যবহারে প্রয়োজনীয় ভুল বোঝাবুঝি বা ভুল ব্যাখ্যার জন্য আমরা দায়বদ্ধ নই।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->