# AI ওয়ার্কশপ ল্যাব: আপনার AI সলিউশনগুলিকে AZD-Deployable করা

**অধ্যায় ন্যাভিগেশন:**
- **📚 কোর্স হোম**: [AZD For Beginners](../../README.md)
- **📖 বর্তমান অধ্যায়**: অধ্যায় 2 - AI-First Development
- **⬅️ পূর্বের**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ পরের**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 পরবর্তী অধ্যায়**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

## ওয়ার্কশপ ওভারভিউ

এই হ্যান্ডস-অন ল্যাব ডেভেলপারদের একটি বিদ্যমান AI টেমপ্লেট নিয়ে AZD (Azure Developer CLI) ব্যবহার করে ডিপ্লয়মেন্ট করার প্রক্রিয়া দেখায়। আপনি Microsoft Foundry সেবা ব্যবহার করে প্রোডাকশন-স্তরের AI ডিপ্লয়মেন্টের জন্য প্রয়োজনীয় প্যাটার্নগুলি শিখবেন।

> **ভ্যালিডেশন নোট (2026-03-25):** এই ওয়ার্কশপটি `azd` `1.23.12` এর বিরুদ্ধে পর্যালোচনা করা হয়েছে। যদি আপনার লোকাল ইনস্টলেশন পুরোনো হয়, তাহলে শুরু করার আগে AZD আপডেট করুন যাতে auth, template, এবং deployment ওয়ার্কফ্লো নীচের ধাপগুলোর সাথে মেলে।

**সময়কাল:** 2-3 ঘন্টা  
**স্তর:** মধ্যবর্তী  
**প্রয়োজনীয়তা:** Azure-এর বেসিক জ্ঞান, AI/ML ধারণার সঙ্গে পরিচিতি

## 🎓 শেখার উদ্দেশ্য

এই ওয়ার্কশপের শেষে, আপনি সক্ষম হবেন:
- ✅ বিদ্যমান AI অ্যাপ্লিকেশনকে AZD টেমপ্লেটে রূপান্তর করতে
- ✅ AZD দিয়ে Microsoft Foundry সেবা কনফিগার করতে
- ✅ AI সেবাগুলোর জন্য নিরাপদ ক্রেডেনশিয়াল ম্যানেজমেন্ট বাস্তবায়ন করতে
- ✅ মনিটরিংসহ প্রোডাকশন-রেডি AI অ্যাপ্লিকেশন ডিপ্লয় করতে
- ✅ সাধারণ AI ডিপ্লয়মেন্ট সমস্যাগুলি ট্রাবলশুট করতে

## পূর্বপ্রয়োজনীয়তা

### প্রয়োজনীয় টুলস
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) ইনস্টল করা
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) ইনস্টল করা
- [Git](https://git-scm.com/) ইনস্টল করা
- কোড এডিটর (VS Code সুপারিশকৃত)

### Azure রিসোর্স
- কনট্রিবিউটর অ্যাক্সেস সহ Azure সাবস্ক্রিপশন
- Microsoft Foundry Models সেবাগুলোর অ্যাক্সেস (বা অ্যাক্সেস অনুরোধ করার সক্ষমতা)
- রিসোর্স গ্রুপ তৈরি করার অনুমতি

### জ্ঞানগত পূর্বশর্ত
- Azure সার্ভিসগুলোর বেসিক ধারণা
- কমান্ড-লাইন ইন্টারফেসগুলোর সাথে পরিচিতি
- AI/ML-এর বেসিক ধারণা (APIs, models, prompts)

## ল্যাব সেটআপ

### ধাপ 1: পরিবেশ প্রস্তুতি

1. **টুল ইনস্টলেশন যাচাই করুন:**
```bash
# AZD ইনস্টলেশন পরীক্ষা করুন
azd version

# Azure CLI পরীক্ষা করুন
az --version

# AZD ওয়ার্কফ্লোগুলির জন্য Azure-এ লগইন করুন
azd auth login

# কেবল তখনই Azure CLI-এ লগইন করুন যদি আপনি ডায়াগনস্টিক চলাকালীন az কমান্ড চালানোর পরিকল্পনা করেন
az login
```

If you work across multiple tenants or your subscription is not detected automatically, retry with `azd auth login --tenant-id <tenant-id>`।

2. **ওয়ার্কশপ রেপো ক্লোন করুন:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## মডিউল 1: AI অ্যাপ্লিকেশনগুলোর জন্য AZD স্ট্রাকচার বুঝে নেওয়া

### AI AZD টেমপ্লেটের অ্যানাটমিক্স

AI-রেডি AZD টেমপ্লেটে থাকা গুরুত্বপূর্ণ ফাইলগুলোর অন্বেষণ করুন:

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

### **ল্যাব এক্সারসাইজ 1.1: কনফিগারেশন অন্বেষণ করুন**

1. **azure.yaml ফাইলটি পরীক্ষা করুন:**
```bash
cat azure.yaml
```

**কী খুঁজবেন:**
- AI কম্পোনেন্টগুলোর জন্য সার্ভিস ডেফিনিশন
- এনভায়রনমেন্ট ভ্যারিয়েবল মাপিং
- হোস্ট কনফিগারেশন

2. **main.bicep ইনফ্রাস্ট্রাকচার রিভিউ করুন:**
```bash
cat infra/main.bicep
```

**চিহ্নিত করার জন্য মূল AI প্যাটার্ন:**
- Microsoft Foundry Models সার্ভিস provisioning
- Azure AI Search ইন্টিগ্রেশন
- সিকিউর কী ম্যানেজমেন্ট
- নেটওয়ার্ক সিকিউরিটি কনফিগারেশন

### **আলোচনার বিষয়:** কেন এই প্যাটার্নগুলো AI-এর জন্য গুরুত্বপূর্ণ

- **সার্ভিস নির্ভরতা**: AI অ্যাপগুলো প্রায়শই একাধিক সমন্বিত সার্ভিস প্রয়োজন করে
- **নিরাপত্তা**: API কী এবং endpoint গুলোকে নিরাপদে পরিচালনা করা দরকার
- **স্কেলেবিলিটি**: AI ওয়ার্কলোডের অনন্য স্কেলিং চাহিদা থাকে
- **খরচ ব্যবস্থাপনা**: AI সেবা উপযুক্তভাবে কনফিগার না করলে ব্যয় অনেক বাড়তে পারে

## মডিউল 2: আপনার প্রথম AI অ্যাপ্লিকেশন ডিপ্লয় করুন

### ধাপ 2.1: পরিবেশ ইনিশিয়ালাইজ করুন

1. **নতুন AZD ENV তৈরি করুন:**
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

### ধাপ 2.2: ইনফ্রা এবং অ্যাপ্লিকেশন ডিপ্লয় করুন

1. **AZD দিয়ে ডিপ্লয় করুন:**
```bash
azd up
```

**`azd up` চলাকালীন কী ঘটে:**
- ✅ Microsoft Foundry Models সার্ভিস provision করা হয়
- ✅ Azure AI Search সার্ভিস তৈরি করা হয়
- ✅ ওয়েব অ্যাপ্লিকেশনের জন্য App Service সেট আপ করা হয়
- ✅ নেটওয়ার্কিং এবং সিকিউরিটি কনফিগার করা হয়
- ✅ অ্যাপ্লিকেশন কোড ডিপ্লয় করা হয়
- ✅ মনিটরিং এবং লগিং সেট আপ করা হয়

2. **ডিপ্লয়মেন্ট প্রোগ্রেস মনিটর করুন** এবং তৈরী হওয়া রিসোর্সগুলোর নোট নিন।

### ধাপ 2.3: আপনার ডিপ্লয়মেন্ট যাচাই করুন

1. **ডিপ্লয় হওয়া রিসোর্সগুলো চেক করুন:**
```bash
azd show
```

2. **ডিপ্লয় হওয়া অ্যাপ্লিকেশন খুলুন:**
```bash
azd show
```

Open the web endpoint shown in the `azd show` output।

3. **AI কার্যকারিতা টেস্ট করুন:**
   - ওয়েব অ্যাপ্লিকেশনটি নেভিগেট করুন
   - স্যাম্পল কুয়েরি চেষ্টা করুন
   - যাচাই করুন AI রেসপন্সগুলো কাজ করছে

### **ল্যাব এক্সারসাইজ 2.1: ট্রাবলশুটিং অনুশীলন**

**পরিস্থিতি**: আপনার ডিপ্লয়মেন্ট সফল হয়েছে কিন্তু AI রেসপন্ড করছে না।

**সাধারণ সমস্যা যাচাই করতে:**
1. **OpenAI API কী**: যাচাই করুন সেগুলো সঠিকভাবে সেট করা আছে কিনা
2. **মডেল উপলব্ধতা**: দেখুন আপনার রিজিয়ন মডেলটি সাপোর্ট করে কিনা
3. **নেটওয়ার্ক কানেক্টিভিটি**: নিশ্চিত করুন সার্ভিসগুলো একে অপরের সাথে যোগাযোগ করতে পারে
4. **RBAC অনুমতি**: যাচাই করুন অ্যাপটি OpenAI অ্যাক্সেস করতে পারে

**ডিবাগিং কমান্ডগুলো:**
```bash
# পরিবেশ ভ্যারিয়েবলগুলো পরীক্ষা করুন
azd env get-values

# ডিপ্লয়মেন্ট লগ দেখুন
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# OpenAI ডিপ্লয়মেন্টের অবস্থা পরীক্ষা করুন
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## মডিউল 3: আপনার দরকার অনুযায়ী AI অ্যাপ কাস্টমাইজ করুন

### ধাপ 3.1: AI কনফিগারেশন পরিবর্তন করুন

1. **OpenAI মডেল আপডেট করুন:**
```bash
# আপনার অঞ্চলে যদি উপলব্ধ থাকে তবে একটি ভিন্ন মডেলে পরিবর্তন করুন
azd env set AZURE_OPENAI_MODEL gpt-4.1

# নতুন কনফিগারেশন দিয়ে পুনরায় ডিপ্লয় করুন
azd deploy
```

2. **অতিরিক্ত AI সেবা যোগ করুন:**

Document Intelligence যোগ করতে `infra/main.bicep` সম্পাদনা করুন:

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

**সেরা অনুশীলন**: ডেভেলপমেন্ট এবং প্রোডাকশনের জন্য আলাদা কনফিগারেশন।

1. **একটি প্রোডাকশন এনভায়রনমেন্ট তৈরি করুন:**
```bash
azd env new myai-production
```

2. **প্রোডাকশন-নির্দিষ্ট প্যারামিটার সেট করুন:**
```bash
# প্রোডাকশনে সাধারণত উচ্চতর SKU ব্যবহার করা হয়
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# অতিরিক্ত নিরাপত্তা বৈশিষ্ট্য সক্রিয় করুন
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **ল্যাব এক্সারসাইজ 3.1: খরচ অনুকূলকরণ**

**চ্যালেঞ্জ**: ডেভেলপমেন্টের জন্য খরচ-কার্যকর কনফিগার টেমপ্লেট কনফিগার করুন।

**কর্মসমূহ:**
1. চিহ্নিত করুন কোন SKUs ফ্রি/বেসিক টিয়ারে সেট করা যায়
2. ন্যূনতম খরচের জন্য এনভায়রনমেন্ট ভ্যারিয়েবল কনফিগার করুন
3. ডিপ্লয় করুন এবং প্রোডাকশন কনফিগারেশনের সাথে খরচ তুলনা করুন

**সমাধান হিন্টস:**
- সম্ভব হলে Azure AI Services-এ F0 (free) টিয়ার ব্যবহার করুন
- ডেভেলপমেন্টে Search Service-এর জন্য Basic টিয়ার ব্যবহার করুন
- Functions-এর জন্য Consumption প্ল্যান বিবেচনা করুন

## মডিউল 4: সিকিউরিটি এবং প্রোডাকশন সেরা অনুশীলন

### ধাপ 4.1: সিকিউর ক্রেডেনশিয়াল ম্যানেজমেন্ট

**বর্তমান চ্যালেঞ্জ**: অনেক AI অ্যাপ API কী হার্ডকোড করে বা অনিরাপদ স্টোরেজ ব্যবহার করে।

**AZD সমাধান**: Managed Identity + Key Vault ইন্টিগ্রেশন।

1. **আপনার টেমপ্লেটের সিকিউরিটি কনফিগারেশন রিভিউ করুন:**
```bash
# Key Vault এবং Managed Identity কনফিগারেশন খুঁজুন
grep -r "keyVault\|managedIdentity" infra/
```

2. **Managed Identity কাজ করছে কি না যাচাই করুন:**
```bash
# ওয়েব অ্যাপটির কি সঠিক পরিচয় কনফিগারেশন রয়েছে তা পরীক্ষা করুন
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### ধাপ 4.2: নেটওয়ার্ক সিকিউরিটি

1. **প্রাইভেট এন্ডপয়েন্ট সক্রিয় করুন** (যদি ইতিমধ্যে কনফিগার করা না থাকে):

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
# কনফিগারেশনটি পরীক্ষা করুন:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **AI-নির্দিষ্ট মনিটরিং সেট আপ করুন:**

AI অপারেশনগুলোর জন্য কাস্টম মেট্রিক্স যোগ করুন:
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

### **ল্যাব এক্সারসাইজ 4.1: সিকিউরিটি অডিট**

**কাজ**: আপনার ডিপ্লয়মেন্ট সিকিউরিটি সেরা অনুশীলনের জন্য রিভিউ করুন।

**চেকলিস্ট:**
- [ ] কোড বা কনফিগারেশনে হার্ডকোডেড সিক্রেট নেই
- [ ] সার্ভিস-টু-সার্ভিস অথেন্টিকেশনের জন্য Managed Identity ব্যবহৃত হয়েছে
- [ ] Key Vault সংবেদনশীল কনফিগারেশন সংরক্ষণ করে
- [ ] নেটওয়ার্ক অ্যাক্সেস যথাযথভাবে সীমাবদ্ধ
- [ ] মনিটরিং এবং লগিং সক্রিয় আছে

## মডিউল 5: আপনার নিজস্ব AI অ্যাপ্লিকেশন রূপান্তর করুন

### ধাপ 5.1: মূল্যায়ন ওয়ার্কশীট

**আপনার অ্যাপ রূপান্তরের আগে**, এই প্রশ্নগুলোর উত্তর দিন:

1. **অ্যাপ্লিকেশন আর্কিটেকচার:**
   - আপনার অ্যাপ কোন AI সেবা ব্যবহার করে?
   - এটি কোন কম্পিউট রিসোর্স প্রয়োজন?
   - কি একটি ডাটাবেস প্রয়োজন?
   - সার্ভিসগুলোর মধ্যে কী নির্ভরতা আছে?

2. **নিরাপত্তা প্রয়োজনীয়তা:**
   - আপনার অ্যাপ কোন সংবেদনশীল ডেটা হ্যান্ডল করে?
   - কোন কমপ্লায়েন্স প্রয়োজনীয়তা আছে?
   - কি প্রাইভেট নেটওয়ার্কিং দরকার?

3. **স্কেলিং প্রয়োজনীয়তা:**
   - আপনার প্রত্যাশিত লোড কত?
   - কি auto-scaling প্রয়োজন?
   - কোন রিজিয়নাল সীমাবদ্ধতা আছে কি?

### ধাপ 5.2: আপনার AZD টেমপ্লেট তৈরি করুন

**আপনি অ্যাপ রূপান্তর করার জন্য এই প্যাটার্ন অনুসরণ করুন:**

1. **মৌলিক স্ট্রাকচার তৈরি করুন:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# AZD টেমপ্লেট আরম্ভ করুন
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

**infra/modules/openai.bicep** - OpenAI মোডিউল:
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

### **ল্যাব এক্সারসাইজ 5.1: টেমপ্লেট তৈরির চ্যালেঞ্জ**

**চ্যালেঞ্জ**: একটি ডকুমেন্ট প্রসেসিং AI অ্যাপের জন্য AZD টেমপ্লেট তৈরি করুন।

**প্রয়োজনীয়তা:**
- কনটেন্ট বিশ্লেষণের জন্য Microsoft Foundry Models
- OCR-এর জন্য Document Intelligence
- ডকুমেন্ট আপলোডের জন্য Storage Account
- প্রসেসিং লজিকের জন্য Function App
- ইউজার ইন্টারফেসের জন্য Web app

**বোনাস পয়েন্ট:**
- সঠিক অ্যারর হ্যান্ডলিং যোগ করুন
- খরচ অনুমান অন্তর্ভুক্ত করুন
- মনিটরিং ড্যাশবোর্ড সেট আপ করুন

## মডিউল 6: সাধারণ সমস্যাগুলির ট্রাবলশুটিং

### সাধারণ ডিপ্লয়মেন্ট সমস্যা

#### সমস্যা 1: OpenAI সার্ভিস কোটা অতিক্রম
**লক্ষণ:** কোটা এরর সহ ডিপ্লয়মেন্ট বিফল হয়
**সমাধানসমূহ:**
```bash
# বর্তমান কোটাগুলি পরীক্ষা করুন
az cognitiveservices usage list --location eastus

# কোটা বাড়ানোর অনুরোধ করুন অথবা অন্য অঞ্চল চেষ্টা করুন
azd env set AZURE_LOCATION westus2
azd up
```

#### সমস্যা 2: মডেল রিজিয়নে উপলব্ধ নয়
**লক্ষণ:** AI রেসপন্স ব্যর্থ বা মডেল ডিপ্লয়মেন্টে ত্রুটি
**সমাধানসমূহ:**
```bash
# অঞ্চল অনুযায়ী মডেলের উপলব্ধতা পরীক্ষা করুন
az cognitiveservices model list --location eastus

# উপলব্ধ মডেলে আপডেট করুন
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### সমস্যা 3: অনুমতি সমস্যা
**লক্ষণ:** AI সার্ভিস কল করার সময় 403 Forbidden ত্রুটি
**সমাধানসমূহ:**
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

#### সমস্যা 4: ধীরে AI রেসপন্স আসে
**অনুসন্ধান ধাপ:**
1. পারফর্ম্যান্স মেট্রিক্সের জন্য Application Insights চেক করুন
2. Azure পোর্টালে OpenAI সার্ভিস মেট্রিক্স রিভিউ করুন
3. নেটওয়ার্ক কানেক্টিভিটি এবং ল্যাটেন্সি যাচাই করুন

**সমাধানসমূহ:**
- সাধারণ কুয়েরির জন্য ক্যাশিং বাস্তবায়ন করুন
- আপনার ব্যবহার কেসের জন্য উপযুক্ত OpenAI মডেল ব্যবহার করুন
- উচ্চ-লোড পরিস্থিতির জন্য রিড রিপ্লিকা বিবেচনা করুন

### **ল্যাব এক্সারসাইজ 6.1: ডিবাগিং চ্যালেঞ্জ**

**পরিস্থিতি**: আপনার ডিপ্লয়মেন্ট সফল হয়েছে, কিন্তু অ্যাপ্লিকেশন 500 ত্রুটি ফিরিয়ে দিচ্ছে।

**ডিবাগিং টাস্ক:**
1. অ্যাপ্লিকেশন লগ চেক করুন
2. সার্ভিস কানেক্টিভিটি যাচাই করুন
3. অথেন্টিকেশন টেস্ট করুন
4. কনফিগারেশন রিভিউ করুন

**ব্যবহারযোগ্য টুলস:**
- ডিপ্লয়মেন্ট ওভারভিউর জন্য `azd show`
- বিস্তারিত সার্ভিস লগের জন্য Azure পোর্টাল
- অ্যাপ্লিকেশন টেলিমেট্রির জন্য Application Insights

## মডিউল 7: মনিটরিং এবং অপ্টিমাইজেশন

### ধাপ 7.1: ব্যাপক মনিটরিং সেট আপ করুন

1. **কাস্টম ড্যাশবোর্ড তৈরি করুন:**

Azure পোর্টালে নেভিগেট করে নিম্নলিখিতগুলো নিয়ে একটি ড্যাশবোর্ড তৈরি করুন:
- OpenAI অনুরোধ গণনা এবং ল্যাটেন্সি
- অ্যাপ্লিকেশন এরর রেট
- রিসোর্স ব্যবহার
- খরচ ট্র্যাকিং

2. **অ্যালার্ট সেট আপ করুন:**
```bash
# উচ্চ ত্রুটি হারের জন্য সতর্কতা
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### ধাপ 7.2: খরচ অনুকূলকরণ

1. **বর্তমান খরচ বিশ্লেষণ করুন:**
```bash
# Azure CLI ব্যবহার করে খরচের ডেটা সংগ্রহ করুন
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **খরচ নিয়ন্ত্রণ বাস্তবায়ন করুন:**
- বাজেট অ্যালার্ট সেট আপ করুন
- অটোস্কেলিং পলিসি ব্যবহার করুন
- রিকোয়েস্ট ক্যাশিং বাস্তবায়ন করুন
- OpenAI-এর জন্য টোকেন ব্যবহার মনিটর করুন

### **ল্যাব এক্সারসাইজ 7.1: পারফরম্যান্স অপ্টিমাইজেশন**

**কাজ**: পারফরম্যান্স এবং খরচ উভয়ের জন্য আপনার AI অ্যাপ অপ্টিমাইজ করুন।

**উন্নতি করার মেট্রিক্স:**
- গড় রেসপন্স টাইম 20% কমান
- মাসিক খরচ 15% কমান
- 99.9% আপটাইম বজায় রাখুন

**চেষ্টার কৌশল:**
- রেসপন্স ক্যাশিং বাস্তবায়ন করুন
- টোকেন দক্ষতার জন্য প্রম্পট অপ্টিমাইজ করুন
- উপযুক্ত কম্পিউট SKU ব্যবহার করুন
- সঠিক অটোস্কেলিং সেটআপ করুন

## চূড়ান্ত চ্যালেঞ্জ: End-to-End বাস্তবায়ন

### চ্যালেঞ্জ পরিস্থিতি

আপনি একটি প্রোডাকশন-রেডি AI-চালিত কাস্টমার সার্ভিস চ্যাটবট তৈরি করার দায়িত্ব পেয়েছেন নিম্নলিখিত চাহিদা নিয়ে:

**ফাংশনাল চাহিদা:**
- গ্রাহক ইন্টারঅ্যাকশনের জন্য ওয়েব ইন্টারফেস
- উত্তরগুলোর জন্য Microsoft Foundry Models-এর ইন্টিগ্রেশন
- Azure AI Search ব্যবহার করে ডকুমেন্ট সার্চ সক্ষমতা
- বিদ্যমান কাস্টমার ডাটাবেসের সঙ্গে ইন্টিগ্রেশন
- বহু-ভাষা সাপোর্ট

**নন-ফাংশনাল চাহিদা:**
- 1000 কনকারেন্ট ব্যবহারকারী হ্যান্ডেল করতে সক্ষম
- 99.9% আপটাইম SLA
- SOC 2 কমপ্লায়েন্স
- মাসিক খরচ $500-এর নিচে
- একাধিক এনভায়রনমেন্টে ডিপ্লয় (dev, staging, prod)

### বাস্তবায়ন ধাপসমূহ

1. **আর্কিটেকচার ডিজাইন করুন**
2. **AZD টেমপ্লেট তৈরি করুন**
3. **সিকিউরিটি ব্যবস্থা বাস্তবায়ন করুন**
4. **মনিটরিং এবং অ্যালার্টিং সেট আপ করুন**
5. **ডিপ্লয়মেন্ট পাইপলাইন তৈরি করুন**
6. **সমাধানটি ডকুমেন্ট করুন**

### মূল্যায়ন মাপকাঠি

- ✅ **ফাংশনালিটি**: কি এটি সব চাহিদা পূরণ করে?
- ✅ **নিরাপত্তা**: সেরা অনুশীলনগুলো কি বাস্তবায়িত হয়েছে?
- ✅ **স্কেলেবিলিটি**: কি এটি লোড হ্যান্ডেল করতে পারে?
- ✅ **মেইনটেইনেবিলিটি**: কোড এবং ইনফ্রাস্ট্রাকচার কি সুসংগঠিত?
- ✅ **খরচ**: কি বাজেটের মধ্যে আছে?

## অতিরিক্ত রিসোর্স

### Microsoft ডকুমেন্টেশন
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### স্যাম্পল টেমপ্লেট
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### কমিউনিটি রিসোর্স
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 সমাপ্তি সনদ

অভিনন্দন! আপনি AI ওয়ার্কশপ ল্যাব সম্পন্ন করেছেন। এখন আপনি সক্ষম হওয়া উচিত:

- ✅ বিদ্যমান AI অ্যাপ্লিকেশনগুলোকে AZD টেমপ্লেটে রূপান্তর করা
- ✅ প্রোডাকশন-রেডি AI অ্যাপ্লিকেশন ডিপ্লয় করা
- ✅ AI ওয়ার্কলোডের জন্য নিরাপত্তা সেরা অনুশীলনগুলো বাস্তবায়ন করা
- ✅ AI অ্যাপ্লিকেশনের কর্মক্ষমতা পর্যবেক্ষণ এবং অপ্টিমাইজ করা
- ✅ সাধারণ ডিপ্লয়মেন্ট সমস্যাগুলো ট্রাবলশুট করা

### পরবর্তী ধাপ
1. Apply these patterns to your own AI projects
2. Contribute templates back to the community
3. Join the Microsoft Foundry Discord for ongoing support
4. Explore advanced topics like multi-region deployments

---

**ওয়ার্কশপ প্রতিক্রিয়া**: আমাদের এই ওয়ার্কশপ উন্নত করতে আপনার অভিজ্ঞতা [Microsoft Foundry Discord #Azure channel](https://discord.gg/microsoft-azure) -এ শেয়ার করে সাহায্য করুন।

---

**চ্যাপ্টার নেভিগেশন:**
- **📚 কোর্স হোম**: [AZD For Beginners](../../README.md)
- **📖 বর্তমান অধ্যায়**: অধ্যায় 2 - AI-First Development
- **⬅️ পূর্ববর্তী**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ পরবর্তী**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 পরবর্তী অধ্যায়**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

**সাহায্য দরকার?** আমাদের কমিউনিটিতে যোগ দিন AZD এবং AI ডিপ্লয়মেন্ট সম্পর্কে সমর্থন ও আলোচনার জন্য।

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**অস্বীকৃতি**:
এই নথিটি AI অনুবাদ পরিষেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনূদিত হয়েছে। যদিও আমরা শুদ্ধতার জন্য চেষ্টা করি, অনুগ্রহ করে মনে রাখবেন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসঙ্গতি থাকতে পারে। মূল নথিটি তার স্বভাষায় কর্তৃত্বপূর্ণ উৎস হিসেবে বিবেচিত হওয়া উচিত। গুরুত্বপূর্ণ তথ্যের জন্য পেশাদার মানব অনুবাদ সুপারিশ করা হয়। এই অনুবাদের ব্যবহারে প্রয়োজনীয় ভুল বোঝাবুঝি বা ভুল ব্যাখ্যার জন্য আমরা দায়বদ্ধ নই।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->