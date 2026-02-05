# AI Workshop Lab: သင့် AI ဖြေရှင်းနည်းများကို AZD-Deployable အဖြစ် ပြုလုပ်ခြင်း

**အခန်းအကြောင်းအရာများ:**
- **📚 သင်တန်းမူလစာမျက်နှာ**: [AZD အခြေခံများ](../../README.md)
- **📖 လက်ရှိအခန်း**: အခန်း ၂ - AI-First Development
- **⬅️ ယခင်**: [AI မော်ဒယ် Deploy လုပ်ခြင်း](ai-model-deployment.md)
- **➡️ နောက်တစ်ခု**: [ထုတ်လုပ်မှု AI အကောင်းဆုံးအလေ့အကျင့်များ](production-ai-practices.md)
- **🚀 နောက်အခန်း**: [အခန်း ၃: Configuration](../getting-started/configuration.md)

## အလုပ်ရုံဆွေးနွေးပွဲ အကျဉ်းချုပ်

ဒီလက်တွေ့လေ့ကျင့်ခန်းမှာ အဆင့်မြင့် AI template တစ်ခုကို အသုံးပြုပြီး Azure Developer CLI (AZD) ဖြင့် deploy လုပ်ပုံကို လေ့လာပါမည်။ Microsoft Foundry ဝန်ဆောင်မှုများကို အသုံးပြု၍ ထုတ်လုပ်မှု AI deployment များအတွက် အရေးကြီးသော ပုံစံများကို သင်ယူနိုင်ပါမည်။

**ကြာချိန်:** ၂-၃ နာရီ  
**အဆင့်:** အလယ်အလတ်  
**လိုအပ်ချက်များ:** Azure အခြေခံအသိပညာ၊ AI/ML အကြောင်းအရာများနှင့် ရင်းနှီးမှု

## 🎓 သင်ယူရမည့် ရည်မှန်းချက်များ

ဒီအလုပ်ရုံဆွေးနွေးပွဲအဆုံးတွင် သင်တတ်မြောက်မည့်အရာများ:
- ✅ ရှိပြီးသား AI အပလီကေးရှင်းကို AZD template များသို့ ပြောင်းလဲနိုင်ခြင်း
- ✅ Microsoft Foundry ဝန်ဆောင်မှုများကို AZD ဖြင့် configure လုပ်နိုင်ခြင်း
- ✅ AI ဝန်ဆောင်မှုများအတွက် လုံခြုံသော အထောက်အထားစီမံခန့်ခွဲမှုကို အကောင်အထည်ဖော်နိုင်ခြင်း
- ✅ ထုတ်လုပ်မှုအဆင့် AI အပလီကေးရှင်းများကို စောင့်ကြည့်မှုနှင့်အတူ deploy လုပ်နိုင်ခြင်း
- ✅ AI deployment အခက်အခဲများကို ဖြေရှင်းနိုင်ခြင်း

## လိုအပ်ချက်များ

### လိုအပ်သော Tools
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) ကို install လုပ်ထားရမည်
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) ကို install လုပ်ထားရမည်
- [Git](https://git-scm.com/) ကို install လုပ်ထားရမည်
- Code editor (VS Code ကို အကြံပြုပါသည်)

### Azure အရင်းအမြစ်များ
- Contributor access ရှိသော Azure subscription
- Azure OpenAI ဝန်ဆောင်မှုများကို အသုံးပြုခွင့် (သို့မဟုတ် အသုံးပြုခွင့်တောင်းနိုင်မှု)
- Resource group ဖန်တီးခွင့်

### အသိပညာလိုအပ်ချက်များ
- Azure ဝန်ဆောင်မှုများအကြောင်း အခြေခံအသိပညာ
- Command-line interface များနှင့် ရင်းနှီးမှု
- AI/ML အခြေခံအကြောင်းအရာများ (APIs, models, prompts)

## Lab Setup

### အဆင့် ၁: ပတ်ဝန်းကျင် ပြင်ဆင်ခြင်း

1. **Tool installation များစစ်ဆေးပါ:**
```bash
# AZD တပ်ဆင်မှုကို စစ်ဆေးပါ
azd version

# Azure CLI ကို စစ်ဆေးပါ
az --version

# Azure သို့ ဝင်ရောက်ပါ
az login
azd auth login
```

2. **Workshop repository ကို clone လုပ်ပါ:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Module 1: AI အပလီကေးရှင်းများအတွက် AZD ဖွဲ့စည်းမှုကို နားလည်ခြင်း

### AI AZD Template ၏ ဖွဲ့စည်းမှု

AI-ready AZD template ၏ အဓိကဖိုင်များကို လေ့လာပါ:

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

### **Lab Exercise 1.1: Configuration ကို လေ့လာပါ**

1. **azure.yaml ဖိုင်ကို စစ်ဆေးပါ:**
```bash
cat azure.yaml
```

**စစ်ဆေးရန်:**
- AI components များအတွက် ဝန်ဆောင်မှု သတ်မှတ်ချက်များ
- Environment variable များ mapping
- Host configuration များ

2. **main.bicep infrastructure ကို ပြန်လည်သုံးသပ်ပါ:**
```bash
cat infra/main.bicep
```

**AI ပုံစံများတွင် အဓိကထားစရာများ:**
- Azure OpenAI ဝန်ဆောင်မှု provision လုပ်ခြင်း
- Cognitive Search ပေါင်းစည်းမှု
- လုံခြုံသော key စီမံခန့်ခွဲမှု
- Network လုံခြုံရေး configuration များ

### **ဆွေးနွေးရန်အချက်:** AI အတွက် ဒီပုံစံများ အရေးကြီးသောအကြောင်း

- **ဝန်ဆောင်မှု အချင်းချင်း အားထားမှုများ**: AI အပလီကေးရှင်းများသည် ဝန်ဆောင်မှုများစွာကို ပေါင်းစည်းထားရသည်
- **လုံခြုံရေး**: API key များနှင့် endpoint များကို လုံခြုံစွာ စီမံခန့်ခွဲရမည်
- **အတိုင်းအတာချဲ့ထွင်နိုင်မှု**: AI workload များတွင် ထူးခြားသော အတိုင်းအတာချဲ့ထွင်မှုလိုအပ်ချက်များရှိသည်
- **ကုန်ကျစရိတ် စီမံခန့်ခွဲမှု**: AI ဝန်ဆောင်မှုများသည် သင့်တင့်စွာ configure မလုပ်ပါက စျေးကြီးနိုင်သည်

## Module 2: သင့်ပထမဆုံး AI အပလီကေးရှင်းကို Deploy လုပ်ပါ

### အဆင့် 2.1: ပတ်ဝန်းကျင် Initialize လုပ်ပါ

1. **AZD ပတ်ဝန်းကျင်အသစ်တစ်ခု ဖန်တီးပါ:**
```bash
azd env new myai-workshop
```

2. **လိုအပ်သော parameters များကို သတ်မှတ်ပါ:**
```bash
# သင်နှစ်သက်သော Azure ဒေသကို သတ်မှတ်ပါ
azd env set AZURE_LOCATION eastus

# ရွေးချယ်နိုင်သည်: သတ်မှတ်ထားသော OpenAI မော်ဒယ်ကို သတ်မှတ်ပါ
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### အဆင့် 2.2: Infrastructure နှင့် Application ကို Deploy လုပ်ပါ

1. **AZD ဖြင့် Deploy လုပ်ပါ:**
```bash
azd up
```

**`azd up` လုပ်စဉ်တွင် ဖြစ်ပေါ်မည့်အရာများ:**
- ✅ Azure OpenAI ဝန်ဆောင်မှုကို provision လုပ်သည်
- ✅ Cognitive Search ဝန်ဆောင်မှုကို ဖန်တီးသည်
- ✅ Web application အတွက် App Service ကို စီစဉ်သည်
- ✅ Networking နှင့် လုံခြုံရေးကို configure လုပ်သည်
- ✅ Application code ကို deploy လုပ်သည်
- ✅ Monitoring နှင့် logging ကို စီစဉ်သည်

2. **Deployment လုပ်ငန်းစဉ်ကို စောင့်ကြည့်ပါ** နှင့် ဖန်တီးနေသော အရင်းအမြစ်များကို မှတ်သားပါ။

### အဆင့် 2.3: သင့် Deployment ကို စစ်ဆေးပါ

1. **Deploy လုပ်ထားသော အရင်းအမြစ်များကို စစ်ဆေးပါ:**
```bash
azd show
```

2. **Deploy လုပ်ထားသော application ကို ဖွင့်ပါ:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **AI လုပ်ဆောင်မှုကို စမ်းသပ်ပါ:**
   - Web application သို့ သွားပါ
   - စမ်းသပ် query များကို စမ်းသပ်ပါ
   - AI အဖြေများ အလုပ်လုပ်နေမှုကို စစ်ဆေးပါ

### **Lab Exercise 2.1: Troubleshooting လေ့ကျင့်ခန်း**

**အခြေအနေ**: သင့် deployment အောင်မြင်ခဲ့သော်လည်း AI အဖြေမပေးပါ။

**စစ်ဆေးရန် အကြောင်းအရာများ:**
1. **OpenAI API key များ**: မှန်ကန်စွာ သတ်မှတ်ထားမှုကို စစ်ဆေးပါ
2. **မော်ဒယ်ရရှိနိုင်မှု**: သင့်ဒေသတွင် မော်ဒယ်ရရှိနိုင်မှုကို စစ်ဆေးပါ
3. **Network ချိတ်ဆက်မှု**: ဝန်ဆောင်မှုများ အချင်းချင်း ဆက်သွယ်နိုင်မှုကို စစ်ဆေးပါ
4. **RBAC ခွင့်ပြုချက်များ**: App သည် OpenAI ကို ဝင်ရောက်နိုင်မှုကို စစ်ဆေးပါ

**Debugging commands:**
```bash
# ပတ်ဝန်းကျင်အပြောင်းအလဲများကို စစ်ဆေးပါ
azd env get-values

# တင်သွင်းမှုမှတ်တမ်းများကို ကြည့်ရှုပါ
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# OpenAI တင်သွင်းမှုအခြေအနေကို စစ်ဆေးပါ
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```


## Module 3: သင့်လိုအပ်ချက်များအတွက် AI အပလီကေးရှင်းများကို Customize လုပ်ပါ

### အဆင့် 3.1: AI Configuration ကို ပြင်ဆင်ပါ

1. **OpenAI မော်ဒယ်ကို Update လုပ်ပါ:**
```bash
# သင့်ဒေသတွင်ရရှိနိုင်ပါက အခြားမော်ဒယ်တစ်ခုသို့ပြောင်းပါ
azd env set AZURE_OPENAI_MODEL gpt-4

# configuration အသစ်ဖြင့် ပြန်လည်တင်သွင်းပါ
azd deploy
```

2. **အပို AI ဝန်ဆောင်မှုများ ထည့်ပါ:**

`infra/main.bicep` ကို ပြင်ဆင်ပြီး Document Intelligence ထည့်ပါ:

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


### အဆင့် 3.2: ပတ်ဝန်းကျင်အလိုက် Configuration များ

**အကောင်းဆုံးလေ့ကျင့်မှု**: Development နှင့် Production အတွက် ကွဲပြားသော configuration များကို သတ်မှတ်ပါ။

1. **Production ပတ်ဝန်းကျင်တစ်ခု ဖန်တီးပါ:**
```bash
azd env new myai-production
```

2. **Production-specific parameters များကို သတ်မှတ်ပါ:**
```bash
# ထုတ်လုပ်မှုသည် အများအားဖြင့် အဆင့်မြင့် SKU များကို အသုံးပြုသည်
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# အပိုလုံခြုံရေးအင်္ဂါရပ်များကို ဖွင့်ပါ
azd env set ENABLE_PRIVATE_ENDPOINTS true
```


### **Lab Exercise 3.1: ကုန်ကျစရိတ် အထိန်းအကွပ်**

**စိန်ခေါ်မှု**: Development အတွက် ကုန်ကျစရိတ်သက်သာစေရန် template ကို configure လုပ်ပါ။

**လုပ်ဆောင်ရန်:**
1. Free/basic tier သို့ ပြောင်းလဲနိုင်သော SKUs များကို ရှာပါ
2. ကုန်ကျစရိတ်အနည်းဆုံးဖြစ်စေရန် environment variable များကို configure လုပ်ပါ
3. Deploy လုပ်ပြီး production configuration နှင့် ကုန်ကျစရိတ်ကို နှိုင်းယှဉ်ပါ

**ဖြေရှင်းရန် အကြံပြုချက်များ:**
- Cognitive Services အတွက် F0 (free) tier ကို အသုံးပြုပါ
- Development အတွက် Search Service အတွက် Basic tier ကို အသုံးပြုပါ
- Functions အတွက် Consumption plan ကို စဉ်းစားပါ

## Module 4: လုံခြုံရေးနှင့် ထုတ်လုပ်မှုအကောင်းဆုံးလေ့ကျင့်မှုများ

### အဆင့် 4.1: လုံခြုံရေးအထောက်အထား စီမံခန့်ခွဲမှု

**လက်ရှိ စိန်ခေါ်မှု**: အများစုသော AI အပလီကေးရှင်းများသည် API key များကို hardcode လုပ်ထားသည် သို့မဟုတ် လုံခြုံမရှိသော storage ကို အသုံးပြုသည်။

**AZD ဖြေရှင်းနည်း**: Managed Identity + Key Vault ပေါင်းစည်းမှု။

1. **သင့် template တွင် လုံခြုံရေး configuration ကို ပြန်လည်သုံးသပ်ပါ:**
```bash
# Key Vault နှင့် Managed Identity configuration ကိုရှာပါ
grep -r "keyVault\|managedIdentity" infra/
```

2. **Managed Identity အလုပ်လုပ်နေမှုကို စစ်ဆေးပါ:**
```bash
# ဝက်ဘ်အက်ပ်မှာမှန်ကန်တဲ့အိုင်ဒင်တီဖိုင်ကွန်ဖစ်ဂျူရေးရှင်းရှိမရှိစစ်ဆေးပါ
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```


### အဆင့် 4.2: Network လုံခြုံရေး

1. **Private endpoints ကို enable လုပ်ပါ** (configure မလုပ်ထားပါက):

သင့် bicep template တွင် ထည့်ပါ:
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


### အဆင့် 4.3: Monitoring နှင့် Observability

1. **Application Insights ကို configure လုပ်ပါ:**
```bash
# Application Insights ကိုအလိုအလျောက်ပြင်ဆင်ထားသင့်သည်
# ပြင်ဆင်မှုကိုစစ်ဆေးပါ:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **AI-specific monitoring ကို စီစဉ်ပါ:**

AI လုပ်ဆောင်မှုများအတွက် custom metrics များ ထည့်ပါ:
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


### **Lab Exercise 4.1: လုံခြုံရေး စစ်ဆေးမှု**

**လုပ်ဆောင်ရန်**: သင့် deployment အတွက် လုံခြုံရေးအကောင်းဆုံးလေ့ကျင့်မှုများကို ပြန်လည်သုံးသပ်ပါ။

**စစ်ဆေးရန် စာရင်း:**
- [ ] Code သို့မဟုတ် configuration တွင် hardcoded secrets မရှိပါ
- [ ] Managed Identity ကို ဝန်ဆောင်မှု-မှ-ဝန်ဆောင်မှု authentication အတွက် အသုံးပြုပါ
- [ ] Key Vault သည် အထောက်အထားအရေးကြီးများကို သိမ်းဆည်းထားသည်
- [ ] Network access ကို သင့်တင့်စွာ ကန့်သတ်ထားသည်
- [ ] Monitoring နှင့် logging ကို enable လုပ်ထားသည်

## Module 5: သင့်ကိုယ်ပိုင် AI အပလီကေးရှင်းကို ပြောင်းလဲခြင်း

### အဆင့် 5.1: အကဲဖြတ် Worksheet

**သင့် app ကို ပြောင်းလဲမီ**, ဒီမေးခွန်းများကို ဖြေပါ:

1. **Application Architecture:**
   - သင့် app သည် ဘယ် AI ဝန်ဆောင်မှုများကို အသုံးပြုသလဲ?
   - ဘယ် compute အရင်းအမြစ်များလိုအပ်သလဲ?
   - Database လိုအပ်ပါသလား?
   - ဝန်ဆောင်မှုများအကြား အချင်းချင်းအားထားမှုများရှိပါသလား?

2. **လုံခြုံရေးလိုအပ်ချက်များ:**
   - သင့် app သည် ဘယ်အချက်အလက်အထောက်အထားများကို ကိုင်တွယ်သလဲ?
   - ဘယ်လို compliance လိုအပ်ချက်များရှိသလဲ?
   - Private networking လိုအပ်ပါသလား?

3. **အတိုင်းအတာချဲ့ထွင်မှုလိုအပ်ချက်များ:**
   - မျှော်မှန်းထားသော load ဘယ်လောက်ရှိသလဲ?
   - Auto-scaling လိုအပ်ပါသလား?
   - ဒေသဆိုင်ရာလိုအပ်ချက်များရှိပါသလား?

### အဆင့် 5.2: သင့် AZD Template ကို ဖန်တီးပါ

**သင့် app ကို ပြောင်းလဲရန် ဒီပုံစံကို လိုက်နာပါ:**

1. **အခြေခံဖွဲ့စည်းမှုကို ဖန်တီးပါ:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# AZD template ကို စတင်ပါ
azd init --template minimal
```

2. **azure.yaml ကို ဖန်တီးပါ:**
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

3. **Infrastructure template များကို ဖန်တီးပါ:**

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


### **Lab Exercise 5.1: Template ဖန်တီးမှု စိန်ခေါ်မှု**

**စိန်ခေါ်မှု**: Document processing AI app အတွက် AZD template တစ်ခု ဖန်တီးပါ။

**လိုအပ်ချက်များ:**
- Content analysis အတွက် Azure OpenAI
- OCR အတွက် Document Intelligence
- Document upload အတွက် Storage Account
- Processing logic အတွက် Function App
- User interface အတွက် Web app

**အပိုအမှတ်များ:**
- မှန်ကန်သော error handling ထည့်ပါ
- ကုန်ကျစရိတ် ခန့်မှန်းချက် ထည့်ပါ
- Monitoring dashboard များ ထည့်ပါ

## Module 6: အခက်အခဲများကို Troubleshoot လုပ်ခြင်း

### Deployment အခက်အခဲများ

#### အခက်အခဲ 1: OpenAI Service Quota ကျော်လွန်မှု
**လက္ခဏာများ:** Deployment quota error ဖြင့် မအောင်မြင်ပါ
**ဖြေရှင်းနည်းများ:**
```bash
# လက်ရှိအပိုင်းအခြားများကို စစ်ဆေးပါ
az cognitiveservices usage list --location eastus

# အပိုင်းအခြားတိုးမြှင့်မှုကို တောင်းဆိုပါ သို့မဟုတ် အခြားဒေသကို စမ်းကြည့်ပါ
azd env set AZURE_LOCATION westus2
azd up
```

#### အခက်အခဲ 2: မော်ဒယ်သည် ဒေသတွင် မရရှိနိုင်ပါ
**လက္ခဏာများ:** AI အဖြေများ မအောင်မြင်ခြင်း သို့မဟုတ် မော်ဒယ် deployment error
**ဖြေရှင်းနည်းများ:**
```bash
# မော်ဒယ်ရရှိနိုင်မှုကိုဒေသအလိုက်စစ်ဆေးပါ
az cognitiveservices model list --location eastus

# ရရှိနိုင်သောမော်ဒယ်သို့အပ်ဒိတ်လုပ်ပါ
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### အခက်အခဲ 3: ခွင့်ပြုချက် အခက်အခဲများ
**လက္ခဏာများ:** AI ဝန်ဆောင်မှုများကို ခေါ်ဆိုရာတွင် 403 Forbidden error
**ဖြေရှင်းနည်းများ:**
```bash
# အခန်းတာဝန်များကို စစ်ဆေးပါ။
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# မရှိသေးသော အခန်းတာဝန်များကို ထည့်ပါ။
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```


### Performance အခက်အခဲများ

#### အခက်အခဲ 4: AI အဖြေများနှေးကွေးမှု
**စစ်ဆေးရန်အဆင့်များ:**
1. Application Insights တွင် performance metrics ကို စစ်ဆေးပါ
2. Azure portal တွင် OpenAI ဝန်ဆောင်မှု metrics ကို ပြန်လည်သုံးသပ်ပါ
3. Network connectivity နှင့် latency ကို စစ်ဆေးပါ

**ဖြေရှင်းနည်းများ:**
- ရိုးရိုး query များအတွက် caching ကို အသုံးပြုပါ
- သင့် use case အတွက် သင့်တင့်သော OpenAI မော်ဒယ်ကို အသုံးပြုပါ
- High-load အခြေအနေများအတွက် read replicas ကို စဉ်းစားပါ

### **Lab Exercise 6.1: Debugging စိန်ခေါ်မှု**

**အခြေအနေ**: သင့် deployment အောင်မြင်ခဲ့သော်လည်း application သည် 500 error ပြန်ပေးသည်။

**Debugging လုပ်ဆောင်ရန်:**
1. Application logs ကို စစ်ဆေးပါ
2. ဝန်ဆောင်မှု ချိတ်ဆက်မှုကို စစ်ဆေးပါ
3. Authentication ကို စမ်းသပ်ပါ
4. Configuration ကို ပြန်လည်သုံးသပ်ပါ

**အသုံးပြုရန် Tools:**
- Deployment အခြေအနေကို ကြည့်ရန်
ဂုဏ်ယူပါတယ်! သင်သည် AI Workshop Lab ကိုပြီးစီးလိုက်ပါပြီ။ ယခုအခါ သင်သည် အောက်ပါအရာများကို ပြုလုပ်နိုင်ပြီဖြစ်သည် -

- ✅ ရှိပြီးသား AI အပလီကေးရှင်းများကို AZD အခြေခံပုံစံများသို့ ပြောင်းလဲနိုင်ခြင်း
- ✅ ထုတ်လုပ်မှုအဆင်သင့် AI အပလီကေးရှင်းများကို တင်သွင်းနိုင်ခြင်း
- ✅ AI workload များအတွက် လုံခြုံရေးအကောင်းဆုံးအလေ့အထများကို အကောင်အထည်ဖော်နိုင်ခြင်း
- ✅ AI အပလီကေးရှင်း၏ စွမ်းဆောင်ရည်ကို စောင့်ကြည့်ပြီး အကောင်းဆုံးအခြေအနေသို့ ပြုပြင်နိုင်ခြင်း
- ✅ ပုံမှန် deployment ပြဿနာများကို ဖြေရှင်းနိုင်ခြင်း

### နောက်တစ်ဆင့်များ
1. ဤပုံစံများကို သင့်ကိုယ်ပိုင် AI ပရောဂျက်များတွင် အသုံးပြုပါ
2. ပုံစံများကို ပြန်လည်အသုံးချရန် အသိုင်းအဝိုင်းသို့ ပံ့ပိုးပါ
3. Microsoft Foundry Discord တွင် ပံ့ပိုးမှုရယူရန် ပူးပေါင်းပါ
4. Multi-region deployments ကဲ့သို့သော အဆင့်မြင့်အကြောင်းအရာများကို လေ့လာပါ

---

**Workshop အကြောင်းပြန်လည်သုံးသပ်မှု**: ဤ workshop ကို ပိုမိုကောင်းမွန်အောင် ပြုလုပ်ရန် သင့်အတွေ့အကြုံကို [Microsoft Foundry Discord #Azure channel](https://discord.gg/microsoft-azure) တွင် မျှဝေပါ။

---

**အခန်းများအကြောင်း လမ်းညွှန်ချက်**:
- **📚 သင်ခန်းစာ အစ**: [AZD For Beginners](../../README.md)
- **📖 လက်ရှိအခန်း**: အခန်း ၂ - AI-First Development
- **⬅️ ယခင်**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ နောက်တစ်ခု**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 နောက်အခန်း**: [အခန်း ၃: Configuration](../getting-started/configuration.md)

**အကူအညီလိုအပ်ပါသလား?** AZD နှင့် AI deployments အကြောင်း ဆွေးနွေးရန်နှင့် ပံ့ပိုးမှုရယူရန် ကျွန်ုပ်တို့၏ အသိုင်းအဝိုင်းကို ပူးပေါင်းပါ။

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**အကြောင်းကြားချက်**:  
ဤစာရွက်စာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ကို အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှုအတွက် ကြိုးစားနေသော်လည်း၊ အလိုအလျောက် ဘာသာပြန်မှုများတွင် အမှားများ သို့မဟုတ် မမှန်ကန်မှုများ ပါဝင်နိုင်သည်ကို သတိပြုပါ။ မူရင်းဘာသာစကားဖြင့် ရေးသားထားသော စာရွက်စာတမ်းကို အာဏာတရားရှိသော အရင်းအမြစ်အဖြစ် သတ်မှတ်သင့်ပါသည်။ အရေးကြီးသော အချက်အလက်များအတွက် လူ့ဘာသာပြန်ပညာရှင်များကို အသုံးပြုရန် အကြံပြုပါသည်။ ဤဘာသာပြန်မှုကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော အလွဲအမှားများ သို့မဟုတ် အနားယူမှုများအတွက် ကျွန်ုပ်တို့သည် တာဝန်မယူပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->