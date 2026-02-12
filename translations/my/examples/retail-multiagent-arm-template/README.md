# လက်လီ Multi-Agent Solution - အခြေခံအဆောက်အအုံ Template

**အခန်း ၅: ထုတ်လုပ် Deployment Package**
- **📚 သင်ခန်းစာအိမ်**: [AZD For Beginners](../../README.md)
- **📖 ဆက်စပ်အခန်း**: [အခန်း ၅: Multi-Agent AI Solutions](../../README.md#-chapter-5-multi-agent-ai-solutions-advanced)
- **📝 အခန်းအကြောင်းအရာ**: [အပြည့်အစုံ Architecture](../retail-scenario.md)
- **🎯 အမြန် Deploy**: [One-Click Deployment](../../../../examples/retail-multiagent-arm-template)

> **⚠️ INFRASTRUCTURE TEMPLATE ONLY**  
> ဒီ ARM template က **Azure resources** ကို multi-agent system အတွက် deploy လုပ်ပေးပါတယ်။  
>  
> **Deploy လုပ်ပြီးရလာမယ့်အရာများ (15-25 မိနစ်):**
> - ✅ Azure OpenAI (GPT-4o, GPT-4o-mini, embeddings across 3 regions)
> - ✅ AI Search service (အလွတ်၊ index ဖန်တီးဖို့အဆင်သင့်)
> - ✅ Container Apps (placeholder images, သင့် code အတွက်အဆင်သင့်)
> - ✅ Storage, Cosmos DB, Key Vault, Application Insights
>  
> **မပါဝင်သေးတဲ့အရာများ (ဖွံ့ဖြိုးတိုးတက်မှုလိုအပ်):**
> - ❌ Agent implementation code (Customer Agent, Inventory Agent)
> - ❌ Routing logic နှင့် API endpoints
> - ❌ Frontend chat UI
> - ❌ Search index schemas နှင့် data pipelines
> - ❌ **ဖွံ့ဖြိုးတိုးတက်မှုအချိန်ခန့်မှန်း: 80-120 နာရီ**
>  
> **ဒီ template ကိုသုံးသင့်တဲ့အခါ:**
> - ✅ Multi-agent project အတွက် Azure infrastructure ကို provision လုပ်ချင်တယ်
> - ✅ Agent implementation ကိုသီးသန့်ဖွံ့ဖြိုးချင်တယ်
> - ✅ Production-ready infrastructure baseline လိုအပ်တယ်
>  
> **မသုံးသင့်တဲ့အခါ:**
> - ❌ Multi-agent demo အလုပ်လုပ်နေတဲ့အခြေအနေကို ချက်ချင်းမျှော်လင့်တယ်
> - ❌ အပြည့်အစုံ application code နမူနာကိုရှာနေတယ်

## အကျဉ်းချုပ်

ဒီ directory မှာ multi-agent customer support system အတွက် **အခြေခံအဆောက်အအုံ** ကို deploy လုပ်ဖို့ comprehensive Azure Resource Manager (ARM) template ပါဝင်ပါတယ်။ Template က Azure services အားလုံးကို configure လုပ်ပြီး interconnected ဖြစ်အောင် provision လုပ်ပေးပါတယ်၊ သင့် application development အတွက်အဆင်သင့်ဖြစ်ပါတယ်။

**Deploy လုပ်ပြီးရလာမယ့်အရာ:** Production-ready Azure infrastructure  
**System ကိုပြီးစီးဖို့လိုအပ်တာ:** Agent code, frontend UI, နှင့် data configuration (ကြည့်ပါ [Architecture Guide](../retail-scenario.md))

## 🎯 Deploy လုပ်ပြီးရလာမယ့်အရာများ

### Core Infrastructure (Deploy လုပ်ပြီးနောက်အခြေအနေ)

✅ **Azure OpenAI Services** (API calls အတွက်အဆင်သင့်)
  - Primary region: GPT-4o deployment (20K TPM capacity)
  - Secondary region: GPT-4o-mini deployment (10K TPM capacity)
  - Tertiary region: Text embeddings model (30K TPM capacity)
  - Evaluation region: GPT-4o grader model (15K TPM capacity)
  - **အခြေအနေ:** အပြည့်အစုံအလုပ်လုပ်နေ - API calls ချက်ချင်းလုပ်နိုင်

✅ **Azure AI Search** (အလွတ် - configure လုပ်ဖို့အဆင်သင့်)
  - Vector search capabilities enabled
  - Standard tier with 1 partition, 1 replica
  - **အခြေအနေ:** Service အလုပ်လုပ်နေ၊ index ဖန်တီးဖို့လိုအပ်
  - **လိုအပ်တဲ့အရေးယူမှု:** သင့် schema နဲ့ search index ဖန်တီးပါ

✅ **Azure Storage Account** (အလွတ် - upload လုပ်ဖို့အဆင်သင့်)
  - Blob containers: `documents`, `uploads`
  - Secure configuration (HTTPS-only, public access မရှိ)
  - **အခြေအနေ:** ဖိုင်တွေကိုလက်ခံဖို့အဆင်သင့်
  - **လိုအပ်တဲ့အရေးယူမှု:** သင့် product data နှင့် documents ကို upload လုပ်ပါ

⚠️ **Container Apps Environment** (Placeholder images deploy လုပ်ထား)
  - Agent router app (nginx default image)
  - Frontend app (nginx default image)
  - Auto-scaling configured (0-10 instances)
  - **အခြေအနေ:** Placeholder containers အလုပ်လုပ်နေ
  - **လိုအပ်တဲ့အရေးယူမှု:** သင့် agent applications ကို build နှင့် deploy လုပ်ပါ

✅ **Azure Cosmos DB** (အလွတ် - data အတွက်အဆင်သင့်)
  - Database နှင့် container pre-configured
  - Low-latency operations အတွက် optimize လုပ်ထား
  - TTL enabled for automatic cleanup
  - **အခြေအနေ:** Chat history ကိုသိမ်းဆည်းဖို့အဆင်သင့်

✅ **Azure Key Vault** (Optional - secrets အတွက်အဆင်သင့်)
  - Soft delete enabled
  - RBAC configured for managed identities
  - **အခြေအနေ:** API keys နှင့် connection strings ကိုသိမ်းဆည်းဖို့အဆင်သင့်

✅ **Application Insights** (Optional - monitoring အလုပ်လုပ်နေ)
  - Log Analytics workspace နဲ့ချိတ်ဆက်ထား
  - Custom metrics နှင့် alerts configure လုပ်ထား
  - **အခြေအနေ:** သင့် apps မှ telemetry ကိုလက်ခံဖို့အဆင်သင့်

✅ **Document Intelligence** (API calls အတွက်အဆင်သင့်)
  - S0 tier for production workloads
  - **အခြေအနေ:** Upload လုပ်ထားတဲ့ documents ကို process လုပ်ဖို့အဆင်သင့်

✅ **Bing Search API** (API calls အတွက်အဆင်သင့်)
  - S1 tier for real-time searches
  - **အခြေအနေ:** Web search queries အတွက်အဆင်သင့်

### Deployment Modes

| Mode | OpenAI Capacity | Container Instances | Search Tier | Storage Redundancy | Best For |
|------|-----------------|---------------------|-------------|-------------------|----------|
| **Minimal** | 10K-20K TPM | 0-2 replicas | Basic | LRS (Local) | Dev/test, learning, proof-of-concept |
| **Standard** | 30K-60K TPM | 2-5 replicas | Standard | ZRS (Zone) | Production, moderate traffic (<10K users) |
| **Premium** | 80K-150K TPM | 5-10 replicas, zone-redundant | Premium | GRS (Geo) | Enterprise, high traffic (>10K users), 99.99% SLA |

**ကုန်ကျစရိတ်သက်ရောက်မှု:**
- **Minimal → Standard:** ~4x cost increase ($100-370/mo → $420-1,450/mo)
- **Standard → Premium:** ~3x cost increase ($420-1,450/mo → $1,150-3,500/mo)
- **ရွေးချယ်ရန်:** မျှော်လင့်ထားတဲ့ load, SLA လိုအပ်ချက်များ, budget အကန့်အသတ်များအပေါ်မူတည်

**Capacity Planning:**
- **TPM (Tokens Per Minute):** Model deployments အားလုံးအတွက်စုစုပေါင်း
- **Container Instances:** Auto-scaling range (min-max replicas)
- **Search Tier:** Query performance နှင့် index size အကန့်အသတ်များကိုသက်ရောက်

## 📋 လိုအပ်ချက်များ

### လိုအပ်တဲ့ Tools
1. **Azure CLI** (version 2.50.0 or higher)
   ```bash
   az --version  # ဗားရှင်းကိုစစ်ဆေးပါ
   az login      # အတည်ပြုပါ
   ```

2. **Active Azure subscription** with Owner or Contributor access
   ```bash
   az account show  # စာရင်းသွင်းမှုကိုအတည်ပြုပါ
   ```

### လိုအပ်တဲ့ Azure Quotas

Deploy လုပ်ခင် target regions မှာ quota လုံလောက်မှုကိုစစ်ဆေးပါ:

```bash
# သင့်ဒေသတွင် Azure OpenAI ရရှိနိုင်မှုကို စစ်ဆေးပါ
az cognitiveservices account list-skus \
  --kind OpenAI \
  --location eastus2

# OpenAI quota ကို အတည်ပြုပါ (ဥပမာ gpt-4o အတွက်)
az cognitiveservices usage list \
  --location eastus2 \
  --query "[?name.value=='OpenAI.Standard.gpt-4o']"

# Container Apps quota ကို စစ်ဆေးပါ
az provider show \
  --namespace Microsoft.App \
  --query "resourceTypes[?resourceType=='managedEnvironments'].locations"
```

**အနည်းဆုံးလိုအပ်တဲ့ Quotas:**
- **Azure OpenAI:** Regions အတောအတွင်း model deployments 3-4 ခု
  - GPT-4o: 20K TPM (Tokens Per Minute)
  - GPT-4o-mini: 10K TPM
  - text-embedding-ada-002: 30K TPM
  - **မှတ်ချက်:** GPT-4o က region တချို့မှာ waitlist ရှိနိုင်ပါတယ် - [model availability](https://learn.microsoft.com/azure/ai-services/openai/concepts/models) ကိုစစ်ဆေးပါ
- **Container Apps:** Managed environment + container instances 2-10 ခု
- **AI Search:** Standard tier (Basic က vector search အတွက်မလုံလောက်)
- **Cosmos DB:** Standard provisioned throughput

**Quota မလုံလောက်ပါက:**
1. Azure Portal → Quotas → Request increase ကိုသွားပါ
2. ဒါမှမဟုတ် Azure CLI ကိုသုံးပါ:
   ```bash
   az support tickets create \
     --ticket-name "OpenAI-Quota-Increase" \
     --severity "minimal" \
     --description "Request quota increase for Azure OpenAI GPT-4o in eastus2"
   ```
3. Availability ရှိတဲ့ alternative regions ကိုစဉ်းစားပါ

## 🚀 အမြန် Deployment

### Option 1: Azure CLI ကိုသုံးခြင်း

```bash
# အခြေခံဖိုင်များကို ကူးယူပါ သို့မဟုတ် ဒေါင်းလုဒ်လုပ်ပါ
git clone <repository-url>
cd examples/retail-multiagent-arm-template

# တင်သွင်းမှု script ကို အကောင်အထည်ဖော်နိုင်ရန် ပြင်ဆင်ပါ
chmod +x deploy.sh

# ပုံမှန်အခြေအနေများဖြင့် တင်သွင်းပါ
./deploy.sh -g myResourceGroup

# ထုတ်လုပ်မှုအတွက် အထူးအင်္ဂါရပ်များနှင့်တင်သွင်းပါ
./deploy.sh -g myProdRG -e prod -m premium -l eastus2
```

### Option 2: Azure Portal ကိုသုံးခြင်း

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2Fazd-for-beginners%2Fmain%2Fexamples%2Fretail-multiagent-arm-template%2Fazuredeploy.json)

### Option 3: Azure CLI ကိုတိုက်ရိုက်သုံးခြင်း

```bash
# အရင်းအမြစ်အုပ်စုကို ဖန်တီးပါ
az group create --name myResourceGroup --location eastus2

# အချုပ်အခြာပုံစံကို တင်သွင်းပါ
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json
```

## ⏱️ Deployment Timeline

### မျှော်လင့်ရမယ့်အရာများ

| အဆင့် | ကြာမြင့်ချိန် | ဖြစ်ပျက်မည့်အရာ |
|-------|----------|--------------||
| **Template Validation** | 30-60 စက္ကန့် | Azure က ARM template syntax နှင့် parameters ကို validate လုပ်ပါမည် |
| **Resource Group Setup** | 10-20 စက္ကန့် | Resource group ကိုဖန်တီးပါမည် (လိုအပ်ပါက) |
| **OpenAI Provisioning** | 5-8 မိနစ် | OpenAI accounts 3-4 ခုကိုဖန်တီးပြီး models ကို deploy လုပ်ပါမည် |
| **Container Apps** | 3-5 မိနစ် | Environment ကိုဖန်တီးပြီး placeholder containers ကို deploy လုပ်ပါမည် |
| **Search & Storage** | 2-4 မိနစ် | AI Search service နှင့် storage accounts ကို provision လုပ်ပါမည် |
| **Cosmos DB** | 2-3 မိနစ် | Database ကိုဖန်တီးပြီး containers ကို configure လုပ်ပါမည် |
| **Monitoring Setup** | 2-3 မိနစ် | Application Insights နှင့် Log Analytics ကို setup လုပ်ပါမည် |
| **RBAC Configuration** | 1-2 မိနစ် | Managed identities နှင့် permissions ကို configure လုပ်ပါမည် |
| **စုစုပေါင်း Deployment** | **15-25 မိနစ်** | အဆောက်အအုံအားလုံးအဆင်သင့်ဖြစ်ပါမည် |

**Deploy လုပ်ပြီးနောက်:**
- ✅ **Infrastructure အဆင်သင့်:** Azure services အားလုံး provision လုပ်ပြီးအလုပ်လုပ်နေ
- ⏱️ **Application Development:** 80-120 နာရီ (သင့်တာဝန်)
- ⏱️ **Index Configuration:** 15-30 မိနစ် (သင့် schema လိုအပ်)
- ⏱️ **Data Upload:** Dataset size အပေါ်မူတည်
- ⏱️ **Testing & Validation:** 2-4 နာရီ

---

## ✅ Deployment အောင်မြင်မှုကိုစစ်ဆေးပါ

### အဆင့် ၁: Resource Provisioning ကိုစစ်ဆေးပါ (2 မိနစ်)

```bash
# အရင်းအမြစ်အားလုံးအောင်မြင်စွာတင်သွင်းပြီးကြောင်းအတည်ပြုပါ
az resource list \
  --resource-group myResourceGroup \
  --query "[?provisioningState!='Succeeded'].{Name:name, Status:provisioningState, Type:type}" \
  --output table
```

**မျှော်လင့်ရမည့်အရာ:** အလွတ် table (အားလုံး "Succeeded" status ပြပါမည်)

### အဆင့် ၂: Azure OpenAI Deployments ကိုစစ်ဆေးပါ (3 မိနစ်)

```bash
# OpenAI အကောင့်အားလုံးကို စာရင်းပြုစုပါ။
az cognitiveservices account list \
  --resource-group myResourceGroup \
  --query "[?kind=='OpenAI'].{Name:name, Location:location, Status:properties.provisioningState}" \
  --output table

# အဓိကဒေသအတွက် မော်ဒယ်များကို စစ်ဆေးပါ။
OPENAI_NAME=$(az cognitiveservices account list \
  --resource-group myResourceGroup \
  --query "[?kind=='OpenAI'] | [0].name" -o tsv)

az cognitiveservices account deployment list \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --output table
```

**မျှော်လင့်ရမည့်အရာ:** 
- OpenAI accounts 3-4 ခု (primary, secondary, tertiary, evaluation regions)
- Model deployments 1-2 ခု (gpt-4o, gpt-4o-mini, text-embedding-ada-002)

### အဆင့် ၃: Infrastructure Endpoints ကိုစမ်းသပ်ပါ (5 မိနစ်)

```bash
# ကွန်တိန်နာအက်ပ် URL များကိုရယူပါ။
az containerapp list \
  --resource-group myResourceGroup \
  --query "[].{Name:name, URL:properties.configuration.ingress.fqdn, Status:properties.runningStatus}" \
  --output table

# router endpoint ကိုစမ်းသပ်ပါ (placeholder image ကတုံ့ပြန်မည်)
ROUTER_URL=$(az containerapp show \
  --name retail-router \
  --resource-group myResourceGroup \
  --query "properties.configuration.ingress.fqdn" -o tsv)

echo "Testing: https://$ROUTER_URL"
curl -I https://$ROUTER_URL || echo "Container running (placeholder image - expected)"
```

**မျှော်လင့်ရမည့်အရာ:** 
- Container Apps "Running" status ပြပါမည်
- Placeholder nginx HTTP 200 သို့မဟုတ် 404 ဖြင့်တုံ့ပြန်ပါမည် (application code မရှိသေး)

### အဆင့် ၄: Azure OpenAI API Access ကိုစစ်ဆေးပါ (3 မိနစ်)

```bash
# OpenAI endpoint နှင့် key ကိုရယူပါ
OPENAI_ENDPOINT=$(az cognitiveservices account show \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --query "properties.endpoint" -o tsv)

OPENAI_KEY=$(az cognitiveservices account keys list \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --query "key1" -o tsv)

# GPT-4o deployment ကိုစမ်းသပ်ပါ
curl "${OPENAI_ENDPOINT}openai/deployments/gpt-4o/chat/completions?api-version=2024-08-01-preview" \
  -H "Content-Type: application/json" \
  -H "api-key: $OPENAI_KEY" \
  -d '{
    "messages": [{"role": "user", "content": "Say hello"}],
    "max_tokens": 10
  }'
```

**မျှော်လင့်ရမည့်အရာ:** JSON response ဖြင့် chat completion (OpenAI အလုပ်လုပ်နေမှုကိုအတည်ပြု)

### အလုပ်လုပ်နေ versus မလုပ်နိုင်သေးတဲ့အရာများ

**✅ Deploy လုပ်ပြီးနောက်အလုပ်လုပ်နေသောအရာများ:**
- Azure OpenAI models deploy လုပ်ပြီး API calls လက်ခံနေ
- AI Search service အလုပ်လုပ်နေ (အလွတ်၊ index မရှိသေး)
- Container Apps အလုပ်လုပ်နေ (placeholder nginx images)
- Storage accounts upload လုပ်ဖို့အဆင်သင့်
- Cosmos DB data operations အတွက်အဆင်သင့်
- Application Insights infrastructure telemetry ကိုစုဆောင်းနေ
- Key Vault secrets သိမ်းဆည်းဖို့အဆင်သင့်

**❌ မလုပ်နိုင်သေးသောအရာများ (ဖွံ့ဖြိုးတိုးတက်မှုလိုအပ်):**
- Agent endpoints (application code မရှိသေး)
- Chat functionality (frontend + backend implementation လိုအပ်)
- Search queries (search index မဖန်တီးသေး)
- Document processing pipeline (data မ upload သေး)
- Custom telemetry (application instrumentation လိုအပ်)

**နောက်တစ်ဆင့်များ:** [Post-Deployment Configuration](../../../../examples/retail-multiagent-arm-template) ကိုကြည့်ပြီး application ကိုဖွံ့ဖြိုးနှင့် deploy လုပ်ပါ

---

## ⚙️ Configuration Options

### Template Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `projectName` | string | "retail" | Resource names အတွက် prefix |
| `location` | string | Resource group location | Primary deployment region |
| `secondaryLocation` | string | "westus2" | Multi-region deployment အတွက် secondary region |
| `tertiaryLocation` | string | "francecentral" | Embeddings model အတွက် region |
| `environmentName` | string | "dev" | Environment designation (dev/staging/prod) |
| `deploymentMode` | string | "standard" | Deployment configuration (minimal/standard/premium) |
| `enableMultiRegion` | bool | true | Multi-region deployment ကို enable လုပ်ပါ |
| `enableMonitoring` | bool | true | Application Insights နှင့် logging ကို enable လုပ်ပါ |
| `enableSecurity` | bool | true | Key Vault နှင့် enhanced security ကို enable လုပ်ပါ |

### Parameters ကို customize လုပ်ခြင်း

`azuredeploy.parameters.json` ကို edit လုပ်ပါ:

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

## 🏗️ Architecture Overview

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

## 📖 Deployment Script Usage

`deploy.sh` script က interactive deployment အတွေ့အကြုံကိုပေးပါသည်:

```bash
# အကူအညီပြရန်
./deploy.sh --help

# အခြေခံ deployment
./deploy.sh -g myResourceGroup

# အထူးပြင်ဆင်မှုများနှင့်အတူ အဆင့်မြင့် deployment
./deploy.sh \
  -g myProductionRG \
  -p companyname \
  -e prod \
  -m premium \
  -l eastus2

# multi-region မပါသော ဖွံ့ဖြိုးရေး deployment
./deploy.sh \
  -g myDevRG \
  -e dev \
  -m minimal \
  --no-multi-region \
  --no-security
```

### Script Features

- ✅ **Prerequisites validation** (Azure CLI, login status, template files)
- ✅ **Resource group management** (မရှိပါကဖန်တီးပါမည်)
- ✅ **Template validation** deploy လုပ်ခင်
- ✅ **Progress monitoring** colored output ဖြင့်
- ✅ **Deployment outputs** ပြသခြင်း
- ✅ **Post-deployment guidance**

## 📊 Deployment ကိုစောင့်ကြည့်ခြင်း

### Deployment Status ကိုစစ်ဆေးပါ

```bash
# တပ်ဆင်မှုများစာရင်း
az deployment group list --resource-group myResourceGroup --output table

# တပ်ဆင်မှုအသေးစိတ်ကိုရယူပါ
az deployment group show \
  --resource-group myResourceGroup \
  --name retail-deployment-YYYYMMDD-HHMMSS

# တပ်ဆင်မှုတိုးတက်မှုကိုကြည့်ရှုပါ
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --verbose
```

### Deployment Outputs

Deploy လုပ်ပြီးအောင်မြင်ပါက outputs အောက်ပါအတိုင်းရရှိပါမည်:

- **Frontend URL**: Web interface အတွက် public endpoint
- **Router URL**: Agent router အတွက် API endpoint
- **OpenAI Endpoints**: Primary နှင့် secondary OpenAI service endpoints
- **Search Service**: Azure AI Search service endpoint
- **Storage Account**: Documents အတွက် storage account name
- **Key Vault**: Key Vault name (enable လုပ်ထားပါက)
- **Application Insights**: Monitoring service name (enable လုပ်ထားပါက)

## 🔧 Post-Deployment: နောက်တစ်ဆင့်များ
> **📝 အရေးကြီးပါသည်:** အခြေခံအဆောက်အအုံများကို တင်သွင်းပြီးဖြစ်သော်လည်း၊ သင်သည် အက်ပလီကေးရှင်းကုဒ်ကို ဖွံ့ဖြိုးပြီး တင်သွင်းရန် လိုအပ်ပါသည်။

### အဆင့် ၁: အေးဂျင့်အက်ပလီကေးရှင်းများ ဖွံ့ဖြိုးရန် (သင့်တာဝန်)

ARM template သည် **အလွတ် Container Apps** များကို placeholder nginx images ဖြင့် ဖန်တီးပေးပါသည်။ သင်သည် အောက်ပါအရာများကို ပြုလုပ်ရမည်ဖြစ်သည်-

**လိုအပ်သော ဖွံ့ဖြိုးမှု:**
1. **အေးဂျင့် အကောင်အထည်ဖော်မှု** (၃၀-၄၀ နာရီ)
   - GPT-4o ပေါင်းစပ်မှုပါဝင်သော ဖောက်သည်ဝန်ဆောင်မှုအေးဂျင့်
   - GPT-4o-mini ပေါင်းစပ်မှုပါဝင်သော စတော့အေးဂျင့်
   - အေးဂျင့် လမ်းကြောင်းသတ်မှတ်မှု လိုဂစ်

2. **Frontend ဖွံ့ဖြိုးမှု** (၂၀-၃၀ နာရီ)
   - Chat interface UI (React/Vue/Angular)
   - ဖိုင်တင်သွင်းနိုင်စွမ်း
   - တုံ့ပြန်မှု ဖော်ပြခြင်းနှင့် ဖော်မတ်ပုံဖော်ခြင်း

3. **Backend ဝန်ဆောင်မှုများ** (၁၂-၁၆ နာရီ)
   - FastAPI သို့မဟုတ် Express router
   - Authentication middleware
   - Telemetry ပေါင်းစပ်မှု

**ကြည့်ပါ:** [Architecture Guide](../retail-scenario.md) အကောင်အထည်ဖော်မှု ပုံစံများနှင့် ကုဒ်ဥပမာများအတွက်

### အဆင့် ၂: AI ရှာဖွေမှု အညွှန်းကို ဖွဲ့စည်းရန် (၁၅-၃၀ မိနစ်)

သင့်ဒေတာမော်ဒယ်နှင့် ကိုက်ညီသော ရှာဖွေမှုအညွှန်းတစ်ခု ဖန်တီးပါ-

```bash
# ရှာဖွေမှုဝန်ဆောင်မှုအသေးစိတ်ကိုရယူပါ
SEARCH_NAME=$(az search service list \
  --resource-group myResourceGroup \
  --query "[0].name" -o tsv)

SEARCH_KEY=$(az search admin-key show \
  --service-name $SEARCH_NAME \
  --resource-group myResourceGroup \
  --query "primaryKey" -o tsv)

# သင့် schema (ဥပမာ) ဖြင့် index တစ်ခုဖန်တီးပါ
curl -X POST "https://${SEARCH_NAME}.search.windows.net/indexes?api-version=2023-11-01" \
  -H "Content-Type: application/json" \
  -H "api-key: ${SEARCH_KEY}" \
  -d '{
    "name": "products",
    "fields": [
      {"name": "id", "type": "Edm.String", "key": true},
      {"name": "title", "type": "Edm.String", "searchable": true},
      {"name": "content", "type": "Edm.String", "searchable": true},
      {"name": "category", "type": "Edm.String", "filterable": true},
      {"name": "content_vector", "type": "Collection(Edm.Single)", 
       "searchable": true, "dimensions": 1536, "vectorSearchProfile": "default"}
    ],
    "vectorSearch": {
      "algorithms": [{"name": "default", "kind": "hnsw"}],
      "profiles": [{"name": "default", "algorithm": "default"}]
    }
  }'
```

**အရင်းအမြစ်များ:**
- [AI ရှာဖွေမှု အညွှန်း Schema ဒီဇိုင်း](https://learn.microsoft.com/azure/search/search-what-is-an-index)
- [Vector ရှာဖွေမှု ဖွဲ့စည်းမှု](https://learn.microsoft.com/azure/search/vector-search-how-to-create-index)

### အဆင့် ၃: သင့်ဒေတာကို တင်သွင်းပါ (အချိန် မတူညီ)

ထုတ်ကုန်ဒေတာနှင့် စာရွက်စာတမ်းများ ရရှိပြီးနောက်-

```bash
# သိုလှောင်မှုအကောင့်အသေးစိတ်ကိုရယူပါ
STORAGE_NAME=$(az storage account list \
  --resource-group myResourceGroup \
  --query "[0].name" -o tsv)

STORAGE_KEY=$(az storage account keys list \
  --account-name $STORAGE_NAME \
  --resource-group myResourceGroup \
  --query "[0].value" -o tsv)

# သင့်စာရွက်စာတမ်းများကိုတင်ပါ
az storage blob upload-batch \
  --destination documents \
  --source /path/to/your/product/docs \
  --account-name $STORAGE_NAME \
  --account-key $STORAGE_KEY

# ဥပမာ - ဖိုင်တစ်ခုတင်ပါ
az storage blob upload \
  --container-name documents \
  --name "product-manual.pdf" \
  --file /path/to/product-manual.pdf \
  --account-name $STORAGE_NAME \
  --account-key $STORAGE_KEY
```

### အဆင့် ၄: သင့်အက်ပလီကေးရှင်းများကို တည်ဆောက်ပြီး တင်သွင်းပါ (၈-၁၂ နာရီ)

အေးဂျင့်ကုဒ်ကို ဖွံ့ဖြိုးပြီးနောက်-

```bash
# 1. Azure Container Registry ကို ဖန်တီးပါ (လိုအပ်ပါက)
az acr create \
  --name myregistry \
  --resource-group myResourceGroup \
  --sku Basic

# 2. Agent router image ကို build လုပ်ပြီး push လုပ်ပါ
docker build -t myregistry.azurecr.io/agent-router:v1 /path/to/your/router/code
az acr login --name myregistry
docker push myregistry.azurecr.io/agent-router:v1

# 3. Frontend image ကို build လုပ်ပြီး push လုပ်ပါ
docker build -t myregistry.azurecr.io/frontend:v1 /path/to/your/frontend/code
docker push myregistry.azurecr.io/frontend:v1

# 4. Container Apps ကို သင့်ရဲ့ images တွေနဲ့ update လုပ်ပါ
az containerapp update \
  --name retail-router \
  --resource-group myResourceGroup \
  --image myregistry.azurecr.io/agent-router:v1

az containerapp update \
  --name retail-frontend \
  --resource-group myResourceGroup \
  --image myregistry.azurecr.io/frontend:v1

# 5. Environment variables တွေကို configure လုပ်ပါ
az containerapp update \
  --name retail-router \
  --resource-group myResourceGroup \
  --set-env-vars \
    OPENAI_ENDPOINT=secretref:openai-endpoint \
    OPENAI_KEY=secretref:openai-key \
    SEARCH_ENDPOINT=secretref:search-endpoint \
    SEARCH_KEY=secretref:search-key
```

### အဆင့် ၅: သင့်အက်ပလီကေးရှင်းကို စမ်းသပ်ပါ (၂-၄ နာရီ)

```bash
# သင့်အက်ပလီကေးရှင်း URL ကိုရယူပါ
ROUTER_URL=$(az containerapp show \
  --name retail-router \
  --resource-group myResourceGroup \
  --query "properties.configuration.ingress.fqdn" -o tsv)

# အေးဂျင့်အဆုံးစွန်ကိုစမ်းသပ်ပါ (သင့်ကုဒ်ကိုတင်ထားပြီးနောက်)
curl -X POST "https://${ROUTER_URL}/chat" \
  -H "Content-Type: application/json" \
  -d '{
    "message": "Hello, I need help with my order",
    "agent": "customer"
  }'

# အက်ပလီကေးရှင်း လော့ဂ်များကိုစစ်ဆေးပါ
az containerapp logs show \
  --name retail-router \
  --resource-group myResourceGroup \
  --follow
```

### အကောင်အထည်ဖော်မှု အရင်းအမြစ်များ

**Architecture & Design:**
- 📖 [အပြည့်အစုံ Architecture Guide](../retail-scenario.md) - အကောင်အထည်ဖော်မှု ပုံစံများ
- 📖 [Multi-Agent Design Patterns](https://learn.microsoft.com/azure/architecture/ai-ml/guide/multi-agent-systems)

**ကုဒ်ဥပမာများ:**
- 🔗 [Azure OpenAI Chat Sample](https://github.com/Azure-Samples/azure-search-openai-demo) - RAG ပုံစံ
- 🔗 [Semantic Kernel](https://github.com/microsoft/semantic-kernel) - အေးဂျင့်ဖွဲ့စည်းမှု (C#)
- 🔗 [LangChain Azure](https://github.com/langchain-ai/langchain) - အေးဂျင့် စီမံခန့်ခွဲမှု (Python)
- 🔗 [AutoGen](https://github.com/microsoft/autogen) - Multi-agent ဆွေးနွေးမှုများ

**စုစုပေါင်း ကြိုးပမ်းမှု ခန့်မှန်းချက်:**
- အခြေခံအဆောက်အအုံ တင်သွင်းမှု: ၁၅-၂၅ မိနစ် (✅ ပြီးစီး)
- အက်ပလီကေးရှင်း ဖွံ့ဖြိုးမှု: ၈၀-၁၂၀ နာရီ (🔨 သင့်အလုပ်)
- စမ်းသပ်မှုနှင့် အကောင်းဆုံးဖြစ်အောင် ပြုလုပ်မှု: ၁၅-၂၅ နာရီ (🔨 သင့်အလုပ်)

## 🛠️ ပြဿနာဖြေရှင်းခြင်း

### ရှိနေသော ပြဿနာများ

#### ၁. Azure OpenAI Quota ကျော်လွန်မှု

```bash
# လက်ရှိကိုတာအသုံးပြုမှုကိုစစ်ဆေးပါ
az cognitiveservices usage list --location eastus2

# ကိုတာတိုးမြှင့်မှုတောင်းဆိုပါ
az support tickets create \
  --ticket-name "OpenAI-Quota-Increase" \
  --severity "minimal" \
  --description "Request quota increase for Azure OpenAI in region X"
```

#### ၂. Container Apps တင်သွင်းမှု မအောင်မြင်ခြင်း

```bash
# ကွန်တိန်နာအက်ပ်၏ လော့ဂ်များကို စစ်ဆေးပါ။
az containerapp logs show \
  --name retail-router \
  --resource-group myResourceGroup \
  --follow

# ကွန်တိန်နာအက်ပ်ကို ပြန်စတင်ပါ။
az containerapp revision restart \
  --name retail-router \
  --resource-group myResourceGroup
```

#### ၃. ရှာဖွေမှု ဝန်ဆောင်မှု စတင်ခြင်း

```bash
# ရှာဖွေမှုဝန်ဆောင်မှုအခြေအနေကိုအတည်ပြုပါ
az search service show \
  --name <search-service-name> \
  --resource-group myResourceGroup

# ရှာဖွေမှုဝန်ဆောင်မှုချိတ်ဆက်မှုကိုစမ်းသပ်ပါ
curl -X GET "https://<search-service-name>.search.windows.net/indexes?api-version=2023-11-01" \
  -H "api-key: <search-admin-key>"
```

### တင်သွင်းမှု အတည်ပြုခြင်း

```bash
# အရင်းအမြစ်အားလုံးဖန်တီးပြီးကြောင်းအတည်ပြုပါ
az resource list \
  --resource-group myResourceGroup \
  --output table

# အရင်းအမြစ်ကျန်းမာရေးကိုစစ်ဆေးပါ
az resource list \
  --resource-group myResourceGroup \
  --query "[?provisioningState!='Succeeded'].{Name:name, Status:provisioningState, Type:type}" \
  --output table
```

## 🔐 လုံခြုံရေးစဉ်းစားမှုများ

### Key Management
- အားလုံးသော လျှို့ဝှက်ချက်များကို Azure Key Vault တွင် သိမ်းဆည်းထားသည် (အသုံးပြုမှုဖြင့်)
- Container apps သည် authentication အတွက် managed identity ကို အသုံးပြုသည်
- Storage accounts တွင် လုံခြုံမှု အခြေခံများ (HTTPS သာ, public blob access မရှိ) ပါဝင်သည်

### Network Security
- Container apps သည် အတွင်းပိုင်း network ကို အများဆုံး အသုံးပြုသည်
- ရှာဖွေမှုဝန်ဆောင်မှုကို private endpoints option ဖြင့် ဖွဲ့စည်းထားသည်
- Cosmos DB ကို လိုအပ်သော ခွင့်ပြုချက်အနည်းဆုံးဖြင့် ဖွဲ့စည်းထားသည်

### RBAC Configuration
```bash
# စီမံခန့်ခွဲမှုအတိအကျအတွက် လိုအပ်သော အခန်းကဏ္ဍများကို ပေးအပ်ပါ။
az role assignment create \
  --assignee <container-app-managed-identity> \
  --role "Cognitive Services OpenAI User" \
  --scope <openai-resource-id>
```

## 💰 ကုန်ကျစရိတ် အကောင်းဆုံးဖြစ်အောင် ပြုလုပ်ခြင်း

### ကုန်ကျစရိတ် ခန့်မှန်းချက်များ (လစဉ်, USD)

| Mode | OpenAI | Container Apps | Search | Storage | Total Est. |
|------|--------|----------------|--------|---------|------------|
| Minimal | $50-200 | $20-50 | $25-100 | $5-20 | $100-370 |
| Standard | $200-800 | $100-300 | $100-300 | $20-50 | $420-1450 |
| Premium | $500-2000 | $300-800 | $300-600 | $50-100 | $1150-3500 |

### ကုန်ကျစရိတ် စောင့်ကြည့်မှု

```bash
# ဘတ်ဂျက်သတိပေးချက်များကို စီစဉ်ပါ
az consumption budget create \
  --account-name <subscription-id> \
  --budget-name "retail-budget" \
  --amount 500 \
  --time-grain Monthly \
  --start-date 2024-01-01 \
  --end-date 2024-12-31
```

## 🔄 အပ်ဒိတ်များနှင့် ပြုပြင်ထိန်းသိမ်းမှု

### Template အပ်ဒိတ်များ
- ARM template ဖိုင်များကို version control ပြုလုပ်ပါ
- ဖွံ့ဖြိုးမှု ပတ်ဝန်းကျင်တွင် အပြောင်းအလဲများကို စမ်းသပ်ပါ
- အပ်ဒိတ်များအတွက် incremental deployment mode ကို အသုံးပြုပါ

### အရင်းအမြစ် အပ်ဒိတ်များ
```bash
# parameters အသစ်များဖြင့် အပ်ဒိတ်လုပ်ပါ
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --mode Incremental
```

### Backup နှင့် Recovery
- Cosmos DB သည် အလိုအလျောက် backup ပြုလုပ်ထားသည်
- Key Vault သည် soft delete ကို ဖွင့်ထားသည်
- Container app revisions များကို rollback အတွက် သိမ်းဆည်းထားသည်

## 📞 အထောက်အပံ့

- **Template ပြဿနာများ**: [GitHub Issues](https://github.com/microsoft/azd-for-beginners/issues)
- **Azure အထောက်အပံ့**: [Azure Support Portal](https://portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade)
- **အသိုင်းအဝိုင်း**: [Azure AI Discord](https://discord.gg/microsoft-azure)

---

**⚡ သင့် multi-agent ဖြေရှင်းချက်ကို တင်သွင်းရန် အသင့်ဖြစ်ပြီလား?**

စတင်ရန်: `./deploy.sh -g myResourceGroup`

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**အကြောင်းကြားချက်**:  
ဤစာရွက်စာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ကို အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှုအတွက် ကြိုးစားနေသော်လည်း အလိုအလျောက် ဘာသာပြန်မှုများတွင် အမှားများ သို့မဟုတ် မမှန်ကန်မှုများ ပါဝင်နိုင်သည်ကို သတိပြုပါ။ မူရင်းဘာသာစကားဖြင့် ရေးသားထားသော စာရွက်စာတမ်းကို အာဏာတရားရှိသော အရင်းအမြစ်အဖြစ် သတ်မှတ်သင့်ပါသည်။ အရေးကြီးသော အချက်အလက်များအတွက် လူက ဘာသာပြန်မှုကို အကြံပြုပါသည်။ ဤဘာသာပြန်မှုကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော အလွဲအမှားများ သို့မဟုတ် အနားလွဲမှုများအတွက် ကျွန်ုပ်တို့သည် တာဝန်မယူပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->