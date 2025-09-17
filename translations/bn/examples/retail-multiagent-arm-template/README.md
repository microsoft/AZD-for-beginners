<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "eb84941706983946ae03bfa0433c0bb6",
  "translation_date": "2025-09-17T20:17:35+00:00",
  "source_file": "examples/retail-multiagent-arm-template/README.md",
  "language_code": "bn"
}
-->
# রিটেইল মাল্টি-এজেন্ট সলিউশন - ARM টেমপ্লেট ডিপ্লয়মেন্ট

**অধ্যায় ৫: প্রোডাকশন ডিপ্লয়মেন্ট প্যাকেজ**
- **📚 কোর্স হোম**: [AZD ফর বিগিনারস](../../README.md)
- **📖 সম্পর্কিত অধ্যায়**: [অধ্যায় ৫: মাল্টি-এজেন্ট AI সলিউশন](../../README.md#-chapter-5-multi-agent-ai-solutions-advanced)
- **📝 পরিস্থিতি গাইড**: [সম্পূর্ণ বাস্তবায়ন](../retail-scenario.md)
- **🎯 দ্রুত ডিপ্লয়**: [এক-ক্লিক ডিপ্লয়মেন্ট](../../../../examples/retail-multiagent-arm-template)

এই ডিরেক্টরিতে রিটেইল মাল্টি-এজেন্ট কাস্টমার সাপোর্ট সলিউশন ডিপ্লয় করার জন্য একটি সম্পূর্ণ Azure Resource Manager (ARM) টেমপ্লেট রয়েছে, যা পুরো আর্কিটেকচারের জন্য কোড হিসেবে ইনফ্রাস্ট্রাকচার প্রদান করে।

## 🎯 কী কী ডিপ্লয় হয়

### মূল ইনফ্রাস্ট্রাকচার
- **Azure OpenAI Services** (উচ্চ প্রাপ্যতার জন্য মাল্টি-রিজিওন)
  - প্রাইমারি রিজিওন: কাস্টমার এজেন্টের জন্য GPT-4o
  - সেকেন্ডারি রিজিওন: ইনভেন্টরি এজেন্টের জন্য GPT-4o-mini  
  - তৃতীয় রিজিওন: টেক্সট এমবেডিং মডেল
  - ইভালুয়েশন রিজিওন: GPT-4o গ্রেডার মডেল
- **Azure AI Search** ভেক্টর সার্চ সক্ষমতার সাথে
- **Azure Storage Account** ডকুমেন্ট এবং আপলোডের জন্য ব্লব কন্টেইনার সহ
- **Azure Container Apps Environment** অটো-স্কেলিং সহ
- **Container Apps** এজেন্ট রাউটার এবং ফ্রন্টএন্ডের জন্য
- **Azure Cosmos DB** চ্যাট হিস্টোরি সংরক্ষণের জন্য
- **Azure Key Vault** সিক্রেট ম্যানেজমেন্টের জন্য (ঐচ্ছিক)
- **Application Insights** এবং Log Analytics মনিটরিংয়ের জন্য (ঐচ্ছিক)
- **Document Intelligence** ডকুমেন্ট প্রসেসিংয়ের জন্য
- **Bing Search API** রিয়েল-টাইম তথ্যের জন্য

### ডিপ্লয়মেন্ট মোড

| মোড | বিবরণ | ব্যবহার ক্ষেত্র | রিসোর্স |
|------|-------------|----------|-----------|
| **মিনিমাল** | খরচ-অপ্টিমাইজড বেসিক ডিপ্লয়মেন্ট | ডেভেলপমেন্ট, টেস্টিং | বেসিক SKUs, একক রিজিওন, কম ক্ষমতা |
| **স্ট্যান্ডার্ড** | প্রোডাকশন ওয়ার্কলোডের জন্য ব্যালেন্সড ডিপ্লয়মেন্ট | প্রোডাকশন, মাঝারি স্কেল | স্ট্যান্ডার্ড SKUs, মাল্টি-রিজিওন, স্ট্যান্ডার্ড ক্ষমতা |
| **প্রিমিয়াম** | উচ্চ-ক্ষমতা, এন্টারপ্রাইজ-গ্রেড ডিপ্লয়মেন্ট | এন্টারপ্রাইজ, উচ্চ স্কেল | প্রিমিয়াম SKUs, মাল্টি-রিজিওন, উচ্চ ক্ষমতা |

## 📋 প্রয়োজনীয়তা

1. **Azure CLI** ইনস্টল এবং কনফিগার করা
2. **অ্যাক্টিভ Azure সাবস্ক্রিপশন** পর্যাপ্ত কোটা সহ
3. **উপযুক্ত অনুমতি** টার্গেট সাবস্ক্রিপশনে রিসোর্স তৈরি করার জন্য
4. **রিসোর্স কোটা**:
   - Azure OpenAI (রিজিওনাল প্রাপ্যতা পরীক্ষা করুন)
   - Container Apps (রিজিওন অনুযায়ী পরিবর্তিত হয়)
   - AI Search (স্ট্যান্ডার্ড টিয়ার বা উচ্চতর সুপারিশকৃত)

## 🚀 দ্রুত ডিপ্লয়মেন্ট

### অপশন ১: Azure CLI ব্যবহার করে

```bash
# Clone or download the template files
git clone <repository-url>
cd examples/retail-multiagent-arm-template

# Make the deployment script executable
chmod +x deploy.sh

# Deploy with default settings
./deploy.sh -g myResourceGroup

# Deploy for production with premium features
./deploy.sh -g myProdRG -e prod -m premium -l eastus2
```

### অপশন ২: Azure পোর্টাল ব্যবহার করে

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2Fazd-for-beginners%2Fmain%2Fexamples%2Fretail-multiagent-arm-template%2Fazuredeploy.json)

### অপশন ৩: সরাসরি Azure CLI ব্যবহার করে

```bash
# Create resource group
az group create --name myResourceGroup --location eastus2

# Deploy template
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json
```

## ⚙️ কনফিগারেশন অপশন

### টেমপ্লেট প্যারামিটার

| প্যারামিটার | টাইপ | ডিফল্ট | বিবরণ |
|-----------|------|---------|-------------|
| `projectName` | string | "retail" | সমস্ত রিসোর্স নামের জন্য প্রিফিক্স |
| `location` | string | রিসোর্স গ্রুপ লোকেশন | প্রাইমারি ডিপ্লয়মেন্ট রিজিওন |
| `secondaryLocation` | string | "westus2" | মাল্টি-রিজিওন ডিপ্লয়মেন্টের জন্য সেকেন্ডারি রিজিওন |
| `tertiaryLocation` | string | "francecentral" | এমবেডিং মডেলের জন্য রিজিওন |
| `environmentName` | string | "dev" | পরিবেশের নামকরণ (dev/staging/prod) |
| `deploymentMode` | string | "standard" | ডিপ্লয়মেন্ট কনফিগারেশন (minimal/standard/premium) |
| `enableMultiRegion` | bool | true | মাল্টি-রিজিওন ডিপ্লয়মেন্ট সক্রিয় করুন |
| `enableMonitoring` | bool | true | Application Insights এবং লগিং সক্রিয় করুন |
| `enableSecurity` | bool | true | Key Vault এবং উন্নত নিরাপত্তা সক্রিয় করুন |

### প্যারামিটার কাস্টমাইজেশন

`azuredeploy.parameters.json` সম্পাদনা করুন:

```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "projectName": {
      "value": "mycompany"
    },
    "environmentName": {
      "value": "prod"
    },
    "deploymentMode": {
      "value": "premium"
    },
    "location": {
      "value": "eastus2"
    }
  }
}
```

## 🏗️ আর্কিটেকচার ওভারভিউ

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Frontend      │    │  Agent Router   │    │     Agents      │
│ (Container App) │───▶│ (Container App) │───▶│ Customer + Inv  │
└─────────────────┘    └─────────────────┘    └─────────────────┘
                                │                        │
                                ▼                        ▼
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   AI Search     │    │  Azure OpenAI   │    │    Storage      │
│   (Vector DB)   │    │ (Multi-region)  │    │   (Documents)   │
└─────────────────┘    └─────────────────┘    └─────────────────┘
                                │                        │
                                ▼                        ▼
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│  Cosmos DB      │    │ App Insights    │    │   Key Vault     │
│ (Chat History)  │    │  (Monitoring)   │    │   (Secrets)     │
└─────────────────┘    └─────────────────┘    └─────────────────┘
```

## 📖 ডিপ্লয়মেন্ট স্ক্রিপ্ট ব্যবহার

`deploy.sh` স্ক্রিপ্ট একটি ইন্টারঅ্যাকটিভ ডিপ্লয়মেন্ট অভিজ্ঞতা প্রদান করে:

```bash
# Show help
./deploy.sh --help

# Basic deployment
./deploy.sh -g myResourceGroup

# Advanced deployment with custom settings
./deploy.sh \
  -g myProductionRG \
  -p companyname \
  -e prod \
  -m premium \
  -l eastus2

# Development deployment without multi-region
./deploy.sh \
  -g myDevRG \
  -e dev \
  -m minimal \
  --no-multi-region \
  --no-security
```

### স্ক্রিপ্ট ফিচার

- ✅ **প্রয়োজনীয়তা যাচাই** (Azure CLI, লগইন স্ট্যাটাস, টেমপ্লেট ফাইল)
- ✅ **রিসোর্স গ্রুপ ম্যানেজমেন্ট** (থাকলে তৈরি করে)
- ✅ **টেমপ্লেট যাচাই** ডিপ্লয়মেন্টের আগে
- ✅ **প্রগ্রেস মনিটরিং** রঙিন আউটপুট সহ
- ✅ **ডিপ্লয়মেন্ট আউটপুট** প্রদর্শন
- ✅ **পোস্ট-ডিপ্লয়মেন্ট নির্দেশিকা**

## 📊 ডিপ্লয়মেন্ট মনিটরিং

### ডিপ্লয়মেন্ট স্ট্যাটাস পরীক্ষা

```bash
# List deployments
az deployment group list --resource-group myResourceGroup --output table

# Get deployment details
az deployment group show \
  --resource-group myResourceGroup \
  --name retail-deployment-YYYYMMDD-HHMMSS

# Watch deployment progress
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --verbose
```

### ডিপ্লয়মেন্ট আউটপুট

সফল ডিপ্লয়মেন্টের পরে নিম্নলিখিত আউটপুট উপলব্ধ:

- **ফ্রন্টএন্ড URL**: ওয়েব ইন্টারফেসের পাবলিক এন্ডপয়েন্ট
- **রাউটার URL**: এজেন্ট রাউটারের API এন্ডপয়েন্ট
- **OpenAI এন্ডপয়েন্টস**: প্রাইমারি এবং সেকেন্ডারি OpenAI সার্ভিস এন্ডপয়েন্ট
- **সার্চ সার্ভিস**: Azure AI Search সার্ভিস এন্ডপয়েন্ট
- **স্টোরেজ অ্যাকাউন্ট**: ডকুমেন্টের জন্য স্টোরেজ অ্যাকাউন্টের নাম
- **Key Vault**: Key Vault-এর নাম (যদি সক্রিয় থাকে)
- **Application Insights**: মনিটরিং সার্ভিসের নাম (যদি সক্রিয় থাকে)

## 🔧 পোস্ট-ডিপ্লয়মেন্ট কনফিগারেশন

### ১. সার্চ ইনডেক্স কনফিগার করুন

```bash
# Set environment variables from deployment outputs
export SEARCH_SERVICE_NAME="<search-service-name>"
export SEARCH_ADMIN_KEY="<search-admin-key>"

# Create search index (customize schema as needed)
curl -X POST "https://${SEARCH_SERVICE_NAME}.search.windows.net/indexes?api-version=2023-11-01" \
  -H "Content-Type: application/json" \
  -H "api-key: ${SEARCH_ADMIN_KEY}" \
  -d @../data/search-schema.json
```

### ২. প্রাথমিক ডেটা আপলোড করুন

```bash
# Upload documents to storage
az storage blob upload-batch \
  --destination documents \
  --source ../data/initial-docs \
  --account-name <storage-account-name>
```

### ৩. এজেন্ট এন্ডপয়েন্ট পরীক্ষা করুন

```bash
# Test router endpoint
curl -X POST "<router-url>/chat" \
  -H "Content-Type: application/json" \
  -d '{
    "message": "Hello, I need help with my order",
    "agent": "customer"
  }'
```

### ৪. কন্টেইনার অ্যাপস কনফিগার করুন

ARM টেমপ্লেট প্লেসহোল্ডার কন্টেইনার ইমেজ ডিপ্লয় করে। প্রকৃত এজেন্ট কোড ডিপ্লয় করতে:

```bash
# Build and push agent images
docker build -t myregistry.azurecr.io/agent-router:latest ./src/router
docker build -t myregistry.azurecr.io/frontend:latest ./src/frontend

# Update container apps
az containerapp update \
  --name retail-router \
  --resource-group myResourceGroup \
  --image myregistry.azurecr.io/agent-router:latest
```

## 🛠️ সমস্যা সমাধান

### সাধারণ সমস্যা

#### ১. Azure OpenAI কোটা অতিক্রম

```bash
# Check current quota usage
az cognitiveservices usage list --location eastus2

# Request quota increase
az support tickets create \
  --ticket-name "OpenAI-Quota-Increase" \
  --severity "minimal" \
  --description "Request quota increase for Azure OpenAI in region X"
```

#### ২. কন্টেইনার অ্যাপস ডিপ্লয়মেন্ট ব্যর্থ

```bash
# Check container app logs
az containerapp logs show \
  --name retail-router \
  --resource-group myResourceGroup \
  --follow

# Restart container app
az containerapp revision restart \
  --name retail-router \
  --resource-group myResourceGroup
```

#### ৩. সার্চ সার্ভিস ইনিশিয়ালাইজেশন

```bash
# Verify search service status
az search service show \
  --name <search-service-name> \
  --resource-group myResourceGroup

# Test search service connectivity
curl -X GET "https://<search-service-name>.search.windows.net/indexes?api-version=2023-11-01" \
  -H "api-key: <search-admin-key>"
```

### ডিপ্লয়মেন্ট যাচাই

```bash
# Validate all resources are created
az resource list \
  --resource-group myResourceGroup \
  --output table

# Check resource health
az resource list \
  --resource-group myResourceGroup \
  --query "[?provisioningState!='Succeeded'].{Name:name, Status:provisioningState, Type:type}" \
  --output table
```

## 🔐 নিরাপত্তা বিবেচনা

### কী ম্যানেজমেন্ট
- সমস্ত সিক্রেট Azure Key Vault-এ সংরক্ষিত (যদি সক্রিয় থাকে)
- কন্টেইনার অ্যাপস ম্যানেজড আইডেন্টিটি ব্যবহার করে প্রমাণীকরণ
- স্টোরেজ অ্যাকাউন্টে নিরাপদ ডিফল্টস (শুধুমাত্র HTTPS, পাবলিক ব্লব অ্যাক্সেস নেই)

### নেটওয়ার্ক নিরাপত্তা
- কন্টেইনার অ্যাপস অভ্যন্তরীণ নেটওয়ার্কিং ব্যবহার করে যেখানে সম্ভব
- সার্চ সার্ভিস প্রাইভেট এন্ডপয়েন্ট অপশন সহ কনফিগার করা
- Cosmos DB ন্যূনতম প্রয়োজনীয় অনুমতি সহ কনফিগার করা

### RBAC কনফিগারেশন
```bash
# Assign necessary roles for managed identity
az role assignment create \
  --assignee <container-app-managed-identity> \
  --role "Cognitive Services OpenAI User" \
  --scope <openai-resource-id>
```

## 💰 খরচ অপ্টিমাইজেশন

### খরচ অনুমান (মাসিক, USD)

| মোড | OpenAI | Container Apps | Search | Storage | মোট অনুমান |
|------|--------|----------------|--------|---------|------------|
| Minimal | $50-200 | $20-50 | $25-100 | $5-20 | $100-370 |
| Standard | $200-800 | $100-300 | $100-300 | $20-50 | $420-1450 |
| Premium | $500-2000 | $300-800 | $300-600 | $50-100 | $1150-3500 |

### খরচ মনিটরিং

```bash
# Set up budget alerts
az consumption budget create \
  --account-name <subscription-id> \
  --budget-name "retail-budget" \
  --amount 500 \
  --time-grain Monthly \
  --start-date 2024-01-01 \
  --end-date 2024-12-31
```

## 🔄 আপডেট এবং রক্ষণাবেক্ষণ

### টেমপ্লেট আপডেট
- ARM টেমপ্লেট ফাইল ভার্সন কন্ট্রোল করুন
- পরিবর্তনগুলি প্রথমে ডেভেলপমেন্ট পরিবেশে পরীক্ষা করুন
- আপডেটের জন্য ইনক্রিমেন্টাল ডিপ্লয়মেন্ট মোড ব্যবহার করুন

### রিসোর্স আপডেট
```bash
# Update with new parameters
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --mode Incremental
```

### ব্যাকআপ এবং পুনরুদ্ধার
- Cosmos DB স্বয়ংক্রিয় ব্যাকআপ সক্রিয়
- Key Vault সফট ডিলিট সক্রিয়
- কন্টেইনার অ্যাপ রিভিশন রোলব্যাকের জন্য সংরক্ষিত

## 📞 সহায়তা

- **টেমপ্লেট সমস্যা**: [GitHub Issues](https://github.com/microsoft/azd-for-beginners/issues)
- **Azure সহায়তা**: [Azure Support Portal](https://portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade)
- **কমিউনিটি**: [Azure AI Discord](https://discord.gg/microsoft-azure)

---

**⚡ আপনার মাল্টি-এজেন্ট সলিউশন ডিপ্লয় করতে প্রস্তুত?**

শুরু করুন: `./deploy.sh -g myResourceGroup`

---

**অস্বীকৃতি**:  
এই নথিটি AI অনুবাদ পরিষেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনুবাদ করা হয়েছে। আমরা যথাসাধ্য সঠিকতা নিশ্চিত করার চেষ্টা করি, তবে অনুগ্রহ করে মনে রাখবেন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসঙ্গতি থাকতে পারে। মূল ভাষায় থাকা নথিটিকে প্রামাণিক উৎস হিসেবে বিবেচনা করা উচিত। গুরুত্বপূর্ণ তথ্যের জন্য, পেশাদার মানব অনুবাদ সুপারিশ করা হয়। এই অনুবাদ ব্যবহারের ফলে কোনো ভুল বোঝাবুঝি বা ভুল ব্যাখ্যা হলে আমরা দায়বদ্ধ থাকব না।