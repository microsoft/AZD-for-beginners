# AI Workshop Lab: သင့်၏ AI ဖြေရှင်းချက်များကို AZD ဖြင့် တပ်ဆင်နိုင်ခြင်း

**အခန်းလမ်းညွှန်:**
- **📚 သင်တန်းအိမ်**: [AZD For Beginners](../../README.md)
- **📖 လက်ရှိအခန်း**: အခန်း 2 - AI-အရင်ဖြေရှင်းမှုဖွံ့ဖြိုးတိုးတက်မှု
- **⬅️ ယခင်အခန်း**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ နောက်တစ်ခန်း**: [Production AI Best Practices](../chapter-08-production/production-ai-practices.md)
- **🚀 နောက်အခန်း**: [အခန်း 3: ကွန်ဖစ်ဂျူရေးရှင်း](../chapter-03-configuration/configuration.md)

## လေ့ကျင့်ခန်း အနှိုင်းအယှက်

ဒီလုပ်ဆောင်ချက်ခံ လက်တွေ့လမ်းညွှန်သည် ဖွံ့ဖြိုးသူများအား ရှိပြီးသား AI ပုံစံကို ဖော်ထုတ်ပြီး Azure Developer CLI (AZD) အသုံးပြု၍ တပ်ဆင်ခြင်းလုပ်ငန်းစဉ်မှတစ်ဆင့် ဦးတည်ပြုပြသည်။ သင်သည် Microsoft Foundry စီမံကိန်းများနှင့် AI ထုတ်လုပ်ခြင်းအတွက် မရှိမဖြစ် အကောင်အထည်ဖော်ရမည့် ပုံစံများကို သင်ယူပါမည်။

> **ထုတ်ဝေသုံးသပ်ချက် (2026-11-04):** AZD command လမ်းညွှန်နှင့် နမူနာကွန်ဖစ်ဂျူရေးရှင်းအမည်များကို `azd` `1.37.2` ထုတ်ဝေမှုနှင့် လင့်ခ်ထားသော နမူနာ၏ လက်ရှိကွန်ဖစ်ဂျူရေးရှင်းနှင့် စိစစ်ပြီးဖြစ်သည်။ ၎င်းမှာ မှတ်တမ်းဆိုင်ရာ သုံးသပ်ချက်ဖြစ်ပြီး တိုက်ရိုက်ထည့်သွင်းစစ်ဆေးခြင်းမဟုတ်ပါ။ RAG lab တွင် agent extension လိုအပ်ခြင်းမရှိ၊ agent သုံးသပ်မှုများအတွက် ကွဲပြားသည့် `azure.ai.evaluations` extension နှင့် [လက်ရှိ သုံးသပ်မှုလုပ်ငန်းစဉ်](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) ကို အသုံးပြုရန်ဖြစ်သည် Legacy agent သုံးသပ်မှု command များကို မသုံးပါနှင့်။

**ကြာချိန်:** 2-3 နာရီ  
**အဆင့်:** အလယ်မှတ်  
**လိုအပ်ချက်များ:** Azure အခြေခံ အသိပညာ၊ AI/ML အကြောင်းအရာ လိုက်ဖက်မှု

## 🎓 သင်ယူလေ့လာရန် ရည်မှန်းချက်များ

ဒီ ဝေါ့ခ်ရှော့ လုပ်ငန်းမှ ပြီးဆုံးသောအခါ သင်သည် ။
- ✅ ရှိပြီးသား AI AZD ပုံစံကို စူးစမ်းခြင်းနှင့် သင့်ရဲ့ application ကို ပြောင်းလဲသွားရန် အစီအစဉ်ရေးဆွဲနိုင်ခြင်း
- ✅ AZD ဖြင့် Microsoft Foundry စီမံကိန်းများ သတ်မှတ်နိုင်ခြင်း
- ✅ AI စီမံကိန်းများအတွက် လုံခြုံသောလက်မှတ်စီမံခန့်ခွဲမှု အကောင်အထည်ဖော်နိုင်ခြင်း
- ✅ စောင့်ကြည့်မှုအပါအဝင် AI ကိုအသုံးပြုသော နမူနာ application တပ်ဆင်နိုင်ခြင်း
- ✅ AI တပ်ဆင်ခြင်း စသည့် ပြဿနာများကို ဖြေရှင်းနိုင်ခြင်း

## လိုအပ်ချက်များ

### လိုအပ်သောကိရိယာများ
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) ထည့်သွင်းထားရှိခြင်း
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) ထည့်သွင်းထားရှိခြင်း
- [Git](https://git-scm.com/) ထည့်သွင်းထားရှိခြင်း
- ကုဒ် တည်းဖြတ်ကိရိယာ (VS Code ကို အကြံပြု)

ဤ command block များသည် Bash စာရေးပုံ သဘောတရားများ (လိုင်းဆက်လက်ရေးမှုများ၊ `grep`) ကို အသုံးပြုသည်။ Windows တွင် Git Bash/WSL သို့မဟုတ် PowerShell သို့ပြောင်းအသုံးပြုပါ။ [နမူနာ၏ ဒေသခံ ပတ်ဝန်းကျင်သတ်မှတ်မှု](https://github.com/Azure-Samples/azure-search-openai-demo#local-environment) တွင် ဖော်ပြထားသည့် ဘာသာစကား၊ package-manager၊ container ကိရိယာများကိုလည်း ထည့်သွင်းပါ။

### Azure အရင်းအမြစ်များ
- resource provisioning နှင့် role-assignment ခွင့်များပါရှိသည့် Azure subscription (Contributor သီးသန့်ဖြင့် RBAC ခန့်အပ်ခြင်း မပြုလုပ်နိုင်ပါ၊ ခွင့်ပြုထားသော role administrator သို့မဟုတ် နမူနာ၏ မှတ်တမ်းတွင် ဖော်ပြထားသည့်နည်းလမ်းကို အသုံးပြုပါ)
- Microsoft Foundry Models စီမံကိန်းများသုံးခွင့် (သို့မဟုတ် အတည်ပြုခြင်း တောင်းဆိုနိုင်မှု)
- Resource group ဖန်တီးခွင့်

### အသိပညာလိုအပ်ချက်များ
- Azure ဝန်ဆောင်မှုများ အခြေခံနားလည်မှု
- command-line ကိုင်တွယ်မှုကျွမ်းကျင်မှု
- AI/ML အခြေခံအကြောင်းအရာများ (API များ၊ မော်ဒယ်များ၊ prompt များ)

## လက်တွေ့စမ်းသပ်မှု ပြင်ဆင်ခြင်း

### အဆင့် 1: ပတ်ဝန်းကျင် ပြင်ဆင်ခြင်း

1. **ကိရိယာများ ထည့်သွင်းမှုကို သေချာစစ်ဆေးပါ:**
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

များစွာသော tenants တွင် အလုပ်လုပ်သည် ဆိုပါက သို့မဟုတ် သင့် subscription ကို အလိုအလျောက် မတွေ့ရှိပါက `azd auth login --tenant-id <tenant-id>` ဖြင့် ထပ်မံကြိုးစားပါ။

2. **ဝေါ့ခ်ရှော့ repository ကို clone လုပ်ပါ:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## အပိုင်း 1: AI applications များအတွက် AZD ဖွဲ့စည်းတည်ဆောက်မှု နားလည်ခြင်း

### AI AZD ပုံစံ၏ ပုံသဏ္ဍာန်အပိုင်းများ

AI အတွက် အသင့် ပြင်ထားသော AZD ပုံစံရှိ အဓိကဖိုင်များကို စူးစမ်းလေ့လာပါ:

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

checked-out နမူနာသည် ပြောင်းလဲနိုင်သည်; `.azure/` သည် ပတ်ဝန်းကျင် စတင်မှုအပြီး မြင်တွေ့ရမည်ဖြစ်ပြီး လုံးဝ အသစ်ဖြင့် clone မလုပ်ပဲ စစ်ဆေးခြင်းသာ လုပ်ပါ။ ပုံစံဖြစ်ရန် မရှိသည့် ဖိုလ်ဒါများ ဖန်တီးရန် မလိုပါ။

### **Lab Exercise 1.1: ကွန်ဖစ်ဂျူရေးရှင်းကို စူးစမ်းရှာဖွေခြင်း**

1. **azure.yaml ဖိုင်ကို စစ်ဆေးပါ:**
```bash
cat azure.yaml
```

**စစ်ဆေးရန်အချက်များ**
- AI အစိတ်အပိုင်းများအတွက် ဝန်ဆောင်မှု သတ်မှတ်ချက်များ
- ပတ်ဝန်းကျင် အပြောင်းအလဲ များကို တွဲဖက်ရေးဆွဲထားမှု
- host ကွန်ဖစ်ဂျူရေးရှင်းများ

2. **main.bicep အင်ဖရာစသည်ရှင်း ကို ပြန်လည်သုံးသပ်ပါ:**
```bash
cat infra/main.bicep
```

**သိရှိရန် Key AI ပုံစံများ**
- Microsoft Foundry Models စီမံကိန်းများ ထည့်သွင်းခြင်း
- Azure AI Search ပေါင်းစည်းခြင်း
- လုံခြုံသော key စီမံခန့်ခွဲမှု
- ကွန်ရက် လုံခြုံရေး ကွန်ဖစ်ဂျူရေးရှင်းများ

### **ဆွေးနွေးရန်အချက်:** အဘယ်ကြောင့် ဒီပုံစံများက AI အတွက်ကျရှိသနည်း

- **ဝန်ဆောင်မှု အခြေခံချက်များ**: AI app များသည် ဝန်ဆောင်မှုများစွာ ပူးပေါင်းလိုအပ်သည်
- **လုံခြုံရေး**: API key များနှင့် endpoints များ လုံခြုံစိတ်ချစွာ စီမံခန့်ခွဲရန်လိုအပ်သည်
- **ထောက်ပံ့နိုင်စွမ်း**: AI စွမ်းဆောင်ရည်များတွင် ထူးခြားသော scalable လိုအပ်ချက်များ ရှိသည်
- **ကုန်ကျစရိတ် စီမံခန့်ခွဲမှု**: AI ဝန်ဆောင်မှုများသည် သက်ဆိုင်ရာ မဟုတ်လျှင် ဈေးကြီးနိုင်သည်

## အပိုင်း 2: သင့်အားဖြင့် ပထမဆုံး AI Application တပ်ဆင်ခြင်း

### အဆင့် 2.1: ပတ်ဝန်းကျင် စတင်သတ်မှတ်ခြင်း

1. **AZD ပတ်ဝန်းကျင်အသစ် ဖန်တီးပါ:**
```bash
azd env new myai-workshop
```

2. **လိုအပ်သော ပရမားတာများ သတ်မှတ်ပါ:**
```bash
# Set your preferred Azure region
azd env set AZURE_LOCATION eastus

# Optional: select a chat model supported by your region and quota
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1-mini
```

### အဆင့် 2.2: အင်ဖရာစည်းမှုနှင့် Application တပ်ဆင်ခြင်း

1. **AZD ဖြင့် တပ်ဆင်ပါ:**
```bash
azd up
```

**`azd up` ခါခုတွင်ဖြစ်ပေါ်သည့်အရာများ:**
- ✅ Microsoft Foundry Models စီမံကိန်း ပေးအပ်ခြင်း
- ✅ Azure AI Search ဝန်ဆောင်မှု ဖန်တီးခြင်း
- ✅ Backend နှင့် bundled frontend အတွက် Azure Container Apps အပါအဝင် တပ်ဆင်ခြင်း (လက်ရှိ နမူနာ မူရင်း)
- ✅ ကွန်ရက် လုံခြုံရေး သတ်မှတ်ခြင်း
- ✅ application code တပ်ဆင်ခြင်း
- ✅ စောင့်ကြည့်ခြင်းနှင့် မှတ်တမ်းတင်ခြင်း ယူဆောင်ခြင်း

2. **တပ်ဆင်မှု ပြုလုပ်သည့်အချိန် အခြေအနေကို စောင့်ကြည့်ပါ**။ ဖန်တီးနေသော resource များကို မှတ်သားပါ။

### အဆင့် 2.3: တပ်ဆင်မှုကို အတည်ပြုခြင်း

1. **တပ်ဆင်ပြီး resource များကို စစ်ဆေးပါ:**
```bash
azd show
```

2. **တပ်ဆင်ပြီး application ကို ဖွင့်ကြည့်ပါ:**
```bash
azd show
```

`azd show` output တွင် ပြသသော web endpoint ကို ဖွင့်ပါ။

3. **AI လုပ်ဆောင်မှုကို စမ်းသပ်ပါ:**
   - web application သို့ ရောက်ရှိပါ
   - နမူနာ မေးခွန်းများ ကို စမ်းသပ်ကြည့်ပါ
   - AI ဖြေကြောင်းများ လုပ်ဆောင်နေမှုကို အတည်ပြုပါ

### **Lab Exercise 2.1: ပြဿနာရှာဖွေရေး လေ့ကျင့်မှု**

**ကိစ္စအချက်အလက်:** သင်၏ တပ်ဆင်မှု အောင်မြင်သော်လည်း AI မဖြေကြောင်းဖြစ်နေပါသည်။

**စစ်ဆေးရန် သူငယ်ချင်းပြဿနာများ:**
1. **အတည်ပြုခြင်း:** managed identity နှင့် role assignments များ စစ်ဆေးပါ။ API key-based authentication ကို သင့်တော်စွာ enabled လုပ်ထားမှသာ API key များကို စစ်ဆေးပါ။
2. **မော်ဒယ်ရရှိနိုင်မှု:** သင့်ဒေသတွင် မော်ဒယ် ပံ့ပိုးမှုပေးလား စစ်ဆေးပါ
3. **ကွန်ရက် ချိတ်ဆက်မှု:** ဝန်ဆောင်မှုများ ချိတ်ဆက်နိုင်ခြင်းရှိမရှိ စစ်ဆေးပါ
4. **RBAC ခွင့်ပြုချက်များ:** application သည် OpenAI ကို အသုံးပြုခွင့်ရှိ/မရှိ စစ်ဆေးပါ

**ဖြေရှင်းရန် command များ:**
```bash
# Check environment variables
azd env get-values

# Open the selected environment's logging view
azd monitor --logs

# Check OpenAI deployment status
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## အပိုင်း 3: သင့်လိုအပ်ချက်အတွက် AI applications ကို အထူးပုံသဏ္ဍာန်ပြုခြင်း

### အဆင့် 3.1: AI ကွန်ဖစ်ဂျူရေးရှင်းကို ပြုပြင်ပြောင်းလဲခြင်း

1. **OpenAI မော်ဒယ် ပြောင်းလဲခြင်း:**
```bash
# Change to a different model (if available in your region)
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1

# Apply the model infrastructure change, then deploy the application
azd up
```

2. **AI ဝန်ဆောင်မှုများ ထပ်ဆောင်းထည့်သွင်းခြင်း:**

Document Intelligence ထည့်ရန် `infra/main.bicep` ကို ပြင်ဆင်ပါ:

အောက်ပါအပိုင်းသည် ပုံပြင် တစ်ခုပဲဖြစ်ပြီး တစ်လုံးလုံး template မဟုတ်ပါ။ နမူနာတွင် ရှိပြီးသား document-processing ဝန်ဆောင်မှုများ ရှိနိုင်သည်။ ထပ်တိုး resource များ ထည့်သွင်းမီလက်ရှိ အင်ဖရာစသည်ရှင်းကို စစ်ဆေးပါ။ ပုံစံအသစ်များသည် output, identity, application configuration တို့ကို လျှောက်ထားရမည်။

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

### အဆင့် 3.2: ပတ်ဝန်းကျင် အလိုက် ကွန်ဖစ်ဂျူရေးရှင်းများ

**အကောင်းဆုံးလုပ်ဆောင်ချက်**: ဖွံ့ဖြိုးရေးနှင့် ထုတ်လုပ်မှု အတွက် ကွဲပြားသော ကွန်ဖစ်ဂျူရေးရှင်းများ သုံးပါ။

1. **ထုတ်လုပ်ရေး ပတ်ဝန်းကျင် ဖန်တီးပါ:**
```bash
azd env new myai-production
```

2. **ထုတ်လုပ်ရေး သတ်မှတ်ချက်များ သတ်မှတ်ပါ:**
```bash
# Use the sample's actual Search SKU parameter
azd env set AZURE_SEARCH_SERVICE_SKU standard

# Enable private endpoints using the sample's parameter
azd env set AZURE_USE_PRIVATE_ENDPOINT true
```

၎င်းအမည်များသည် နမူနာ [main.parameters.json](https://github.com/Azure-Samples/azure-search-openai-demo/blob/main/infra/main.parameters.json) ထဲမှ ရရှိပါသည်။ `azd env set` သည် တန်ဖိုးကို သိုလှောင်ပေးသော်လည်း အမှားတစ်ခုခု မဖြစ်စေသနည်း။ template သည် ၎င်းကို အသုံးပြုရမည်။ နမူနာ၏ [network isolation guide](https://github.com/Azure-Samples/azure-search-openai-demo/blob/main/docs/deploy_private.md) ကို ပြန်လည်စစ်ဆေး၍ လွတ်လပ်သော အင်တာနက် အသုံးပြုခွင့် ပိတ်မည်မဟုတ်ကြောင်း သေချာစေပါ။ `azd up` ဖြင့် အင်ဖရာပိုင်းပြင်ဆင်မှု ပြုလုပ်ပါ။ OpenAI SKU `S0` သည် ရိုးရိုး throughput ကို မဆုံးဖြတ်ပဲ မော်ဒယ် deployment အမျိုးအစား နှင့် စွမ်းဆောင်ရည်ကို ပိုပေးဆောင်ပါသည်။

### **Lab Exercise 3.1: ကုန်ကျစရိတ် ထိရောက်မှုမြှင့်တင်ခြင်း**

**စိန်ခေါ်မှု**: ဖွံ့ဖြိုးရေး ထိရောက်စွာ ဖြစ်အောင် template ကို ပြင်ဆင်ပါ။

**တာဝန်များ:**
1. အသုံးမပြုသော workshop ပတ်ဝန်းကျင်ကို ရွေးချယ်ပါ: `azd env select myai-workshop`။
2. ယခင် Search SKU နှင့် မော်ဒယ် စွမ်းဆောင်ရည်ကို `infra/main.parameters.json` နှင့် ရွေးချယ်ထားသော ပတ်ဝန်းကျင်မှ မှတ်တမ်းတင်ပါ။
3. မော်ဒယ် / ဒေသ quota ကို ထောက်ခံပြီး အောက်ပါ ထောက်ပံ့သော အချက်များကို အသုံးပြုပါ:
   ```bash
   azd env set AZURE_SEARCH_SERVICE_SKU basic
   azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
   azd up
   ```
4. အခမဲ့ portal တွင် Search SKU နှင့် deployment စွမ်းဆောင်ရည်ကို အတည်ပြုပြီး စျေးနှုန်းတွက်ချက်မှုနှင့် ကွာခြားချက်ကို ခန့်မှန်းပါ။ ဘီလ်ဒေတာ ပိုမိုပြောင်းလဲမှုကို ခြုံဆက်မထားပါနှင့်။

**အောင်မြင်မှု အချက်များ:** Search သည် Basic ကို အသုံးပြု၊ chat deployment တွင် တောင်းဆိုထားသည့် စွမ်းဆောင်ရည်ရှိ၊ app သည် နမူနာမေးခွန်း တစ်ခုအထိ ဖြေကြောင်းပေးနိုင်သည်။ စွမ်းဆောင်ရည် `10` သည် စည်းကမ်းတားဆီးချက် သတ်မှတ်ချက်ဖြစ်ပြီး token စျေးလျော့စျေး မဟုတ်ပါ။ Search tier သိမ်းမှုကို အကန့်အသတ်။

## အပိုင်း 4: လုံခြုံရေး နှင့် ထုတ်လုပ်မှုအကောင်းဆုံးလုပ်ထုံးလုပ်နည်းများ

### အဆင့် 4.1: လုံခြုံသော အချက်အလက် စီမံခန့်ခွဲမှု

**လက်ရှိ စိန်ခေါ်မှု** : AI application များတွင် API key များကို hardcode လုပ်ခြင်း သို့မဟုတ် လုံခြုံမသည့် အရင်းအမြစ်တွင် သိမ်းဆည်းခြင်းရှိသည်။

**AZD ဖြေရှင်းချက်** : Managed Identity + Key Vault ပေါင်းစပ်ခြင်း။

1. **သင်၏ template ၏ လုံခြုံရေး ကွန်ဖစ်ဂျူရေးရှင်းကို ပြန်လည်သုံးသပ်ပါ:**
```bash
# Look for Key Vault and Managed Identity configuration
grep -r "keyVault\|managedIdentity" infra/
```

2. **Managed Identity ကောင်းမွန်စွာ လုပ်ဆောင်နေသည်ကို အတည်ပြုပါ:**
```bash
# For the sample's default Container Apps host
az containerapp identity show --name YOUR_CONTAINER_APP_NAME --resource-group YOUR_RG
```

### အဆင့် 4.2: ကွန်ရက် လုံခြုံရေး

1. **စမ်းသပ်ပုံ အားဖြင့် sample ၏ ကွန်ရက် ကွန်ဖစ်ဂျူရေးရှင်းဖြင့် private endpoints ကို ဖွင့်ပါ (မဖွင့်ရသေးလျှင်)။**

သင့်မူလ template အတွက် ထို့အပြင် OpenAI endpoint ချိတ်ဆက်မှုကို ရှင်းပြတဲ့ အပိုင်းဖြစ်သည်။ VNet, private DNS configuration, application connectivity တို့ လည်း လိုအပ်သည်။ sample သည် private-endpoint module များပါရှိပြီး မတူညီသော နမူနာကို မတင်ပေးပါနှင့်။
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

### အဆင့် 4.3: စောင့်ကြည့်မှုနှင့် တွေ့ရှိချက်

1. **Application Insights ကို သတ်မှတ်ပါ:**
```bash
# Application Insights should be automatically configured
# Check the configuration:
az monitor app-insights component show --app YOUR_APP_INSIGHTS_NAME --resource-group YOUR_RG
```

2. **နမူနာ၏ Application Insights ပေါင်းစပ်မှုကို ဖွင့်ပါ:**
```bash
azd env set AZURE_USE_APPLICATION_INSIGHTS true
azd up
azd monitor --overview
```

နမူနာ၏ စက်ကိရိယာသည် telemetry ထုတ်ပေးသည်။ အလွဲတစ်မျိုး `OPENAI_MONITOR_ENABLED` သတ်မှတ်ချက်သည် AI metrics မဖွင့်ပေးပါ။ မော်ဒယ်ခေါ်ဆိုမှုများ၊ နှောင့်နှေးမှု၊ လုပ်ငန်းရှုံးနှင့် token အသုံးပြုမှုများကို ချီးမြှင့်၍ sensitive prompts သို့မဟုတ် ဖြေကြောင်းများ မမှတ်တမ်းတင်စေရန် ကျေးဇူးပြုပါ။

### **Lab Exercise 4.1: လုံခြုံရေး စစ်ဆေးမှု**

**တာဝန်**: သင်၏ တပ်ဆင်မှုကို လုံခြုံရေး အကောင်းဆုံးလုပ်ထုံးလုပ်နည်းများနှင့် ညီညွတ်မှုရှိကြောင်း ပြန်လည် သုံးသပ်ပါ။

**စစ်ဆေးရန် စာရင်း:**
- [ ] ကုဒ် သို့မဟုတ် ကွန်ဖစ်ဂျူရေးရှင်းထဲတွင် လျှို့ဝှက်ချက်များ hardcode မထားပါ
- [ ] service-to-service authentication အတွက် Managed Identity ကို အသုံးပြုပြီးပါပြီ
- [ ] sensitive configuration များကို Key Vault သိုလှောင်ထားသည်
- [ ] ကွန်ရက် လမ်းကြောင်းများကို မှန်ကန်စွာ ကန့်သတ်ထားသည်
- [ ] စောင့်ကြည့်မှုနှင့် မှတ်တမ်းတင်မှုများ ဖွင့်ထားသည်

## အပိုင်း 5: သင့် AI Application ကို ပြောင်းလဲခြင်း

### အဆင့် 5.1: သုံးသပ်မှု ရေးရာစာမူ

**သင့် application ကားကို ပြောင်းလဲမှုမပြုမီ**, အောက်ပါမေးခွန်းများကို ဖြေဆိုပါ:

1. **Application ဖွဲ့စည်းတည်ဆောက်မှု:**
   - သင့် app သည် ဘယ် AI ဝန်ဆောင်မှုတွေ အသုံးပြုနေလဲ?
   - ဘာကြောင့် computer resource များလိုအပ်ပါသလဲ?
   - ဒေတာဘေ့(စ်)လိုအပ်ပါသလား?
   - ဝန်ဆောင်မှုများအကြား လိုက်လျောညီထွေမှုက ဘယ်လိုရှိပါသလဲ?

2. **လုံခြုံရေးလိုအပ်ချက်များ:**
   - သင့် app မှ ဂရုစိုက်ရမည့် sensitive data များသည် ဘာတွေလဲ?
   - ဘယ်လိုလိုက်နာဆောင်ရွက်ရမည့် လမ်းညွှန်ချက်များ ရှိပါသလဲ?
   - ကိုယ်ပိုင်ကွန်ရက်လိုအပ်ပါသလား?

3. **ပိုမိုကြီးထွားနိုင်စွမ်းလိုအပ်ချက်များ:**
   - ခန့်မှန်းထားသည့် ညွှန်ကြားမှုဘယ်လောက်ပါသလဲ?
   - အလိုအလျှောက် ပိုမိုကြီးထွားနိုင်စွမ်းလိုအပ်ပါသလား?
   - ဒေသအလိုက် တပ်ဆင်ရန် လိုအပ်ချက် ရှိပါသလား?

### အဆင့် 5.2: သင့် AZD ပုံစံကို ဖန်တီးပါ

**သင့် app ကို ပြောင်းလဲရန် အောက်ပါပုံစံကို လိုက်နာပါ:**

**သာ scaffold:** ဤပိုင်းတွင် API/web application source, host infrastructure, model deployments, identity/RBAC သို့မဟုတ် ပြီးစီးသော `main.parameters.json` ပိုင်းများ မပါပါ။ resource-group-scoped Bicep သည် module ဖွဲ့စည်းတည်ဆောက်မှုကို ဖော်ပြသည်။ မူရင်း AZD subscription-scoped entry point သည် resource group ဖန်တီးပြီး ထို scope တွင် ခေါ်ယူရမည်။ `azd up` ဖြင့် fragment များကိုတင် ကူးယူခြင်းဖြင့် ပြည့်စုံသော app တပ်ဆင်မည်မဟုတ်ပါ။ runnable သည် ပုံစံအနေဖြင့် Module 1 တွင် RAG template ကို ရှေ့ပြေးဆက်လက်အသုံးပြုပါ။

1. **အခြေခံ ဖွဲ့စည်းမှု ဖန်တီးပါ:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Initialize AZD template
azd init --template minimal .
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

3. **အင်ဖရာစသည်ရှင်း template များ ဖန်တီးပါ:**

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
    disableLocalAuth: true
  }
}

output endpoint string = openAIAccount.properties.endpoint
output name string = openAIAccount.name
```

### **Lab Exercise 5.1: Template ဖန်တီးခြင်း စိန်ခေါ်မှု**

**စိန်ခေါ်မှု**: စာရွက်စာတမ်း ဖြစ်ထုတ်ကျင့်တင် AI app အတွက် AZD ပုံစံတစ်ခု ဖန်တီးပါ။

**လိုအပ်ချက်များ:**
- Microsoft Foundry Models အတွက် အကြောင်းအရာ သုံးသပ်မှု
- Document Intelligence အတွက် OCR
- စာရွက် ထည့်သွင်းရန် Storage Account
- ပြုလုပ်မှုအတွက် Function App
- အသုံးပြုသူ မျက်နှာပြင်အတွက် Web app

**အပိုဆု အချက်များ:**
- အမှားကျင်းပမှု ကောင်းမွန်စွာ ထည့်သွင်းပါ
- ကုန်ကျစရိတ် ခန့်မှန်းချက် ထည့်ပေးပါ
- စောင့်ကြည့်မှု dashboard များ တည်ဆောက်ပါ

## အပိုင်း 6: ပုံမှန် ဖြစ်ပေါ်သော ပြဿနာများ ဖြေရှင်းခြင်း

### ပုံမှန် တပ်ဆင်မှု ပြဿနာများ

#### ပြဿနာ 1: OpenAI ဝန်ဆောင်မှု quota ကျော်လွန်ခြင်း
**လက္ခဏာများ:** quota အမှားဖြင့် တပ်ဆင်မှု မလွှတ်နိုင်ခြင်း
**ဖြေရှင်းချက်များ:**
```bash
# Check current quotas
az cognitiveservices usage list --location eastus

# Request quota increase, OR try a new disposable environment in another region.
# Azure resources cannot be relocated merely by changing AZURE_LOCATION.
azd env new myai-quota-test
azd env set AZURE_LOCATION westus2
azd up
```

#### ပြဿနာ 2: ဒေသတွင် မော်ဒယ် မရရှိနိုင်ခြင်း
**လက္ခဏာများ:** AI ဖြေကြောင်း မပြန်ပါ သို့မဟုတ် မော်ဒယ် တပ်ဆင်မှု အမှားများ ဖြစ်ပေါ်သည်
**ဖြေရှင်းချက်များ:**
```bash
# Check model availability by region
az cognitiveservices model list --location eastus

# Update to available model
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1-mini
azd up
```

#### ပြဿနာ 3: ခွင့်ပြုချက်ပြဿနာများ
**လက္ခဏာများ:** AI ဝန်ဆောင်မှုများ ကို ခေါ်ယူစဉ် 403 Forbidden အမှားများ
**ဖြေရှင်းချက်များ:**
```bash
# Check role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Add missing roles
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### စွမ်းဆောင်ရည်ဆိုင်ရာ ပြဿနာများ

#### ပြဿနာ 4: AI ဖြေကြောင်း ညစ်ညမ်းသောနှေးကွေးမှု
**စစ်ဆေးရန် အဆင့်များ:**
1. စွမ်းဆောင်ရည် metric များအတွက် Application Insights ကို စစ်ဆေးပါ
2. Azure portal တွင် OpenAI ဝန်ဆောင်မှုပေါ်မူတည်သော metrics များကို အရှုမကြည့်ပါ
3. ကွန်ရက် ချိတ်ဆက်မှုနှင့် latency ကို အတည်ပြုပါ

**ဖြေရှင်းချက်များ:**
- ပုံမှန် မေးခွန်းများအတွက် caching ကို အကောင်အထည်ဖော်ပါ
- မည်သည့် use case နဲ့ဆိုသင့်သည့် OpenAI မော်ဒယ်ကို အသုံးပြုပါ
- မော်ဒယ် RPM/TPM ကန့်သတ်ချက်များ စစ်ဆေးပြီးမှ application replica များကို အဆင့်မြှင့်ပါ၊ Azure OpenAI deployments တွင် generic database-style "read replica" ပုံစံ မရှိပါ

### **Lab Exercise 6.1: ပြဿနာရှာဖွေရေး စိန်ခေါ်မှု**

**ကိစ္စအချက်အလက်:** သင့် တပ်ဆင်မှု အောင်မြင်သော်လည်း application က 500 အမှားများ ပြန်ဖြေသည်။

**ပြဿနာရှာဖွေရေး လုပ်ငန်းဆောင်တာများ:**
1. application log များကို စစ်ဆေးပါ
2. ဝန်ဆောင်မှုချိတ်ဆက်မှုကို အတည်ပြုပါ
3. မှန်ကန်မှုစစ်ဆေးခြင်း
4. ဖွဲ့စည်းတည်ဆောက်မှုသုံးသပ်ခြင်း

**အသုံးပြုရမည့်ကိရိယာများ:**
- ခေတ္တကြည့်ခြင်းအတွက် `azd show`
- အသေးစိတ်ဝန်ဆောင်မှုမှတ်တမ်းများအတွက် Azure ပေါ်တယ်
- အပလီကေးရှင်းတလီမီထရီအတွက် Application Insights

## မော်ဂျူး 7: မောင်းနှင်ခြင်းနှင့်တိုးတက်မှု

### ခြေလှမ်း 7.1: အပြည့်အစုံ မောင်းနှင်မှု တပ်ဆင်ခြင်း

1. **စိတ်ကြိုက် ဒက်ရှ်ဘုတ်များ ဖန်တီးပါ:**

Azure ပေါ်တယ်သို့ သွားပါ၊ ဒက်ရှ်ဘုတ်တစ်ခုဖန်တီးပါ:
- OpenAI မေးမြန်းမှုအရေအတွက်နှင့်နောက်ကျမှု
- အပလီကေးရှင်းမှားယွင်းမှုနှုန်းများ
- အရင်းအမြစ်အသုံးပြုမှု
- ကုန်ကျစရိတ်အခြေအနေ

2. **အသိပေးချက်များတပ်ဆင်ပါ:**
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

ကွန်ပိုနန့်စ်သည် မေးမြန်းမှုတလီမီထရီထုတ်ပေးသည်ကို စစ်ဆေးပြီး အသိပေးလိုပါက အက်ရှင်အစည်းအရုံးထည့်ပါ။ ဒီအတိုင်းအတာမှာ ရေတွက်ချက်တစ်ခုဖြစ်ပြီး မအောင်မြင်မှုရာခိုင်နှုန်းမဟုတ်ပါ; အချက်ပြတစ်ခုအတွက် သင့်လျော်သောမေးခွန်းနှင့် အောက်စွန်းလိုအပ်ပါသည်။

### ခြေလှမ်း 7.2: ကုန်ကျစရိတ် စတင်မြှင့်တင်မှု

1. **လက်ရှိကုန်ကျစရိတ်လေ့လာပါ:**
```bash
# Set a recent reporting window supported by your billing account.
az consumption usage list --start-date YYYY-MM-DD --end-date YYYY-MM-DD
```

ရက်စွဲအစားထိုးများကို အစားထိုးပါ။ စားသုံးမှု API အထောက်အပံ့သည် ဘီလ်မင့်အ договор အပေါ် မူတည်ပြီး; အသုံးပြုမှုအသေးစိတ် မတွေ့ရပါက ပေါ်တယ်ရှိ Cost Management ကို အသုံးပြုပါ။ ကုန်ကျစရိတ်များသည် နောက်ကျသည်၊ အဲဒီဟာတိကျအချိန်စမ်းသပ်မှု မဟုတ်ပါ။

2. **ကုန်ကျစရိတ်ထိန်းချုပ်မှုများ ဆောင်ရွက်ပါ:**
- ငွေကြေးပမာဏအသိပေးချက်များ တပ်ဆင်ပါ
- အလိုအလျောက်ချဲ့ထွင်မူမူဝါဒများကို အသုံးပြုပါ
- မေးမြန်းမှုကင့်မြှောက်မှု ထိန်းချုပ်ပါ
- OpenAI အတွက် တိုကင်အသုံးပြုမှုများ ကြပ်မတ်ပါ

### **စမ်းသပ်ရေး လုပ်ငန်း 7.1: စွမ်းဆောင်ရည် တိုးတက်မှု**

**တာဝန်**: သင့် AI အပလီကေးရှင်းကို စွမ်းဆောင်ရည်နှင့်ကုန်ကျစရိတ်နှစ်ခုလုံးအတွက် အကောင်းဆုံးလုပ်ပါ။

**တိုးတက်စေရမည့် အတိုင်းအတာများ:**
- ပျမ်းမျှတုံ့ပြန်ချိန်ကို 20% လျှော့ချပါ
- လစဉ်ကုန်ကျစရိတ် 15% လျှော့ချပေးပါ
- 99.9% ရရှိနိုင်မှု SLO တစ်ခု နှင့်တိုင်းတာမှုပြပွဲ (တိုတောင်းသော လက်တွေ့တန်း ကျောင်းခန်း မလုံလောက်ပါ)

**အကြံအစည်များ:**
- တုံ့ပြန်ထားမှုကင့်မြှောက်မှုကို ဆောင်ရွက်ပါ
- တိုကင် ထိရောက်မှုအတွက် prompt များကို တိုးတက်အောင်လုပ်ပါ
- သင့်တော်သော ကွန်ပျူးတာ SKU များကို အသုံးပြုပါ
- မှန်ကန်သော အလိုအလျောက်ချဲ့ထွင်မှု တပ်ဆင်ပါ

## နောက်ဆုံး စိန်ခေါ်မှု: အစွန်းစွန်းပိုင်း ဆောင်ရွက်မှု

### စိန်ခေါ်မှု လက်တွေ့အခြေအနေ

ဒီသည် **ရွေးချယ်ယူရန် အင်ဂျင်နီယာ/ဒီဇိုင်းစိန်ခေါ်မှုတစ်ခု** ဖြစ်၍ အလုပ်လည်ဆောင်မှု လေ့ကျင့်ခန်းသို့မဟုတ် ထုတ်လုပ်ရေး သက်သေချာစစ်စစ် မဟုတ်ပါ။ AI အစွမ်းအားဖြင့် ဖောက်သည်ဝန်ဆောင်မှု chatbot တစ်ခု အကြံပြုကာ ကုန်ကျစရိတ်နှင့် သက်ဆိုင်ရာ လိုအပ်ချက်များ ပိုပြီးဆောင်ရွက်ရန် သက်သေပြရန် စာတမ်းရေးပါ။

**မဟာဗျူဟာ လိုအပ်ချက်များ:**
- ဖောက်သည်နှင့် ဆက်သွယ်ရန် ဝက်ဘ်အင်တာဖေ့စ်
- Microsoft Foundry Models နှင့် ပေါင်းစပ်ခြင်း
- Azure AI Search ဖြင့် စာရွက်စာတမ်း ရှာဖွေရေး
- ရှိပြီးသား ဖောက်သည် ဒေတာဘေ့စ်နှင့် ပေါင်းစပ်ခြင်း
- ဘာသာစကားစုံကို ပံ့ပိုးမှု

**မဟာဗျူဟာမဟုတ်သည့် လိုအပ်ချက်များ:**
- ၁၀၀၀ ချိတ်ဆက်အသုံးပြုသူ ကျွမ်းကျင်မှု
- ၉၉.၉% အချိန်ရရှိနိုင်မှု SLA
- SOC 2 လျော့ကျမှုလိုက်နာမှု
- လစဉ် $၅၀၀ အောက်ကုန်ကျစရိတ်
- မျိုးစုံသုံးပတ်ဝန်းကျင် (dev, staging, prod) သို့ တပ်ဆင်မှု

၎င်းတို့သည် စဉ်ဆက်မပြတ် အောင်မြင်မှုများ မဟုတ်သည့် ထင်ရှားချက်များဖြစ်သည်။ မေးမြန်းမှုနှုန်း, prompt/output အရွယ်အစားများ၊ session ကြာမြင့်ချိန်များကို ကုန်ကျစရိတ် ခန့်မှန်းမတိုင်မီ သတ်မှတ်ပါ; ၁၀၀၀ ချိတ်ဆက်ထားသူသည် လုပ်ဆောင်မှုမရှိသေးခြင်း သို့မဟုတ် $၅၀၀ ဘတ်ဂျက် သက်သာမှု မထောက်ခံနိုင်ပါ။ SOC 2 သည် အဖွဲ့အစည်းအဖြစ် စစ်ဆေးမှုရလဒ်ဖြစ်ပြီး AZD ဖောင်တမ်းဖြင့် ဖွင့်လှစ်စေခြင်း မဟုတ်ပါ။ ညှိနှိုင်းချက်များကို သတ်မှတ်၍ လက်မခံနိုင်သော ကန့်သတ်ချက်များကို သက်သေ ပြပါ။

### ဆောင်ရွက်မှု ခြေလှမ်းများ

1. **ဖွဲ့စည်းပုံဒီဇိုင်း ဆွဲပါ**
2. **AZD ဖောင်တမ်း ဖန်တီးပါ**
3. **လုံခြုံရေးများ ဆောင်ရွက်ပါ**
4. **မောင်းနှင်မှုနှင့် အသိပေးချက်များ တပ်ဆင်ပါ**
5. **တပ်ဆင်မှုပိုင်း လမ်းကြောင်းများ ဖန်တီးပါ**
6. **ဖြေရှင်းချက် စာရွက်စာတမ်းရေးပါ**

### သုံးသပ်မှု ခြေရာခံချက်များ

- ✅ **လုပ်ဆောင်နိုင်မှု**: ဆောင်ရွက်ထားသော စွမ်းဆောင်ချက်များ ပြသထားပြီး ကျန်ရစ်ချက်များ ပြတ်သားသလား?
- ✅ **လုံခြုံမှု**: အကောင်းဆုံး လုပ်ထုံးလုပ်နည်းများ တပ်ဆင်ထားပါသလား?
- ✅ **တိုးချဲ့နိုင်မှု**: အလုပ်ဖြည့်နိုင်သလား?
- ✅ **ထိန်းသိမ်းနိုင်မှု**: ကုဒ်နှင့်အင်ဖရာစတပ်ချာ ကျွတ်ကျောကျက်သလား?
- ✅ **ကုန်ကျစရိတ်**: ဘတ်ဂျက်ထဲတွင် ကျန်ရှိနိုင်သလား?

## ထပ်ဆောင်း အရင်းအမြစ်များ

### Microsoft စာရွက်စာတမ်းများ
- [Azure Developer CLI စာရွက်စာတမ်း](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models ဝန်ဆောင်မှု စာရွက်စာတမ်း](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry စာရွက်စာတမ်း](https://learn.microsoft.com/azure/ai-studio/)

### နမူနာ ဖောင်တမ်းများ
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### အသိုင်းအဝိုင်း အရင်းအမြစ်များ
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 ပြီးစီးမှု စစ်ဆေးချက်

ဂုဏ်ပြုပါတယ်! သင်သည် AI အလုပ်ရုံ လက်တွေ့ခန်းကို ပြီးမြောက်ပြီ။ ယခုတွင် အောက်ပါအရာများ ပြုလုပ်နိုင်ပါပြီ။

- ✅ ရှိပြီးသား AI အပလီကေးရှင်းကို AZD ဖောင်တမ်းသို့ပြောင်းလဲခြင်းကို ရှင်းပြနိုင်ပါသည်။
- ✅ AI ကို ကိုးကားနည်းဖြင့် တပ်ဆင်ထားပြီး စမ်းသပ်နိုင်ပါသည်။
- ✅ AI အလုပ်များအတွက် လုံခြုံရေး အကောင်းဆုံးလုပ်ထုံးလုပ်နည်းများ ဆောင်ရွက်နိုင်ပါသည်။
- ✅ AI အပလီကေးရှင်း၏ စွမ်းဆောင်ရည် ကို မောင်းနှင်မှုနှင့် တိုးတက်မှု ပြုလုပ်နိုင်ပါသည်။
- ✅ စာရင်းသွင်းတင်ဆက်မှုကိစ္စများ ပုံမှန် ဖြစ်ပေါ်စေကာ ဖြေရှင်းနိုင်ပါသည်။

**ရှင်းလင်းခြင်း:** `azd env list` ကို လုပ်ဆောင်ပါ၊ ဒီလက်တွေ့ခန်းတွင် ဖန်တီးထားသော ဖျက်စီးနိုင်သော ပတ်ဝန်းကျင်အားလုံးကို ရွေးချယ်ပါ (`myai-workshop`၊ တပ်ဆင်ထားက `myai-production`/`myai-quota-test` ရှိပါက)၊ ၄င်းတိုင်းတွင် `azd down` ကို လုပ်ဆောင်ပါ။ ဖျက်ပစ်ရန်အစီအစဉ်ကို ပြန်လည်စစ်ဆေးပါ; ပတ်ဝန်းကျင်၏ ဒေသဖိုင်ဖွဲ့စည်းမှုကိုသာ ဖျက်ခြင်းသည် Azure အရင်းအမြစ်များကိုမဖျက်ပါ။ မပြန်လည်နိုင်သော ကြာမြင့်သော ဖျက်ပစ်မှုကို မနားလည်ပါက `--purge` ကင်းရှင်းပါ။

### နောက်တစ်ဆင့်များ
1. မိမိ၏ AI ပရောဂျက်များတွင် ဒီမော်ဒယ်များ ကို အသုံးချပါ
2. ဖောင်တမ်များကို အသိုင်းအဝိုင်းသို့ ပြန်လည်ထောက်ပံ့ပေးပါ
3. ဆက်လက်ပံ့ပိုးမှုအတွက် Microsoft Foundry Discord တွင် ဝင်ပါ
4. ဒေသစုံ တပ်ဆင်မှုများ ကဲ့သို့ တိုးတက်ခြင်းများ စူးစမ်းလေ့လာပါ

---

**အလုပ်ရုံ သုံးသပ်ချက်**: ဒီအလုပ်ရုံကို တိုးတက်စေဖို့ သင့်တွေ့ရှိချက်ကို [Microsoft Foundry Discord #Azure channel](https://discord.gg/microsoft-azure) တွင် မျှဝေပါ။

---

**အခန်း လမ်းညွှန်:**
- **📚 သင်တန်းမူလစာမျက်နှာ**: [AZD For Beginners](../../README.md)
- **📖 လက်ရှိ အခန်း**: အခန်း 2 - AI-ပထမ နည်းပညာ ဖွံ့ဖြိုးမှု
- **⬅️ ယခင်**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ နောက်တစ်ခု**: [Production AI Best Practices](../chapter-08-production/production-ai-practices.md)
- **🚀 နောက်တစ်ခန်း**: [အခန်း 3: ဖွဲ့စည်းတည်ဆောက်မှု](../chapter-03-configuration/configuration.md)

**အကူအညီ လိုပါသလား?** AZD နှင့် AI တပ်ဆင်မှုများဆိုင်ရာ ပံ့ပိုးမှုနှင့် ဆွေးနွေးမှုများ အတွက် အသိုင်းအဝိုင်းထဲ ဝင်ပါ။

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ပြောကြားချက်**
ဤစာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှန်ကန်မှုအတွက် ကြိုးပမ်းနေသော်လည်း၊ စက်ကိရိယာဘာသာပြန်ခြင်းများတွင် အမှားများ သို့မဟုတ် မှားယွင်းချက်များ ပါဝင်နိုင်ကြောင်း သတိပြုပါရန် လိုအပ်ပါသည်။ မူလစာတမ်းကို မူရင်းဘာသာဖြင့်သာ ယုံကြည်စိတ်ချရသော အချက်အလက်အဖြစ် သတ်မှတ်သင့်သည်။ အရေးကြီးသည့် သတင်းအချက်အလက်များအတွက် ပရော်ဖက်ရှင်နယ် လူသားဘာသာပြန်သူဝန်ဆောင်မှုကို အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော နားလည်မှုကွာခြားမှုများ သို့မဟုတ် မမှန်ကန်သော အသုံးပြုမှုများအတွက် ကျွန်ုပ်တို့ တာဝန်မခံပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->