# ကောင်းမြတ်သော AI Workshop Lab: သင့် AI ဖြေရှင်းချက်များကို AZD ဖြင့် Deploy ပြုလုပ်ခြင်း

**အခန်းနှိပ်စက်မှု:**
- **📚 သင်ကြားရေးအိမ်ဖြစ်စေခြင်း**: [AZD အတွက် စတင်သူများ](../../README.md)
- **📖 လက်ရှိအခန်း**: အခန်း ၂ - AI ပထမဆုံးတီထွင်မှု
- **⬅️ ယခင်အခန်း**: [AI မော်ဒယ် Deploy လုပ်ခြင်း](ai-model-deployment.md)
- **➡️ နောက်ထပ်**: [Production AI အကောင်းဆုံး လုပ်ထုံးလုပ်နည်းများ](production-ai-practices.md)
- **🚀 နောက်ထပ် အခန်း**: [အခန်း ၃: သတ်မှတ်ချက်များ](../chapter-03-configuration/configuration.md)

## လေ့ကျင့်ခန်းအနှစ်ချုပ်

ဤလက်တွေ့လေ့ကျင့်ခန်းသည် developer များကို ရှိပြီးသား AI ပုံစံအတိုင်းရေးဆွဲပြီး Azure Developer CLI (AZD) ဖြင့် deploy ပြုလုပ်နည်းကို လမ်းညွှန်ပေးသည်။ Microsoft Foundry ဝန်ဆောင်မှုများကို အသုံးပြု၍ production AI deployment များအတွက် အရေးကြီးသော ပုံစံများကို သင်ယူမည်။

> **အတည်ပြုမှတ်ချက် (2026-07-13):** ယခု workshop ကို `azd` `1.27.1` နှင့် စစ်ဆေးပြီးဖြစ်သည်။ သင့်ဒေသတွင် တပ်ဆင်ထားသည့် AZD အစားအစာဟောင်းပါက စတင်ခြင်းမတိုင်မီ update ပြုလုပ်ပါက auth, template နှင့် deployment လမ်းကြောင်းများအောက်ပါအတိုင်း သင့်စားသုံးမှုနှင့် ကိုက်ညီမည်ဖြစ်သည်။

**ကြာမြင့်ချိန်:** ၂-၃ နာရီ  
**အဆင့်:** အလယ်အလတ်  
**လိုအပ်ချက်များ:** Azure အခြေခံကွာလဟာ ရှိပြီး၊ AI/ML သဘောတရားများကို နားလည်ခြင်း  

## 🎓 သင်ယူရန်ရည်မှန်းချက်များ

ဒီ workshop ပြီးဆုံးချိန်တွင် သင်လုပ်နိုင်လိမ့်မှာ:
- ✅ ရှိပြီးသား AI application ကို AZD template များသို့ ပြောင်းယူခြင်း
- ✅ Microsoft Foundry ဝန်ဆောင်မှုများကို AZD ဖြင့် configure ပြုလုပ်ခြင်း
- ✅ AI ဝန်ဆောင်မှုများအတွက် လုံခြုံမှု credentials စီမံခန့်ခွဲခြင်းကျင့်သုံးခြင်း
- ✅ မောင့်တင်တာနှင့်အတူ production အဆင်သင့် AI application များ deploy လုပ်ခြင်း
- ✅ AI deployment ပျမ်းမျှ ပြဿနာများကို ပြုပြင်ဖြေရှင်းခြင်း

## လိုအပ်ချက်များ

### လိုအပ်သော ကိရိယာများ
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) တပ်ဆင်ထားရန်
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) တပ်ဆင်ထားရန်
- [Git](https://git-scm.com/) တပ်ဆင်ထားရန်
- ကုဒ်ရေးတည်းဖြတ်ရန် စနစ် (VS Code ကို အကြံပြု)

### Azure ရင်းမြစ်များ
- Contributor အခွင့်အလမ်းရှိသော Azure subscription
- Microsoft Foundry Models ဝန်ဆောင်မှုများ အသုံးပြုခွင့် (သို့မဟုတ် လျှောက်ထားခွင့်ရရှိခွင့်)
- Resource group ဖန်တီးခွင့်များ

### သတိထားသင့်သည့် ဗဟုသုတများ
- Azure ဝန်ဆောင်မှုများအတွက် အခြေခံနားလည်မှု
- command-line interfaces များနှင့် ရင်းနှီးမှု
- AI/ML သဘောတရား များ (API များ၊ မော်ဒယ်များ၊ prompt များ)

## လက်တွေ့ဆောင်ရွက်မှု စတင်ခြင်း

### အဆင့် ၁: ပတ်ဝန်းကျင် ပြင်ဆင်ခြင်း

1. **ကိရိယာများ တပ်ဆင်မှု စစ်ဆေးပါ:**
```bash
# AZD တပ်ဆင်မှုကို စစ်ဆေးပါ
azd version

# Azure CLI ကို စစ်ဆေးပါ
az --version

# AZD workflow များအတွက် Azure သို့ ဝင်ရန်
azd auth login

# ရောဂါရောဂါ စစ်ဆေးမှုအတွင်း az များကို run ဖို့ စီစဉ်ထားပါကသာ Azure CLI သို့ ဝင်ပါ
az login
```

သင်အများသောတန်နန့်များကြားသို့ သွားရာတွင် သို့မဟုတ် subscription ကို အလိုအလျောက် မတွေ့ရှိပါက `azd auth login --tenant-id <tenant-id>` ဖြင့် ပြန်ကြိုးစားပါ။

2. **Workshop repository ကို clone လုပ်ပါ:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## မော်ဒျူး ၁: AI အတွက် AZD ဖွဲ့စည်းမှုနားလည်ခြင်း

### AI အသုံးပြု AZD Template ၏ ဖွဲ့စည်းပုံ

AI ရားတွက် AZD template တွင် အဓိက ဖိုင်များကို စူးစမ်းကြည့်ပါ:

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

### **လက်တွေ့လေ့ကျင့်ခန်း ၁.၁: သတ်မှတ်ချက် စူးစမ်းခြင်း**

1. **azure.yaml ဖိုင်ကို စိစစ်ပါ:**
```bash
cat azure.yaml
```

**ကြည့်ရှုရန်:**
- AI အစိတ်အပိုင်းများ ဝန်ဆောင်မှု သတ်မှတ်ချက်များ
- ပတ်ဝန်းကျင် မဆိုင်ခွဲမှု ချိတ်ဆက်မှုများ
- Host ဖွဲ့စည်းမှုများ

2. **main.bicep အင်ဖရာစွ့တက်ရှင်းကို သုံးသပ်ပါ:**
```bash
cat infra/main.bicep
```

**အဓိက AI ပုံစံများကို ရှာဖွေပါ:**
- Microsoft Foundry Models ဝန်ဆောင်မှု သတ်မှတ်ခြင်း
- Azure AI Search ပေါင်းစည်းမှု
- လုံခြုံသော key စီမံခန့်ခွဲမှု
- ကွန်ရက်လုံခြုံမှု ဖွဲ့စည်းမှုများ

### **ဆွေးနွေးစရာ:** ထိုပုံစံများသည် AI အတွက် အဘယ်သို့ အရေးကြီးပါသလဲ

- **ဝန်ဆောင်မှုအစပ်အဆိုင်များ**: AI app များတွင် ဝန်ဆောင်မှုများစုပေါင်းညှိနှိုင်းမှု လိုအပ်သည်
- **လုံခြုံမှု**: API key များနှင့် endpoint များကို လုံခြုံစိတ်ချစွာ စီမံပေးရမည်
- **ချဲ့ထွင့်နိုင်မှု**: AI အလုပ်တင်တာများတွင် ထူးခြားသောချဲ့ထွင့်တုံ့ပြန်မှု လိုအပ်ချက်များရှိသည်
- **ကုန်ကျစရိတ် စီမံခန့်ခွဲမှု**: AI ဝန်ဆောင်မှုများကို အမှန်တကယ် configure မပြုပါက ယင်းသည် ထိုလွှာကျစရိတ်များ ဖြစ်စေသည်

## မော်ဒျူး ၂: သင့် ပထမဆုံး AI application ကို deploy လုပ်ပါ

### အဆင့် ၂.၁: ပတ်ဝန်းကျင် စတင်ဖြတ်သန်းခြင်း

1. **AZD သစ်ပတ်ဝန်းကျင်အသစ် ဖန်တီးပါ:**
```bash
azd env new myai-workshop
```

2. **လိုအပ်သော ပါလာမီတာများ သတ်မှတ်ပါ:**
```bash
# သင်နှစ်သက်သော Azure ဒေသကို သတ်မှတ်ပါ
azd env set AZURE_LOCATION eastus

# နောက်ထပ်ရွေးချယ်စရာ: အထူး OpenAI မော်ဒယ်ကို သတ်မှတ်ပါ
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### အဆင့် ၂.၂: အင်ဖရာစွ့တက်ရှင်းနှင့် application ကို deploy လုပ်ခြင်း

1. **AZD ဖြင့် deploy လုပ်ပါ:**
```bash
azd up
```

**`azd up` အတွင်း ဖြစ်ပေါ်မှုများ:**
- ✅ Microsoft Foundry Models ဝန်ဆောင်မှုကို အဆင်သင့် ပြုလုပ်သည်
- ✅ Azure AI Search ဝန်ဆောင်မှုဖန်တီးသည်
- ✅ Web application အတွက် App Service တည်ဆောက်သည်
- ✅ ကွန်ရက်နှင့် လုံခြုံမှု လုပ်ငန်းစဉ်များ configure ပြုလုပ်သည်
- ✅ အသုံးပြု application code ကို deploy လုပ်သည်
- ✅ စောင့်ကြည့်မှုနှင့် မှတ်တမ်းတင်မှု စနစ်များ တပ်ဆင်သည်

2. **Deployment လုပ်ငန်းတိုးတက်မှုကို စောင့်ကြည့်ပြီး ဖန်တီးနေသော ရင်းမြစ်များ အကြောင်း သိရှိပါ။**

### အဆင့် ၂.၃: သင့် deployment ကို စစ်ဆေးပါ

1. **Deploy ပြီးသော ရင်းမြစ်များကို စစ်ဆေးပါ:**
```bash
azd show
```

2. **Deploy လုပ်ပြီးသော application ကို ဖွင့်ပါ:**
```bash
azd show
```

`azd show` output မှာ ဖော်ပြထားသည့် web endpoint ကိုဖွင့်ပါ။

3. **AI လုပ်ဆောင်ချက်ကို စမ်းသပ်ပါ:**
   - Web application ကို သွားပါ
   - နမူနာ query များ ကို စမ်းသပ်ပါ
   - AI အဖြေများ လည်ပတ်မှု သေချာစေပါ

### **လက်တွေ့လေ့ကျင့်ခန်း ၂.၁: ပြဿနာဖြေရှင်း အကြံပြုခြင်း**

**အခြေအနေ**: သင့် deployment အောင်မြင်သော်လည်း AI က တုံ့ပြန်မှုမပြုပါ။

**စစ်ဆေးရန် ပျမ်းမျှကိစ္စများ:**
1. **OpenAI API key များ**: မှန်ကန်စွာ သတ်မှတ်ထားခြင်းရှိ/မရှိ စစ်ဆေးပါ
2. **မော်ဒယ် ရနိုင်ခြင်း**: သင်၏ဒေသ၌ မော်ဒယ်ရရှိနိုင်မှုကို စစ်ဆေးပါ
3. **ကွန်ရက် ချိတ်ဆက်မှု**: ဝန်ဆောင်မှုများ ကြား ကွန်ရက်ဆက်သွယ်နိုင်မှု ရှိ/မရှိ စစ်ဆေးပါ
4. **RBAC ခွင့်ပြုချက်များ**: Application သည် OpenAI ကို ဝင်ရောက်ခွင့်ရှိ/မရှိ စစ်ဆေးပါ

**ဒီဘတ်ဂင်း ကွန်မန်းများ:**
```bash
# ပတ်ဝန်းကျင်အပြောင်းအလဲများစစ်ဆေးပါ
azd env get-values

# တပ်ဆင်ခြင်းမှတ်တမ်းများကြည့်ပါ
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# OpenAI တပ်ဆင်မှုအခြေအနေကိုစစ်ဆေးပါ
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## မော်ဒျူး ၃: သင့်လိုအပ်ချက် အတွက် AI application ကို နည်းလမ်းအကြံပြုခြင်း

### အဆင့် ၃.၁: AI သတ်မှတ်ချက်ကို ပြင်ဆင်ခြင်း

1. **OpenAI မော်ဒယ်ကို အပ်ဒိတ်လုပ်ပါ:**
```bash
# သင့်ဒေသမှာရနိုင်ရင် မတူညီတဲ့မော်ဒယ်သို့ပြောင်းပါ
azd env set AZURE_OPENAI_MODEL gpt-4.1

# နယူးဆက်တင်ဖြင့် ထပ်မံတင်ပို့ပါ
azd deploy
```

2. **AI ဝန်ဆောင်မှုများ အသစ် ထည့်သွင်းပါ:**

`infra/main.bicep` ဖိုင်ကို ပြင်ဆင်ပြီး Document Intelligence ကို ထည့်ပါ:

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

### အဆင့် ၃.၂: ပတ်ဝန်းကျင်အလိုက် သတ်မှတ်ချက်များ

**အကောင်းဆုံး လေ့လာစရာ**: ဖွံ့ဖြိုးရေးနှင့် production အတွက် သတ်မှတ်ချက်ကွာခြားမှုရှိစေရန်။

1. **Production ပတ်ဝန်းကျင် ဖန်တီးပါ:**
```bash
azd env new myai-production
```

2. **Production အတွက် သီးသန့် ပါလာမီတာများ သတ်မှတ်ပါ:**
```bash
# ထုတ်လုပ်မှုတွင် အနေအထားအမြင့် SKUs များကို အသုံးပြုသည်
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# အပိုဆိုးရွားမှုလုံခြုံရေးလက္ခဏာများကို ဖွင့်ပါ
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **လက်တွေ့လေ့ကျင့်ခန်း ၃.၁: စရိတ် ထိရောက်စွာ ပြုလုပ်ခြင်း**

**အပြိုင်အဆိုင်**: Template ကို စရိတ်လျော့နည်းစွာ ဖွံ့ဖြိုးရေးအတွက် configure ပြုလုပ်ပါ။

**တာဝန်များ:**
1. အခမဲ့/basic ကဏ္ဍများသို့ SKUs များ သတ်မှတ်ပါ
2. အနည်းဆုံး စရိတ်ဖြင့် ပတ်ဝန်းကျင် မဆိုင်ခွဲသတ်မှတ်ချက်များ ပြုလုပ်ပါ
3. Deploy လုပ်ပြီး production သတ်မှတ်ချက်နှင့် စရိတ်နှိုင်းယှဉ်ပါ

**ဖြေရှင်းနည်း အကြံပြုချက်များ:**
- Azure AI Service များအတွက် F0 (အခမဲ့) ကဏ္ဍ အသုံးပြုပါ
- ဖွံ့ဖြိုးရေးတွင် Search Service အတွက် Basic ကဏ္ဍအသုံးပြုပါ
- Functions အတွက် Consumption စနစ်ကို စဉ်းစားပါ

## မော်ဒျူး ၄: လုံခြုံမှုနှင့် Production အကောင်းဆုံး လုပ်ထုံးလုပ်နည်းများ

### အဆင့် ၄.၁: လုံခြုံသော အထောက်အထား စီမံခန့်ခွဲမှု

**လက်ရှိ ပြဿနာ:** AI app များတွင် API key များကို hardcode သို့မဟုတ် လုံခြုံမှုမရှိသော သိမ်းဆည်းမှုများ အသုံးပြုသည်။

**AZD ဖြေရှင်းနည်း:** Managed Identity နှင့် Key Vault ပေါင်းစည်းခြင်း။

1. **သင့်ပုံစံအတွင်း လုံခြုံရေး သတ်မှတ်ချက်များကို ပြန်လည်သုံးသပ်ပါ:**
```bash
# Key Vault နှင့် Managed Identity ဆက်တင့်များကို ရှာဖွေပါ
grep -r "keyVault\|managedIdentity" infra/
```

2. **Managed Identity စနစ် အလုပ်လုပ်မှု စစ်ဆေးပါ:**
```bash
# ဝဘ်အက်ပ်တွင် မှန်ကန်သော ကိုယ်ပိုင်အတည်ပြုဖွဲ့စည်းပုံရှိကြောင်း စစ်ဆေးပါ
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### အဆင့် ၄.၂: ကွန်ရက်လုံခြုံမှု

1. **private endpoints ကို ဖွင့်ပါ** (ခင်ပွန်းမထည့်ထားသေးပါက):

သင့် bicep template တွင် ထည့်ရန်:
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

### အဆင့် ၄.၃: စောင့်ကြည့်မှုနှင့် ရှုမြင်နိုင်မှု

1. **Application Insights ကို configure ပြုလုပ်ပါ:**
```bash
# Application Insights ကို ကိုယ်တိုင်စနစ်တကျပြင်ဆင်ထားသင့်သည်
# ပုံသေပြုလုပ်ချက်ကို စစ်ဆေးပါ။
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **AI-specific စောင့်ကြည့်မှုများ စနစ်တကျ တပ်ဆင်ပါ:**

AI အလုပ်ရုံများအတွက် custom metrics များ ထည့်သွင်းပါ:
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

### **လက်တွေ့လေ့ကျင့်ခန်း ၄.၁: လုံခြုံရေး စစ်ဆေးခြင်း**

**တာဝန်:** သင့် deployment ကို လုံခြုံရေး အကောင်းဆုံး လုပ်ထုံးလုပ်နည်းများနှင့်နှိုင်းယှဉ် စစ်ဆေးပါ။

**စစ်ဆေးရန်**
- [ ] ကုဒ် သို့မဟုတ် configuration တွင် hardcoded secrets မရှိပါ
- [ ] ဝန်ဆောင်မှုပြန်လည် သက်ဆိုင်မှုအတွက် Managed Identity အသုံးပြုပါ
- [ ] Key Vault မှ သိသာထင်ရှားသော သတ်မှတ်ချက်များ သိမ်းဆည်းပါ
- [ ] ကွန်ရက် ဝင်ရောက်မှု ကို အမှန်တကယ် ကန့်သတ်ထားပါ
- [ ] စောင့်ကြည့်ခြင်းနှင့် မှတ်တမ်းတင်ခြင်းများ တပ်ဆင်ထားသည်

## မော်ဒျူး ၅: သင့်ကိုယ်ပိုင် AI application ကို ပြောင်းလဲခြင်း

### အဆင့် ၅.၁: အကဲဖြတ်မှု စာရွက်တွင် ဖြည့်စွက်ခြင်း

**သင့် app ကို ပြောင်းလဲမည့်အရင်က** အောက်ပါ မေးခွန်းများကို ဖြေကြားပါ:

1. **Application Architecture:**
   - သင့် app သည် ဘယ် AI ဝန်ဆောင်မှုများကို အသုံးပြုပါသလဲ?
   - ဘယ် compute resource များ လိုအပ်သနည်း?
   - သိုလှောင်ရန် database လိုအပ်ပါသလား?
   - ဝန်ဆောင်မှုများအကြားတွင် မည်သည့်အကျိုးတည်ရှိမှုများရှိသနည်း?

2. **လုံခြုံရေးလိုအပ်ချက်များ:**
   - သင့် app လက်ခံသော ယက်နယ်ညစ်ညမ်းသော ဒေတာ မည်မျှရှိပါသလဲ?
   - သင့်တွင် ဘယ်လိုလိုက်နာရမည့် စည်းမျဉ်းစည်းကမ်းများ ရှိပါသလဲ?
   - ပုဂ္ဂလိက ကွန်ရက်များ လိုအပ်ပါသလား?

3. **ချဲ့ထွင့်လိုအပ်ချက်များ:**
   - သင့်မျှော်လင့်ထားသော လုပ်ငန်းအလို့ငှာ ဘယ်လောက်ရှိသနည်း?
   - အလိုအလျောက်ချဲ့ထွင်မှု လိုအပ်ပါသလား?
   - ဒေသအလိုက်လိုအပ်ချက်များ ရှိပါသလား?

### အဆင့် ၅.၂: သင့် AZD Template ကို ဖန်တီးပါ

**ဒီပုံစံနဲ့ သင့် app ကို ပြောင်းလဲပါ:**

1. **အခြေခံဖွဲ့စည်းမှုဖန်တီးပါ:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# AZD တမ်ပလိတ်ကို စတင်ဖန်တီးခြင်း
azd init --template minimal
```

2. **azure.yaml ဖိုင်ဖန်တီးပါ:**
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

3. **အင်ဖရာစွ့တက်ရှင်း template များ ဖန်တီးပါ:**

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

### **လက်တွေ့လေ့ကျင့်ခန်း ၅.၁: Template ဖန်တီးခြင်း အပြိုင်အဆိုင်**

**ပြိုင်ဆိုင်မှု**: စာရွက်စာတမ်း ပြင်ဆင် AI app အတွက် AZD template ဖန်တီးပါ။

**လိုအပ်ချက်များ:**
- Microsoft Foundry Models အတွက် အကြောင်းအရာ စစ်ဆေးခြင်း
- Document Intelligence မှ OCR ဖြင့်
- စာရွက် စာတင်ရန် Storage Account
- လုပ်ဆောင်ချက်များအတွက် Function App
- အသုံးပြုသူ ရှေ့ပြေး အတွက် Web app

**အကျိုးဆောင်မှတ်ချက်များ:**
- အမှားများကို သေချာ လုပ်ဆောင်စေမှု
- စရိတ် ခန့်မှန်းချက် ပါဝင်မှု
- စောင့်ကြည့်ရေး dashboard များ တပ်ဆင်ခြင်း

## မော်ဒျူး ၆: ပျမ်းမျှ ဖြစ်ပေါ်နိုင်သော ပြဿနာများ

### ပျမ်းမျှ deployment ပြဿနာများ

#### ပြဿနာ ၁: OpenAI ဝန်ဆောင်မှုပမာဏ ကျော်လွန်မှု
**လက္ခဏာများ:** deployment မအောင်မြင်ဘဲ ပမာဏ error ဖြစ်ပေါ်သည်
**ဖြေရှင်းနည်းများ:**
```bash
# လက်ရှိအရေအတွက်များကို စစ်ဆေးပါ
az cognitiveservices usage list --location eastus

# အရေအတွက်တိုးမြှင့်မှုကို တောင်းဆိုပါ ဒါမှမဟုတ် အခြားဒေသကို စမ်းသပ်ကြည့်ပါ
azd env set AZURE_LOCATION westus2
azd up
```

#### ပြဿနာ ၂: မော်ဒယ် ကိုဒေသ၌ မရရှိနိုင်မှု
**လက္ခဏာများ:** AI တုံ့ပြန်မှု မအောင်မြင်ခြင်း သို့မဟုတ် model deployment ပြဿနာများ
**ဖြေရှင်းနည်းများ:**
```bash
# တိုင်းဒေသအလိုက် မော်ဒယ် ရနိုင်မှုကို စစ်ဆေးပါ
az cognitiveservices model list --location eastus

# ရနိုင်သော မော်ဒယ်သို့ အပ်ဒိတ်လုပ်ပါ
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### ပြဿနာ ၃: ခွင့်ပြုပြဿနာများ
**လက္ခဏာများ:** AI ဝန်ဆောင်မှုများကို ခေါ်ဆိုရာတွင် 403 Forbidden အမှား ဖြစ်ပေါ်သည်
**ဖြေရှင်းနည်းများ:**
```bash
# အခန်းကဏ္ဍတာဝန် ပေးခြင်းများ စစ်ဆေးပါ
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# မရှိသေးသော အခန်းကဏ္ဍများ ထည့်သွင်းပါ
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### စွမ်းဆောင်ရည် ပြဿနာများ

#### ပြဿနာ ၄: AI တုံ့ပြန်မှု များရေ ဆန့်ကျင်မှု နှေးကွေးခြင်း
**စုံစမ်းစစ်ဆေးရန်:**
1. Application Insights တွင် စွမ်းဆောင်ရည် တိုင်းတာချက်များ ကြည့်ပါ
2. Azure portal မှ OpenAI service metrics ပြန်လည်ကြည့်ပါ
3. ကွန်ရက် ချိတ်ဆက်မှုနှင့် အချိန်ကြာမြင့်မှု စစ်ဆေးပါ

**ဖြေရှင်းနည်းများ:**
- ပုံမှန် query များအတွက် caching ယူဆောင်ပါ
- သင့်အတွက် သင့်တော်သော OpenAI မော်ဒယ်ကို အသုံးပြုပါ
- အမြင့်တင်အား နဲ့နီးသော replica များကို စဉ်းစားပါ

### **လက်တွေ့လေ့ကျင့်ခန်း ၆.၁: မတတ်နိုင်မှု ဖြေရှင်းခြင်း အကဲဖြတ်မှု**

**အခြေအနေ**: သင့် deployment အောင်မြင်သော်လည်း application က ၅၀၀ အမှားပြန်ပေးနေသည်။

**အကဲဖြတ်ရန် လုပ်ဆောင်ချက်များ:**
1. application logs စစ်ဆေးပါ
2. ဝန်ဆောင်မှုချိတ်ဆက်မှု စစ်ဆေးပါ
3. အတည်ပြုမှု စမ်းသပ်ပါ
4. configuration ကို ပြန်လည်သုံးသပ်ပါ

**အသုံးပြုရန် ကိရိယာများ:**
- `azd show` ဖြင့် deployment အမြင်အာရုံ သိရှိပါ
- Azure portal တွင် ဝန်ဆောင်မှု အသေးစိတ် အချက်အလက်များ ကြည့်ပါ
- Application Insights မှ တယ်လီမီတရီဓါတ်မှန်များ ကြည့်ပါ

## မော်ဒျူး ၇: စောင့်ကြည့်မှုနှင့် အကောင်းဆုံး ပြုပြင်ခြင်း

### အဆင့် ၇.၁: ပြည့်စုံသော စောင့်ကြည့်မှု တပ်ဆင်ခြင်း

1. **Custom dashboard များ ဖန်တီးပါ:**

Azure portal သို့ သွားပြီး dashboard ဖန်တီးပါ၊ ထိုနေရာတွင်:
- OpenAI request အရေအတွက်နှင့် အချိန်ကြာမြင့်မှု
- Application အမှားနှုန်းများ
- ရင်းမြစ်အသုံးပြုမှု
- ကုန်ကျစရိတ် ချက်လက်များ

2. **Alert များ တပ်ဆင်ပါ:**
```bash
# အမြင့်အမှားနှုန်းအတွက် သတိပေးချက်
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### အဆင့် ၇.၂: စရိတ် ထိန်းသိမ်းမှု

1. **လက်ရှိ စရိတ်များကို ခွဲခြမ်းစိတ်ဖြာပါ:**
```bash
# ကုန်ကျစရိတ် ဒေတာ ရယူရန် Azure CLI ကို အသုံးပြုပါ
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **စရိတ် ထိန်းသိမ်းမှုနည်းလမ်းများ တပ်ဆင်ပါ:**
- အတိုးပမာဏ alert များ တပ်ဆင်ပါ
- autoscaling မူဝါဒများ သုံးပါ
- request caching ကို အသုံးပြုပါ
- OpenAI token အသုံးပြုမှု များကို စောင့်ကြည့်ပါ

### **လက်တွေ့လေ့ကျင့်ခန်း ၇.၁: စွမ်းဆောင်ရည် အကောင်းမြင့်တင်ခြင်း**

**တာဝန်:** သင့် AI application ကို စွမ်းဆော်ပြီး စရိတ် သက်သာစေပါ။

**တိုးတက်စေရန် မွန်းကောင်းချက်များ:**
- ပျမ်းမျှ တုံ့ပြန်မှု အချိန်ကို ၂၀% လျော့ပါ
- လစဉ်ကုန်ကျစရိတ်ကို ၁၅% လျော့ပါ
- ၉၉.၉% uptime ကို ထိန်းသိမ်းပါ

**ကြိုးစားသင့်သော မဟာဗျူဟာများ:**
- တုံ့ပြန်မှု caching ကို ကျင့်သုံးပါ
- token ထိရောက်မှု ကြည့်ပြီး prompt များကို optimize ပြုလုပ်ပါ
- သင့်လိုအပ်ချက်အတွက် သင့်တော်သော compute SKUs အသုံးပြုပါ
- autoscaling ကို သင့်တော်စွာပြုလုပ်ပါ

## နောက်ဆုံး ပြိုင်ဆိုင်မှု: ပထမဆုံး မှ နောက်ဆုံး အကောင်အထည်ဖော်မှု

### ပြိုင်ဆိုင်မှု အခြေအနေ

သင်သည် production-ready AI-အင်အားမြှင့် ဖောက်သည်ဝန်ဆောင်မှု chatbot တစ်ခုကို အောက်ပါလိုအပ်ချက်များဖြင့် ဖန်တီးရန် တာဝန်ရှိသည်။

**လုပ်ဆောင်ချက်လိုအပ်ချက်များ:**
- ဖောက်သည်နှင့် ဆက်သွယ်ရန် web interface
- Microsoft Foundry Models နှင့် ပေါင်းစည်းမှုဖြင့် တုံ့ပြန်မှု ရရှိခြင်း
- Azure AI Search အသုံးပြု၍ စာရွက်စာတမ်း ရှာဖွေရန် အင်အား
- ရှိပြီးသား ဖောက်သည် ဒေတာအိုင်တီ စနစ်နှင့် ပေါင်းစည်းခြင်း
- ဘာသာစကားစုံ ပံ့ပိုးပေးမှု

**လုပ်ဆောင်ချက်မဟုတ်သော လိုအပ်ချက်များ:**
- တပြိုင်တည်းအသုံးပြုသူ ၁၀၀၀ ကို ကူညီနိုင်မှု
- ၉၉.၉% uptime SLA ကို ထိန်းသိမ်းခြင်း
- SOC 2 စည်းမျဉ်းများနှင့် ကိုက်ညီမှု
- လစဉ် $၅၀၀ အောက် စကားဝိုင်းများ
- Dev, staging, prod environment များ သို့ deploy ပြုလုပ်ခြင်း

### အကောင်အထည်ဖော် ခြေလှမ်းများ

1. **လမ်းညွှန်ရေးဆွဲပါ**
2. **AZD template ဖန်တီးပါ**
3. **လုံခြုံရေး စနစ်များ အကောင်အထည်ဖော်ပါ**
4. **စောင့်ကြည့်မှုနှင့် alert ပြုလုပ်ခြင်း စနစ်များ ဖန်တီးပါ**
5. **Deployment pipeline များတည်ဆောက်ပါ**
6. **ဖြေရှင်းနည်းဆွဲချိတ်ပါ**

### အကဲဖြတ်မှု စံနှုန်းများ

- ✅ **လုပ်ဆောင်ချက်**: မည်သည့်လိုအပ်ချက်များကိုဖြည့်ဆည်းထားသနည်း?
- ✅ **လုံခြုံမှု**: အကောင်းဆုံး လုပ်ထုံးလုပ်နည်းများ လက်ခံပြုလုပ်ထားသနည်း?
- ✅ **ချဲ့ထွင့်နိုင်မှု**: လုပ်ငန်းလောက်မှန်သည့် ချဲ့ထွင့်နိုင်မှု ရှိပါသလား?
- ✅ **ထိန်းသိမ်းနိုင်မှု**: ကုဒ်နှင့်အင်ဖရာစွ့တက်ရှင်း ဖွဲ့စည်းမှု သေချာရှင်းလင်းပါသလား?
- ✅ **ကုန်ကျစရိတ်**: ဘတ်ဂျက်အတွင်းတွင် ရှိပြီးနားနိုင်ပါသလား?

## ထပ်တူအသုံးပြုနိုင်သော ရင်းမြစ်များ

### Microsoft မှ ပြုစုသော စာတမ်းများ
- [Azure Developer CLI လမ်းညွှန်စာအုပ်](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models ဝန်ဆောင်မှု လမ်းညွှန်စာအုပ်](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry လမ်းညွှန်စာအုပ်](https://learn.microsoft.com/azure/ai-studio/)

### နမူနာ Template များ
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)

- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### ရုပ်ပုံအသိုင်းအဝိုင်း အရင်းအမြစ်များ
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 ပြီးမြောက်စာမူ

ဂုဏ်ယူပါတယ်! သင် AI လုပ်ငန်းရပ်သင်တန်းကိုပြီးမြောက်လိုက်ပြီ။ ယခု သင်လုပ်နိုင်ဖို့ လိုအပ်သည်မှာ -

- ✅ ရှိပြီးသား AI အပလီကေးရှင်းများကို AZD ပုံစံများသို့ ပြောင်းလဲခြင်း
- ✅ ထုတ်လုပ်မှုအဆင့် AI အပလီကေးရှင်းများ တပ်ဆင်ခြင်း
- ✅ AI အလုပ်လုပြင်ပွဲများအတွက် လုံခြုံရေးကောင်းမွန်မှုဆိုင်ရာ ကောင်းမွန်သောလုပ်ထုံးလုပ်နည်းများ ကို အကောင်အထည်ဖော်ခြင်း
- ✅ AI အပလီကေးရှင်း၏ တုံ့ပြန်မှုနှင့် ထိန်းသိမ်းမှု ကို စောင့်ကြည့်ပြီး တိုးတက်အောင်လုပ်ခြင်း
- ✅ ရိုးရှင်းသော ထိပ်တန်းပြဿနာများကို ဖြေရှင်းခြင်း

### နောက်တစ်ဆင့်များ
1. ဒီပုံစံများကို သင်၏ ကိုယ်ပိုင် AI ပရောဂျက်များတွင် အသုံးပြုပါ
2. မူပိုင်ခွင့်အသစ်များကို ပြန်လည် ပေးဆောင်ပါ
3. ဆက်လက်ထောက်ခံမှုအတွက် Microsoft Foundry Discord တွင် ပါဝင်ဆွေးနွေးပါ
4. မျိုးစုံဒေသတွင် တပ်ဆင်ခြင်းကဲ့သို့ ရှေ့ဆက်ခက်ခဲသော အကြောင်းအရာများကို လေ့လာပါ

---

**သင်တန်းတုံ့ပြန်ချက်**: သင်၏အတွေ့အကြုံကို [Microsoft Foundry Discord #Azure channel](https://discord.gg/microsoft-azure) တွင် မွေ့တာဝန်မဲ့ပြီး ဤ သင်တန်းကို တိုးတက်အောင် ကူညီပါ။

---

**အခန်းလမ်းညွှန်:**
- **📚 သင်တန်းမူလစာမျက်နှာ**: [AZD For Beginners](../../README.md)
- **📖 လက်ရှိ အခန်း**: အခန်း 2 - AI-First Development
- **⬅️ ယခင်**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ နောက်တစ်ခု**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 နောက်အခန်း**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

**ကူညီလိုပါသလား?** AZD နှင့် AI တပ်ဆင်မှုများဆိုင်ရာ ထောက်ခံမှုနှင့် ဆွေးနွေးမှုအတွက် ကျွန်ုပ်တို့ရုပ်ပုံအသိုင်းအဝိုင်းတွင် ပါဝင်ပါ။

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ပြောကြားချက်**
ဤစာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှန်ကန်မှုအတွက် ကြိုးပမ်းနေသော်လည်း၊ စက်ကိရိယာဘာသာပြန်ခြင်းများတွင် အမှားများ သို့မဟုတ် မှားယွင်းချက်များ ပါဝင်နိုင်ကြောင်း သတိပြုပါရန် လိုအပ်ပါသည်။ မူလစာတမ်းကို မူရင်းဘာသာဖြင့်သာ ယုံကြည်စိတ်ချရသော အချက်အလက်အဖြစ် သတ်မှတ်သင့်သည်။ အရေးကြီးသည့် သတင်းအချက်အလက်များအတွက် ပရော်ဖက်ရှင်နယ် လူသားဘာသာပြန်သူဝန်ဆောင်မှုကို အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော နားလည်မှုကွာခြားမှုများ သို့မဟုတ် မမှန်ကန်သော အသုံးပြုမှုများအတွက် ကျွန်ုပ်တို့ တာဝန်မခံပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->