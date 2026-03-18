# AI Workshop Lab: Making Your AI Solutions AZD-Deployable

**Chapter Navigation:**
- **📚 သင်တန်း မူလစာမျက်နှာ**: [AZD For Beginners](../../README.md)
- **📖 လက်ရှိ အခန်း**: အခန်း 2 - AI-First Development
- **⬅️ အရင်**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ နောက်တစ်ခု**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 နောက် အခန်း**: [အခန်း ၃: ဖွဲ့စည်းခြင်း](../chapter-03-configuration/configuration.md)

## Workshop Overview

ယင်း လက်တွေ့ လေ့ကျင့်ခန်းသည် ပြင်ဆင်ပြီးသား AI အခေါင်းစဉ်တစ်ခုကို ယူ၍ Azure Developer CLI (AZD) ဖြင့် ထုတ်လုပ်မှုအဆင့် ပြင်ဆင်ပြီး Deploy လုပ်နည်းကို ဖေါ်ပြသင်ကြားပေးသည်။ Microsoft Foundry ဝန်ဆောင်မှုများကို အသုံးပြုကာ ထုတ်လုပ်မှု AI deployments များအတွက် အခြေခံပုံစံများကို သင်ယူနိုင်မည်။

**Duration:** 2-3 hours  
**Level:** Intermediate  
**Prerequisites:** Basic Azure knowledge, familiarity with AI/ML concepts

## 🎓 Learning Objectives

ဤ လက်တွေ့လေ့ကျင့်ခန်းပြီးဆုံးချိန်အထိ သင်တတ်နိုင်မည့် အရာများမှာ -
- ✅ ရှိပြီးသား AI အပလီကေးရှင်းကို AZD တမ်းပလိတ်သို့ ပြောင်းလဲနိုင်စေမည်
- ✅ AZD ဖြင့် Microsoft Foundry ဝန်ဆောင်မှုများကို कॉန်းဖစ်ချာ ပြုလုပ်နိုင်မည်
- ✅ AI ဝန်ဆောင်မှုများအတွက် လုံခြုံသည့် credential များကို စီမံခန့်ခွဲနိုင်မည်
- ✅ မော်နီတာအပါအဝင် ထုတ်လုပ်မှုအဆင့် ပြင်ဆင်ထားသော AI အပလီကေးရှင်းများကို Deploy လုပ်နိုင်မည်
- ✅ သာမာန် AI deployment ပြဿနာများကို ဖြေရှင်းနိုင်မည်

## Prerequisites

### Required Tools
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) installed
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) installed
- [Git](https://git-scm.com/) installed
- Code editor (VS Code recommended)

### Azure Resources
- Azure subscription with contributor access
- Access to Microsoft Foundry Models services (or ability to request access)
- Resource group creation permissions

### Knowledge Prerequisites
- Azure ဝန်ဆောင်မှုများအကြောင်း အခြေခံ နားလည်မှု
- ကွန်မန်းဒ်လိုင်း အင်တာဖေ့စ်များနှင့် 친숙မှု
- AI/ML အခြေခံ အယူအဆများ (API များ, မော်ဒယ်များ, prompt များ)

## Lab Setup

### Step 1: Environment Preparation

1. **Verify tool installations:**
```bash
# AZD ထည့်သွင်းမှုကို စစ်ဆေးပါ
azd version

# Azure CLI ထည့်သွင်းမှုကို စစ်ဆေးပါ
az --version

# Azure သို့ လော့ဂ်အင် ဝင်ပါ
az login
azd auth login
```

2. **Clone the workshop repository:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Module 1: Understanding AZD Structure for AI Applications

### Anatomy of an AI AZD Template

AI-အဆင်ပြေသော AZD တမ်းပလိတ်ထဲရှိ အဓိက ဖိုင်များကို စူးစမ်းကြည့်ပါ -

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

### **Lab Exercise 1.1: Explore the Configuration**

1. **Examine the azure.yaml file:**
```bash
cat azure.yaml
```

**ရှာဖွေရန် အချက်များ:**
- AI ကွန်ပိုနင့်များအတွက် ဝန်ဆောင်မှု သတ်မှတ်ချက်များ
- ပတ်ဝန်းကျင် သတ်မှတ်ကိန်းဂဏန်းများ (environment variables) များ၏ မျက်နှာကျက်
- ဟိုစ်(Host) ဖော်ပြချက်များ

2. **Review the main.bicep infrastructure:**
```bash
cat infra/main.bicep
```

**ဖော်ထုတ်ရန် အဓိက AI ပုံစံများ:**
- Microsoft Foundry Models ဝန်ဆောင်မှု ပေးဆောင်ခြင်း
- Cognitive Search ထည့်သွင်းခြင်း
- လုံခြုံသော key စီမံခန့်ခွဲမှု
- network လုံခြုံရေး ဖွဲ့စည်းမှုများ

### **Discussion Point:** Why These Patterns Matter for AI

- **Service Dependencies**: AI အက်ပ်များသည် များစွာသော ဝန်ဆောင်မှုများကို ဆက်သွယ်လိုက်ဖက်စွာ လိုအပ်သည်
- **Security**: API key များနှင့် endpoint များကို လုံခြုံစိတ်ချစွာ စီမံရမည်
- **Scalability**: AI လုပ်ငန်းများတွင် ထူးခြားသော scaling လိုအပ်ချက်များ ရှိသည်
- **Cost Management**: မကျေနပ်စွာ ဆက်လက်မလှုပ်ရှားပါက AI ဝန်ဆောင်မှုများသည် စရိတ်များစွာ ကုန်ကျနိုင်သည်

## Module 2: Deploy Your First AI Application

### Step 2.1: Initialize the Environment

1. **Create a new AZD environment:**
```bash
azd env new myai-workshop
```

2. **Set required parameters:**
```bash
# သင်နှစ်သက်သော Azure တိုင်းဒေသကို သတ်မှတ်ပါ
azd env set AZURE_LOCATION eastus

# ရွေးချယ်စရာ: အထူးတိကျသော OpenAI မော်ဒယ်ကို သတ်မှတ်ပါ
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### Step 2.2: Deploy the Infrastructure and Application

1. **Deploy with AZD:**
```bash
azd up
```

**`azd up` သာမာန်အားဖြင့် ဖြစ်ပျက်သည့် အရာများ:**
- ✅ Microsoft Foundry Models ဝန်ဆောင်မှု ပေးဆောင်ခြင်း
- ✅ Cognitive Search ဝန်ဆောင်မှု တည်ဆောက်ခြင်း
- ✅ ဝဘ် အက်ပ်အတွက် App Service တည်ဆောက်ခြင်း
- ✅ ကွန်ယက်နှင့် လုံခြုံရေး ဖော်ပြချက်များ ပြင်ဆင်ခြင်း
- ✅ အက်ပ်ကုဒ်ကို Deploy လုပ်ခြင်း
- ✅ မော်နီတာနှင့် လော့ဂ်များ စတင်တပ်ဆင်ခြင်း

2. **Monitor the deployment progress** and note the resources being created.

### Step 2.3: Verify Your Deployment

1. **Check the deployed resources:**
```bash
azd show
```

2. **Open the deployed application:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **Test the AI functionality:**
   - ဝဘ် အက်ပ်သို့ သွားပါ
   - နမူနာ မေးခွန်းများကို စမ်းကြည့်ပါ
   - AI ဖြေကြားချက်များ အလုပ်လုပ်နေကြောင်း သေချာစစ်ဆေးပါ

### **Lab Exercise 2.1: Troubleshooting Practice**

**Scenario**: သင်၏ deployment သည် အောင်မြင်ခဲ့သော်လည်း AI မှ တုံ့ပြန်မှု မရှိခြင်း။

**စစ်ဆေးစရာ များ:**
1. **OpenAI API keys**: မှန်ကန်စွာ ဆက်ထားပါသည်လား စစ်ဆေးပါ
2. **Model availability**: သင့် ဒေသတွင် မော်ဒယ်ရရှိနိုင်မှု မရှိပါက စစ်ဆေးပါ
3. **Network connectivity**: ဝန်ဆောင်မှုများ သံဆောင်လုပ်နိုင်မှု ရှိနေသည်ဟုတ်ကြောင်း အတည်ပြုပါ
4. **RBAC permissions**: အက်ပ်သည် OpenAI ကို 접근ခွင့် ရှိသည်ဟုတ်ကြောင်း စစ်ဆေးပါ

**Debugging commands:**
```bash
# ပတ်ဝန်းကျင် ဆက်တင်များ (environment variables) ကို စစ်ဆေးပါ
azd env get-values

# တင်သွင်းမှု မှတ်တမ်းများကို ကြည့်ပါ
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# OpenAI တင်သွင်းမှု အခြေအနေကို စစ်ဆေးပါ
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Module 3: Customizing AI Applications for Your Needs

### Step 3.1: Modify the AI Configuration

1. **Update the OpenAI model:**
```bash
# သင်၏ဒေသတွင် ရနိုင်ပါက အခြားမော်ဒယ်တစ်ခုသို့ ပြောင်းပါ
azd env set AZURE_OPENAI_MODEL gpt-4.1

# ဖွဲ့စည်းပုံအသစ်ဖြင့် ထပ်မံ ဖြန့်ချိပါ
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

**အကောင်းဆုံး အလေ့အထ**: development နှင့် production အတွက် ကွဲပြားသော ဖော်ပြချက်များ အသုံးပြုပါ။

1. **Create a production environment:**
```bash
azd env new myai-production
```

2. **Set production-specific parameters:**
```bash
# ထုတ်လုပ်ရေးတွင် ပုံမှန်အားဖြင့် ပိုမြင့်သော SKU များကို အသုံးပြုသည်
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# အပိုလုံခြုံရေး လက္ခဏာများကို ဖွင့်ပါ
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Lab Exercise 3.1: Cost Optimization**

**စိန်ခေါ်မှု**: တိုးတက်စရိတ် သက်သာစေရန် template ကို သတ်မှတ်ပါ။

**တာဝန်များ:**
1. ဘယ်အရာများကို free/basic တန်းအဖြစ် သတ်မှတ်နိုင်သည်ကို ဖော်ထုတ်ပါ
2. အနည်းဆုံး စရိတ်အတွက် ပတ်ဝန်းကျင် အဆက်တင်ကိန်းများကို သတ်မှတ်ပါ
3. Deploy လုပ်ပြီး production configuration နှင့် စရိတ်များ နှိုင်းယှဉ်ပါ

**ဖြေရှင်းချက် အကြံပြုချက်များ:**
- Cognitive Services အတွက် ရနိုင်ပါက F0 (free) tier ကို အသုံးပြုပါ
- development အတွက် Search Service အတွက် Basic tier ကို အသုံးပြုပါ
- Functions အတွက် Consumption plan ကို စဉ်းစားပါ

## Module 4: Security and Production Best Practices

### Step 4.1: Secure Credential Management

**လက်ရှိ စိန်ခေါ်မှု**: AI အက်ပ်များစွာသည် API key များကို code ထဲတွင် hardcode လုပ်ထားသည် သို့မဟုတ် လုံခြုံမပြေလေ့ရှိသည်။

**AZD ဖြေရှင်းချက်**: Managed Identity + Key Vault ပေါင်းစပ် သုံးစွဲမှု။

1. **Review the security configuration in your template:**
```bash
# Key Vault နှင့် Managed Identity ဆက်တင်များကို ရှာပါ
grep -r "keyVault\|managedIdentity" infra/
```

2. **Verify Managed Identity is working:**
```bash
# ဝက်ဘ်အက်ပ်တွင် မှန်ကန်သော အတည်ပြုမှု ညှိနှိုင်းချက် ရှိမရှိ စစ်ဆေးပါ
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Step 4.2: Network Security

1. **Enable private endpoints** (if not already configured):

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
# Application Insights ကို အလိုအလျောက် သတ်မှတ်ပေးထားသင့်သည်
# ဖွဲ့စည်းမှုကို စစ်ဆေးပါ:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Set up AI-specific monitoring:**

Add custom metrics for AI operations:
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

**တာဝန်**: သင့် deployment ကို လုံခြုံရေး အကောင်းဆုံး လက်တွေ့အတွက် ပြန်လည်စစ်ဆေးပါ။

**စစ် Checklist:**
- [ ] ကုဒ် သို့မဟုတ် ဖော်ပြချက်များတွင် hardcoded secrets မရှိရပါ
- [ ] အဝန်ဆောင်မှုများ အကြား authentication အတွက် Managed Identity ကို အသုံးပြုထားပါ
- [ ] Key Vault သည် သတင်းအချက်အလက့် အလွန်ထိရောက်သော ဖိုင်များကို သိမ်းဆည်းထားသည်
- [ ] ကွန်ယက် ဝင်ပြင်အသွားများ သက်ဆိုင်ရာ ပုံစံဖြင့် အကန့်အသတ်ထားသည်
- [ ] မော်နီတာနှင့် လော့ဂ်များ သတ်မှတ်ပြီး ဖွင့်ထားသည်

## Module 5: Converting Your Own AI Application

### Step 5.1: Assessment Worksheet

**သင့်အက်ပ်ကို ပြောင်းလဲမီ**, ဤမေးခွန်းများကို ဖြေပါ -

1. **Application Architecture:**
   - သင့်အက်ပ်သည် ဘယ် AI ဝန်ဆောင်မှုများကို အသုံးပြုသနည်း?
   - ဘယ် compute အရင်းအမြစ်များ လိုအပ်သနည်း?
   - ဒေတာဘေ့စ် လိုအပ်ပါသလား?
   - ဝန်ဆောင်မှုများအကြား အငြင်းပွားမှုများ ရှိပါသလား?

2. **Security Requirements:**
   - သင့်အက်ပ်သည် ဘယ်လို အာရုံစိုက်ရမည့် အသေးစိတ် ဒေတာများကို ကိုင်တွယ်သနည်း?
   - သင့်တွင် လိုအပ်သည့် အလိုအလျောက်လိုက်နာမှု (compliance) များ ရှိပါသလား?
   - private networking လိုအပ်ပါသလား?

3. **Scaling Requirements:**
   - မျှော်မှန်းထားသည့် ဘာသာရပ် ခေါ်ယူမှု (load) ဘယ်လောက်နေလဲ?
   - auto-scaling လိုအပ်ပါသလား?
   - ဒေသဆိုင်ရာ လိုအပ်ချက်များ ရှိပါသလား?

### Step 5.2: Create Your AZD Template

**သင့်အက်ပ်ကို ပြောင်းလဲရန် အောက်ပါ ပုံစံကို လိုက်နာပါ။**

1. **Create the basic structure:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# AZD template ကို စတင်ဖန်တီးပါ
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

**စိန်ခေါ်မှု**: စာရွက်စာတမ်းကို ကြားနာသုံးသပ်နိုင်သော document processing AI အက်ပ်အတွက် AZD template တစ်ခု ဖန်တီးပါ။

**လိုအပ်ချက်များ:**
- Microsoft Foundry Models ကို အကြောင်းအရာ သုံးသပ်ရန်
- Document Intelligence ကို OCR အတွက်
- စာရွက်များ အပ်လိုက်ရန် Storage Account
- အလုပ်လုပ်ပြန်ဆောင်ရန် Function App
- အသုံးပြုသူ အင်တာဖေ့စ်အတွက် Web app

**အဆင့်မြှင့် အမှတ်များ:**
- မှားယွင်းချက်ကို သေချာထိန်းချုပ်ခြင်း ထည့်သွင်းပါ
- စရိတ် ခန့်မှန်းချက် ထည့်သွင်းပါ
- မော်နီတာပတ်လမ်းများ တပ်ဆင်ပါ

## Module 6: Troubleshooting Common Issues

### Common Deployment Issues

#### Issue 1: OpenAI Service Quota Exceeded
**ရောဂါလက္ခဏာများ:** Deployment က quota error ဖြင့် ပျက်ကွက်သည်
**ဖြေရှင်းနည်းများ:**
```bash
# လက်ရှိ ကွိုတာများကို စစ်ဆေးပါ
az cognitiveservices usage list --location eastus

# ကွိုတာ တိုးမြှင့်ရန် တောင်းဆိုပါ သို့မဟုတ် အခြား ဒေသကို ကြိုးစားကြည့်ပါ
azd env set AZURE_LOCATION westus2
azd up
```

#### Issue 2: Model Not Available in Region
**ရောဂါလက္ခဏာများ:** AI တုံ့ပြန်မှု မရသော်လည်း မော်ဒယ် deployment မှားယွင်းသည်
**ဖြေရှင်းနည်းများ:**
```bash
# ဒေသအလိုက် မော်ဒယ်ရရှိနိုင်မှုကို စစ်ဆေးပါ
az cognitiveservices model list --location eastus

# ရရှိနိုင်သော မော်ဒယ်သို့ အပ်ဒိတ်လုပ်ပါ
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### Issue 3: Permission Issues
**ရောဂါလက္ခဏာများ:** AI ဝန်ဆောင်မှုများကို ခေါ်ဆိုသည့်အခါ 403 Forbidden အမှားများ ပေါ်လာသည်
**ဖြေရှင်းနည်းများ:**
```bash
# တာဝန်အပ်နှံထားမှုများကို စစ်ဆေးပါ
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# မရှိသေးသော တာဝန်များကို ထည့်ပါ
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Performance Issues

#### Issue 4: Slow AI Responses
**စုံစမ်းရန် အဆင့်များ:**
1. Application Insights မှ performance metrics များကို စစ်ဆေးပါ
2. Azure portal တွင် OpenAI ဝန်ဆောင်မှု မက်ထရစ်များကို ပြန်လည်ကြည့်ပါ
3. ကွန်ယက် ဆက်သွယ်မှုနှင့် latency ကို အတည်ပြုပါ

**ဖြေရှင်းနည်းများ:**
- သာမာန်မေးခွန်းများအတွက် caching ကို ထည့်သွင်းပါ
- သင့်အသုံးအတွက် သင့်လျော်သော OpenAI မော်ဒယ်ကို အသုံးပြုပါ
- အမြင့် load အတွက် read replicas များကို စဉ်းစားပါ

### **Lab Exercise 6.1: Debugging Challenge**

**Scenario**: သင်၏ deployment သည် အောင်မြင်ခဲ့သော်လည်း အက်ပ်သည် 500 အမှားများ ပြန်ပေးနေသည်။

**Debugging တာဝန်များ:**
1. အက်ပ် လော့ဂ်များကို စစ်ဆေးပါ
2. ဝန်ဆောင်မှု ချိတ်ဆက်မှုကို အတည်ပြုပါ
3. authentication ကို စမ်းသပ်ပါ
4. ဖော်ပြချက်ကို ပြန်လည်သုံးသပ်ပါ

**အသုံးပြုရန် ကိရိယာများ:**
- `azd show` သည် deployment အကျဉ်းချုပ်ကို ကြည့်ရန်
- အသေးစိတ် ဝန်ဆောင်မှု လော့ဂ်များအတွက် Azure portal
- အက်ပ် telemetry အတွက် Application Insights

## Module 7: Monitoring and Optimization

### Step 7.1: Set Up Comprehensive Monitoring

1. **Create custom dashboards:**

Azure portal သို့ သွား၍ အောက်ပါအရာများပါသည့် dashboard တစ်ခု ဖန်တီးပါ -
- OpenAI request count and latency
- Application error rates
- Resource utilization
- Cost tracking

2. **Set up alerts:**
```bash
# အမှားနှုန်းမြင့်မားမှုအတွက် သတိပေးချက်
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
# Azure CLI ကို အသုံးပြုပြီး ကုန်ကျစရိတ် ဒေတာကို ရယူပါ
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Implement cost controls:**
- Budget alerts တပ်ဆင်ပါ
- Autoscaling မူဝါဒများ ကို အသုံးပြုပါ
- Request caching ကို ထည့်သွင်းပါ
- OpenAI အတွက် token အသုံးစရိတ်ကို စောင့်ကြည့်ပါ

### **Lab Exercise 7.1: Performance Optimization**

**တာဝန်**: သင့် AI အက်ပ်ကို စွမ်းဆောင်ရည်နှင့် စရိတ်နှစ်ဖက်လုံးအတွက် အကောင်းဆုံးပြုလုပ်ပါ။

**တိုးတက်စေရန် မက်ထရစ်များ:**
- ပျမ်းမျှ တုံ့ပြန်ချိန်ကို ၂၀% လျော့ချပါ
- လစဉ် စရိတ်ကို ၁၅% လျော့ချပါ
- ၉၉.၉% Uptime ကို ထိန်းဆည်းပါ

**ကြိုးပမ်းရန် မဟာဗျည်းများ:**
- တုံ့ပြန်ချက် caching အကောင်အထည်ဖော်ပါ
- token ထိရောက်မှုအတွက် prompts များ ကို အတွေးအခေါ် ထိန်းချုပ်ပါ
- သင့်လျော်သော compute SKU များကို သတ်မှတ်ပါ
- မူဝါဒ autoscaling ကို သတ်မှတ်ပါ

## Final Challenge: End-to-End Implementation

### Challenge Scenario

သင်ကို စုစည်းထားသည့် လုပ်ငန်းတာဝန်မှာ ထုတ်လုပ်မှုအဆင့် အဆင်ပြေသော AI ပါဝင်သော ဖောက်သည်ဝန်ဆောင်မှု chatbot တစ်ခု ဖန်တီးရမည်ဖြစ်သည်၊ အောက်ပါလိုအပ်ချက်များနှင့် -

**Functional Requirements:**
- ဖောက်သည်နှင့် ဆက်သွယ်ရန် ဝဘ် အင်တာဖေ့စ်
- ပြန်လည်ဖြေရှင်းရန် Microsoft Foundry Models နှင့် ပေါင်းစည်းခြင်း
- Cognitive Search ကို အသုံးပြုသော စာရွက် ရှာဖွေရေး ကွက်လပ်
- ရှိပြီးသား ဖောက်သည် ဒေတာဘေ့စ်နှင့် ပေါင်းစည်းခြင်း
- ဘာသာစကား များစွာ ထောက်ခံမှု

**Non-Functional Requirements:**
- တပြိုင်နက် 1000 ဦးကို ကိုင်တွယ်နိုင်ရန်
- 99.9% uptime SLA
- SOC 2 အညီအမခံ
- လစဉ် $500 အောက် စရိတ်
- မျိုးစုံသော ပတ်ဝန်းကျင်များ (dev, staging, prod) သို့ Deploy လုပ်နိုင်ရန်

### Implementation Steps

1. **Architecture ကို ဒီဇိုင်းဆွဲပါ**
2. **AZD template ကို ဖန်တီးပါ**
3. **လုံခြုံရေး အစီအစဉ်များ ကို အကောင်အထည်ဖော်ပါ**
4. **မော်နီတာနှင့် အချက်ပေးခြင်းများ ပြင်ဆင်ပါ**
5. **Deployment pipeline များ ဖန်တီးပါ**
6. **ဖြေရှင်းချက်ကို စာတမ်းပြုစုပါ**

### Evaluation Criteria

- ✅ **Functionality**: အားလုံးလိုအပ်ချက်များ ပြည့်မှီပါသလား?
- ✅ **Security**: အကောင်းဆုံး လက်တွေ့များကို ဆောင်ရွက်ထားသလား?
- ✅ **Scalability**: ယင်းသည် အများအပြား load ကို ကိုင်တွယ်နိုင်သလား?
- ✅ **Maintainability**: ကုဒ်နှင့် အထောက်အပံ့ ဖွဲ့စည်းမှု ကောင်းမွန်စွာ စီမံထားသလား?
- ✅ **Cost**: ဘတ်ဂျက်အတွင်းတွင် ရှိနေပါသလား?

## Additional Resources

### Microsoft Documentation
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### Sample Templates
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Community Resources
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Completion Certificate

အခမ်းအနား ယူပြီးပါပြီ! သင်သည် AI Workshop Lab ကို ပြီးစီးလိုက်ပြီ။ ယခုအားဖြင့် သင်အောက်ပါအရာများကို ပြုလုပ်နိုင်ပါပြီ -
- ✅ ရှိပြီးသား AI အက်ပလီကေးရှင်းများကို AZD တမ်းပလိတ်များအဖြစ် ပြောင်းလဲပါ
- ✅ ထုတ်လုပ်ရေးအသင့် AI အက်ပလီကေးရှင်းများကို တပ်ဆင်ပါ
- ✅ AI workload များအတွက် လုံခြုံရေး အကောင်းဆုံး လုပ်ထုံးလုပ်နည်းများကို ပြုလုပ်ပါ
- ✅ AI အက်ပလီကေးရှင်းများ၏ စွမ်းဆောင်ရည်ကို ကြီးကြပ်၍ တိုးတက်အောင် ပြုလုပ်ပါ
- ✅ အများဆုံး တွေ့ကြုံရသော တပ်ဆင်မှု ပြဿနာများကို ဖြေရှင်းပါ

### နောက်ဆက်တွဲ အဆင့်များ
1. ဒီပုံစံများကို သင့် AI ပရိုဂျက်များတွင် အသုံးချပါ
2. တမ်းပလိတ်များကို အသိုင်းအဝိုင်းထံ ပြန်လှန် ဝေမျှပေးပါ
3. ဆက်လက်ပံ့ပိုးမှုအတွက် Microsoft Foundry Discord တွင် ပါဝင်ပါ
4. ဒေသအများအပြား၌ တပ်ဆင်ခြင်းကဲ့သို့သော တိုးတက်သော ခေါင်းစဉ်များကို ရှာဖွေ စူးစမ်းပါ

---

**သင်တန်းတုံ့ပြန်ချက်**: ဤသင်တန်းကို တိုးတက်ကောင်းမွန်စေရန် သင့်အတွေ့အကြုံကို [Microsoft Foundry Discord #Azure channel](https://discord.gg/microsoft-azure) တွင် မျှဝေကူညီပါ။

  
---

**အခန်း လမ်းကြောင်း:**
- **📚 Course Home**: [AZD အခြေခံများ](../../README.md)
- **📖 လက်ရှိ အခန်း**: အခန်း 2 - AI ကို ဦးစားပေးသော ဖွံ့ဖြိုးရေး
- **⬅️ ယခင်**: [AI မော်ဒယ် တပ်ဆင်ခြင်း](ai-model-deployment.md)
- **➡️ နောက်တစ်ခု**: [ထုတ်လုပ်ရေး AI အတွက် အကောင်းဆုံး လုပ်ထုံးလုပ်နည်းများ](production-ai-practices.md)
- **🚀 နောက် အခန်း**: [အခန်း 3: ဖွဲ့စည်းခြင်း](../chapter-03-configuration/configuration.md)

**အကူအညီလိုပါသလား?** AZD နှင့် AI တပ်ဆင်မှုများနှင့် ပတ်သတ်သော ပံ့ပိုးမှုနှင့် ဆွေးနွေးမှုများအတွက် ကျွန်ုပ်တို့၏ အသိုင်းအဝိုင်းတွင် ပါဝင်ဆဒဲပါ။

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**အသိပေးချက်**:
ဤစာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ကို အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှုအတွက် ကြိုးပမ်းပါသော်လည်း၊ အလိုအလျောက်ဘာသာပြန်မှုများတွင် အမှားများ သို့မဟုတ် တိကျမှုနည်းပါးမှုများ ပါဝင်နိုင်ကြောင်း ကျေးဇူးပြု၍ သတိပြုပါ။ မူလစာတမ်းကို မူရင်းဘာသာစကားဖြင့် အာဏာရှိသော အရင်းအမြစ်အဖြစ် သတ်မှတ်စဉ်းစားသင့်ပါသည်။ အရေးကြီးသော အချက်အလက်များအတွက် အတတ်ပညာရှင်များဖြင့် လူ့ဘာသာပြန်မှုကို အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုမှုကြောင့် ဖြစ်ပေါ်လာနိုင်သည့် နားမလည်မှုများ သို့မဟုတ် အဓိပ္ပာယ်မှားယွင်းမှုများအတွက် ကျွန်ုပ်တို့ တာဝန်မယူပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->