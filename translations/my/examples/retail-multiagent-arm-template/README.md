<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "eb84941706983946ae03bfa0433c0bb6",
  "translation_date": "2025-09-18T14:23:18+00:00",
  "source_file": "examples/retail-multiagent-arm-template/README.md",
  "language_code": "my"
}
-->
# လက်လီ Multi-Agent ဖြေရှင်းချက် - ARM Template တင်သွင်းခြင်း

**အခန်း ၅: ထုတ်လုပ်မှု တင်သွင်းမှုအထုပ်**
- **📚 သင်ခန်းစာ မူလစာမျက်နှာ**: [AZD For Beginners](../../README.md)
- **📖 ဆက်စပ်အခန်း**: [အခန်း ၅: Multi-Agent AI ဖြေရှင်းချက်များ](../../README.md#-chapter-5-multi-agent-ai-solutions-advanced)
- **📝 အခန်းအကြောင်းအရာ လမ်းညွှန်**: [အပြည့်အစုံ အကောင်အထည်ဖော်မှု](../retail-scenario.md)
- **🎯 အမြန်တင်သွင်းမှု**: [တစ်ချက်နှိပ်တင်သွင်းမှု](../../../../examples/retail-multiagent-arm-template)

ဒီဖိုင်တွင် လက်လီ Multi-Agent ဖောက်သည်ပံ့ပိုးမှု ဖြေရှင်းချက်အတွက် Azure Resource Manager (ARM) template တစ်ခုပါဝင်ပြီး၊ architecture အားလုံးအတွက် infrastructure ကို code အဖြစ်ပံ့ပိုးပေးသည်။

## 🎯 တင်သွင်းမည့်အရာများ

### အဓိက အခြေခံအဆောက်အအုံ
- **Azure OpenAI Services** (မြင့်မားသောရရှိနိုင်မှုအတွက် မျိုးစုံဒေသ)
  - ပထမဒေသ: GPT-4o (ဖောက်သည်အေးဂျင့်အတွက်)
  - ဒုတိယဒေသ: GPT-4o-mini (ကုန်ပစ္စည်းစာရင်းအေးဂျင့်အတွက်)
  - တတိယဒေသ: စာသား embedding မော်ဒယ်
  - သုံးသပ်မှုဒေသ: GPT-4o grader မော်ဒယ်
- **Azure AI Search** (vector search စွမ်းရည်များနှင့်)
- **Azure Storage Account** (စာရွက်စာတမ်းများနှင့် upload များအတွက် blob containers)
- **Azure Container Apps Environment** (auto-scaling ဖြင့်)
- **Container Apps** (အေးဂျင့် router နှင့် frontend အတွက်)
- **Azure Cosmos DB** (စကားဝိုင်းမှတ်တမ်းသိမ်းဆည်းမှုအတွက်)
- **Azure Key Vault** (လျှို့ဝှက်ချက်များစီမံခန့်ခွဲမှုအတွက် - ရွေးချယ်နိုင်သည်)
- **Application Insights** နှင့် Log Analytics (စောင့်ကြည့်မှုအတွက် - ရွေးချယ်နိုင်သည်)
- **Document Intelligence** (စာရွက်စာတမ်းများကို စီမံခန့်ခွဲရန်)
- **Bing Search API** (အချိန်နှင့်တပြေးညီသတင်းအချက်အလက်များအတွက်)

### တင်သွင်းမှု Modes

| Mode | ဖော်ပြချက် | အသုံးပြုမှု | အရင်းအမြစ်များ |
|------|-------------|----------|-----------|
| **Minimal** | စရိတ်သက်သာသော အခြေခံတင်သွင်းမှု | ဖွံ့ဖြိုးမှု၊ စမ်းသပ်မှု | အခြေခံ SKUs၊ တစ်ဒေသတည်း၊ စွမ်းရည်လျှော့ချထားသည် |
| **Standard** | ထုတ်လုပ်မှုအတွက် သင့်လျော်သောတင်သွင်းမှု | ထုတ်လုပ်မှု၊ အလတ်စားအရွယ်အစား | စံ SKUs၊ မျိုးစုံဒေသ၊ စံစွမ်းရည် |
| **Premium** | မြင့်မားသောစွမ်းဆောင်ရည်၊ စီးပွားရေးအဆင့်တင်သွင်းမှု | စီးပွားရေး၊ မြင့်မားသောအရွယ်အစား | Premium SKUs၊ မျိုးစုံဒေသ၊ မြင့်မားသောစွမ်းရည် |

## 📋 ကြိုတင်လိုအပ်ချက်များ

1. **Azure CLI** ကို install လုပ်ပြီး configure လုပ်ထားရမည်
2. **Active Azure subscription** (quota လုံလောက်မှုနှင့်)
3. **သင့်လျော်သောခွင့်ပြုချက်များ** (target subscription တွင် အရင်းအမြစ်များဖန်တီးရန်)
4. **Resource quotas**:
   - Azure OpenAI (ဒေသရရှိနိုင်မှုကိုစစ်ဆေးပါ)
   - Container Apps (ဒေသအလိုက်ကွဲပြားသည်)
   - AI Search (standard tier သို့မဟုတ် အထက်ကိုအကြံပြုသည်)

## 🚀 အမြန်တင်သွင်းမှု

### ရွေးချယ်မှု ၁: Azure CLI အသုံးပြုခြင်း

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

### ရွေးချယ်မှု ၂: Azure Portal အသုံးပြုခြင်း

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2Fazd-for-beginners%2Fmain%2Fexamples%2Fretail-multiagent-arm-template%2Fazuredeploy.json)

### ရွေးချယ်မှု ၃: Azure CLI ကိုတိုက်ရိုက်အသုံးပြုခြင်း

```bash
# Create resource group
az group create --name myResourceGroup --location eastus2

# Deploy template
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json
```

## ⚙️ Configuration ရွေးချယ်မှုများ

### Template Parameters

| Parameter | အမျိုးအစား | ပုံမှန် | ဖော်ပြချက် |
|-----------|------|---------|-------------|
| `projectName` | string | "retail" | အရင်းအမြစ်အမည်များအတွက် နာမည်အစ |
| `location` | string | Resource group location | ပထမတင်သွင်းမှုဒေသ |
| `secondaryLocation` | string | "westus2" | မျိုးစုံဒေသတင်သွင်းမှုအတွက် ဒုတိယဒေသ |
| `tertiaryLocation` | string | "francecentral" | Embeddings မော်ဒယ်အတွက် ဒေသ |
| `environmentName` | string | "dev" | ပတ်ဝန်းကျင်အမည် (dev/staging/prod) |
| `deploymentMode` | string | "standard" | တင်သွင်းမှု configuration (minimal/standard/premium) |
| `enableMultiRegion` | bool | true | မျိုးစုံဒေသတင်သွင်းမှုကိုဖွင့်ပါ |
| `enableMonitoring` | bool | true | Application Insights နှင့် logging ကိုဖွင့်ပါ |
| `enableSecurity` | bool | true | Key Vault နှင့် မြှင့်တင်လုံခြုံမှုကိုဖွင့်ပါ |

### Parameters ကိုစိတ်ကြိုက်ပြင်ဆင်ခြင်း

`azuredeploy.parameters.json` ကို ပြင်ဆင်ပါ:

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

## 🏗️ Architecture အကျဉ်းချုပ်

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

## 📖 တင်သွင်းမှု Script အသုံးပြုမှု

`deploy.sh` script သည် အပြန်အလှန်တင်သွင်းမှုအတွေ့အကြုံကိုပေးသည်:

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

### Script အင်္ဂါရပ်များ

- ✅ **ကြိုတင်လိုအပ်ချက်များစစ်ဆေးမှု** (Azure CLI, login status, template files)
- ✅ **Resource group စီမံခန့်ခွဲမှု** (မရှိပါက ဖန်တီးသည်)
- ✅ **Template စစ်ဆေးမှု** (တင်သွင်းမှုမတိုင်မီ)
- ✅ **တိုးတက်မှုစောင့်ကြည့်မှု** (အရောင်အသုံးပြုထားသော output)
- ✅ **တင်သွင်းမှုအထွက်များ** ပြသမှု
- ✅ **တင်သွင်းပြီးနောက် လမ်းညွှန်မှု**

## 📊 တင်သွင်းမှု စောင့်ကြည့်မှု

### တင်သွင်းမှုအခြေအနေ စစ်ဆေးခြင်း

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

### တင်သွင်းမှုအထွက်များ

တင်သွင်းမှုအောင်မြင်ပြီးနောက် အောက်ပါအထွက်များရရှိနိုင်သည်:

- **Frontend URL**: Web interface အတွက် public endpoint
- **Router URL**: အေးဂျင့် router အတွက် API endpoint
- **OpenAI Endpoints**: ပထမနှင့် ဒုတိယ OpenAI service endpoints
- **Search Service**: Azure AI Search service endpoint
- **Storage Account**: စာရွက်စာတမ်းများအတွက် storage account အမည်
- **Key Vault**: Key Vault အမည် (ဖွင့်ထားပါက)
- **Application Insights**: စောင့်ကြည့်မှု service အမည် (ဖွင့်ထားပါက)

## 🔧 တင်သွင်းပြီးနောက် ပြင်ဆင်မှု

### 1. Search Index ကို Configure လုပ်ပါ

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

### 2. စတင်ဒေတာများ Upload လုပ်ပါ

```bash
# Upload documents to storage
az storage blob upload-batch \
  --destination documents \
  --source ../data/initial-docs \
  --account-name <storage-account-name>
```

### 3. အေးဂျင့် Endpoints စမ်းသပ်ပါ

```bash
# Test router endpoint
curl -X POST "<router-url>/chat" \
  -H "Content-Type: application/json" \
  -d '{
    "message": "Hello, I need help with my order",
    "agent": "customer"
  }'
```

### 4. Container Apps ကို Configure လုပ်ပါ

ARM template သည် placeholder container images များကိုတင်သွင်းသည်။ အေးဂျင့် code အမှန်တစ်ရပ်ကိုတင်သွင်းရန်:

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

## 🛠️ ပြဿနာရှင်းလင်းမှု

### ရိုးရိုးတွေ့ရသော ပြဿနာများ

#### 1. Azure OpenAI Quota ကျော်လွန်မှု

```bash
# Check current quota usage
az cognitiveservices usage list --location eastus2

# Request quota increase
az support tickets create \
  --ticket-name "OpenAI-Quota-Increase" \
  --severity "minimal" \
  --description "Request quota increase for Azure OpenAI in region X"
```

#### 2. Container Apps တင်သွင်းမှု မအောင်မြင်မှု

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

#### 3. Search Service စတင်မူ

```bash
# Verify search service status
az search service show \
  --name <search-service-name> \
  --resource-group myResourceGroup

# Test search service connectivity
curl -X GET "https://<search-service-name>.search.windows.net/indexes?api-version=2023-11-01" \
  -H "api-key: <search-admin-key>"
```

### တင်သွင်းမှု အတည်ပြုခြင်း

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

## 🔐 လုံခြုံရေးအတွေးအခေါ်များ

### Key စီမံခန့်ခွဲမှု
- လျှို့ဝှက်ချက်အားလုံးကို Azure Key Vault တွင်သိမ်းဆည်းထားသည် (ဖွင့်ထားပါက)
- Container apps များသည် managed identity ကိုအသုံးပြုသည်
- Storage accounts တွင် secure defaults (HTTPS only, public blob access မရှိ) ပါဝင်သည်

### Network လုံခြုံမှု
- Container apps များသည် internal networking ကိုအသုံးပြုသည် (ဖြစ်နိုင်လျှင်)
- Search service ကို private endpoints ဖြင့် configure လုပ်ထားသည်
- Cosmos DB ကို လိုအပ်သောခွင့်ပြုချက်အနည်းဆုံးဖြင့် configure လုပ်ထားသည်

### RBAC Configuration
```bash
# Assign necessary roles for managed identity
az role assignment create \
  --assignee <container-app-managed-identity> \
  --role "Cognitive Services OpenAI User" \
  --scope <openai-resource-id>
```

## 💰 စရိတ်သက်သာမှု

### စရိတ်ခန့်မှန်းခြေ (လစဉ်, USD)

| Mode | OpenAI | Container Apps | Search | Storage | စုစုပေါင်းခန့်မှန်း |
|------|--------|----------------|--------|---------|------------|
| Minimal | $50-200 | $20-50 | $25-100 | $5-20 | $100-370 |
| Standard | $200-800 | $100-300 | $100-300 | $20-50 | $420-1450 |
| Premium | $500-2000 | $300-800 | $300-600 | $50-100 | $1150-3500 |

### စရိတ်စောင့်ကြည့်မှု

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

## 🔄 အပ်ဒိတ်နှင့် ပြုပြင်ထိန်းသိမ်းမှု

### Template အပ်ဒိတ်များ
- ARM template ဖိုင်များကို version control လုပ်ပါ
- ပြောင်းလဲမှုများကို ဖွံ့ဖြိုးမှုပတ်ဝန်းကျင်တွင်စမ်းသပ်ပါ
- အပ်ဒိတ်များအတွက် incremental deployment mode ကိုအသုံးပြုပါ

### အရင်းအမြစ် အပ်ဒိတ်များ
```bash
# Update with new parameters
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --mode Incremental
```

### Backup နှင့် Recovery
- Cosmos DB အလိုအလျောက် backup ဖွင့်ထားသည်
- Key Vault soft delete ဖွင့်ထားသည်
- Container app revisions များကို rollback အတွက် သိမ်းဆည်းထားသည်

## 📞 ပံ့ပိုးမှု

- **Template ပြဿနာများ**: [GitHub Issues](https://github.com/microsoft/azd-for-beginners/issues)
- **Azure ပံ့ပိုးမှု**: [Azure Support Portal](https://portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade)
- **Community**: [Azure AI Discord](https://discord.gg/microsoft-azure)

---

**⚡ သင့် Multi-Agent ဖြေရှင်းချက်ကို တင်သွင်းရန် အသင့်ဖြစ်ပြီလား?**

`./deploy.sh -g myResourceGroup` ဖြင့် စတင်ပါ

---

**အကြောင်းကြားချက်**:  
ဤစာရွက်စာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ကို အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှုအတွက် ကြိုးစားနေသော်လည်း၊ အလိုအလျောက် ဘာသာပြန်ခြင်းတွင် အမှားများ သို့မဟုတ် မတိကျမှုများ ပါရှိနိုင်သည်ကို သတိပြုပါ။ မူရင်းဘာသာစကားဖြင့် ရေးသားထားသော စာရွက်စာတမ်းကို အာဏာတရ အရင်းအမြစ်အဖြစ် ရှုလေ့လာသင့်ပါသည်။ အရေးကြီးသော အချက်အလက်များအတွက် လူ့ဘာသာပြန်ပညာရှင်များမှ ပရော်ဖက်ရှင်နယ် ဘာသာပြန်ခြင်းကို အကြံပြုပါသည်။ ဤဘာသာပြန်ကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော အလွဲအမှားများ သို့မဟုတ် အနားလည်မှုမှားများအတွက် ကျွန်ုပ်တို့သည် တာဝန်မယူပါ။