# এআই ওয়ার্কশপ ল্যাব: আপনার AI সমাধানগুলি AZD-এ ডিপ্লয়যোগ্য করা

**অধ্যায় নেভিগেশন:**
- **📚 কোর্স হোম**: [শিখুন AZD ফর বিগিনার্স](../../README.md)
- **📖 বর্তমান অধ্যায়**: অধ্যায় ২ - AI-প্রথম বিকাশ
- **⬅️ পূর্বের**: [AI মডেল ডিপ্লয়মেন্ট](ai-model-deployment.md)
- **➡️ পরবর্তী**: [প্রোডাকশন AI সেরা অনুশীলন](../chapter-08-production/production-ai-practices.md)
- **🚀 পরবর্তী অধ্যায়**: [অধ্যায় ৩: কনফিগারেশন](../chapter-03-configuration/configuration.md)

## ওয়ার্কশপ ওভারভিউ

এই হাতে-কলমে ল্যাবটি ডেভেলপারদের একটি বিদ্যমান AI টেমপ্লেট গ্রহণ এবং Azure Developer CLI (AZD) ব্যবহার করে ডিপ্লয় করার প্রক্রিয়া দেখায়। আপনি Microsoft Foundry সেবাগুলির মাধ্যমে প্রোডাকশন AI ডিপ্লয়মেন্টের মৌলিক প্যাটার্ন শিখবেন।

> **রিলিজ পর্যালোচনা (2026-11-04):** AZD কমান্ড নির্দেশনা এবং নমুনা কনফিগারেশন নামগুলি `azd` `1.37.2` রিলিজ এবং লিঙ্ক করা নমুনার বর্তমান কনফিগারেশনের সঙ্গে যাচাই করা হয়েছে। এটি একটি ডকুমেন্টেশন পর্যালোচনা, সরাসরি ডিপ্লয়মেন্ট যাচাই নয়। RAG ল্যাবের জন্য এজেন্ট এক্সটেনশনের প্রয়োজন নেই; এজেন্ট মূল্যায়নের জন্য আলাদা `azure.ai.evaluations` এক্সটেনশন এবং [বর্তমান মূল্যায়ন কর্মপ্রবাহ](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) ব্যবহার করুন, পুরানো এজেন্ট মূল্যায়ন কমান্ড নয়।

**সময়কাল:** ২-৩ ঘন্টা  
**স্তর:** মধ্যবর্তী  
**প্রয়োজনীয়তা:** মৌলিক Azure জ্ঞান, AI/ML ধারণা সম্পর্কে পরিচিতি

## 🎓 শেখার উদ্দেশ্য

এই ওয়ার্কশপ শেষ করার পর, আপনি সক্ষম হবেন:
- ✅ একটি বিদ্যমান AI AZD টেমপ্লেট অন্বেষণ এবং নিজের অ্যাপ্লিকেশন রূপান্তরের পরিকল্পনা করা
- ✅ AZD দিয়ে Microsoft Foundry সেবা কনফিগার করা
- ✅ AI সেবাগুলির জন্য নিরাপদ ক্রেডেনশিয়াল ব্যবস্থাপনা বাস্তবায়ন করা
- ✅ মনিটরিং সহ একটি AI রেফারেন্স অ্যাপ্লিকেশন ডিপ্লয় করা
- ✅ সাধারণ AI ডিপ্লয়মেন্ট সমস্যা সমাধান করা

## প্রয়োজনীয়তা

### প্রয়োজনীয় সরঞ্জাম
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) ইনস্টল করা আছে
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) ইনস্টল করা আছে
- [Git](https://git-scm.com/) ইনস্টল করা আছে
- কোড এডিটর (VS Code সুপারিশ করা হয়েছে)

এই কমান্ড ব্লকগুলো Bash সিনট্যাক্স ব্যবহার করে (লাইন কন্টিনিউেশন সহ এবং `grep`)। উইন্ডোজে, Git Bash/WSL ব্যবহার করুন বা এগুলোকে PowerShell এ অনুবাদ করুন। এছাড়াও [নমুনার স্থানীয় পরিবেশ সেটআপ](https://github.com/Azure-Samples/azure-search-openai-demo#local-environment) এ তালিকাভুক্ত ভাষা, প্যাকেজ-ম্যানেজার এবং কনটেইনার টুলগুলো ইনস্টল করুন।

### Azure রিসোর্সসমূহ
- Azure সাবস্ক্রিপশন যার মধ্যে রিসোর্স প্রোভিশনিং এবং রোল-অ্যাসাইনমেন্ট অনুমতিসমূহ রয়েছে (কনট্রিবিউটর শুধুমাত্র RBAC অ্যাসাইনমেন্ট তৈরি করতে পারে না; অথরাইজড রোল অ্যাডমিনিস্ট্রেটর অথবা নমুনার ডকুমেন্টেড সমতুল্য ব্যবহার করুন)
- Microsoft Foundry Models সার্ভিসের অ্যাক্সেস (অথবা অ্যাক্সেস অনুরোধের সক্ষমতা)
- রিসোর্স গ্রুপ তৈরি করার অনুমতি

### জ্ঞানগত প্রাথমিক শর্তসমূহ
- Azure সার্ভিসের মৌলিক ধারণা
- কমান্ড-লাইন ইন্টারফেসের সাথে পরিচিতি
- মৌলিক AI/ML ধারণা (API, মডেল, প্রম্পট)

## ল্যাব সেটআপ

### ধাপ ১: পরিবেশ প্রস্তুতি

1. **টুল ইনস্টলেশন যাচাই করুন:**
```bash
# Check AZD installation
azd version

# Check Azure CLI
az --version

# Login to Azure for AZD workflows
azd auth login

# Login to Azure CLI only if you plan to run az commands during diagnostics
az login
```

আপনি যদি একাধিক টেন্যান্টে কাজ করেন বা আপনার সাবস্ক্রিপশন স্বয়ংক্রিয়ভাবে সনাক্ত না হয়, তবে `azd auth login --tenant-id <tenant-id>` ব্যবহার করে পুনরায় চেষ্টা করুন।

2. **ওয়ার্কশপ রিপোজিটরি ক্লোন করুন:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## মডিউল ১: AI অ্যাপ্লিকেশনের জন্য AZD স্ট্রাকচার বোঝা

### একটি AI AZD টেমপ্লেটের গঠন

AI-রেডি AZD টেমপ্লেটের মূল ফাইলগুলো অন্বেষণ করুন:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   ├── core/               # Shared infrastructure modules
│   └── app/                # Application-specific infrastructure
├── app/                    # Backend, frontend, and optional ingestion functions
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

চেকআউটকৃত নমুনাটি পরিবর্তিত হতে পারে; `.azure/` পরিবেশ ইনিশিয়ালাইজেশনের পরে দেখা যায়, নতুন ক্লোনে নয়। এই স্কিম্যাটিকের সাথে মেলানোর জন্য অনুপস্থিত ডিরেক্টরি তৈরি না করে প্রকৃত চেকআউট পরীক্ষা করুন।

### **ল্যাব এক্সারসাইজ ১.১: কনফিগারেশন অন্বেষণ করুন**

1. **azure.yaml ফাইল পরীক্ষা করুন:**
```bash
cat azure.yaml
```

**দেখতে যা যা:**
- AI কম্পোনেন্টের জন্য সার্ভিস সংজ্ঞা
- পরিবেশ ভেরিয়েবল ম্যাপিংস
- হোস্ট কনফিগারেশন

2. **main.bicep ইन्फ্রাস্ট্রাকচার পর্যালোচনা করুন:**
```bash
cat infra/main.bicep
```

**প্রধান AI প্যাটার্নগুলি চিহ্নিত করার জন্য:**
- Microsoft Foundry Models সার্ভিস provisioning
- Azure AI Search ইন্টিগ্রেশন
- নিরাপদ কী ম্যানেজমেন্ট
- নেটওয়ার্ক সিকিউরিটি কনফিগারেশন

### **আলোচনা পয়েন্ট:** কেন এই প্যাটার্নগুলো AI জন্য গুরুত্বপূর্ণ

- **সার্ভিস নির্ভরতা**: AI অ্যাপগুলো প্রায়ই একাধিক সমন্বিত সার্ভিস প্রয়োজন করে
- **নিরাপত্তা**: API কী এবং এন্ডপয়েন্ট নিরাপদ পরিচালনা প্রয়োজন
- **স্কেলেবিলিটি**: AI ওয়ার্কলোডের আলাদা স্কেলিং প্রয়োজনীয়তা রয়েছে
- **মূল্য পরিচালনা**: AI সার্ভিসগুলি সঠিকভাবে কনফিগার না করলে ব্যয়বহুল হতে পারে

## মডিউল 2: আপনার প্রথম AI অ্যাপ্লিকেশন ডিপ্লয় করুন

### ধাপ 2.1: পরিবেশ আরম্ভ করুন

1. **একটি নতুন AZD পরিবেশ তৈরি করুন:**
```bash
azd env new myai-workshop
```

2. **প্রয়োজনীয় প্যারামিটার সেট করুন:**
```bash
# Set your preferred Azure region
azd env set AZURE_LOCATION eastus

# Optional: select a chat model supported by your region and quota
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1-mini
```

### ধাপ 2.2: ইন্ড্রাস্ট্রাকচার এবং অ্যাপ্লিকেশন ডিপ্লয় করুন

1. **AZD দিয়ে ডিপ্লয় করুন:**
```bash
azd up
```

**`azd up` সময় কি ঘটে:**
- ✅ Microsoft Foundry Models সার্ভিস provisioning করে
- ✅ Azure AI Search সার্ভিস তৈরি করে
- ✅ ব্যাকএন্ড এবং বন্ডেল করা ফ্রন্টএন্ডের জন্য Azure Container Apps সেটআপ করে (বর্তমান স্যাম্পল ডিফল্ট)
- ✅ নেটওয়ার্ক এবং সুরক্ষা কনফিগার করে
- ✅ অ্যাপ্লিকেশন কোড ডিপ্লয় করে
- ✅ মনিটরিং এবং লগিং সেটআপ করে

2. **ডিপ্লয়মেন্ট প্রগ্রেস মনিটর করুন** এবং তৈরি হওয়া রিসোর্সগুলো নোট করুন।

### ধাপ 2.3: আপনার ডিপ্লয়মেন্ট যাচাই করুন

1. **ডিপ্লয় হওয়া রিসোর্সগুলো চেক করুন:**
```bash
azd show
```

2. **ডিপ্লয় হওয়া অ্যাপ্লিকেশনটি খুলুন:**
```bash
azd show
```

`azd show` আউটপুটে প্রদর্শিত ওয়েব এন্ডপয়েন্টটি খুলুন।

3. **AI কার্যকারিতা পরীক্ষা করুন:**
   - ওয়েব অ্যাপ্লিকেশনে নেভিগেট করুন
   - নমুনা প্রশ্ন করুন
   - যাচাই করুন AI প্রতিক্রিয়াগুলি কাজ করছে

### **ল্যাব অনুশীলন 2.1: সমস্যার সমাধানের অভ্যাস**

**পরিস্থিতি**: আপনার ডিপ্লয়মেন্ট সফল হয়েছে কিন্তু AI প্রতিক্রিয়া দিচ্ছে না।

**সাধারণ বিষয়গুলি যাচাই করুন:**
1. **প্রামাণীকরণ**: ম্যানেজড আইডেনটিটি এবং রোল অ্যাসাইনমেন্ট যাচাই করুন; শুধুমাত্র তখনই API কী পরীক্ষা করুন যদি আপনি ইচ্ছাকৃতভাবে কী-ভিত্তিক প্রামাণীকরণ সক্রিয় করে থাকেন
2. **মডেল পাওয়া যাচ্ছে কিনা**: যাচাই করুন আপনার অঞ্চল মডেলটিকে সমর্থন করে কিনা
3. **নেটওয়ার্ক সংযোগযোগ্যতা**: নিশ্চিত করুন সার্ভিসগুলি পরস্পরের সাথে যোগাযোগ করতে পারে
4. **RBAC অনুমতি**: যাচাই করুন অ্যাপটি OpenAI অ্যাক্সেস করতে পারে

**ডিবাগিং কমান্ড:**
```bash
# Check environment variables
azd env get-values

# Open the selected environment's logging view
azd monitor --logs

# Check OpenAI deployment status
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## মডিউল 3: আপনার প্রয়োজন অনুসারে AI অ্যাপ্লিকেশন কাস্টমাইজেশন

### ধাপ 3.1: AI কনফিগারেশন সংশোধন করুন

1. **OpenAI মডেল আপডেট করুন:**
```bash
# Change to a different model (if available in your region)
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1

# Apply the model infrastructure change, then deploy the application
azd up
```

2. **অতিরিক্ত AI সার্ভিস যোগ করুন:**

`infra/main.bicep` সম্পাদনা করে Document Intelligence যোগ করুন:

নিম্নলিখিতটি একটি উদাহরণমূলক অংশ, সম্পূর্ণ টেমপ্লেট নয়। নমুনাটি ইতিমধ্যে ডকুমেন্ট-প্রসেসিং সার্ভিস সরবরাহ করতে পারে: ডুপ্লিকেট সম্পদ যোগ করার আগে এর বর্তমান অবকাঠামো পরীক্ষা করুন। কাস্টম সংযোজনের জন্য আউটপুট, পরিচয় এবং অ্যাপ্লিকেশন কনফিগারেশন সংযুক্ত করতে হবে।

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

**সেরা অনুশীলন**: ডেভেলপমেন্ট বনাম প্রোডাকশনের জন্য আলাদা কনফিগারেশন।

1. **একটি প্রোডাকশন পরিবেশ তৈরি করুন:**
```bash
azd env new myai-production
```

2. **প্রোডাকশন-নির্দিষ্ট প্যারামিটার সেট করুন:**
```bash
# Use the sample's actual Search SKU parameter
azd env set AZURE_SEARCH_SERVICE_SKU standard

# Enable private endpoints using the sample's parameter
azd env set AZURE_USE_PRIVATE_ENDPOINT true
```

এই নামগুলি নমুনার [main.parameters.json](https://github.com/Azure-Samples/azure-search-openai-demo/blob/main/infra/main.parameters.json) থেকে এসেছে। `azd env set` একটি মান সংরক্ষণ করে কিন্তু এবছ arbitrary ভেরিয়েবল কার্যকর করে না: টেমপ্লেট এটি ব্যবহার করতে হবে। পাবলিক অ্যাক্সেস অক্ষম করার আগে নমুনার [নেটওয়ার্ক বিচ্ছেদ নির্দেশিকা](https://github.com/Azure-Samples/azure-search-openai-demo/blob/main/docs/deploy_private.md) পর্যালোচনা করুন, এবং অবকাঠামোগত পরিবর্তন প্রয়োগ করতে `azd up` ব্যবহার করুন। OpenAI SKU `S0` একা মডেল থ্রুপুট নির্ধারণ করে না; মডেল ডিপ্লয়মেন্ট প্রকার এবং ক্ষমতাও গুরুত্বপূর্ণ।

### **ল্যাব অনুশীলন 3.1: খরচ অপ্টিমাইজেশন**

**চ্যালেঞ্জ**: টেমপ্লেটকে খরচ-সাশ্রয়ী ডেভেলপমেন্টের জন্য কনফিগার করুন।

**কাজসমূহ:**
1. ব্যবহারযোগ্য ওয়ার্কশপ পরিবেশ নির্বাচন করুন: `azd env select myai-workshop`।
2. বর্তমান Search SKU এবং মডেল ক্ষমতা `infra/main.parameters.json` এবং নির্বাচিত পরিবেশ থেকে রেকর্ড করুন।
3. মডেল/অঞ্চল কোটার নিশ্চিতকরণের পর নীচের সমর্থিত ইনপুট ব্যবহার করুন:
   ```bash
   azd env set AZURE_SEARCH_SERVICE_SKU basic
   azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
   azd up
   ```
4. পোর্টালে Search SKU এবং ডিপ্লয়মেন্ট ক্ষমতা যাচাই করুন এবং মূল্য নিরূপণ ক্যালকুলেটরের সাথে পার্থক্য অনুমান করুন। বিলিং তথ্য অবিলম্বে আপডেট হবে বলে আশা করবেন না।

**সাফল্যের ক্রাইটেরিয়া:** Search Basic ব্যবহার করে, চ্যাট ডিপ্লয়মেন্ট অনুরোধকৃত সমর্থিত ক্ষমতা রয়েছে, এবং অ্যাপ এখনও একটি নমুনা প্রশ্নের উত্তর দেয়। ক্ষমতা `10` একটি হারে সীমা বরাদ্দ, কোনও টোকেন মূল্যের ছাড় নয়। Search স্তরের পরিবর্তন সীমাবদ্ধ থাকতে পারে বা পুনরায় তৈরি প্রয়োজন হতে পারে; প্রোডাকশন সম্পদে পরীক্ষা করবেন না। F0 সার্ভিস-নির্দিষ্ট এবং এটি Azure OpenAI মডেল SKU নয়।

## মডিউল 4: নিরাপত্তা এবং প্রোডাকশন সেরা অনুশীলনসমূহ

### ধাপ 4.1: নিরাপদ ক্রেডেনশিয়াল ব্যবস্থাপনা

**বর্তমান চ্যালেঞ্জ**: অনেক AI অ্যাপ্লিকেশন API কী হার্ডকোড করে বা অনিরাপদ স্টোরেজ ব্যবহার করে।

**AZD সমাধান**: ম্যানেজড আইডেনটিটি + কী ভল্ট ইন্টিগ্রেশন।

1. **আপনার টেমপ্লেটের নিরাপত্তা কনফিগারেশন পর্যালোচনা করুন:**
```bash
# Look for Key Vault and Managed Identity configuration
grep -r "keyVault\|managedIdentity" infra/
```

2. **ম্যানেজড আইডেন্টিটি কাজ করছে কিনা যাচাই করুন:**
```bash
# For the sample's default Container Apps host
az containerapp identity show --name YOUR_CONTAINER_APP_NAME --resource-group YOUR_RG
```

### ধাপ 4.2: নেটওয়ার্ক সিকিউরিটি

1. **নমুনার সমর্থিত নেটওয়ার্ক কনফিগারেশন ব্যবহার করে প্রাইভেট এন্ডপয়েন্ট সক্রিয় করুন** (যদি ইতিমধ্যে কনফিগার করা না হয়)।

আপনার নিজের টেমপ্লেটের জন্য, এই ইলাস্ট্রেটিভ অংশটি OpenAI এন্ডপয়েন্ট সংযোগ দেখায়। এর জন্য একটি VNet, প্রাইভেট DNS কনফিগারেশন এবং অ্যাপ্লিকেশন সংযোগও প্রয়োজন; এটি কোনও পরিবর্তন ছাড়াই নমুনায় পেস্ট করবেন না, যেখানে ইতিমধ্যে প্রাইভেট-এন্ডপয়েন্ট মডিউল রয়েছে:
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

### ধাপ 4.3: মনিটরিং এবং অবজারভেবিলিটি

1. **অ্যাপ্লিকেশন ইনসাইটস কনফিগার করুন:**
```bash
# Application Insights should be automatically configured
# Check the configuration:
az monitor app-insights component show --app YOUR_APP_INSIGHTS_NAME --resource-group YOUR_RG
```

2. **নমুনার অ্যাপ্লিকেশন ইনসাইটস ইন্টিগ্রেশন সক্রিয় করুন:**
```bash
azd env set AZURE_USE_APPLICATION_INSIGHTS true
azd up
azd monitor --overview
```

নমুনার ইনস্ট্রুমেন্টেশন টেলিমেট্রি প্রেরণ করে; একটি স্বতন্ত্র `OPENAI_MONITOR_ENABLED` সেটিং AI মেট্রিক্স সক্রিয় করে না। মডেল কল, লেটেন্সি, ব্যর্থতা, এবং টোকেন ব্যবহারের জন্য ট্রেস পর্যালোচনা করুন, এবং সংবেদনশীল প্রম্পট বা প্রতিক্রিয়া রেকর্ড করা এড়িয়ে চলুন।

### **ল্যাব ব্যায়াম 4.1: সিকিউরিটি অডিট**

**কার্য:** আপনার ডিপ্লয়মেন্টের জন্য সিকিউরিটি সেরা অনুশীলনগুলো পর্যালোচনা করুন।

**চেকলিস্ট:**
- [ ] কোড বা কনফিগারেশনে কোনো হার্ডকোডেড সিক্রেট নেই
- [ ] সার্ভিস-টু-সার্ভিস অথেনটিকেশনের জন্য ম্যানেজড আইডেন্টিটি ব্যবহার করা হয়েছে
- [ ] কিজ ভল্ট সংবেদনশীল কনফিগারেশন সংরক্ষণ করে
- [ ] নেটওয়ার্ক অ্যাক্সেস সঠিকভাবে সীমাবদ্ধ করা হয়েছে
- [ ] মনিটরিং এবং লগিং সক্রিয় আছে

## মডিউল 5: আপনার নিজের AI অ্যাপ্লিকেশন রূপান্তর

### ধাপ 5.1: মূল্যায়ন ওয়ার্কশীট

**আপনার অ্যাপ রূপান্তর করার আগে**, এই প্রশ্নগুলোর উত্তর দিন:

1. **অ্যাপ্লিকেশন আর্কিটেকচার:**
   - আপনার অ্যাপ কোন AI সার্ভিসগুলি ব্যবহার করে?
   - এটি কী ধরনের কম্পিউট রিসোর্স প্রয়োজন?
   - এটি কি ডাটাবেস প্রয়োজন?
   - সার্ভিসগুলোর মধ্যে কী ধরনের নির্ভরতা রয়েছে?

2. **সিকিউরিটি প্রয়োজনীয়তাগুলো:**
   - আপনার অ্যাপ কোন সংবেদনশীল তথ্য সামলায়?
   - আপনার কি কোনো কমপ্লায়েন্স প্রয়োজনীয়তা আছে?
   - কি আপনার প্রাইভেট নেটওয়ার্কিং প্রয়োজন?

3. **স্কেলিং প্রয়োজনীয়তাগুলো:**
   - আপনার প্রত্যাশিত লোড কত?
   - আপনি কি অটো-স্কেলিং প্রয়োজন?
   - কোনো আঞ্চলিক প্রয়োজনীয়তা আছে কি?

### ধাপ 5.2: আপনার AZD টেমপ্লেট তৈরি করুন

**আপনার অ্যাপ রূপান্তর করার জন্য এই প্যাটার্নটি অনুসরণ করুন:**

**শুধুমাত্র স্ক্যাফোল্ড:** এই বিভাগ API/ওয়েব অ্যাপ্লিকেশন সোর্স, হোস্ট অবকাঠামো, মডেল ডিপ্লয়মেন্ট, আইডেন্টিটি/RBAC, অথবা একটি সম্পূর্ণ `main.parameters.json` সরবরাহ করে না। রিসোর্স-গ্রুপ-স্কোপড Bicep মডিউল কম্পোজিশন দেখায়; একটি সাধারণ AZD সাবস্ক্রিপশন-স্কোপড এন্ট্রি পয়েন্ট একটি রিসোর্স গ্রুপ তৈরি করতে হবে এবং সেই স্কোপে এটি ইনভোক করতে হবে। শুধুমাত্র এই অংশগুলি কপি করলে `azd up` সম্পূর্ণ অ্যাপ ডিপ্লয় করবে এমন আশা করবেন না। চালু করার মতো বেসলাইন জন্য, মডিউল ১ থেকে RAG টেমপ্লেট ব্যবহার চালিয়ে যান।

1. **মূল কাঠামো তৈরি করুন:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Initialize AZD template
azd init --template minimal .
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
    disableLocalAuth: true
  }
}

output endpoint string = openAIAccount.properties.endpoint
output name string = openAIAccount.name
```

### **ল্যাব ব্যায়াম 5.1: টেমপ্লেট তৈরি চ্যালেঞ্জ**

**চ্যালেঞ্জ:** একটি ডকুমেন্ট প্রসেসিং AI অ্যাপের জন্য AZD টেমপ্লেট তৈরি করুন।

**প্রয়োজনীয়তাগুলো:**
- বিষয়বস্তুর বিশ্লেষণের জন্য Microsoft Foundry মডেল
- OCR জন্য ডকুমেন্ট ইন্টেলিজেন্স
- ডকুমেন্ট আপলোডের জন্য স্টোরেজ অ্যাকাউন্ট
- প্রসেসিং লজিকের জন্য ফাংশন অ্যাপ
- ব্যবহারকারীর ইন্টারফেসের জন্য ওয়েব অ্যাপ

**বোনাস পয়েন্ট:**
- সঠিক ত্রুটির হ্যান্ডলিং যোগ করুন
- খরচ অনুমানের অন্তর্ভুক্ত করা  
- মনিটরিং ড্যাশবোর্ড সেট আপ করা  

## মডিউল 6: সাধারণ সমস্যাগুলোর সমাধান  

### সাধারণ ডিপ্লয়মেন্ট সমস্যা  

#### সমস্যা 1: OpenAI সার্ভিস কোটা অতিক্রম করা হয়েছে  
**লক্ষণ:** কোটা 오류 নিয়ে ডিপ্লয়মেন্ট ব্যর্থ হয়  
**সমাধানসমূহ:**  
```bash
# Check current quotas
az cognitiveservices usage list --location eastus

# Request quota increase, OR try a new disposable environment in another region.
# Azure resources cannot be relocated merely by changing AZURE_LOCATION.
azd env new myai-quota-test
azd env set AZURE_LOCATION westus2
azd up
```
  
#### সমস্যা 2: মডেল অঞ্চলভিত্তিক উপলব্ধ নেই  
**লক্ষণ:** AI প্রতিক্রিয়া ব্যর্থ হয় বা মডেল ডিপ্লয়মেন্ট ত্রুটি হয়  
**সমাধানসমূহ:**  
```bash
# Check model availability by region
az cognitiveservices model list --location eastus

# Update to available model
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1-mini
azd up
```
  
#### সমস্যা 3: অনুমতির সমস্যা  
**লক্ষণ:** AI সার্ভিস কল করার সময় 403 ফরবিডেন ত্রুটি  
**সমাধানসমূহ:**  
```bash
# Check role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Add missing roles
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```
  
### কর্মক্ষমতার সমস্যা  

#### সমস্যা ৪: ধীর AI প্রতিক্রিয়া
**তদন্তের ধাপসমূহ:**
১. পারফরম্যান্স মেট্রিক্সের জন্য অ্যাপ্লিকেশন ইনসাইটস চেক করুন
২. Azure পোর্টালে OpenAI সার্ভিস মেট্রিক্স পর্যালোচনা করুন
৩. নেটওয়ার্ক সংযোগ এবং বিলম্ব যাচাই করুন

**সমাধানসমূহ:**
- সাধারণ প্রশ্নগুলোর জন্য ক্যাশিং প্রয়োগ করুন
- আপনার ব্যবহারের ক্ষেত্রে উপযুক্ত OpenAI মডেল ব্যবহার করুন
- মডেল RPM/TPM সীমা পরীক্ষা করার পরই অ্যাপ্লিকেশন রেপ্লিকা স্কেল করুন; Azure OpenAI ডিপ্লয়মেন্টগুলি সাধারণ ডেটাবেস-স্টাইলের "রিড রেপ্লিকা" সেটিং প্রকাশ করে না

### **ল্যাব অনুশীলন ৬.১: ডিবাগিং চ্যালেঞ্জ**

**পরিস্থিতি**: আপনার ডিপ্লয়মেন্ট সফল হয়েছে, কিন্তু অ্যাপ্লিকেশন ৫০০ ত্রুটি প্রদান করছে।

**ডিবাগিং কাজসমূহ:**
১. অ্যাপ্লিকেশন লগ চেক করুন
২. সার্ভিস সংযোগ যাচাই করুন
৩. প্রমাণীকরণ পরীক্ষা
৪. কনফিগারেশন পর্যালোচনা

**ব্যবহার করার সরঞ্জামসমূহ:**
- ডিপ্লয়মেন্ট ওভারভিউয়ের জন্য `azd show`
- বিস্তারিত সেবা লগসমূহের জন্য Azure পোর্টাল
- অ্যাপ্লিকেশন টেলিমেট্রির জন্য Application Insights

## মডিউল ৭: পর্যবেক্ষণ ও অনুকূলন

### ধাপ ৭.১: ব্যাপক পর্যবেক্ষণ সেট আপ করুন

১. **কাস্টম ড্যাশবোর্ড তৈরি করুন:**

Azure পোর্টালে যান এবং একটি ড্যাশবোর্ড তৈরি করুন যা অন্তর্ভুক্ত করবে:
- OpenAI অনুরোধ গণনা ও বিলম্ব
- অ্যাপ্লিকেশন ত্রুটি হারসমূহ
- সম্পদ ব্যবহার
- খরচ ট্র্যাকিং

২. **অ্যালার্ট সেট আপ করুন:**
```bash
# Failed-request count on the Application Insights component (not a percentage)
az monitor metrics alert create \
  --name "AI-App-Failed-Requests" \
  --resource-group YOUR_RG \
  --scopes YOUR_APPLICATION_INSIGHTS_RESOURCE_ID \
  --condition "count requests/failed > 10" \
  --window-size 5m \
  --evaluation-frequency 1m \
  --description "More than 10 failed requests in five minutes"
```

নিশ্চিত করুন উপাদান অনুরোধ টেলিমেট্রি পাঠাচ্ছে এবং যদি বিজ্ঞপ্তি প্রয়োজন হয় তবে একটি অ্যাকশন গ্রুপ যোগ করুন। মেট্রিকটি একটি গণনা, ব্যর্থতার শতাংশ নয়; একটি হার অ্যালার্টের জন্য উপযুক্ত কোয়েরি এবং ডিনোমিনেটর প্রয়োজন।

### ধাপ ৭.২: খরচ অনুকূলন

১. **বর্তমান খরচ বিশ্লেষণ করুন:**
```bash
# Set a recent reporting window supported by your billing account.
az consumption usage list --start-date YYYY-MM-DD --end-date YYYY-MM-DD
```

তারিখের প্লেসবোল্ডারগুলি প্রতিস্থাপন করুন। কনজাম্পশন API এর সমর্থন বিলিং চুক্তি অনুযায়ী বিভিন্ন হতে পারে; যদি ব্যবহার বিবরণ পাওয়া না যায় তবে পোর্টালের Cost Management ব্যবহার করুন। খরচগুলি বিলম্বিত হয়, এটি রিয়েল-টাইম পরীক্ষার ওরাকল নয়।

২. **খরচ নিয়ন্ত্রণ বাস্তবায়ন করুন:**
- বাজেট অ্যালার্ট সেট আপ করুন
- অটোস্কেলিং নীতি ব্যবহার করুন
- অনুরোধ ক্যাশিং বাস্তবায়ন করুন
- OpenAI এর জন্য টোকেন ব্যবহারের পর্যবেক্ষণ করুন

### **ল্যাব অনুশীলন ৭.১: কর্মক্ষমতা অনুকূলন**

**কার্য:** আপনার AI অ্যাপ্লিকেশনকে কর্মক্ষমতা ও খরচ উভয়ের জন্য অনুকূলিত করুন।

**উন্নত করার জন্য মেট্রিক্সগুলো:**
- গড় প্রতিক্রিয়া সময় ২০% কমান
- মাসিক খরচ ১৫% কমান
- ৯৯.৯% উপলভ্যতা SLO এবং একটি পরিমাপ উইন্ডো সংজ্ঞায়িত করুন (একটি স্বল্প ল্যাব মাসিক অপটাইম প্রদর্শন করতে পারে না)

**চেষ্টা করার কৌশলসমূহ:**
- প্রতিক্রিয়া ক্যাশিং বাস্তবায়ন করুন
- টোকেন দক্ষতার জন্য প্রম্পট অপ্টিমাইজ করুন
- উপযুক্ত কম্পিউট SKUs ব্যবহার করুন
- সঠিক অটোস্কেলিং সেট আপ করুন

## চূড়ান্ত চ্যালেঞ্জ: প্রথম থেকে শেষ বাস্তবায়ন

### চ্যালেঞ্জ দৃশ্যকল্প

এটি একটি **ঐচ্ছিক আর্কিটেকচার/ডিজাইন চ্যালেঞ্জ**, সরবরাহকৃত রানযোগ্য অনুশীলন বা একটি উৎপাদন সার্টিফিকেশন নয়। একটি AI-চালিত কাস্টমার সার্ভিস চ্যাটবট প্রস্তাব করুন এবং কোন রিকোয়ারমেন্টগুলোর জন্য আরও বাস্তবায়ন এবং প্রমাণ প্রয়োজন তা নথিভুক্ত করুন:

**কার্যকরী রিকোয়ারমেন্ট:**
- কাস্টমার ইন্টারঅ্যাকশনের জন্য ওয়েব ইন্টারফেস
- Microsoft Foundry মডেলসমূহের সাথে প্রতিক্রিয়ার ইন্টিগ্রেশন
- Azure AI সার্চ ব্যবহার করে ডকুমেন্ট অনুসন্ধান ক্ষমতা
- বিদ্যমান কাস্টমার ডাটাবেসের সাথে ইন্টিগ্রেশন
- বহু-ভাষা সমর্থন

**অকার্যকরী রিকোয়ারমেন্ট:**
- একসাথে ১০০০ ব্যবহারকারী পরিচালনা করবে
- ৯৯.৯% আপটাইম SLA
- SOC 2 অনুবর্তিতা
- মাসে $৫০০-এর মধ্যে খরচ
- একাধিক পরিবেশে (ডেভ, স্টেজিং, প্রোড) ডিপ্লয়মেন্ট

এরা কাল্পনিক স্টেকহোল্ডার সীমাবদ্ধতা, একসাথে নিশ্চিত ফলাফল নয়। অনুরোধ হার, প্রম্পট/আউটপুট সাইজ, এবং সেশন সময়কাল সংজ্ঞায়িত করুন খরচ অনুমানের আগে; ১,০০০ ব্যবহারকারীই একটি ওয়ার্কলোড ভিত্তি গঠন করে না বা $৫০০ বাজেটের বাস্তবতা প্রমাণ করে না। SOC 2 একটি সাংগঠনিক অডিট ফলাফল, AZD টেমপ্লেট দ্বারা চালু করা কোনো সুইচ নয়। ব্যবসা-বিনিময়গুলি শনাক্ত করুন এবং প্রমাণসহ অবাস্তব সীমাবদ্ধতা প্রত্যাখ্যান করুন।

### বাস্তবায়ন ধাপসমূহ

১. **আর্কিটেকচার ডিজাইন করুন**
২. **AZD টেমপ্লেট তৈরি করুন**
৩. **নিরাপত্তা ব্যবস্থা বাস্তবায়ন করুন**
৪. **পর্যবেক্ষণ ও অ্যালার্টিং সেট আপ করুন**
৫. **ডিপ্লয়মেন্ট পাইপলাইন তৈরি করুন**
৬. **সমাধান নথিভুক্ত করুন**

### মূল্যায়ন মানদণ্ড

- ✅ **কার্যকারিতা**: বাস্তবায়িত ক্ষমতাগুলো প্রদর্শিত কি এবং অবশিষ্ট ফাঁক স্পষ্ট কি?
- ✅ **নিরাপত্তা**: সেরা চর্চাগুলো বাস্তবায়িত কি?
- ✅ **স্কেলেবিলিটি**: এটি লোড সহ্য করতে পারে কি?
- ✅ **রক্ষণাবেক্ষণযোগ্যতা**: কোড এবং অবকাঠামো সুসংগঠিত কি?
- ✅ **খরচ**: এটি বাজেটের মধ্যে আছে কি?

## অতিরিক্ত সম্পদ

### Microsoft ডকুমেন্টেশন
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### নমুনা টেমপ্লেটসমূহ
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### কমিউনিটি রিসোর্স
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 সম্পন্ন করার চেকপয়েন্ট

অভিনন্দন! আপনি AI ওয়ার্কশপ ল্যাব সম্পন্ন করেছেন। এখন আপনি সক্ষম হবেন:

- ✅ কিভাবে বিদ্যমান AI অ্যাপ্লিকেশনকে AZD টেমপ্লেটে অভিযোজিত করতে হয় ব্যাখ্যা করুন
- ✅ AI রেফারেন্স অ্যাপ্লিকেশন ডিপ্লয় ও পরীক্ষা করুন
- ✅ AI ওয়ার্কলোডের জন্য নিরাপত্তার সেরা চর্চা বাস্তবায়ন করুন
- ✅ AI অ্যাপ্লিকেশন কর্মক্ষমতা মনিটর ও অনুকূলন করুন
- ✅ সাধারণ ডিপ্লয়মেন্ট সমস্যাগুলোর সমাধান করুন

**পরিষ্কার করুন:** `azd env list` চালান, প্রতিটি ডিসপোজেবল পরিবেশ নির্বাচন করুন যা এই ল্যাবে তৈরি হয়েছে (`myai-workshop`, এবং যদি ডিপ্লয় করা থাকে `myai-production`/`myai-quota-test`), এবং প্রতিটিতে `azd down` চালান। মুছে ফেলার পরিকল্পনা পর্যালোচনা করুন; কোনও পরিবেশের স্থানীয় কনফিগারেশন মুছে ফেলা Azure সম্পদ মুছে ফেলে না। `--purge` এড়িয়ে চলুন যদি আপনি অনিবার্য সফট-ডিলিটেড রিসোর্স অপসারণ বুঝে না থাকেন।

### পরবর্তী ধাপসমূহ
১. এই প্যাটার্নগুলো আপনার নিজস্ব AI প্রকল্পে প্রয়োগ করুন
২. টেমপ্লেটগুলো কমিউনিটিতে পুনরায় অবদান রাখুন
৩. চলমান সহায়তার জন্য Microsoft Foundry Discord-এ যোগ দিন
৪. বহু-অঞ্চল ডিপ্লয়মেন্টের মতো উন্নত বিষয়গুলি অনুসন্ধান করুন

---

**ওয়ার্কশপ প্রতিক্রিয়া**: এই ওয়ার্কশপ উন্নত করতে আপনার অভিজ্ঞতা [Microsoft Foundry Discord #Azure চ্যানেল](https://discord.gg/microsoft-azure) এ শেয়ার করুন।

---

**অধ্যায় নেভিগেশন:**
- **📚 কোর্স হোম**: [AZD ফর বিগিনার্স](../../README.md)
- **📖 বর্তমান অধ্যায়**: অধ্যায় ২ - AI-প্রথম উন্নয়ন
- **⬅️ পূর্ববর্তী**: [AI মডেল ডিপ্লয়মেন্ট](ai-model-deployment.md)
- **➡️ পরবর্তী**: [প্রোডাকশন AI সেরা চর্চা](../chapter-08-production/production-ai-practices.md)
- **🚀 পরবর্তী অধ্যায়**: [অধ্যায় ৩: কনফিগারেশন](../chapter-03-configuration/configuration.md)

**সহায়তা দরকার?** AZD এবং AI ডিপ্লয়মেন্ট নিয়ে সমর্থন এবং আলোচনা জন্য আমাদের কমিউনিটিতে যোগ দিন।

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**অস্বীকৃতি**:
এই নথিটি AI অনুবাদ পরিষেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনূদিত হয়েছে। যদিও আমরা শুদ্ধতার জন্য চেষ্টা করি, অনুগ্রহ করে মনে রাখবেন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসঙ্গতি থাকতে পারে। মূল নথিটি তার স্বভাষায় কর্তৃত্বপূর্ণ উৎস হিসেবে বিবেচিত হওয়া উচিত। গুরুত্বপূর্ণ তথ্যের জন্য পেশাদার মানব অনুবাদ সুপারিশ করা হয়। এই অনুবাদের ব্যবহারে প্রয়োজনীয় ভুল বোঝাবুঝি বা ভুল ব্যাখ্যার জন্য আমরা দায়বদ্ধ নই।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->