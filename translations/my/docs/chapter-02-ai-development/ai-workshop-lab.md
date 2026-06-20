# AI Workshop Lab: သင့် AI ဖြေရှင်းချက်များကို AZD ဖြင့် တင်သွင်းနည်း

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: အခန်း ၂ - AI-First Development
- **⬅️ Previous**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Next**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 Next Chapter**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

## Workshop Overview

ဤ လက်တွေ့ လက်ခုပ်သည် developer များအား ပစ္စည်းရှိပြီးသား AI template ကိုယူ၍ Azure Developer CLI (AZD) အသုံးပြုကာ တင်သွင်းခြင်းလုပ်ငန်းစဉ်အား လမ်းပြပေးသည်။ Microsoft Foundry services များကို အသုံးပြု၍ production AI deployments အတွက် အရေးကြီးပုံစံများကို သင်ယူနိုင်ပါလိမ့်မည်။

> **Validation note (2026-03-25):** ဤ workshop ကို `azd` `1.23.12` နှင့်နှိုင်းယှဉ် စစ်ဆေးထားသည်။ သင့် local installation သည် အဟောင်းဖြစ်လျှင် AZD ကို အားလုံးစတင်မည်မဟုတ်မီ update လုပ်ပါ။

**Duration:** 2-3 hours  
**Level:** အလတ်အလတ်  
**Prerequisites:** Azure အခြေခံ သိမြင်မှု၊ AI/ML အကြောင်းအရာများကို သိထားမှု

## 🎓 Learning Objectives

ဤ workshop အပြီးတွင် သင်သည် အောက်ပါ အရာများကို ပြုလုပ်နိုင်မည် —
- ✅ ရှိပြီးသား AI application ကို AZD templates သို့ ပြောင်းလဲနိုင်မည်
- ✅ AZD ဖြင့် Microsoft Foundry services များကို ဖွင့်ချိန်ချိန်နိုင်မည်
- ✅ AI services များအတွက် လုံခြုံသော credential ဖွံ့ဖြိုးမှုကို အကောင်အထည်ဖော်နိုင်မည်
- ✅ စောင့်ကြည့်မှုပါသော production-ready AI applications များ တင်သွင်းနိုင်မည်
- ✅ AI deployment များနှင့် ပတ်သက်သော သာမန်ပြဿနာများကို စစ်ဆေးဖြေရှင်းနိုင်မည်

## Prerequisites

### Required Tools
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) ထည့်သွင်းထားရန်
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) ထည့်သွင်းထားရန်
- [Git](https://git-scm.com/) ထည့်သွင်းထားရန်
- ကုဒ်တည်းဖြတ်ကိရိယာ (VS Code ကို အကြံပြု)

### Azure Resources
- contributor access ရှိသည့် Azure subscription
- Microsoft Foundry Models services သို့ အသုံးပြုခွင့် (သို့မဟုတ် access တောင်းနိုင်စွမ်း)
- Resource group ဖန်တီးခွင့်များ

### Knowledge Prerequisites
- Azure services များအပေါ် အခြေခံနားလည်မှု
- command-line interfaces များကို အသုံးပြုသိရှိမှု
- AI/ML အကြောင်းအရာ အခြေခံအယူအဆများ (APIs, models, prompts)

## Lab Setup

### Step 1: Environment Preparation

1. **Verify tool installations:**
```bash
# AZD တပ်ဆင်ခြင်းကို စစ်ဆေးပါ
azd version

# Azure CLI ကို စစ်ဆေးပါ
az --version

# AZD လုပ်ငန်းစဉ်များအတွက် Azure သို့ အကောင့်ဝင်ပါ
azd auth login

# စစ်ဆေးမှုများအတွင်း az command များကို လည်ပတ်ရန် ရည်ရွယ်ပါကသာ Azure CLI သို့ အကောင့်ဝင်ပါ
az login
```

If you work across multiple tenants or your subscription is not detected automatically, retry with `azd auth login --tenant-id <tenant-id>`.

2. **Clone the workshop repository:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Module 1: Understanding AZD Structure for AI Applications

### Anatomy of an AI AZD Template

AI အသုံးပြုရန် အဆင်ပြေသည့် AZD template တွင် ပါဝင်သင့်သော အဓိက ဖိုင်များကို စူးစမ်းကြည့်ရှုပါ။

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

### **Lab Exercise 1.1: Explore the Configuration**

1. **Examine the azure.yaml file:**
```bash
cat azure.yaml
```

**What to look for:**
- AI component များအတွက် service သတ်မှတ်ချက်များ
- Environment variable များ၏ မျက်နှာပြင်(mapping)
- Host ဖန်တီးမှုများ

2. **Review the main.bicep infrastructure:**
```bash
cat infra/main.bicep
```

**Key AI patterns to identify:**
- Microsoft Foundry Models service provisioning
- Azure AI Search integration
- လုံခြုံသော key management
- Network security ကို သတ်မှတ်ထားခြင်း

### **Discussion Point:** AI အတွက် ဤပုံစံများ အရေးကြီးသည့် အကြောင်း

- **Service Dependencies**: AI applications များတွင် အများအားဖြင့် ဝန်ဆောင်မှုများစုံလင်စွာ စီမံရန် လိုအပ်သည်
- **Security**: API keys နှင့် endpoints များကို လုံခြုံစိတ်ချစေစေရန် စီမံရပါမည်
- **Scalability**: AI အလုပ်အကိုင်များတွင် သီးခြား scaling လိုအပ်ချက်များ ရှိသည်
- **Cost Management**: AI services များသည် များစွာအသုံးပြုပါက ဈေးကြီးနိုင်ပြီး မှန်ကန်စွာ ဆက်တင်ဆောင်ရွက်ရန် လိုအပ်သည်

## Module 2: Deploy Your First AI Application

### Step 2.1: Initialize the Environment

1. **Create a new AZD environment:**
```bash
azd env new myai-workshop
```

2. **Set required parameters:**
```bash
# သင်နှစ်သက်ရာ Azure ဒေသကို သတ်မှတ်ပါ
azd env set AZURE_LOCATION eastus

# ရွေးချယ်စရာ: တိကျသော OpenAI မော်ဒယ်ကို သတ်မှတ်ပါ
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### Step 2.2: Deploy the Infrastructure and Application

1. **Deploy with AZD:**
```bash
azd up
```

**What happens during `azd up`:**
- ✅ Microsoft Foundry Models service ကို provision လုပ်သည်
- ✅ Azure AI Search service ကို ဖန်တီးသည်
- ✅ Web application အတွက် App Service ကို တပ်ဆင်သည်
- ✅ Networking နှင့် security ကို ဖွဲ့စည်းသည်
- ✅ application code ကို တင်ပို့သည်
- ✅ မောနိုင်းတာနှင့် လော့ဂ်များကို စတင်တပ်ဆင်သည်

2. **Monitor the deployment progress** နှင့် ဖန်တီးနေသော resources များကို မှတ်သားပါ။

### Step 2.3: Verify Your Deployment

1. **Check the deployed resources:**
```bash
azd show
```

2. **Open the deployed application:**
```bash
azd show
```

Open the web endpoint shown in the `azd show` output.

3. **Test the AI functionality:**
   - Web application သို့ သွားကြည့်ပါ
   - ဥပမာမေးခွန်းများကို ကြိုးစားမေးပါ
   - AI အဖြေများ အလုပ်လုပ်နေကြောင်း အတည်ပြုပါ

### **Lab Exercise 2.1: Troubleshooting Practice**

**Scenario**: Deployment အောင်မြင်သော်လည်း AI သည် တုံ့ပြန်မှု မပေးဘဲ ရှိနေသည်။

**Common issues to check:**
1. **OpenAI API keys**: မှန်ကန်စွာ သတ်မှတ်ထားပြီးပါသလား စစ်ဆေးပါ
2. **Model availability**: သင်၏ region သည် အဆိုပါ model ကို ထောက်ပံ့ပါသလား စစ်ဆေးပါ
3. **Network connectivity**: ဝန်ဆောင်မှုများ ကြား ဆက်သွယ်နိုင်မှုရှိမရှိ စစ်ဆေးပါ
4. **RBAC permissions**: app သည် OpenAI ကို ဝင်ရောက်ခွင့် ရှိသည်လား စစ်ဆေးပါ

**Debugging commands:**
```bash
# ပတ်ဝန်းကျင် အပြောင်းအလဲများကို စစ်ဆေးပါ
azd env get-values

# တပ်ဆင်မှုမှတ်တမ်းများကို ကြည့်ပါ
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# OpenAI တပ်ဆင်မှုအခြေအနေကို စစ်ဆေးပါ
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Module 3: Customizing AI Applications for Your Needs

### Step 3.1: Modify the AI Configuration

1. **Update the OpenAI model:**
```bash
# တစ်ခြား မော်ဒယ်သို့ ပြောင်းပါ (သင့်ဒေသတွင် ရနိုင်ပါက)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# အသစ်ပြင်ဆင်ထားသော ဖွဲ့စည်းပုံဖြင့် ပြန်တပ်ဆင်ပါ
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

**Best Practice**: development နှင့် production အတွက် ကွာခြားခြင်းရှိသည့် configurations များကို သတ်မှတ်ပါ။

1. **Create a production environment:**
```bash
azd env new myai-production
```

2. **Set production-specific parameters:**
```bash
# ထုတ်လုပ်မှုတွင် သာမန်အားဖြင့် အဆင့်မြင့်သော SKU များကို အသုံးပြုသည်
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# နောက်ထပ် လုံခြုံရေး လုပ်ဆောင်ချက်များကို ဖွင့်ပါ
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Lab Exercise 3.1: Cost Optimization**

**Challenge**: ဆီမနေသော development အတွက် ကုန်ကျစရိတ် ထိန်းသိမ်းစွာ template ကို configure လုပ်ပါ။

**Tasks:**
1. ခွဲခြားထားနိုင်သည့် SKUs များကို free/basic tier သို့ ပြောင်းနိုင်သည်ကို ရှာဖွေပါ
2. အနိမ့်ဆုံးကုန်ကျစရိတ်အတွက် environment variables များကို သတ်မှတ်ပါ
3. Deploy လုပ်ပြီး production configuration နှင့် ကုန်ကျစရိတ်ကို နှိုင်းယှဉ်ပါ

**Solution hints:**
- Azure AI Services အတွက် ရနိုင်ပါက F0 (free) tier ကို အသုံးပြုပါ
- Development အတွက် Search Service တွင် Basic tier ကို အသုံးပြုပါ
- Functions အတွက် Consumption plan ကို စဉ်းစားပါ

## Module 4: Security and Production Best Practices

### Step 4.1: Secure Credential Management

**Current challenge**: အများအပြား AI apps များတွင် API keys များကို code ထဲတွင် hardcode လုပ်ထားသည် သို့မဟုတ် လုံခြုံမဟုတ်သော storage သုံးနေသည်။

**AZD Solution**: Managed Identity + Key Vault အပြန်အလှန်ပေါင်းစည်းမှု။

1. **Review the security configuration in your template:**
```bash
# Key Vault နှင့် Managed Identity ဆက်တင်များကို ရှာဖွေပါ
grep -r "keyVault\|managedIdentity" infra/
```

2. **Verify Managed Identity is working:**
```bash
# ဝဘ်အက်ပ်တွင် မှန်ကန်သော အမှတ်အသားအတည်ပြု ဖော်ပြချက် (identity configuration) သတ်မှတ်ထားပါသလား စစ်ဆေးပါ
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Step 4.2: Network Security

1. **Enable private endpoints** (မရှိသေးပါက):

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
# Application Insights ကို အလိုအလျောက် ဖွဲ့စည်းထားသင့်သည်
# ဆက်တင်များကို စစ်ဆေးပါ:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Set up AI-specific monitoring:**

AI လုပ်ဆောင်ချက်များအတွက် custom metrics များ ထည့်ပါ:
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

**Task**: သင့် deployment ကို security best practices အရ ပြန်လည်စစ်ဆေးပါ။

**Checklist:**
- [ ] Code သို့မဟုတ် configuration တွင် hardcoded secrets မရှိပါ
- [ ] Managed Identity ကို service-to-service authentication အတွက် အသုံးပြုထားပါ
- [ ] Key Vault သည် sensitive configuration များကို သိမ်းဆည်းထားပါ
- [ ] Network access ကို သင့်တော်စွာ ကန့်သတ်ထားပါ
- [ ] Monitoring နှင့် logging များ ဖွင့်ထားပါ

## Module 5: Converting Your Own AI Application

### Step 5.1: Assessment Worksheet

**သင့် app ကို ပြောင်းလဲရန်မတိုင်မီ**, အောက်ပါမေးခွန်းများကို ဖြေပါ။

1. **Application Architecture:**
   - သင့် app သည် ဘယ် AI services များကို အသုံးပြုသနည်း?
   - ဘယ် compute resources များလိုအပ်သနည်း?
   - ဒေတာဘေ့စ်တစ်ခု လိုအပ်ပါသလား?
   - ဝန်ဆောင်မှုများအကြား မည်သည့် dependency များ ရှိသနည်း?

2. **Security Requirements:**
   - သင့် app သည် မည္သည့် sensitive data များကို ကိုင်တွယ်သနည်း?
   - သင့်တွင် ဘယ်လို compliance လိုအပ်ချက်များ ရှိသနည်း?
   - private networking လိုအပ်ပါသလား?

3. **Scaling Requirements:**
   - မျှော်မှန်းထားသည့် load မည်မျှလဲ?
   - auto-scaling လိုအပ်မလား?
   - ဧရိယာဆိုင်ရာ လိုအပ်ချက်များ ရှိပါသလား?

### Step 5.2: Create Your AZD Template

**သင့် app ကို ပြောင်းလဲရာတွင် ဤပုံစံကို လိုက်နာပါ:**

1. **Create the basic structure:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# AZD ပုံစံကို စတင်လုပ်ဆောင်ရန်
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

**Challenge**: document processing AI app အတွက် AZD template တစ်ခု ဖန်တီးပါ။

**Requirements:**
- content analysis အတွက် Microsoft Foundry Models
- OCR အတွက် Document Intelligence
- အဖိုင်တင်ရန် Storage Account
- processing logic အတွက် Function App
- user interface အတွက် Web app

**Bonus points:**
- သင့်တော်သော error handling ထည့်ပါ
- ကုန်ကျစရိတ် ခန့်မှန်းခြေ ထည့်ပါ
- မောနိုင်းတာ dashboard များ စတင်ထားပါ

## Module 6: Troubleshooting Common Issues

### Common Deployment Issues

#### Issue 1: OpenAI Service Quota Exceeded
**Symptoms:** Deployment သည် quota error ဖြင့် မအောင်မြင်ပါ
**Solutions:**
```bash
# လက်ရှိ ကွိုတာများကို စစ်ဆေးပါ
az cognitiveservices usage list --location eastus

# ကွိုတာ တိုးမြှင့်ရန် တောင်းဆိုပါ သို့မဟုတ် မတူညီသော ဒေသတစ်ခုကို စမ်းကြည့်ပါ
azd env set AZURE_LOCATION westus2
azd up
```

#### Issue 2: Model Not Available in Region
**Symptoms:** AI အဖြေများ မအလုပ်လုပ်ခြင်း သို့မဟုတ် model deployment error များ
**Solutions:**
```bash
# ဒေသအလိုက် မော်ဒယ် ရနိုင်မှုကို စစ်ဆေးပါ
az cognitiveservices model list --location eastus

# ရရှိနိုင်သော မော်ဒယ်သို့ အပ်ဒိတ်လုပ်ပါ
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### Issue 3: Permission Issues
**Symptoms:** AI services ကို ခေါ်သုံးသောအခါ 403 Forbidden အမှားပြသည်
**Solutions:**
```bash
# အခန်းကဏ္ဍများအပ်နှံထားမှုကို စစ်ဆေးပါ
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# မရှိသေးသော အခန်းကဏ္ဍများကို ထည့်ပါ
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Performance Issues

#### Issue 4: Slow AI Responses
**Investigation steps:**
1. Application Insights တွင် performance metrics များကို စစ်ဆေးပါ
2. Azure portal တွင် OpenAI service metrics များကို ပြန်လည်စစ်ဆေးပါ
3. network connectivity နှင့် latency ကို အတည်ပြုပါ

**Solutions:**
- အထူးမေးလေ့များအတွက် caching ကို အကောင်အထည်ဖော်ပါ
- သင့် use case အတွက် သင့်လျော်သော OpenAI model ကို အသုံးပြုပါ
- High-load ပြဿနာများအတွက် read replicas ကို စဉ်းစားပါ

### **Lab Exercise 6.1: Debugging Challenge**

**Scenario**: Deployment အောင်မြင်သော်လည်း application က 500 errors ပြန်ပို့နေသည်။

**Debugging tasks:**
1. application logs ကို စစ်ဆေးပါ
2. ဝန်ဆောင်မှုဆက်သွယ်နိုင်မှုကို အတည်ပြုပါ
3. authentication ကို စမ်းသပ်ပါ
4. configuration ကို ပြန်လည်ဆန်းစစ်ပါ

**Tools to use:**
- `azd show` အား deployment အမြင်အယမြင်အတွက် အသုံးပြုပါ
- service logs အသေးစိတ်အတွက် Azure portal ကို အသုံးပြုပါ
- application telemetry အတွက် Application Insights ကို အသုံးပြုပါ

## Module 7: Monitoring and Optimization

### Step 7.1: Set Up Comprehensive Monitoring

1. **Create custom dashboards:**

Azure portal သို့ သွားပြီး အောက်ပါအရာများပါဝင်သည့် dashboard တစ်ခု ဖန်တီးပါ။
- OpenAI request count နှင့် latency
- Application error rates
- Resource utilization
- Cost tracking

2. **Set up alerts:**
```bash
# အမှားနှုန်း မြင့်မားမှုအတွက် သတိပေးချက်
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
# ကုန်ကျစရိတ် ဒေတာများကို ရယူရန် Azure CLI ကို အသုံးပြုပါ
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Implement cost controls:**
- budget alerts များကို စတင်တပ်ဆင်ပါ
- autoscaling policies များကို အသုံးပြုပါ
- request caching ကို အကောင်အထည်ဖော်ပါ
- OpenAI အတွက် token အသုံးပြုမှုကို မော်နီတာလုပ်ပါ

### **Lab Exercise 7.1: Performance Optimization**

**Task**: performance နှင့် cost နှစ်ခုစလုံးအတွက် သင့် AI application ကို မျှလုပ်ကြပါ။

**Metrics to improve:**
- ပျမ်းမျှ တုံ့ပြန်ချိန်ကို 20% လျှော့ချရန်
- တစ်လလျှင် ကုန်ကျစရိတ်ကို 15% လျှော့ချရန်
- 99.9% uptime ထိန်းသိမ်းထားရန်

**Strategies to try:**
- response caching ကို အကောင်အထည်ဖော်ပါ
- token သိမြင်မှုအတွက် prompts များကို အကောင်းအစား ပြုပြင်ပါ
- သင့်လျော်သော compute SKUs များကို အသုံးပြုပါ
- autoscaling ကို မှန်ကန်စွာ သတ်မှတ်ပါ

## Final Challenge: End-to-End Implementation

### Challenge Scenario

သင့်တာဝန်မှာ production-ready AI-powered customer service chatbot တစ်ခုကို ဒီလိုလိုအပ်ချက်များနှင့် ဖန်တီးရန်ဖြစ်သည်။

**Functional Requirements:**
- ဖောက်သည်များနှင့် ဆက်သွယ်ရန် web interface
- ပြန်လည်ဖြေကြားရန် Microsoft Foundry Models နှင့် ပေါင်းစည်းမှု
- Azure AI Search ကို အသုံးပြု၍ document search ထောက်ပံ့မှု
- ရှိပြီးသား customer database နှင့် ပေါင်းစည်းမှု
- ဘာသာစကားများစွာကို ထောက်ပံ့ရေး

**Non-Functional Requirements:**
- တပြိုင်နက် 1000 ဦးကို ကိုင်တွယ်နိုင်ရန်
- 99.9% uptime SLA
- SOC 2 compliance
- တစ်လလျှင် $500 အောက် ကုန်ကျစရိတ်
- အမျိုးမျိုးသော environments (dev, staging, prod) သို့ တင်သွင်းရန်

### Implementation Steps

1. architecture ကို ဒီဇိုင်น์ဆွဲပါ
2. AZD template ကို ဖန်တီးပါ
3. security အတွက် နည်းလမ်းများကို အကောင်အထည်ဖော်ပါ
4. မောနိုင်းတာနှင့် alerting ကို စတင်ပါ
5. deployment pipelines များကို ဖန်တီးပါ
6. ဖြေရှင်းချက်ကို စာရွက်စာတမ်းပြုစုပါ

### Evaluation Criteria

- ✅ **Functionality**: အားလုံးလိုအပ်ချက်များကို ဖြည့်ဆည်းနိုင်သလား?
- ✅ **Security**: best practices များ ထည့်သွင်းထားသလား?
- ✅ **Scalability**: load ကို ကိုင်တွယ်နိုင်သလား?
- ✅ **Maintainability**: code နှင့် infrastructure ကို ကောင်းစွာ စုပေါင်းထားသလား?
- ✅ **Cost**: ဘတ်ဂျက်အတွင်းမှာ ရှိနေသလား?

## Additional Resources

### Microsoft Documentation
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### Sample Templates
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### လူထုအရင်းအမြစ်များ
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 ပြီးမြောက်လက်မှတ်

ဂုဏ်ယူပါတယ်! သင်သည် AI Workshop Lab ကို အပြီးသတ် ပြီးမြောက်ပါပြီ။ ယခုတွင် သင်အောက်ပါ အရာများကို ပြုလုပ်နိုင်သင့်သည်။

- ✅ လက်ရှိ AI applications များကို AZD templates များအဖြစ် ပြောင်းနိုင်ခြင်း
- ✅ ထုတ်လုပ်မှုအသင့် AI applications များကို ထည့်သွင်းတင်ပို့နိုင်ခြင်း
- ✅ AI workloads များအတွက် လုံခြုံရေး အကောင်းဆုံး လက်တွေ့နည်းလမ်းများကို အကောင်အထည်ဖော်နိုင်ခြင်း
- ✅ AI application များ၏ လုပ်ဆောင်မှုကို စောင့်ကြည့်၍ တိုးတက်အောင် ပြုစုနိုင်ခြင်း
- ✅ ပုံမှန် ထည့်သွင်းမှု ပြဿနာများကို ပြန်လည်ဖြေရှင်းနိုင်ခြင်း

### နောက်ထပ် ခြေလှမ်းများ
1. ဤပုံစံများကို သင်၏ ကိုယ်ပိုင် AI ပရိုဇက်များတွင် အသုံးချပါ
2. Templates များကို ပြန်လည် လူထုထံ စေ့ဆော်ပါ
3. ဆက်လက်ထောက်ပံ့မှုအတွက် Microsoft Foundry Discord သို့ ဝင်ပါ
4. multi-region deployments ကဲ့သို့ တိုးတက်ပြောင်းလဲမှု ခေါင်းစဉ်များကို ရှာဖွေပါ

---

**Workshop Feedback**: ဤ workshop ကို တိုးတက်စေရန် သင်၏ အတွေ့အကြုံကို [Microsoft Foundry Discord #Azure ချန်နယ်](https://discord.gg/microsoft-azure) တွင် မျှဝေကူညီပေးပါ။

 
---

**အခန်း လမ်းညွှန်:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 2 - AI-First Development
- **⬅️ Previous**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Next**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 Next Chapter**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

**အကူအညီ လိုပါသလား?** ကျေးဇူးပြု၍ AZD နှင့် AI ထည့်သွင်းခြင်းများအတွက် အထောက်အပံ့နှင့် ဆွေးနွေးရန် ကျွန်တော်တို့၏ လူထုတွင် ပါဝင်ဆွေးနွေးပါ။

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ပြောကြားချက်**
ဤစာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှန်ကန်မှုအတွက် ကြိုးပမ်းနေသော်လည်း၊ စက်ကိရိယာဘာသာပြန်ခြင်းများတွင် အမှားများ သို့မဟုတ် မှားယွင်းချက်များ ပါဝင်နိုင်ကြောင်း သတိပြုပါရန် လိုအပ်ပါသည်။ မူလစာတမ်းကို မူရင်းဘာသာဖြင့်သာ ယုံကြည်စိတ်ချရသော အချက်အလက်အဖြစ် သတ်မှတ်သင့်သည်။ အရေးကြီးသည့် သတင်းအချက်အလက်များအတွက် ပရော်ဖက်ရှင်နယ် လူသားဘာသာပြန်သူဝန်ဆောင်မှုကို အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော နားလည်မှုကွာခြားမှုများ သို့မဟုတ် မမှန်ကန်သော အသုံးပြုမှုများအတွက် ကျွန်ုပ်တို့ တာဝန်မခံပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->