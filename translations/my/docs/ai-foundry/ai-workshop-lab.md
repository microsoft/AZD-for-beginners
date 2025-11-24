<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "8b26783231714a00efafee3aca8b233c",
  "translation_date": "2025-11-23T22:51:58+00:00",
  "source_file": "docs/ai-foundry/ai-workshop-lab.md",
  "language_code": "my"
}
-->
# AI Workshop Lab: AI ဖြေရှင်းချက်များကို AZD-Deployable အဖြစ် ပြင်ဆင်ခြင်း

**အခန်းများအလိုက် လမ်းညွှန်:**
- **📚 သင်တန်း မူလစာမျက်နှာ**: [AZD For Beginners](../../README.md)
- **📖 လက်ရှိအခန်း**: အခန်း 2 - AI-First Development
- **⬅️ ယခင်**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ နောက်တစ်ခု**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 နောက်အခန်း**: [အခန်း 3: Configuration](../getting-started/configuration.md)

## Workshop အကျဉ်းချုပ်

ဒီလက်တွေ့လေ့ကျင့်ခန်းမှာ Developer များကို Azure Developer CLI (AZD) ကို အသုံးပြု၍ ရှိပြီးသား AI Template ကို Deploy လုပ်ခြင်းဆိုင်ရာ လမ်းညွှန်ပေးပါမည်။ Microsoft Foundry Services ကို အသုံးပြု၍ ထုတ်လုပ်မှုအဆင့် AI Deployment Pattern များကို သင်ယူနိုင်ပါမည်။

**ကြာမြင့်ချိန်:** 2-3 နာရီ  
**အဆင့်:** အလယ်အလတ်  
**လိုအပ်ချက်များ:** Azure အခြေခံအသိပညာ၊ AI/ML အကြောင်းအရာများနှင့် ရင်းနှီးမှု

## 🎓 သင်ယူရမည့် ရည်မှန်းချက်များ

ဒီ Workshop ပြီးဆုံးချိန်တွင် သင်တစ်ဦးတည်းက:
- ✅ ရှိပြီးသား AI အက်ပလီကေးရှင်းကို AZD Template များသို့ ပြောင်းလဲနိုင်ခြင်း
- ✅ Microsoft Foundry Services ကို AZD ဖြင့် Configure လုပ်နိုင်ခြင်း
- ✅ AI Services များအတွက် လုံခြုံ Credential Management ကို အကောင်အထည်ဖော်နိုင်ခြင်း
- ✅ ထုတ်လုပ်မှုအဆင့် AI Applications များကို Monitoring ဖြင့် Deploy လုပ်နိုင်ခြင်း
- ✅ AI Deployment ဆိုင်ရာ အခက်အခဲများကို ဖြေရှင်းနိုင်ခြင်း

## လိုအပ်ချက်များ

### လိုအပ်သော Tools
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) ကို Install လုပ်ထားရမည်
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) ကို Install လုပ်ထားရမည်
- [Git](https://git-scm.com/) ကို Install လုပ်ထားရမည်
- Code Editor (VS Code ကို အကြံပြုသည်)

### Azure Resources
- Contributor Access ရှိသော Azure Subscription
- Azure OpenAI Services ကို အသုံးပြုခွင့် (သို့မဟုတ် Access တောင်းဆိုနိုင်မှု)
- Resource Group ဖန်တီးခွင့်

### အသိပညာလိုအပ်ချက်များ
- Azure Services အခြေခံကို နားလည်မှု
- Command-Line Interface များနှင့် ရင်းနှီးမှု
- AI/ML အခြေခံအကြောင်းအရာများ (APIs, Models, Prompts)

## Lab Setup

### အဆင့် 1: ပတ်ဝန်းကျင် ပြင်ဆင်ခြင်း

1. **Tool Installation များကို စစ်ဆေးပါ:**
```bash
# AZD တပ်ဆင်မှုကို စစ်ဆေးပါ
azd version

# Azure CLI ကို စစ်ဆေးပါ
az --version

# Azure သို့ ဝင်ရောက်ပါ
az login
azd auth login
```

2. **Workshop Repository ကို Clone လုပ်ပါ:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Module 1: AI Applications အတွက် AZD Structure ကို နားလည်ခြင်း

### AI AZD Template ၏ အခြေခံဖွဲ့စည်းမှု

AI-ready AZD Template တွင် ပါဝင်သော အဓိကဖိုင်များကို လေ့လာပါ:

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

### **Lab Exercise 1.1: Configuration ကို လေ့လာခြင်း**

1. **azure.yaml ဖိုင်ကို စစ်ဆေးပါ:**
```bash
cat azure.yaml
```

**စစ်ဆေးရန်အချက်များ:**
- AI Components များအတွက် Service Definitions
- Environment Variable Mapping များ
- Host Configuration များ

2. **main.bicep Infrastructure ကို ပြန်လည်သုံးသပ်ပါ:**
```bash
cat infra/main.bicep
```

**AI Pattern အဓိကအချက်များ:**
- Azure OpenAI Service Provisioning
- Cognitive Search Integration
- Secure Key Management
- Network Security Configuration များ

### **ဆွေးနွေးရန်အချက်:** AI အတွက် Pattern များ အရေးကြီးသောအကြောင်းရင်း

- **Service Dependencies**: AI Applications များသည် အများအပြား Coordinated Services များလိုအပ်သည်
- **Security**: API Keys နှင့် Endpoints များကို လုံခြုံစွာ စီမံခန့်ခွဲရန်လိုအပ်သည်
- **Scalability**: AI Workloads တွင် ထူးခြားသော Scaling Requirements ရှိသည်
- **Cost Management**: AI Services များကို သင့်တင့်စွာ Configure မလုပ်ပါက စရိတ်များကြီးမားနိုင်သည်

## Module 2: သင့်ပထမဆုံး AI Application ကို Deploy လုပ်ခြင်း

### အဆင့် 2.1: ပတ်ဝန်းကျင် Initialize လုပ်ခြင်း

1. **AZD Environment အသစ်တစ်ခု ဖန်တီးပါ:**
```bash
azd env new myai-workshop
```

2. **လိုအပ်သော Parameters များကို Set လုပ်ပါ:**
```bash
# သင်နှစ်သက်သော Azure ဒေသကို သတ်မှတ်ပါ
azd env set AZURE_LOCATION eastus

# ရွေးချယ်နိုင်သည်: သတ်မှတ်ထားသော OpenAI မော်ဒယ်ကို သတ်မှတ်ပါ
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### အဆင့် 2.2: Infrastructure နှင့် Application ကို Deploy လုပ်ခြင်း

1. **AZD ဖြင့် Deploy လုပ်ပါ:**
```bash
azd up
```

**`azd up` မှာ ဖြစ်ပျက်သောအရာများ:**
- ✅ Azure OpenAI Service ကို Provision လုပ်သည်
- ✅ Cognitive Search Service ကို ဖန်တီးသည်
- ✅ Web Application အတွက် App Service ကို Set Up လုပ်သည်
- ✅ Networking နှင့် Security ကို Configure လုပ်သည်
- ✅ Application Code ကို Deploy လုပ်သည်
- ✅ Monitoring နှင့် Logging ကို Set Up လုပ်သည်

2. **Deployment Progress ကို စောင့်ကြည့်ပါ** နှင့် ဖန်တီးနေသော Resources များကို မှတ်သားပါ။

### အဆင့် 2.3: Deployment ကို Verify လုပ်ပါ

1. **Deploy လုပ်ထားသော Resources များကို စစ်ဆေးပါ:**
```bash
azd show
```

2. **Deploy လုပ်ထားသော Application ကို ဖွင့်ပါ:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **AI Functionality ကို စမ်းသပ်ပါ:**
   - Web Application သို့ သွားပါ
   - Sample Queries များကို စမ်းသပ်ပါ
   - AI Response များအလုပ်လုပ်နေမှုကို Verify လုပ်ပါ

### **Lab Exercise 2.1: Troubleshooting လေ့ကျင့်ခန်း**

**အခြေအနေ**: Deployment အောင်မြင်ခဲ့သော်လည်း AI Response မပေးပါ။

**စစ်ဆေးရန် အကြောင်းအရာများ:**
1. **OpenAI API Keys**: မှန်ကန်စွာ Set လုပ်ထားမှုကို Verify လုပ်ပါ
2. **Model Availability**: သင့် Region တွင် Model ကို Support လုပ်မှုကို စစ်ဆေးပါ
3. **Network Connectivity**: Services များအချင်းချင်း ဆက်သွယ်နိုင်မှုကို Verify လုပ်ပါ
4. **RBAC Permissions**: App သည် OpenAI ကို Access လုပ်နိုင်မှုကို Verify လုပ်ပါ

**Debugging Commands:**
```bash
# ပတ်ဝန်းကျင်အပြောင်းအလဲများကို စစ်ဆေးပါ
azd env get-values

# တင်သွင်းမှုမှတ်တမ်းများကို ကြည့်ရှုပါ
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# OpenAI တင်သွင်းမှုအခြေအနေကို စစ်ဆေးပါ
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Module 3: သင့်လိုအပ်ချက်များအတွက် AI Applications ကို Customize လုပ်ခြင်း

### အဆင့် 3.1: AI Configuration ကို ပြင်ဆင်ခြင်း

1. **OpenAI Model ကို Update လုပ်ပါ:**
```bash
# သင့်ဒေသတွင်ရရှိနိုင်ပါက မော်ဒယ်အသစ်တစ်ခုသို့ပြောင်းပါ
azd env set AZURE_OPENAI_MODEL gpt-4

# configuration အသစ်ဖြင့် ပြန်လည်တပ်ဆင်ပါ
azd deploy
```

2. **AI Services များကို ထပ်ထည့်ပါ:**

`infra/main.bicep` ကို Edit လုပ်၍ Document Intelligence ကို ထည့်ပါ:

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

### အဆင့် 3.2: Environment-Specific Configuration များ

**အကောင်းဆုံးအလေ့အကျင့်**: Development နှင့် Production အတွက် Configuration များကို ခွဲခြားထားပါ။

1. **Production Environment တစ်ခု ဖန်တီးပါ:**
```bash
azd env new myai-production
```

2. **Production-Specific Parameters များကို Set လုပ်ပါ:**
```bash
# ထုတ်လုပ်မှုသည် အများအားဖြင့် SKUs အမြင့်များကို အသုံးပြုသည်။
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# အပိုလုံခြုံရေးအင်္ဂါရပ်များကို ဖွင့်ပါ။
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Lab Exercise 3.1: စရိတ်သက်သာမှု Optimization**

**အခက်အခဲ**: Development အတွက် စရိတ်သက်သာ Template ကို Configure လုပ်ပါ။

**လုပ်ဆောင်ရန်များ:**
1. Free/Basic Tier သို့ Set လုပ်နိုင်သော SKUs များကို ရှာပါ
2. စရိတ်အနည်းဆုံး Environment Variables များကို Configure လုပ်ပါ
3. Deploy လုပ်ပြီး Production Configuration နှင့် စရိတ်ကို နှိုင်းယှဉ်ပါ

**ဖြေရှင်းရန် အကြံပြုချက်များ:**
- Cognitive Services အတွက် F0 (Free) Tier ကို အသုံးပြုပါ
- Development အတွက် Search Service ကို Basic Tier သို့ Set လုပ်ပါ
- Functions အတွက် Consumption Plan ကို စဉ်းစားပါ

## Module 4: လုံခြုံရေးနှင့် Production အကောင်းဆုံးအလေ့အကျင့်များ

### အဆင့် 4.1: Credential Management ကို လုံခြုံစွာ စီမံခြင်း

**လက်ရှိအခက်အခဲ**: အများစုသော AI Applications များသည် API Keys ကို Hardcode လုပ်ထားသည် သို့မဟုတ် မလုံခြုံသော Storage ကို အသုံးပြုသည်။

**AZD ဖြေရှင်းချက်**: Managed Identity + Key Vault Integration

1. **Template တွင် Security Configuration ကို ပြန်လည်သုံးသပ်ပါ:**
```bash
# Key Vault နှင့် Managed Identity configuration ကိုရှာပါ
grep -r "keyVault\|managedIdentity" infra/
```

2. **Managed Identity အလုပ်လုပ်နေမှုကို Verify လုပ်ပါ:**
```bash
# ဝက်ဘ်အက်ပ်မှာမှန်ကန်တဲ့အိုင်ဒင်တီဖိုင်ကွန်ဖစ်ဂျူရေးရှင်းရှိမရှိစစ်ဆေးပါ
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### အဆင့် 4.2: Network Security

1. **Private Endpoints ကို Enable လုပ်ပါ** (Configure မလုပ်ထားပါက):

သင့် bicep Template တွင် ထည့်ပါ:
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

1. **Application Insights ကို Configure လုပ်ပါ:**
```bash
# Application Insights ကို အလိုအလျောက် ပြင်ဆင်ထားသင့်သည်။
# ပြင်ဆင်မှုကို စစ်ဆေးပါ:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **AI-Specific Monitoring ကို Set Up လုပ်ပါ:**

AI Operations အတွက် Custom Metrics များကို ထည့်ပါ:
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

**လုပ်ဆောင်ရန်**: Deployment ကို Security အကောင်းဆုံးအလေ့အကျင့်များအတွက် ပြန်လည်သုံးသပ်ပါ။

**စစ်ဆေးရန်စာရင်း:**
- [ ] Code သို့မဟုတ် Configuration တွင် Hardcoded Secrets မရှိပါ
- [ ] Service-to-Service Authentication အတွက် Managed Identity ကို အသုံးပြုထားပါ
- [ ] Sensitive Configuration များကို Key Vault တွင် သိမ်းဆည်းထားပါ
- [ ] Network Access ကို သင့်တင့်စွာ ကန့်သတ်ထားပါ
- [ ] Monitoring နှင့် Logging ကို Enable လုပ်ထားပါ

## Module 5: သင့်ကိုယ်ပိုင် AI Application ကို ပြောင်းလဲခြင်း

### အဆင့် 5.1: Assessment Worksheet

**သင့် App ကို ပြောင်းလဲမည်မပြုမီ**, အောက်ပါမေးခွန်းများကို ဖြေပါ:

1. **Application Architecture:**
   - သင့် App သည် ဘယ် AI Services များကို အသုံးပြုပါသလဲ?
   - ဘယ် Compute Resources များလိုအပ်ပါသလဲ?
   - Database လိုအပ်ပါသလား?
   - Services များအကြား Dependency များရှိပါသလား?

2. **Security Requirements:**
   - သင့် App သည် ဘယ်လို Sensitive Data ကို Handle လုပ်ပါသလဲ?
   - Compliance Requirements များရှိပါသလား?
   - Private Networking လိုအပ်ပါသလား?

3. **Scaling Requirements:**
   - မျှော်မှန်း Load ဘယ်လောက်ရှိပါသလဲ?
   - Auto-Scaling လိုအပ်ပါသလား?
   - Regional Requirements ရှိပါသလား?

### အဆင့် 5.2: AZD Template ကို ဖန်တီးပါ

**သင့် App ကို ပြောင်းလဲရန် ဒီ Pattern ကို လိုက်နာပါ:**

1. **အခြေခံ Structure ကို ဖန်တီးပါ:**
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

3. **Infrastructure Templates များကို ဖန်တီးပါ:**

**infra/main.bicep** - Main Template:
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

**infra/modules/openai.bicep** - OpenAI Module:
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

**အခက်အခဲ**: Document Processing AI App အတွက် AZD Template တစ်ခု ဖန်တီးပါ။

**လိုအပ်ချက်များ:**
- Content Analysis အတွက် Azure OpenAI
- OCR အတွက် Document Intelligence
- Document Uploads အတွက် Storage Account
- Processing Logic အတွက် Function App
- User Interface အတွက် Web App

**အပိုအမှတ်များ:**
- Error Handling ကို သင့်တင့်စွာ ထည့်ပါ
- စရိတ်ခန့်မှန်းခြင်းကို ထည့်ပါ
- Monitoring Dashboards ကို Set Up လုပ်ပါ

## Module 6: အခက်အခဲများကို Troubleshooting လုပ်ခြင်း

### Deployment အခက်အခဲများ

#### အခက်အခဲ 1: OpenAI Service Quota ကျော်လွန်မှု
**လက္ခဏာများ:** Deployment မှာ Quota Error ဖြင့် Fail ဖြစ်သည်
**ဖြေရှင်းချက်များ:**
```bash
# လက်ရှိအပိုင်းအခြားများကိုစစ်ဆေးပါ
az cognitiveservices usage list --location eastus

# အပိုင်းအခြားတိုးမြှင့်မှုတောင်းဆိုပါ သို့မဟုတ် အခြားဒေသကိုကြိုးစားပါ
azd env set AZURE_LOCATION westus2
azd up
```

#### အခက်အခဲ 2: Model သည် Region တွင် မရရှိနိုင်ခြင်း
**လက္ခဏာများ:** AI Response Fail ဖြစ်ခြင်း သို့မဟုတ် Model Deployment Errors
**ဖြေရှင်းချက်များ:**
```bash
# မော်ဒယ်ရရှိနိုင်မှုကိုဒေသအလိုက်စစ်ဆေးပါ
az cognitiveservices model list --location eastus

# ရရှိနိုင်သောမော်ဒယ်သို့အပ်ဒိတ်လုပ်ပါ
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### အခက်အခဲ 3: Permission Issues
**လက္ခဏာများ:** AI Services ကို Call လုပ်သောအခါ 403 Forbidden Errors
**ဖြေရှင်းချက်များ:**
```bash
# အခန်းတာဝန်များကို စစ်ဆေးပါ
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# လိုအပ်သော အခန်းများကို ထည့်သွင်းပါ
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Performance အခက်အခဲများ

#### အခက်အခဲ 4: AI Response များနှေးကွေးမှု
**စစ်ဆေးရန်အဆင့်များ:**
1. Application Insights တွင် Performance Metrics ကို စစ်ဆေးပါ
2. Azure Portal တွင် OpenAI Service Metrics ကို ပြန်လည်သုံးသပ်ပါ
3. Network Connectivity နှင့် Latency ကို Verify လုပ်ပါ

**ဖြေရှင်းချက်များ:**
- Common Queries အတွက် Caching ကို အကောင်အထည်ဖော်ပါ
- သင့် Use Case အတွက် သင့်တင့်သော OpenAI Model ကို အသုံးပြုပါ
- High-Load Scenarios အတွက် Read Replicas ကို စဉ်းစားပါ

### **Lab Exercise 6.1: Debugging Challenge**

**အခြေအနေ**: Deployment အောင်မြင်ခဲ့သော်လည်း Application သည် 500 Errors ပြန်ပေးသည်။

**Debugging လုပ်ဆောင်ရန်များ:**
1. Application Logs ကို စစ်ဆေးပါ
2. Service Connectivity ကို Verify လုပ်ပါ
3. Authentication ကို စမ်းသပ်ပါ
4. Configuration ကို ပြန်လည်သုံးသပ်ပါ

**အသုံးပြုရန် Tools:**
- `azd show` သည် Deployment Overview ကို ပြသသည်
- Azure Portal သည် Service Logs များကို အသေးစိတ်ပြသသည်
- Application Insights သည် Application Telemetry ကို ပြသသည်

## Module 7: Monitoring နှင့် Optimization

### အဆင့် 7.1: Comprehensive Monitoring ကို Set Up လုပ်ပါ

1. **Custom Dashboards ဖန်တီးပါ:**

Azure Portal သို့ သွားပြီး Dashboard တစ်ခု ဖန်တီးပါ:
- OpenAI Request Count နှင့် Latency
- Application Error Rates
- Resource Utilization
- Cost Tracking

2. **Alerts ကို Set Up လုပ်ပါ:**
```bash
# အမှားနှုန်းမြင့်မားမှုအတွက်သတိပေးချက်
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### အဆင့် 7.2: စရိတ် Optimization

1. **လက်ရှိစရိတ်ကို Analysis လုပ်ပါ:**
```bash
# Azure CLI ကို အသုံးပြု၍ ကုန်ကျစရိတ်ဒေတာရယူပါ
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Cost Controls ကို အကောင်အထည်ဖော်ပါ:**
- Budget Alerts ကို Set Up လုပ်ပါ
- Autoscaling Policies ကို အသုံးပြုပါ
- Request Caching ကို အကောင်အထည်ဖော်ပါ
- OpenAI Token Usage ကို Monitor လုပ်ပါ

### **Lab Exercise 7.1: Performance Optimization**

**လုပ်ဆောင်ရန်**: သင့် AI Application ကို Performance နှင့် Cost အတွက် Optimize လုပ်ပါ။

**တိုးတက်စေရန် Metrics:**
- Response Time ကို 20% လျှော့ချပါ
- Monthly Costs ကို 15% လျှော့ချပါ
- 99.9% Uptime ကို ထိန်းသိမ်းပါ

**စမ်းသပ်ရန် Strategies:**
- Response Caching ကို အကောင်အထည်ဖော်ပါ
- Token Efficiency အတွက် Prompts ကို Optimize လုပ်ပါ
- သင့်တင့်သော Compute SKUs ကို အသုံးပြုပါ
- Autoscaling ကို သင့်တင့်စွာ Set Up လုပ်ပါ

## Final Challenge: အဆုံး-to-အဆုံး အကောင်အထည်ဖော်ခြင်း

### Challenge အခြေအနေ

သင့်အား Production-Ready AI-Powered Customer Service Chatbot တစ်ခု ဖန်တီးရန် တာဝန်ပေးထားသည်။

**Functional Requirements:**
- Customer Interaction အတွက် Web Interface
- Response များအတွက် Azure OpenAI Integration
- Document Search အတွက် Cognitive Search
- ရှိပြီးသား Customer Database နှင့် Integration
- Multi-Language Support

**Non-Functional Requirements:**
- 1000 Concurrent Users ကို Handle လုပ်နိုင်ရမည်
- 99.9% Uptime SLA
- SOC 2 Compliance
- $500/month
အောင်မြင်ပါတယ်! သင်သည် AI Workshop Lab ကိုပြီးစီးလိုက်ပါပြီ။ ယခုအခါ သင်သည် အောက်ပါအရာများကိုလုပ်နိုင်ပါပြီ-

- ✅ ရှိပြီးသား AI အက်ပလီကေးရှင်းများကို AZD template များသို့ ပြောင်းလဲနိုင်ခြင်း
- ✅ ထုတ်လုပ်မှုအဆင်သင့် AI အက်ပလီကေးရှင်းများကို တင်သွင်းနိုင်ခြင်း
- ✅ AI workload များအတွက် လုံခြုံရေးအကောင်းဆုံးအလေ့အကျင့်များကို အကောင်အထည်ဖော်နိုင်ခြင်း
- ✅ AI အက်ပလီကေးရှင်း၏ စွမ်းဆောင်ရည်ကို စောင့်ကြည့်ပြီး အကောင်းဆုံးအခြေအနေသို့ ပြုပြင်နိုင်ခြင်း
- ✅ ပုံမှန်တင်သွင်းမှုဆိုင်ရာ ပြဿနာများကို ဖြေရှင်းနိုင်ခြင်း

### နောက်တစ်ဆင့်လုပ်ဆောင်ရန်
1. ဒီ pattern များကို သင်၏ကိုယ်ပိုင် AI project များတွင် အသုံးချပါ
2. Template များကို ပြန်လည်အသုံးပြုရန်အတွက် community သို့ ပံ့ပိုးပါ
3. Microsoft Foundry Discord တွင် ဆက်လက်ပံ့ပိုးမှုရယူရန် ပါဝင်ပါ
4. Multi-region deployment ကဲ့သို့သော အဆင့်မြင့်အကြောင်းအရာများကို လေ့လာပါ

---

**Workshop Feedback**: ဒီ workshop ကို ပိုမိုကောင်းမွန်အောင် ပြုပြင်ရန်အတွက် သင်၏အတွေ့အကြုံကို [Microsoft Foundry Discord #Azure channel](https://discord.gg/microsoft-azure) တွင် မျှဝေပါ။

---

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 2 - AI-First Development
- **⬅️ Previous**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Next**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 Next Chapter**: [Chapter 3: Configuration](../getting-started/configuration.md)

**အကူအညီလိုအပ်ပါသလား?** AZD နှင့် AI deployment များအကြောင်း ဆွေးနွေးရန်နှင့် ပံ့ပိုးမှုရယူရန် ကျွန်ုပ်တို့၏ community တွင် ပါဝင်ပါ။

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**အကြောင်းကြားချက်**:  
ဤစာရွက်စာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ကို အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှုအတွက် ကြိုးစားနေသော်လည်း အလိုအလျောက် ဘာသာပြန်မှုများတွင် အမှားများ သို့မဟုတ် မမှန်ကန်မှုများ ပါဝင်နိုင်သည်ကို သတိပြုပါ။ မူရင်းဘာသာစကားဖြင့် ရေးသားထားသော စာရွက်စာတမ်းကို အာဏာတရားရှိသော အရင်းအမြစ်အဖြစ် သတ်မှတ်သင့်ပါသည်။ အရေးကြီးသော အချက်အလက်များအတွက် လူ့ဘာသာပြန်ပညာရှင်များကို အသုံးပြုရန် အကြံပြုပါသည်။ ဤဘာသာပြန်မှုကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော အလွဲအမှားများ သို့မဟုတ် အနားလွဲမှုများအတွက် ကျွန်ုပ်တို့သည် တာဝန်မယူပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->