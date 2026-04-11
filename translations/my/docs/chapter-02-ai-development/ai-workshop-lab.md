# AI Workshop Lab: သင့် AI ဖြေရှင်းချက်များကို AZD ဖြင့် တပ်ဆင်နိုင်အောင်

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 2 - AI-First Development
- **⬅️ Previous**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Next**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 Next Chapter**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

## Workshop Overview

ဤလက်တွေ့လုပ်ငန်းခွင်လက်ဖျာသည် ဖန်တီးသူများအား ရှိပြီးသား AI အက်ပလီကေးရှင်းတစ်ခုကို Azure Developer CLI (AZD) အသုံးပြု၍ တပ်ဆင်ခြင်းလုပ်ငန်းစဉ်ကို လမ်းပြပေးပါသည်။ Microsoft Foundry ဝန်ဆောင်မှုများကို အသုံးပြု၍ production အဆင့် AI တပ်ဆင်မှုများအတွက် အဓိကနည်းပညာပုံစံများကို သင်ယူနိုင်ပါလိမ့်မယ်။

> **သတိပေးချက် (2026-03-25):** ဤ workshop ကို `azd` `1.23.12` နှင့် မျှတစွာ စိစစ်ပြီးဖြစ်သည်။ သင့်ဒေသရှိ ထည့်သွင်းထားသော AZD ဗားရှင်းသည် အဟောင်းဖြစ်ပါက စတင်မလုပ်မီ AZD ကို အပ်ဒိတ်လုပ်ပါ။ ထို့ဖြင့် authentication, template နှင့် deployment လည်ပတ်ပုံသည် အောက်တွင်ဖော်ပြပါ အဆင့်များနှင့် ကိုက်ညီပါမည်။

**Duration:** 2-3 hours  
**Level:** Intermediate  
**Prerequisites:** Azure အခြေခံ သိမြင်မှု, AI/ML အယူအဆများနှင့် ပတ်သက်သော အခြေခံ သိမြင်မှု

## 🎓 Learning Objectives

ဤ workshop အဆုံးသတ်သောအခါ သင်အောက်ပါအရာများကို ဆောင်ရွက်နိုင်လိမ့်မည် -
- ✅ ရှိပြီးသား AI အက်ပလီကေးရှင်းကို AZD template များသို့ ပြောင်းလဲနိုင်မည်
- ✅ AZD ဖြင့် Microsoft Foundry ဝန်ဆောင်မှုများကို ဖွဲ့စည်းနိုင်မည်
- ✅ AI ဝန်ဆောင်မှုများအတွက် လုံခြုံစိတ်ချစေသော credential များကို စီမံထိန်းသိမ်းနိုင်မည်
- ✅ မျက်နှာပြင်ကြောင့် အထွေထွေစောင့်ကြည့်မှုနှင့်အတူ production-ready AI apps တပ်ဆင်နိုင်မည်
- ✅ AI deployment များတွင် လူသုံးများကြုံတွေ့သည့်ပြဿနာများကိုဖြေရှင်းနိုင်မည်

## Prerequisites

### Required Tools
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) ထည့်သွင်းထားရမည်
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) ထည့်သွင်းထားရမည်
- [Git](https://git-scm.com/) ထည့်သွင်းထားရမည်
- ကုဒ် အယ်ဒီတာ (VS Code အကြံပြု)

### Azure Resources
- contributor access ပါသော Azure subscription
- Microsoft Foundry Models ဝန်ဆောင်မှုများသို့ access (သို့မဟုတ် access တောင်းနိုင်စွမ်း)
- Resource group ဖန်တီးခွင့်ရှိရမည်

### Knowledge Prerequisites
- Azure ဝန်ဆောင်မှုများအကြောင်း အခြေခံ နားလည်မှု
- command-line interface များနှင့် 친숙မှု
- AI/ML အခြေခံ အယူအဆများ (API များ၊ မော်ဒယ်များ၊ prompts)

## Lab Setup

### Step 1: Environment Preparation

1. **Verify tool installations:**
```bash
# AZD ထည့်သွင်းမှုကို စစ်ဆေးပါ
azd version

# Azure CLI ကို စစ်ဆေးပါ
az --version

# AZD လုပ်ငန်းစဉ်များအတွက် Azure သို့ လော့ဂ်အင် ဝင်ပါ
azd auth login

# diagnostics အတွင်း az command များကို အသုံးပြုရန် ရည်ရွယ်ထားပါကသာ Azure CLI သို့ လော့ဂ်အင် ဝင်ပါ
az login
```

တစ်ချို့ tenant များတွင် အလုပ်လုပ်မည်ဆိုပါက သို့မဟုတ် subscription ကို အလိုအလျောက် တွေ့ရှိမရပါက `azd auth login --tenant-id <tenant-id>` ဖြင့် ထပ်မံ login ဝင်ကြည့်ပါ။

2. **Clone the workshop repository:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Module 1: AI အက်ပလီကေးရှင်းများအတွက် AZD ဖွဲ့စည်းပုံ နားလည်ခြင်း

### Anatomy of an AI AZD Template

AI အတွက် အသင့်ရှိသော AZD template တစ်ခုတွင် အဓိက ဖိုင်များကို လေ့လာပါ။

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

### **Lab Exercise 1.1: စီမံခန့်ခွဲမှု ဖိုင်များကို စူးစမ်းပါ**

1. **azure.yaml ဖိုင်ကို ကြည့်ပါ:**
```bash
cat azure.yaml
```

**ဖော်ထုတ်ရန် အချက်များ:**
- AI ကွန်ပိုနင့်များအတွက် service အဓိကဖေါ်ပြချက်များ
- ပတ်ဝန်းကျင် အလျှောက်တန်းတွေ (environment variable) များ၏ မျက်နှာပြင် ပြ(mapping)
- Host ဖွဲ့စည်းပုံများ

2. **main.bicep အဓိက အခြေခံကို ပြန်လည်သုံးသပ်ပါ:**
```bash
cat infra/main.bicep
```

**ရှာဖွေရမည့် အဓိက AI ပုံစံများ:**
- Microsoft Foundry Models ဝန်ဆောင်မှု သတ်မှတ်ပေးခြင်း
- Cognitive Search အထောက်အပံ့ ပေါင်းစည်းခြင်း
- လုံခြုံစိတ်ချစေသော key စီမံခန့်ခွဲမှု
- ကွန်ယက် လုံခြုံရေး ဖွဲ့စည်းပုံများ

### **ဆွေးနွေးရန် အချက်**: ဤပုံစံများက AI အတွက် အရေးကြီးသည့် အကြောင်းရင်း

- **Service Dependencies**: AI အက်ပလီကေးရှင်းများသည် မျိုးစုံ ဝန်ဆောင်မှုများ လိုအပ်လေ့ရှိသည်
- **လုံခြုံရေး**: API key များ နှင့် endpoint များကို လုံခြုံစိတ်ချစွာ စီမံရပါမည်
- **ချဲ့ထွင်နိုင်စွမ်း**: AI အလုပ်ပမာဏများတွင် အထူးချဲ့ထွင်မှု လိုအပ်ချက်များ ရှိသည်
- **ကုန်ကျစရိတ် စီမံခန့်ခွဲမှု**: မလုံလောက်စွာစီမံမထားပါက AI ဝန်ဆောင်မှုများသည် အလွန်တန်ဖိုးမြင့်တတ်သည်

## Module 2: သင့်ပထမဆုံး AI အက်ပလီကေးရှင်းကို တပ်ဆင်ခြင်း

### Step 2.1: ပတ်ဝန်းကျင် စတင်ပြင်ဆင်ခြင်း

1. **AZD ပတ်ဝန်းကျင် အသစ်ကို ဖန်တီးပါ:**
```bash
azd env new myai-workshop
```

2. **လိုအပ်သော အပြောင်းအလဲများကို သတ်မှတ်ပါ:**
```bash
# သင့်နှစ်သက်ရာ Azure ဒေသကို သတ်မှတ်ပါ
azd env set AZURE_LOCATION eastus

# ရွေးချယ်စရာ: သီးသန့် OpenAI မော်ဒယ်ကို သတ်မှတ်ပါ
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### Step 2.2: အင်ဖရာနှင့် အက်ပလီကေးရှင်း တပ်ဆင်ခြင်း

1. **AZD ဖြင့် တပ်ဆင်ပါ:**
```bash
azd up
```

**`azd up` လုပ်ဆောင်ချိန်တွင် ဖြစ်ပေါ်ပုံများ:**
- ✅ Microsoft Foundry Models ဝန်ဆောင်မှု ကို provision ပြုလုပ်သည်
- ✅ Cognitive Search ဝန်ဆောင်မှုကို ဖန်တီးသည်
- ✅ ဝဘ်အက်ပလီကေးရှင်းအတွက် App Service တစ်ခု စီတည်ဆောက်သည်
- ✅ ကွန်ယက်နှင့် လုံခြုံရေး ကို ဖွဲ့စည်းပေးသည်
- ✅ အက်ပလီကေးရှင်း ကုတ်ကို တပ်ဆင်ပါသည်
- ✅ စောင့်ကြည့်မှုနှင့် log များကို စနစ်တကျ စတင်တပ်ဆင်သည်

2. **တပ်ဆင်ရေး တိုးတက်မှုကို စောင့်ကြည့်ပါ** နှင့် ဖန်တီးနေသည့် resources များကို မှတ်သားပါ။

### Step 2.3: သင့်တပ်ဆင်မှုကို စစ်ဆေးပါ

1. **တပ်ဆင်ပြီးသော resources များကို ကြည့်ပါ:**
```bash
azd show
```

2. **တပ်ဆင်ပြီးသော အက်ပလီကေးရှင်းကို ဖွင့်ပါ:**
```bash
azd show
```

`azd show` ထုတ်လွှင့်ချက်တွင် ပြထားသော web endpoint ကို ဖွင့်ကြည့်ပါ။

3. **AI လုပ်ဆောင်ချက်များကို စမ်းသပ်ပါ:**
   - ဝဘ်အက်ပလီကေးရှင်းသို့ သွားပါ
   - နမူနာ မေးခွန်းများကို စမ်းကြည့်ပါ
   - AI ဖြေကြားချက်များ အလုပ်လုပ်နေသည်ကို အတည်ပြုပါ

### **Lab Exercise 2.1: မှားယွင်းချက် ရှာဖွေရေး လေ့ကျင့်ခန်း**

**အခြေအနေ**: မင်းတပ်ဆင်မှုအောင်မြင်သော်လည်း AI က တုံ့ပြန်မှု မပေးလျှင်။

**ပုံမှန် ကြုံတွေ့သော ပြဿနာများကို စစ်ဆေးရန်:**
1. **OpenAI API keys**: မှန်ကန်စွာ သတ်မှတ်ထားသည်ကို အတည်ပြုပါ
2. **Model availability**: သင်၏ဒေသတွင် မော်ဒယ်၏ ပံ့ပိုးမှုရှိ/မရှိ စစ်ဆေးပါ
3. **Network connectivity**: ဝန်ဆောင်မှုများ သုံးသပ် ဆက်သွယ်နိုင်မှုရှိကြောင်း သေချာပါစေ
4. **RBAC permissions**: အက်ပလီကေးရှင်းမှ OpenAI သို့ ဝင်ရောက်ခွင့်ရှိသည်ကို စစ်ဆေးပါ

**ဒစ်ဘတ်ဂ်အမိန့်များ:**
```bash
# ပတ်ဝန်းကျင်အပြောင်းအလဲတန်ဖိုးများကို စစ်ဆေးပါ
azd env get-values

# တပ်ဆင်မှု မှတ်တမ်းများကို ကြည့်ပါ
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# OpenAI တပ်ဆင်မှု အခြေအနေကို စစ်ဆေးပါ
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Module 3: သင့်လိုအပ်ချက်အတွက် AI အက်ပလီကေးရှင်းများကို စိတ်ကြိုက် ပြင်ဆင်ရေး

### Step 3.1: AI ဖော်ပြချက်ကို ပြင်ဆင်ခြင်း

1. **OpenAI မော်ဒယ်ကို အပ်ဒိတ်လုပ်ပါ:**
```bash
# သင့်ဒေသတွင် ရနိုင်ပါက အခြားမော်ဒယ်သို့ ပြောင်းပါ
azd env set AZURE_OPENAI_MODEL gpt-4.1

# ဖွဲ့စည်းမှုအသစ်ဖြင့် ပြန်လည်တင်ပါ
azd deploy
```

2. **ထပ်မံ AI ဝန်ဆောင်မှုများ ထည့်ပါ:**

Document Intelligence ထည့်ရန် infra/main.bicep ကို တည်းဖြတ်ပါ။

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

### Step 3.2: ပတ်ဝန်းကျင် အလိုက် သတ်မှတ်ချက်များ

**အကောင်းဆုံး လေ့ကျင့်မှု**: ဖွံ့ဖြိုးမှုနှင့် production အတွက် ကွဲပြားသော configuration များ ထားရှိပါ။

1. **production environment တစ်ခု ဖန်တီးပါ:**
```bash
azd env new myai-production
```

2. **production အတွက် သီးသန့် parameter များ သတ်မှတ်ပါ:**
```bash
# ထုတ်လုပ်မှုတွင် ပုံမှန်အားဖြင့် အဆင့်မြင့် SKU များကို အသုံးပြုကြသည်
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# အပိုလုံခြုံရေး လုပ်ဆောင်ချက်များကို ဖွင့်ပါ
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Lab Exercise 3.1: ကုန်ကျစရိတ် တိကျစေရေး**

**စိန်ခေါ်မှု**: ဖွံ့ဖြိုးရေးအတွက် ကုန်ကျစရိတ် သက်သာစေသော template ကို ပြင်ဆင်ပါ။

**တာဝန်များ:**
1. နည်းဆုံး ကုန်ကျစရိတ်အဆင့်များသို့ ပြောင်းနိုင်သော SKU များကို ဖော်ထုတ်ပါ
2. အနည်းဆုံးကုန်ကျစရိတ်အတွက် ပတ်ဝန်းကျင် အလျှောက်တန်းများကို သတ်မှတ်ပါ
3. တပ်ဆင်ပြီး production configuration နှင့် ကုန်ကျစရိတ်ကို နှိုင်းယှဉ်ပါ

**ဖြေရှင်းရန် အကြံပြုချက်များ:**
- Cognitive Services တွင် F0 (free) tier ကို သင့်လျော်လျှင် အသုံးပြုပါ
- Search Service အတွက် ဖွံ့ဖြိုးရေးတွင် Basic tier အသုံးပြုပါ
- Functions အတွက် Consumption plan ကို စဉ်းစားပါ

## Module 4: လုံခြုံရေးနှင့် Production အကောင်းဆုံး လေ့ကျင့်မှုများ

### Step 4.1: သတင်းအချက်အလက် လုံခြုံစွာ စီမံခြင်း

**လက်ရှိ စိန်ခေါ်မှု**: အများအပြား AI အက်ပလီကေးရှင်းများသည် API key များကို hardcode ထားသည် သို့မဟုတ် လုံခြုံမဟုတ်သော သိမ်းဆည်းမှုကို အသုံးပြုသည်။

**AZD ဖြေရှင်းချက်**: Managed Identity + Key Vault ပေါင်းစပ်ခြင်း။

1. **သင့် template အတွင်း လုံခြုံရေး ဖော်ပြချက်ကို ပြန်လည်သုံးသပ်ပါ:**
```bash
# Key Vault နှင့် Managed Identity ဆက်တင်များကို ရှာပါ
grep -r "keyVault\|managedIdentity" infra/
```

2. **Managed Identity အလုပ်လုပ်ဆောင်မှုကို အတည်ပြုပါ:**
```bash
# ဝက်ဘ်အက်ပ်တွင် မှန်ကန်သော အသိအမှတ်ပြု ဖွဲ့စည်းမှု သတ်မှတ်ထားပါသလား စစ်ဆေးပါ
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Step 4.2: ကွန်ယက် လုံခြုံရေး

1. **private endpoints ကို ဖွင့်ပါ** (မပုံသေ၍ ဖြစ်ပါက):

သင့် bicep template တွင် ထည့်သွင်းပါ:
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

### Step 4.3: စောင့်ကြည့်မှုနှင့် ဖော်ထုတ်နိုင်မှု

1. **Application Insights ကို ပြင်ဆင်ပါ:**
```bash
# Application Insights ကို အလိုအလျောက် ဖွဲ့စည်းထားသင့်သည်
# ဖွဲ့စည်းမှုကို စစ်ဆေးပါ:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **AI အတွက် အထူး စောင့်ကြည့်မှုများ ဆက်တင်ပါ:**

AI လုပ်ဆောင်ချက်များအတွက် custom metrics များ ထည့်သွင်းပါ:
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

### **Lab Exercise 4.1: လုံခြုံရေး စစ်ဆေးခြင်း**

**တာဝန်**: သင်၏တပ်ဆင်မှုကို လုံခြုံရေး အကောင်းဆုံး လေ့ကျင့်မှုများအရ ပြန်လည်သုံးသပ်ပါ။

**စာရင်းစစ်ချက်များ:**
- [ ] ကုတ် သို့မဟုတ် configuration တွင် hardcoded secrets မရှိရ
- [ ] Managed Identity ကို service-to-service authentication အတွက် အသုံးပြုထားရ
- [ ] Key Vault တွင်-sensitive configuration များ သိမ်းဆည်းထားရ
- [ ] ကွန်ယက် ဝင်ရောက်ခြင်းကို သတ်မှတ်ထားရ
- [ ] စောင့်ကြည့်မှုနှင့် logging များ ဖြစ်အောင်ထားရ

## Module 5: သင့်ကိုယ်ပိုင် AI အက်ပလီကေးရှင်းကို ပြောင်းလဲခြင်း

### Step 5.1: အကဲဖြတ် အလုပ်ပြု စာရွက်

**သင့် app ကို ပြောင်းလဲမည်မတိုင်မီ**, ဤမေးခွန်းများကို ဖြေပါ။

1. **Application Architecture:**
   - သင့် app သည် ဘယ် AI ဝန်ဆောင်မှုများကို အသုံးပြုသနည်း?
   - ဘယ် compute အရင်းအမြစ်များ လိုအပ်သနည်း?
   - ဒေတာဘေ့စ် လိုအပ်သလား?
   - ဝန်ဆောင်မှုများအကြား ကိုယ်ပိုင် ပေါင်းသင်းမှုများ ရှိသလား?

2. **Security Requirements:**
   - သင့် app သည် မည်မျှ sensitive ဒေတာ ကို ကိုင်တွယ်သနည်း?
   - မည်သည့် compliance လိုအပ်ချက်များ ရှိသနည်း?
   - private networking လိုအပ်ပါသလား?

3. **Scaling Requirements:**
   - မျှော်မှန်းထားသော သွင်းသုံးပမာဏ (load) ဘယ်လောက်လဲ?
   - auto-scaling လိုအပ်သလား?
   - တိုင်းဒေသဆိုင်ရာ လိုအပ်ချက်များ ရှိသလား?

### Step 5.2: သင့် AZD Template ကို ဖန်တီးပါ

**သင့် app ကို ပြောင်းလဲရန် ဤပုံစံကို နှိုင်းယှဉ်လိုက်နာပါ:**

1. **အခြေခံ ဖွဲ့စည်းပုံကို ဖန်တီးပါ:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# AZD နမူနာကို စတင်တည်ဆောက်ပါ
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

3. **အင်ဖရာ ထွက်ပုံများကို ဖန်တီးပါ:**

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

### **Lab Exercise 5.1: Template ဖန်တီးခြင်း စိန်ခေါ်မှု**

**စိန်ခေါ်မှု**: စာရွက်စာတမ်း ကြော်ငြာပြုပြင်ဆင်ရေး (document processing) အတွက် AZD template တစ်ခု ဖန်တီးပါ။

**လိုအပ်ချက်များ:**
- Microsoft Foundry Models သည် အကြောင်းအရာသုံးသပ်မှုအတွက်
- Document Intelligence သည် OCR အတွက်
- စာရွက်များ တင်ရန် Storage Account
- ပြုလုပ်ချက်များအတွက် Function App
- အသုံးပြုသူ မျက်နှာပြင်အတွက် Web app

**အပိုဆုအမှတ်:**
- မှားယွင်းမှု ကိုင်တွယ်မှု သေချာစေရန် ထည့်ပါ
- ကုန်ကျစရိတ် ခန့်မှန်းမှု ထည့်ပါ
- စောင့်ကြည့်မှု dashboard များကို တပ်ဆင်ပါ

## Module 6: လူသုံးများ ကြုံတွေ့သော ပြဿနာများ ရှာဖွေခြင်း

### Common Deployment Issues

#### Issue 1: OpenAI Service Quota ထက် ပိုမားခြင်း
**လက္ခဏာများ:** quota error ဖြင့် deployment မအောင်မြင်
**ဖြေရှင်းနည်းများ:**
```bash
# လက်ရှိ အရေအတွက် ကန့်သတ်ချက်များကို စစ်ဆေးပါ
az cognitiveservices usage list --location eastus

# ကန့်သတ်ချက်များ တိုးမြှင့်ရန် တောင်းဆိုပါ သို့မဟုတ် အခြားဒေသကို စမ်းကြည့်ပါ
azd env set AZURE_LOCATION westus2
azd up
```

#### Issue 2: မော်ဒယ်ကို ဒေသတွင် မရရှိနိုင်ခြင်း
**လက္ခဏာများ:** AI တုံ့ပြန်ချက်များ မလုပ်ခြင်း သို့မဟုတ် မော်ဒယ် တပ်ဆင်မှု error
**ဖြေရှင်းနည်းများ:**
```bash
# ဒေသအလိုက် မော်ဒယ် ရရှိနိုင်မှုကို စစ်ဆေးပါ
az cognitiveservices model list --location eastus

# ရရှိနိုင်သည့် မော်ဒယ်သို့ ပြောင်းပါ
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### Issue 3: ခွင့်ပြုချက် ပြဿနာများ
**လက္ခဏာများ:** AI ဝန်ဆောင်မှုများကို ခေါ်စဉ် 403 Forbidden error
**ဖြေရှင်းနည်းများ:**
```bash
# တာဝန်ခန့်အပ်ချက်များကို စစ်ပါ
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# မပါသေးသော တာဝန်များကို ထည့်ပါ
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### စွမ်းဆောင်ရည် ပြဿနာများ

#### Issue 4: AI တုံ့ပြန်မှု များ နောက်ကျသည်
**စစ်ဆေးရန် အဆင့်များ:**
1. Application Insights တွင် စွမ်းဆောင်ရည် မက်ထရစ်များကို စစ်ဆေးပါ
2. Azure portal တွင် OpenAI ဝန်ဆောင်မှု မက်ထရစ်များကို ပြန်လည်ကြည့်ပါ
3. ကွန်ယက် ဆက်သွယ်မှုနှင့် latency ကို စစ်ဆေးပါ

**ဖြေရှင်းနည်းများ:**
- အကြိမ်တွေ့သော မေးခွန်းများအတွက် caching ကို ကတိထားပါ
- သင်၏ အသုံးနည်းအတွက် သင့်လျော်သော OpenAI မော်ဒယ်ကို အသုံးပြုပါ
- ပမာဏမြင့် load များအတွက် read replicas ကို စဥ်းစားပါ

### **Lab Exercise 6.1: ဒစ်ဘတ်ဂ် စိန်ခေါ်မှု**

**အခြေအနေ**: သင်၏တပ်ဆင်မှု အောင်မြင်ခဲ့သော်လည်း၊ အက်ပလီကေးရှင်းမှ 500 error ပြန်လာပါသည်။

**ဒစ်ဘတ်ဂ် တာဝန်များ:**
1. အက်ပလီကေးရှင်း logs များကို စစ်ဆေးပါ
2. ဝန်ဆောင်မှု ဆက်သွယ်နိုင်မှုကို အတည်ပြုပါ
3. authentication ကို စမ်းသပ်ပါ
4. configuration ကို ပြန်လည်သုံးသပ်ပါ

**အသုံးပြုရန် ကိရိယာများ:**
- deployment အကျဉ်းချုပ်အတွက် `azd show`
- ဝန်ဆောင်မှုအသေးစိတ် log များအတွက် Azure portal
- အက်ပလီကေးရှင်း telemetry အတွက် Application Insights

## Module 7: စောင့်ကြည့်မှုနှင့် တိုးတက်စေရေး

### Step 7.1: စုစုပေါင်း စောင့်ကြည့်မှု တပ်ဆင်ပါ

1. **custom dashboards ဖန်တီးပါ:**

Azure portal သို့ သွားပြီး ဒီရှ်ဘုတ် တစ်ခုဖန်တီးပါ၊ အောက်ပါအရာများ ပါဝင်စေရမည် -
- OpenAI request count နှင့် latency
- အက်ပလီကေးရှင်း error အနှုန်း
- အရင်းအမြစ် အသုံးပြုမှု
- ကုန်ကျစရိတ် ခံယူမှု

2. **အချက်ထုတ်ချက်(alerts) များ ကို စတင်သတ်မှတ်ပါ:**
```bash
# အမှားနှုန်းမြင့်မှုအတွက် သတိပေးချက်
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### Step 7.2: ကုန်ကျစရိတ် တိကျစေရေး

1. **လက်ရှိ ကုန်ကျစရိတ်များကို ခွဲခြမ်းစစ်ဆေးပါ:**
```bash
# ကုန်ကျစရိတ် ဒေတာများကို ရယူရန် Azure CLI ကို အသုံးပြုပါ
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **ကုန်ကျစရိတ် ထိန်းချုပ်မှုများကို အကောင်အထည်ဖော်ပါ:**
- ဘတ်ဂျက် အစီရင်ခံချက် အချက်ပေးချက်များ ထည့်ပါ
- autoscaling မူဝါဒများ အသုံးပြုပါ
- request caching ကို အကောင်အထည်ဖော်ပါ
- OpenAI token အသုံးသည့် အတိုင်းအတာကို စောင့်ကြည့်ပါ

### **Lab Exercise 7.1: စွမ်းဆောင်မှု အောင်မြင်အောင် ပြုပြင်ခြင်း**

**တာဝန်**: စွမ်းဆောင်မှုနှင့် ကုန်ကျစရိတ်နှစ်ခုလုံးအတွက် သင့် AI အက်ပလီကေးရှင်းကို အကောင်းဆုံးလုပ်ပါ။

**တိုးတက်စေရမည့် မက်ထရစ်များ:**
- ပျမ်းမျှ တုံ့ပြန်ချိန်ကို 20% ကန့်သတ်ချော်
- လစဉ် ကုန်ကျစရိတ်ကို 15% လျော့ချပါ
- 99.9% uptime ထိန်းသိမ်းပါ

**စမတ်နည်းလမ်းများ:**
- တုံ့ပြန်ချက် caching ကို အကောင်အထည်ဖော်ပါ
- token ထိရောက်မှုအတွက် prompts များကို တိုးတက်စေပါ
- သင့်လျော်သော compute SKU များကို အသုံးပြုပါ
- autoscaling ကို သေချာသတ်မှတ်ပါ

## Final Challenge: အစမှအဆုံး အကောင်အထည်ဖော်ခြင်း

### Challenge Scenario

သင့်တာဝန်မှာ production-ready AI အားဖြင့် ဖောက်သည်ဝန်ဆောင်မှု chatbot တစ်ခုကို ဖန်တီးရမည်။

**လုပ်ဆောင်ရမည့် လုပ်ငန်းလိုအပ်ချက်များ:**
- ဖောက်သည် အပြန်အလှန် ဆက်သွယ်နိုင်ရန် ဝဘ် မျက်နှာပြင်
- Microsoft Foundry Models ဖြင့် တုံ့ပြန်ချက်များ ပေးစွမ်းခြင်း
- Cognitive Search ဖြင့် စာရွက်ရှာဖွေရေး လုပ်ဆောင်ချက်
- ရှိပြီးသား ဖောက်သည်ဒေတာဘေ့စ်နှင့် ပေါင်းစည်းမှု
- ဘာသာစကား မျိုးစုံ ထောက်ပံ့မှု

**လုပ်ဆောင်သင့်သော မဟာဗျူဟာလိုအပ်ချက်များ:**
- 1000 concurrent user ကို ကိုင်တွယ်နိုင်ရန်
- 99.9% uptime SLA
- SOC 2 compliance
- $500/လ ထက် နည်းသော ကုန်ကျစရိတ်
- မျိုးစုံပတ်ဝန်းကျင်များသို့ (dev, staging, prod) တပ်ဆင်နိုင်မှု

### Implementation Steps

1. မဟာဗျူဟာ ဒီဇိုင်းချပါ
2. AZD template ကို ဖန်တီးပါ
3. လုံခြုံရေး နည်းလမ်းများကို အကောင်အထည်ဖော်ပါ
4. စောင့်ကြည့်မှုနှင့် အချက်ပေးမှုများကို သတ်မှတ်ပါ
5. deployment pipeline များ ဖန်တီးပါ
6. ဖြေရှင်းချက်ကို စာတမ်းတင်ပါ

### အကဲဖြတ်ခြာများ

- ✅ **Functionality**: မလိုအပ်ချက်အားလုံး ဖြည့်ဆည်းနိုင်ပါသလား?
- ✅ **Security**: အကောင်းဆုံး လုံခြုံရေး လေ့ကျင့်မှုများ ထည့်သွင်းထားပါသလား?
- ✅ **Scalability**: ထိုလမ်းဖြင့် စွမ်းဆောင်နိုင်ပါသလား?
- ✅ **Maintainability**: ကုတ်နှင့် အင်ဖရာ ကို စုပေါင်း သတ်မှတ်ထားသလား?
- ✅ **Cost**: ဘတ်ဂျက်အတွင်းထားနိုင်ပါသလား?

## Additional Resources

### Microsoft Documentation
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### Sample Templates
- [Microsoft Foundry Models Chat အက်ပ်](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat အက်ပ် အမြန်စတင်လမ်းညွှန်](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### အသိုင်းအဝိုင်း အရင်းအမြစ်များ
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 ပြီးမြောက်လက်မှတ်

ဂုဏ်ယူပါ! သင်သည် AI Workshop Lab ကို ပြီးမြောက်လိုက်ပြီ။ ယခုအချိန်တွင် သင်အောက်ပါ အရာများကို ပြုလုပ်နိုင်ရမည်။

- ✅ လက်ရှိ AI အက်ပလီကေးရှင်းများကို AZD စံနမူနာများအဖြစ် ပြောင်းလဲနိုင်သည်
- ✅ ထုတ်လုပ်ရေးအဆင့်သင့် AI အက်ပလီကေးရှင်းများကို တပ်ဆင်နိုင်သည်
- ✅ AI အလုပ်ပေါ်များအတွက် လုံခြုံရေးအကောင်းဆုံး လေ့ကျင့်မှုများကို အကောင်အထည်ဖော်နိုင်သည်
- ✅ AI အက်ပလီကေးရှင်း၏ လုပ်ဆောင်ချက်ကို စောင့်ကြည့်ပြီး ဖြန့်ချိမှုကို တိုးတက်အောင် ပြင်ဆင်နိုင်သည်
- ✅ ဖြန့်ချိမှုဆိုင်ရာ လူသုံးများကြုံကြုံတွေ့တွေ့ ပြဿနာများကို ဖြေရှင်းနိုင်သည်

### နောက်တစ်ဆင့်များ
1. ဤပုံစံများကို သင်၏ ကိုယ်ပိုင် AI ပရောဂျက်များတွင် အသုံးပြုပါ
2. နမူနာများကို အသိုင်းအဝိုင်းထံ ပြန်လည်ထည့်သွင်းပါ
3. ဆက်လက်ထောက်ပံ့မှုအတွက် Microsoft Foundry Discord သို့ ပူးပေါင်းပါ
4. ဒေသစုံဖြန့်ချိခြင်းကဲ့သို့တိုးတက်သောခေါင်းဆောင်အကြောင်းအရာများကို လေ့လာပါ

---

**Workshop Feedback**: ကျွန်ုပ်တို့ကို ဒီသင်တန်းကို တိုးတက်အောင် ကူညီပေးရန် သင့်အတွေ့အကြုံကို [Microsoft Foundry Discord #Azure ချန်နယ်](https://discord.gg/microsoft-azure) တွင် မျှဝေပါ။

---

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: အခန်း 2 - AI- ပထမ ဦး ဆောင် ဖွံ့ဖြိုးရေး
- **⬅️ Previous**: [AI မော်ဒယ် ဖြန့်ချိခြင်း](ai-model-deployment.md)
- **➡️ Next**: [ထုတ်လုပ်ရေး AI အကောင်းဆုံး လေ့ကျင့်မှုများ](production-ai-practices.md)
- **🚀 Next Chapter**: [အခန်း 3: ဖွဲ့စည်းမှု](../chapter-03-configuration/configuration.md)

**Help လိုပါသလား?** AZD နှင့် AI ဖြန့်ချိမှုများဆိုင်ရာ အထောက်အပံ့နှင့် ဆွေးနွေးရန် အသိုင်းအဝိုင်းတွင် ပါဝင်ပါ။

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
ဤစာရွက်စာတမ်းအား AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ဖြင့် ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှုအတွက် ကြိုးစားပေမယ့် အလိုအလျောက် ဘာသာပြန်ချက်များတွင် အမှားများ သို့မဟုတ် မှန်ကန်မှုမရှိမှုများ ပါဝင်နိုင်ကြောင်း သတိပြုရန် ပြောကြားလိုပါသည်။ မူလစာရွက်စာတမ်းကို မူရင်းဘာသာဖြင့်သာ တရားဝင် အရင်းအမြစ်အဖြစ် ခံယူသင့်ပါသည်။ အရေးကြီးသော အချက်အလက်များအတွက် ပရော်ဖက်ရှင်နယ် လူသား ဘာသာပြန် ဝန်ဆောင်မှုကို အသုံးပြုရန် အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသည့် နားမလည်မှုများ သို့မဟုတ် မမှန်ကန်သော ဖော်ပြချက်များအတွက် ကျွန်ုပ်တို့သည် တာဝန်မယူပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->