# AI Workshop Lab: Making Your AI Solutions AZD-Deployable

**Chapter Navigation:**
- **📚 Course Home**: [AZD အတွက် စတင်သူများ](../../README.md)
- **📖 လက်ရှိ အခန်း**: အခန်း ၂ - AI-ဦးစားပေး ဖွံ့ဖြိုးရေး
- **⬅️ ယခင်**: [AI မော်ဒယ် တင်သွင်းခြင်း](ai-model-deployment.md)
- **➡️ နောက်တစ်ခု**: [ထုတ်လုပ်ရေး AI အကောင်းဆုံးသုံးစွဲနည်းများ](production-ai-practices.md)
- **🚀 နောက်ထပ် အခန်း**: [အခန်း ၃: သတ်မှတ်ချက်များ](../chapter-03-configuration/configuration.md)

## အလုပ်ရုံ လေ့ကျင့်ခန်း အနှိုင်းအယှဉ်

ဤ လက်တွေ့လေ့ကျင့်ခန်းသည် ရှိပြီးသား AI တမ်းပလိတ်တစ်ခုကို ယူပြီး Azure Developer CLI (AZD) ကိရိယာဖြင့် တပ်ဆင်ပို့ဆောင်ခြင်းဖြင့် တိုးတက်အောင် လမ်းပြပေးပါသည်။ Microsoft Foundry အစီအစဉ်များကို အသုံးပြုပြီး ထုတ်လုပ်ရေးအဆင့် AI တပ်ဆင်မှုများအတွက် အရေးကြီးပုံစံများကို သင်လေ့လာပါမည်။

**အချိန်ကုန်ကျ:** 2-3 နာရီ  
**အဆင့်:** အလတ်တန်း  
**လိုအပ်ချက်များ:** Azure အခြေခံ နားလည်မှု၊ AI/ML အကြောင်းအရာများနှင့် ရင်းနှီး familiarity

## 🎓 သင်ယူရမည့် ရည်မှန်းချက်များ

ဒီ အလုပ်ရုံလေ့ကျင့်ခန်း၏ အဆုံးတွင် သင်တို့သည် အောက်ပါအရာများကို လုပ်နိုင်ပါမည်-
- ✅ ရှိပြီးသား AI အက်ပလီကေးရှင်းကို AZD တမ်းပလိတ်များသို့ ရှေ့ပြောင်းနိုင်ခြင်း
- ✅ AZD ဖြင့် Microsoft Foundry ဝန်ဆောင်မှုများကို သတ်မှတ်ကော်ဖီဂရေးရှင်းလုပ်နိုင်ခြင်း
- ✅ AI ဝန်ဆောင်မှုများအတွက် လုံခြုံစိတ်ချရသော လျှို့ဝှက်ချက် စီမံခန့်ခွဲမှု ဆောင်ရွက်နိုင်ခြင်း
- ✅ စောင့်ကြည့်မှုနှင့်အတူ ထုတ်လုပ်ရေးအသင့် AI အက်ပလီကေးရှင်းများကို တပ်ဆင်နိုင်ခြင်း
- ✅ မကြာခဏဖြစ်ပေါ်သော AI တပ်ဆင်မှု ပြဿနာများကို မျှော်လင့်ချက်ပြုပြင်နိုင်ခြင်း

## လိုအပ်ချက်များ

### လိုအပ်သော ကိရိယာများ
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) တပ်ဆင်ထားရပါမည်
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) တပ်ဆင်ထားရပါမည်
- [Git](https://git-scm.com/) တပ်ဆင်ထားရမည်
- ကုဒ် တည်းဖြတ်စက် (VS Code ကို အကြံပြု)

### Azure အရင်းအမြစ်များ
- contributor မျိုးနဲ့ အကန့်အသတ်ရှိ Azure subscription တစ်ခု
- Azure OpenAI ဝန်ဆောင်မှုများ အသုံးပြုခွင့် (သို့မဟုတ် တောင်းဆိုနိုင်စွမ်း)
- Resource group ဖန်တီးခွင့်များ

### ပညာအရင်းအမြစ် လိုအပ်ချက်များ
- Azure ဝန်ဆောင်မှုများအခြေခံ နားလည်မှု
- command-line အင်တာဖေ့စ်များ နားလည်မှု
- AI/ML အခြေခံ ရင်းမြစ်များ (APIများ၊ မော်ဒယ်များ၊ prompt များ)

## Lab Setup

### Step 1: Environment Preparation

1. **ကိရိယာများ တပ်ဆင်မှုကို အတည်ပြုပါ:**
```bash
# AZD တပ်ဆင်မှုကို စစ်ဆေးပါ
azd version

# Azure CLI ကို စစ်ဆေးပါ
az --version

# Azure သို့ လော့ဂ်အင် ဝင်ပါ
az login
azd auth login
```

2. **Workshop repository ကို clone လုပ်ပါ:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Module 1: Understanding AZD Structure for AI Applications

### Anatomy of an AI AZD Template

AI အတွက် ပြင်ဆင်ထားသော AZD တမ်းပလိတ်၏ အဓိက ဖိုင်များကို ဖြစ်ရပ်ရှာဖွေပါ။

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   └── modules/            # Reusable Bicep modules
│       ├── openai.bicep    # Azure OpenAI configuration
│       ├── search.bicep    # Cognitive Search setup
│       └── webapp.bicep    # Web app configuration
├── app/                    # Application code
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

### **Lab Exercise 1.1: Explore the Configuration**

1. **azure.yaml ဖိုင်ကို စစ်ဆေးပါ:**
```bash
cat azure.yaml
```

**စစ်ဆေးရန် အချက်များ:**
- AI ကွန်ပိုနင့်များအတွက် ဝန်ဆောင်မှု သတ်မှတ်ချက်များ
- Environment variable များ၏ မက်ပတ်ဆင့်များ
- Host ဖွဲ့စည်းမှုများ

2. **main.bicep အင်ဖရာစထျက်ချာကို ပြန်လည်ဆန်းစစ်ပါ:**
```bash
cat infra/main.bicep
```

**ဖော်ထုတ်ရန် အဓိက AI ပုံစံများ:**
- Azure OpenAI ဝန်ဆောင်မှု တပ်ဆင်ခြင်း
- Cognitive Search ပေါင်းစည်းခြင်း
- လုံခြုံသော key စီမံခန့်ခွဲမှု
- ကွန်ရက် လုံခြုံရေး ဖော်ပြချက်များ

### **ဆွေးနွေးချက် အချက်အလက်:** ဤ ပုံစံများသည် AI အတွက် အရေးကြီးသည့် အကြောင်းပြချက်

- **ဝန်ဆောင်မှု မူတည်မှုများ**: AI အက်ပလီကေးရှင်းများသည် မျိုးစုံ ဝန်ဆောင်မှုများကို ညှိနှိုင်းလိုသည်
- **လုံခြုံရေး**: API keys နှင့် endpoints များကို လုံခြုံစွာ စီမံရန် လိုအပ်သည်
- **ချဲ့ထွင်နိုင်မှု**: AI အလုပ်ပမာဏများသည် ထူးခြားသော စုစည်းဖြန့်ဖြူးမှု လိုအပ်ချက်များရှိသည်
- **ကုန်ကျစရိတ် စီမံခန့်ခွဲမှု**: မှန်ကန်စွာ မသတ်မှတ်မထားလျှင် AI ဝန်ဆောင်မှုများသည် စျေးကြီးနိုင်သည်

## Module 2: Deploy Your First AI Application

### Step 2.1: Initialize the Environment

1. **AZD အတွက် environment အသစ် ဖန်တီးပါ:**
```bash
azd env new myai-workshop
```

2. **လိုအပ်သော ပါရာမီတာများ သတ်မှတ်ပါ:**
```bash
# သင်နှစ်သက်ရာ Azure ဒေသကို သတ်မှတ်ပါ
azd env set AZURE_LOCATION eastus

# ရွေးချယ်နိုင်ပါသည်: သတ်မှတ်ထားသော OpenAI မော်ဒယ်ကို သတ်မှတ်ပါ
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### Step 2.2: Deploy the Infrastructure and Application

1. **AZD ဖြင့် တပ်ဆင်ပါ:**
```bash
azd up
```

**`azd up` အတွင်း ဖြစ်ပေါ်သည့်အရာများ:**
- ✅ Azure OpenAI ဝန်ဆောင်မှု ကို provision လုပ်သည်
- ✅ Cognitive Search ဝန်ဆောင်မှု ဖန်တီးသည်
- ✅ web application အတွက် App Service ကို စီစဉ်သည်
- ✅ ကွန်ရက်နှင့် လုံခြုံရေး ကို ပြင်ဆင်သည်
- ✅ အက်ပလီကေးရှင်းကုဒ်ကို တပ်ဆင်သည်
- ✅ စောင့်ကြည့်မှုနှင့် မှတ်တမ်းတင်မှုများ ထည့်သွင်းသည်

2. **တပ်ဆင်မှု အဆင့်ဆင့်ကို စောင့်ကြည့်ပြီး ဖန်တီးနေသော အရင်းအမြစ်များကို မှတ်သားပါ။**

### Step 2.3: Verify Your Deployment

1. **တပ်ဆင်ပြီးသော အရင်းအမြစ်များကို စစ်ဆေးပါ:**
```bash
azd show
```

2. **တပ်ဆင်ထားသည့် အက်ပလီကေးရှင်းကို ဖွင့်ပါ:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **AI အလုပ်လုပ်ပုံကို စမ်းသပ်ပါ:**
   - web application ကိုသွားပါ
   - နမူနာ query များ အကဲဖြတ်ပါ
   - AI ပြန်ကြားချက်များ အလုပ်လုပ်နေသည်ကို အတည်ပြုပါ

### **Lab Exercise 2.1: Troubleshooting Practice**

**အခြေအနေ**: တပ်ဆင်မှု အောင်မြင်ပြီ သော်လည်း AI တုံ့ပြန်မှု မရပါ။

**စစ်ဆေးရန် ပုံမှန်ပြဿနာများ:**
1. **OpenAI API keys**: မှန်ကန်စွာ သတ်မှတ်ထားသည်ကို စစ်ပါ
2. **Model availability**: သင်၏ ဒေသတွင် မော်ဒယ်ကို ပံ့ပိုးမရှိနိုင်ပါက စစ်ပါ
3. **Network connectivity**: ဝန်ဆောင်မှုများ အချင်းချင်း ဆက်သွယ်နိုင်ခြင်းကို အာမခံပါ
4. **RBAC permissions**: အက်ပလီကေးရှင်းသည် OpenAI ကို ဝင်ရောက်ခွင့်ရှိသည်ကို အတည်ပြုပါ

**ဒက်ဘတ်ဂ် အမိန့်များ:**
```bash
# ပတ်ဝန်းကျင် သတ်မှတ်ထားသော တန်ဖိုးများကို စစ်ဆေးပါ
azd env get-values

# ဖြန့်ချိမှု မှတ်တမ်းများကို ကြည့်ပါ
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# OpenAI ဖြန့်ချိမှု အခြေအနေကို စစ်ဆေးပါ
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Module 3: Customizing AI Applications for Your Needs

### Step 3.1: Modify the AI Configuration

1. **OpenAI မော်ဒယ်ကို အသစ်တပ်ဆင်ပါ:**
```bash
# သင်၏ဒေသတွင် ရနိုင်ပါက အခြား မော်ဒယ်သို့ ပြောင်းပါ
azd env set AZURE_OPENAI_MODEL gpt-4

# ဖွဲ့စည်းမှုအသစ်ဖြင့် ပြန်တပ်ဆင်ပါ
azd deploy
```

2. **အပို AI ဝန်ဆောင်မှုများ ထည့်ပါ:**

`infra/main.bicep` ကို အမှတ်တံဆိပ် Document Intelligence ထည့်ရန် ပြင်ဆင်ပါ:

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

**အကောင်းဆုံး လေ့ကျင့်မှု**: ဖွံ့ဖြိုးရေးနှင့် ထုတ်လုပ်ရေးအတွက် ကွာခြားသော ကော်ဖီဂရေးရှင်းများ ကို အသုံးပြုပါ။

1. **ထုတ်လုပ်ရေး environment တစ်ခု ဖန်တီးပါ:**
```bash
azd env new myai-production
```

2. **ထုတ်လုပ်ရေး အတွက် သီးသန့် ပါရာမီတာများ သတ်မှတ်ပါ:**
```bash
# ထုတ်လုပ်ရေးတွင် ပုံမှန်အားဖြင့် အဆင့်မြင့် SKU များကို အသုံးပြုသည်
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# အပိုဆောင်း လုံခြုံရေး အင်္ဂါရပ်များကို ဖွင့်ပါ
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Lab Exercise 3.1: Cost Optimization**

**စိန်ခေါ်မှု**: ဖွံ့ဖြိုးရေးအတွက် ကုန်ကျစရိတ် သက်သာစေသော တမ်းပလိတ်ကို သတ်မှတ်ပါ။

**တာဝန်များ:**
1. ဘယ် SKUs တွေကို free/basic အဆင့် သို့ သတ်မှတ်နိုင်သည်ကို ဖော်ထုတ်ပါ
2. အစုံအပြောက် ကုန်ကျစရိတ် နည်းစေဖို့ environment variable များ ကို ဆက်သွယ်ပါ
3. တပ်ဆင်ပြီး ထုတ်လုပ်ရေး configuration နှင့် ကုန်ကျစရိတ်ကို နှိုင်းယှဉ်ပါ

**ဖြေရှင်းချက် အကြံပြုချက်များ:**
- Cognitive Services အတွက် F0 (free) tier ကို အခွင့်ရလျှင် သုံးပါ
- ဖွံ့ဖြိုးရေးတွင် Search Service အတွက် Basic tier ကို သုံးပါ
- Functions အတွက် Consumption plan ကို စဉ်းစားပါ

## Module 4: Security and Production Best Practices

### Step 4.1: Secure Credential Management

**လက်ရှိ ပြဿနာ**: AI အက်ပလီကေးရှင်းများအများစုသည် API keys ကို hardcode ထားခြင်း သို့မဟုတ် လုံခြုံမှုမရှိသော 저장နေရာ အသုံးပြုလေ့ရှိသည်။

**AZD ဖြေရှင်းချက်**: Managed Identity + Key Vault ပေါင်းစည်းမှု။

1. **တမ်းပလိတ်ထဲက လုံခြုံရေး ဖော်ပြချက်ကို ပြန်လည်ကြည့်ပါ:**
```bash
# Key Vault နှင့် Managed Identity အတွက် ပြင်ဆင်မှု (configuration) ကို ရှာဖွေပါ
grep -r "keyVault\|managedIdentity" infra/
```

2. **Managed Identity သတ်မှတ်ချက် အလုပ်လုပ်မှုကို အတည်ပြုပါ:**
```bash
# ဝဘ်အက်ပ်တွင် identity configuration မှန်ကန်ကြောင်း စစ်ဆေးပါ
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Step 4.2: Network Security

1. **private endpoints များကို ဖွင့်ပါ** (မပြင်ဆင်ထားလျှင်):

သင့် bicep template ထဲသို့ ထည့်ပါ:
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

1. **Application Insights ကို သတ်မှတ်ပါ:**
```bash
# Application Insights ကို အလိုအလျောက် ပြင်ဆင်ထားသင့်သည်
# ဖွဲ့စည်းပုံကို စစ်ဆေးပါ:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **AI သီးသန့် စောင့်ကြည့်မှုများ ထည့်သွင်းပါ:**

AI လုပ်ငန်းစဥ်များအတွက် custom metrics များ ထည့်ပါ:
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

**တာဝန်**: သင့် တပ်ဆင်မှုကို လုံခြုံရေး အကောင်းဆုံးလမ်းညွှန်ချက်များအရ ပြန်လည်စစ်ဆေးပါ။

**စစ်တမ်းစာရင်း:**
- [ ] ကုဒ် သို့မဟုတ် ကော်ဖီဂရေးရှင်းထဲတွင် hardcoded secrets မရှိစေပါ
- [ ] Managed Identity ကို service-to-service authentication အတွက် အသုံးပြုထားပါ
- [ ] Key Vault သည် အချက်အလက် သက်ဆိုင်ရာများကို သိမ်းဆည်းထားပါ
- [ ] ကွန်ရက် ဝင်ထွက်ကို မှန်ကန်စွာ ကန့်သတ်ထားပါ
- [ ] စောင့်ကြည့်မှုနှင့် မှတ်တမ်းတင်မှုများ ဖွင့်ထားပါ

## Module 5: Converting Your Own AI Application

### Step 5.1: Assessment Worksheet

**သင့် app ကို ပြောင်းလဲမည့် မတိုင်မီ**, အောက်ပါမေးခွန်းများကို ဖြေပါ:

1. **Application Architecture:**
   - သင့် app သည် ဘယ် AI ဝန်ဆောင်မှုများကို အသုံးပြုသနည်း?
   - ဘယ် compute resource များလိုအပ်သနည်း?
   - အချက်အလက်ဒေတာဘေ့စ် လိုအပ်ခြင်း ရှိသလား?
   - ဝန်ဆောင်မှုများအကြား ဘယ်လို မူတည်မှုများ ရှိသနည်း?

2. **Security Requirements:**
   - သင့် app သည် ဘယ်လို အလှည့်ကျ_sensitive data ကို ကိုင်တွယ်သနည်း?
   - ဘယ်လို လိုက်နာရမည့် compliance လိုအပ်ချက်များ ရှိသနည်း?
   - private networking လိုအပ်ပါသလား?

3. **Scaling Requirements:**
   - မျှော်မှန်းထားသည့် လုပ်ဆောင်နိုင်မှု (load) ဘယ်လောက်လဲ?
   - auto-scaling လိုအပ်ပါသလား?
   - ဒေသတွင်းလိုအပ်ချက်များ ရှိသလား?

### Step 5.2: Create Your AZD Template

**သင့် app ကို ပြောင်းလဲရန် ဤ ပုံစံကို လိုက်နာပါ:**

1. **အခြေခံ ဖွဲ့စည်းမှုကို ဖန်တီးပါ:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# AZD ပုံစံကို စတင်သတ်မှတ်သည်
azd init --template minimal
```

2. **azure.yaml ဖိုင်ကို ဖန်တီးပါ:**
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

3. **အင်ဖရာစထျက် templates များ ဖန်တီးပါ:**

**infra/main.bicep** - အဓိက template:
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

**စိန်ခေါ်မှု**: document processing AI app အတွက် AZD တမ်းပလိတ် တစ်ခု ဖန်တီးပါ။

**လိုအပ်ချက်များ:**
- အကြောင်းအရာ phân tích အတွက် Azure OpenAI
- OCR အတွက် Document Intelligence
- စာတမ်းများ upload အတွက် Storage Account
- အလုပ်လုပ်မှု လိုဂျစ်စ်အတွက် Function App
- အသုံးပြုသူ မျက်နှာပြင်အတွက် Web app

**ပိုဆုများ:**
- သင့်အား လိုက်နာရမည့် မှားယွင်းမှု ကို ထည့်သွင်းပါ
- ကုန်ကျစရိတ် ခန့်မှန်းချက် ထည့်ပါ
- စောင့်ကြည့်မှု dashboard များ သတ်မှတ်ပါ

## Module 6: Troubleshooting Common Issues

### Common Deployment Issues

#### Issue 1: OpenAI Service Quota Exceeded
**လက္ခဏာများ:** quota error ဖြင့် တပ်ဆင်မှု မအောင်မြင်ပါ
**ဖြေရှင်းချက်များ:**
```bash
# လက်ရှိ ကွိုတာများကို စစ်ဆေးပါ
az cognitiveservices usage list --location eastus

# ကွိုတာ တိုးမြှင့်ရန် တောင်းဆိုပါ သို့မဟုတ် အခြားဒေသတစ်ခုကို စမ်းကြည့်ပါ
azd env set AZURE_LOCATION westus2
azd up
```

#### Issue 2: Model Not Available in Region
**လက္ခဏာများ:** AI တုံ့ပြန်မှု မရခြင်း သို့မဟုတ် မော်ဒယ် တပ်ဆင်မှု အမှားများ ဖြစ်ပွားခြင်း
**ဖြေရှင်းချက်များ:**
```bash
# မော်ဒယ်ရရှိနိုင်မှုကို ဒေသအလိုက် စစ်ဆေးပါ
az cognitiveservices model list --location eastus

# ရရှိနိုင်သည့် မော်ဒယ်သို့ အပ်ဒိတ်လုပ်ပါ
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### Issue 3: Permission Issues
**လက္ခဏာများ:** AI ဝန်ဆောင်မှုများကို ခေါ်ဆိုရာတွင် 403 Forbidden အမှားများ
**ဖြေရှင်းချက်များ:**
```bash
# အခန်းကဏ္ဍ ခန့်အပ်ချက်များကို စစ်ဆေးပါ
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# မရှိသေးသော အခန်းကဏ္ဍများကို ထည့်ပါ
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Performance Issues

#### Issue 4: Slow AI Responses
**စုံစမ်းစရာအဆင့်များ:**
1. Application Insights တွင် performance metrics ကို စစ်ဆေးပါ
2. Azure portal တွင် OpenAI ဝန်ဆောင်မှု metrics ကို ပြန်လည်ကြည့်ပါ
3. ကွန်ရက် ဆက်သွယ်မှုနှင့် latency ကို အတည်ပြုပါ

**ဖြေရှင်းချက်များ:**
- ပုံမှန် query များအတွက် caching ကို အကောင်အထည်ဖော်ပါ
- သင့် use case အတွက် သင့်တော်သည့် OpenAI မော်ဒယ်ကို အသုံးပြုပါ
- အမြင့်တင် လုပ်ဆောင်မှုများအတွက် read replicas ကို စဉ်းစားပါ

### **Lab Exercise 6.1: Debugging Challenge**

**အခြေအနေ**: တပ်ဆင်မှု အောင်မြင်ခဲ့သော်လည်း အက်ပလီကေးရှင်းသည် 500 အမှား ပြန်လည်ပေးသည်။

**ဒက်ဘတ်ဂ် အလုပ်များ:**
1. အက်ပလီကေးရှင်း log များကို စစ်ပါ
2. ဝန်ဆောင်မှု ဆက်သွယ်နိုင်မှုကို အတည်ပြုပါ
3. authentication ကို စမ်းသပ်ပါ
4. ကော်ဖီဂရေးရှင်းကို ပြန်လည်ဆန်းစစ်ပါ

**အသုံးပြုရန် ကိရိယာများ:**
- `azd show` အတွက် တပ်ဆင်မှု အနှံ့အယှဉ် များကြည့်ရန်
- service log အသေးစိတ်အတွက် Azure portal
- အက်ပလီကေးရှင်း telemetry အတွက် Application Insights

## Module 7: Monitoring and Optimization

### Step 7.1: Set Up Comprehensive Monitoring

1. **custom dashboards ဖန်တီးပါ:**

Azure portal သို့ ဝင်ကာ dashboard တစ်ခု ဖန်တီးပါ၊ အတွင်းမှာ:
- OpenAI request count နှင့် latency
- အက်ပလီကေးရှင်း အမှားနှုန်း
- အရင်းအမြစ် အသုံးပြုမှု
- ကုန်ကျစရိတ် ထိန်းချုပ်မှု

2. **alerts ကို သတ်မှတ်ပါ:**
```bash
# အမှားနှုန်းမြင့်မှုအတွက် အသိပေးချက်
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### Step 7.2: Cost Optimization

1. **လက်ရှိ ကုန်ကျစရိတ်များကို ခွဲခြမ်းစိတ်ဖြာပါ:**
```bash
# Azure CLI ကို အသုံးပြုပြီး ကုန်ကျစရိတ် ဒေတာ ရယူပါ
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **ကုန်ကျစရိတ် ထိန်းချုပ်မှု ကို အကောင်အထည်ဖော်ပါ:**
- budget alerts သတ်မှတ်ပါ
- autoscaling အမႈများ အသုံးပြုပါ
- request caching ကို အကောင်အထည်ဖော်ပါ
- OpenAI token အသုံးပြုမှုကို စောင့်ကြည့်ပါ

### **Lab Exercise 7.1: Performance Optimization**

**တာဝန်**: သင့် AI အက်ပလီကေးရှင်းကို performance နှင့် ကုန်ကျစရိတ် နှစ်ခုလုံးအတွက် အကောင်းဆုံး ပြုစုပါ။

**တိုးတက်စေရန် metrics များ:**
- ပျမ်းမျှ တုံ့ပြန်ချိန်ကို 20% သာလျှင် လျော့ချပါ
- လစဉ် ကုန်ကျစရိတ်ကို 15% လျော့နည်းစေပါ
- 99.9% uptime ကို ထိန်းသိမ်းပါ

**စမ်းသပ်ရန် နည်းလမ်းများ:**
- တုံ့ပြန်မှု caching ကို အကောင်အထည်ဖော်ပါ
- token ထိရောက်မှု အတွက် prompts များကို အကောင်းဆုံး ဖော်ပြပါ
- သင့်တော်သည့် compute SKUs များကို အသုံးပြုပါ
- အမှန်တကယ် autoscaling ကို သတ်မှတ်ပါ

## Final Challenge: End-to-End Implementation

### Challenge Scenario

သင်အား ထုတ်လုပ်ရေးအသင့် AI စွမ်းဆောင်ရည်ရှိသော customer service chatbot တစ်ခုပြုလုပ်ရန် တာဝန်ပေးထားပါသည်။ အောက်ပါ လိုအပ်ချက်များနှင့်အတူ။

**လုပ်ဆောင်ရမည့် လိုအပ်ချက်များ:**
- ဖောက်သည်နှင့် ဆက်သွယ်ရန် web interface တစ်ခု
- ပြန်လည်ဖြေကြားချက်များအတွက် Azure OpenAI ဖြင့် ပေါင်းစည်းမှု
- Cognitive Search ကို အသုံးပြုပြီး စာရွက် ရှာဖွေရေး လုပ်နိုင်စွမ်း
- ရှိပြီးသား ဖောက်သည် ဒေတာဘေ့စ်နှင့် ပေါင်းစည်းနိုင်ရန်
- ဘာသာစကား မျိုးစုံကို ထောက်ခံနိုင်ရန်

**မလုပ်ဆောင်ပေစေသည့် လိုအပ်ချက်များ:**
- 同時 1000 user ကို ကိုင်တွယ်နိုင်ရန်
- 99.9% uptime SLA
- SOC 2 လိုက်နာမှု
- လစဉ် ကုန်ကျစရိတ် $500 အောက်
- အမျိုးမျိုးသော environment များ (dev, staging, prod) သို့ တပ်ဆင်ရန်

### Implementation Steps

1. **architecture ကို ဒီဇိုင်းဆွဲပါ**
2. **AZD template を ဖန်တီးပါ**
3. **လုံခြုံရေးမေးခွန်းများကို အကောင်အထည်ဖော်ပါ**
4. **စောင့်ကြည့်မှုနှင့် သတိပေးချက်များ စီမံပါ**
5. **တပ်ဆင်မှု pipeline များ ဖန်တီးပါ**
6. **ဖြေရှင်းချက်ကို စာရွက်ပြုစုပါ**

### Evaluation Criteria

- ✅ **Functionality**: အားလုံးလိုအပ်ချက်များ ဖြည့်ဆည်းနေသလား?
- ✅ **Security**: အကောင်းဆုံးလမ်းညွှန်ချက်များကို ထည့်သွင်းထားသလား?
- ✅ **Scalability**: လုပ်အားကိုင်နိုင်သလား?
- ✅ **Maintainability**: ကုဒ်နှင့် အင်ဖရာစထျက် စနစ် များ အဖွဲ့အစည်းကောင်းမွန်သလား?
- ✅ **Cost**: အားလုံးကို ထိန်းသိမ်းပြီး ဘတ်ဂျက်အတွင်း ရှိသလား?

## Additional Resources

### Microsoft Documentation
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Azure OpenAI Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### Sample Templates
- [Azure OpenAI Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Community Resources
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 ပြီးမြောက်လက်မှတ်
ဂုဏ်ယူပါတယ်! သင်သည် AI Workshop Lab ကိုပြီးစီးလိုက်ပြီ။ ယခုတွင် သင် အောက်ပါအရာများကို ပြုလုပ်နိုင်ပါပြီ:

- ✅ ရှိပြီးသား AI အက်ပ်လီကေးရှင်းများကို AZD template များအဖြစ် ပြောင်းလဲနိုင်သည်
- ✅ ထုတ်လုပ်မှုအဆင့် သင့် AI အက်ပ်များကို တပ်ဆင်နိုင်သည်
- ✅ AI လုပ်ငန်းများအတွက် လုံခြုံရေး အကောင်းဆုံး လုပ်နည်းများကို အကောင်အထည်ဖော်နိုင်သည်
- ✅ AI အက်ပ်၏ ဖျော်ဖြေရေးနှင့် လုပ်ဆောင်နိုင်မှုပေါ်ကို စောင့်ကြည့်ပြီး အဆင်ပြေမှုကို မြှင့်တင်နိုင်သည်
- ✅ ရိုးရှင်း၍ တွေ့ရသည့် တပ်ဆင်မှု ပြဿနာများကို ဖြေရှင်းနိုင်သည်

### နောက်ဆင့်များ
1. ဤပုံစံများကို သင့်ကိုယ်ပိုင် AI ပရောဂျက်များတွင် အသုံးချပါ
2. ပုံစံများကို အသိုင်းအဝိုင်းထံ အပ်နှင်းပါ
3. ဆက်လက် အထောက်အပံ့အတွက် Microsoft Foundry Discord တွင် ပူးပေါင်းပါ
4. ဒေသအများအပြားတွင် တပ်ဆင်ခြင်းစသည့် အဆင့်မြင့် ခေါင်းစဉ်များကို လေ့လာပါ

---

**Workshop Feedback**: ဤ workshop ကို ပိုမိုကောင်းမွန်စေရန် သင့်အတွေ့အကြုံကို [Microsoft Foundry Discord #Azure ချန်နယ်](https://discord.gg/microsoft-azure) တွင် မျှဝေ၍ ကူညီပါ။

---

**အခန်း လမ်းကြောင်း:**
- **📚 Course Home**: [AZD စတင်သူများအတွက်](../../README.md)
- **📖 Current Chapter**: အခန်း ၂ - AI-ဦးစားပေး ဖွံ့ဖြိုးရေး
- **⬅️ Previous**: [AI မော်ဒယ် တပ်ဆင်ခြင်း](ai-model-deployment.md)
- **➡️ Next**: [ထုတ်လုပ်မှု အဆင့် AI အတွက် အကောင်းဆုံး လုပ်နည်းများ](production-ai-practices.md)
- **🚀 Next Chapter**: [အခန်း ၃: ဖွဲ့စည်းမှု](../chapter-03-configuration/configuration.md)

**အကူအညီ လိုပါသလား?** AZD နှင့် AI တပ်ဆင်မှုများဆိုင်ရာ အထောက်အပံ့နှင့် ဆွေးနွေးရန် ကျွန်တော်တို့၏ အသိုင်းအဝိုင်းထဲသို့ လက်လှမ်းမီပါ။

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**သတိပေးချက်**:
ဤစာရွက်စာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ဖြင့် ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှန်ကန်မှုအတွက် ကြိုးစားပေမယ့် အလိုအလျောက် ဘာသာပြန်ချက်များတွင် အမှားများ သို့မဟုတ် တိကျမှုချို့ယွင်းမှုများ ရှိနိုင်သည်ကို သတိပြုပါ။ မူရင်းစာရွက်စာတမ်းကို မူရင်းဘာသာဖြင့်သာ အာဏာပိုင် အရင်းအမြစ်အဖြစ် သတ်မှတ်ရပါမည်။ အရေးကြီးသော အချက်အလက်များအတွက် ပရော်ဖက်ရှင်နယ် လူသား ဘာသာပြန်ကို အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုခြင်းကြောင့် ဖြစ်ပေါ်နိုင်သည့် နားမလည်မှုများ သို့မဟုတ် မမှန်ကန်မှုများအတွက် ကျွန်ုပ်တို့သည် တာဝန်မယူပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->