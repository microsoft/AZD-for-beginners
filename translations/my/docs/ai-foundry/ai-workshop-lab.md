<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ed84aca3294b926341ef9e0a5a78059e",
  "translation_date": "2025-09-18T13:17:55+00:00",
  "source_file": "docs/ai-foundry/ai-workshop-lab.md",
  "language_code": "my"
}
-->
# AI Workshop Lab: AZD-Deployable AI Solutions ဖန်တီးခြင်း

**အခန်းများ Navigation:**
- **📚 သင်တန်းမူလစာမျက်နှာ**: [AZD For Beginners](../../README.md)
- **📖 လက်ရှိအခန်း**: အခန်း 2 - AI-First Development
- **⬅️ ယခင်**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ နောက်တစ်ခု**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 နောက်အခန်း**: [အခန်း 3: Configuration](../getting-started/configuration.md)

## Workshop အကျဉ်းချုပ်

ဒီလက်တွေ့လေ့လာရေးလက်မူမှာ Developer များကို Azure Developer CLI (AZD) အသုံးပြု၍ ရှိပြီးသား AI အက်ပလီကေးရှင်းကို deploy လုပ်နိုင်အောင် လမ်းညွှန်ပေးပါမည်။ Azure AI Foundry ဝန်ဆောင်မှုများကို အသုံးပြု၍ ထုတ်လုပ်မှုအဆင့် AI deployment များအတွက် အရေးကြီးသော pattern များကို သင်ယူနိုင်ပါမည်။

**ကြာမြင့်ချိန်:** 2-3 နာရီ  
**အဆင့်:** အလယ်အလတ်  
**လိုအပ်ချက်များ:** Azure အခြေခံအသိပညာ၊ AI/ML အကြောင်းအရာများနှင့် ရင်းနှီးမှု

## 🎓 သင်ယူရမည့်ရည်ရွယ်ချက်များ

ဒီ workshop ပြီးဆုံးချိန်တွင် သင်တစ်ဦးတည်းက:
- ✅ ရှိပြီးသား AI အက်ပလီကေးရှင်းကို AZD template များသို့ ပြောင်းလဲနိုင်မည်
- ✅ Azure AI Foundry ဝန်ဆောင်မှုများကို AZD ဖြင့် configure လုပ်နိုင်မည်
- ✅ AI ဝန်ဆောင်မှုများအတွက် လုံခြုံ credential စီမံခန့်ခွဲမှုကို အကောင်အထည်ဖော်နိုင်မည်
- ✅ Monitoring ပါဝင်သော ထုတ်လုပ်မှုအဆင့် AI အက်ပလီကေးရှင်းများကို deploy လုပ်နိုင်မည်
- ✅ AI deployment အခက်အခဲများကို ဖြေရှင်းနိုင်မည်

## လိုအပ်ချက်များ

### လိုအပ်သော Tools
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) ကို install လုပ်ထားရမည်
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) ကို install လုပ်ထားရမည်
- [Git](https://git-scm.com/) ကို install လုပ်ထားရမည်
- Code editor (VS Code အကြံပြုသည်)

### Azure Resources
- Contributor access ရှိသော Azure subscription
- Azure OpenAI ဝန်ဆောင်မှုများကို အသုံးပြုခွင့် (သို့မဟုတ် အသုံးပြုခွင့်တောင်းနိုင်မှု)
- Resource group ဖန်တီးခွင့်

### အသိပညာလိုအပ်ချက်များ
- Azure ဝန်ဆောင်မှုများအခြေခံကို နားလည်မှု
- Command-line interface များနှင့် ရင်းနှီးမှု
- AI/ML အခြေခံအကြောင်းအရာများ (API, model, prompt)

## Lab Setup

### အဆင့် 1: ပတ်ဝန်းကျင် ပြင်ဆင်ခြင်း

1. **Tool installation များကို စစ်ဆေးပါ:**
```bash
# Check AZD installation
azd version

# Check Azure CLI
az --version

# Login to Azure
az login
azd auth login
```

2. **Workshop repository ကို clone လုပ်ပါ:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Module 1: AI အက်ပလီကေးရှင်းများအတွက် AZD ဖွဲ့စည်းမှုကို နားလည်ခြင်း

### AI AZD Template ၏ အရေးကြီးသော ဖိုင်များ

AI-ready AZD template ၏ အရေးကြီးသော ဖိုင်များကို လေ့လာပါ:

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

**စစ်ဆေးရန်အချက်များ:**
- AI component များအတွက် service definition
- Environment variable mapping များ
- Host configuration များ

2. **main.bicep infrastructure ကို ပြန်လည်သုံးသပ်ပါ:**
```bash
cat infra/main.bicep
```

**AI pattern အရေးကြီးသောအချက်များ:**
- Azure OpenAI service provisioning
- Cognitive Search integration
- Secure key management
- Network security configuration

### **ဆွေးနွေးရန်အချက်**: AI အတွက် ဒီ pattern များအရေးကြီးသောအကြောင်းရင်း

- **Service Dependencies**: AI app များသည် ဝန်ဆောင်မှုများစွာကို ပေါင်းစပ်အသုံးပြုရန်လိုအပ်သည်
- **Security**: API key များနှင့် endpoint များကို လုံခြုံစွာ စီမံခန့်ခွဲရန်လိုအပ်သည်
- **Scalability**: AI workload များတွင် ထူးခြားသော scale လုပ်နိုင်စွမ်းလိုအပ်ချက်များရှိသည်
- **Cost Management**: AI ဝန်ဆောင်မှုများသည် သင့်တင့်စွာ configure မလုပ်ပါက စရိတ်များကြီးမားနိုင်သည်

## Module 2: သင့်ပထမဆုံး AI အက်ပလီကေးရှင်းကို Deploy လုပ်ပါ

### အဆင့် 2.1: ပတ်ဝန်းကျင် Initialize လုပ်ပါ

1. **AZD environment အသစ်တစ်ခု ဖန်တီးပါ:**
```bash
azd env new myai-workshop
```

2. **လိုအပ်သော parameter များကို သတ်မှတ်ပါ:**
```bash
# Set your preferred Azure region
azd env set AZURE_LOCATION eastus

# Optional: Set specific OpenAI model
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### အဆင့် 2.2: Infrastructure နှင့် Application ကို Deploy လုပ်ပါ

1. **AZD ဖြင့် Deploy လုပ်ပါ:**
```bash
azd up
```

**`azd up` မှာ ဖြစ်ပျက်နေသောအရာများ:**
- ✅ Azure OpenAI service ကို provision လုပ်သည်
- ✅ Cognitive Search service ကို ဖန်တီးသည်
- ✅ Web application အတွက် App Service ကို စီမံသည်
- ✅ Networking နှင့် security ကို configure လုပ်သည်
- ✅ Application code ကို deploy လုပ်သည်
- ✅ Monitoring နှင့် logging ကို စီမံသည်

2. **Deployment progress ကို စောင့်ကြည့်ပါ** နှင့် ဖန်တီးနေသော resource များကို မှတ်သားပါ။

### အဆင့် 2.3: သင့် Deployment ကို စစ်ဆေးပါ

1. **Deploy လုပ်ထားသော resource များကို စစ်ဆေးပါ:**
```bash
azd show
```

2. **Deploy လုပ်ထားသော application ကို ဖွင့်ပါ:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **AI functionality ကို စမ်းသပ်ပါ:**
   - Web application သို့ သွားပါ
   - Sample query များကို စမ်းသပ်ပါ
   - AI response များအလုပ်လုပ်နေမှုကို စစ်ဆေးပါ

### **Lab Exercise 2.1: Troubleshooting လေ့ကျင့်မှု**

**အခြေအနေ**: Deployment အောင်မြင်ခဲ့သော်လည်း AI အလုပ်မလုပ်ပါ။

**စစ်ဆေးရန် အကြောင်းအရာများ:**
1. **OpenAI API key များ**: မှန်ကန်စွာ သတ်မှတ်ထားမှုကို စစ်ဆေးပါ
2. **Model ရရှိနိုင်မှု**: သင့် region မှာ model ကို support လုပ်မှုရှိ/မရှိ စစ်ဆေးပါ
3. **Network connectivity**: ဝန်ဆောင်မှုများ ဆက်သွယ်နိုင်မှုရှိ/မရှိ စစ်ဆေးပါ
4. **RBAC permission**: App သည် OpenAI ကို access လုပ်နိုင်မှုရှိ/မရှိ စစ်ဆေးပါ

**Debugging command များ:**
```bash
# Check environment variables
azd env get-values

# View deployment logs
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Check OpenAI deployment status
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Module 3: သင့်လိုအပ်ချက်များအတွက် AI အက်ပလီကေးရှင်းများကို Customize လုပ်ပါ

### အဆင့် 3.1: AI Configuration ကို ပြင်ဆင်ပါ

1. **OpenAI model ကို update လုပ်ပါ:**
```bash
# Change to a different model (if available in your region)
azd env set AZURE_OPENAI_MODEL gpt-4

# Redeploy with the new configuration
azd deploy
```

2. **AI ဝန်ဆောင်မှုများ ထပ်မံထည့်သွင်းပါ:**

`infra/main.bicep` ကို ပြင်ဆင်ပြီး Document Intelligence ထည့်သွင်းပါ:

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

### အဆင့် 3.2: Environment-specific Configuration များ

**အကောင်းဆုံးအလေ့အထ**: Development နှင့် production အတွက် configuration များကို ခွဲခြားပါ။

1. **Production environment တစ်ခု ဖန်တီးပါ:**
```bash
azd env new myai-production
```

2. **Production-specific parameter များကို သတ်မှတ်ပါ:**
```bash
# Production typically uses higher SKUs
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Enable additional security features
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Lab Exercise 3.1: စရိတ်သက်သာမှု**

**အခက်အခဲ**: Development အတွက် စရိတ်သက်သာသော template ကို configure လုပ်ပါ။

**လုပ်ဆောင်ရန်များ:**
1. Free/basic tier သို့ ပြောင်းလဲနိုင်သော SKU များကို ရှာပါ
2. စရိတ်အနည်းဆုံးဖြစ်စေရန် environment variable များကို configure လုပ်ပါ
3. Deploy လုပ်ပြီး production configuration နှင့် စရိတ်ကို နှိုင်းယှဉ်ပါ

**ဖြေရှင်းရန် အကြံပြုချက်များ:**
- Cognitive Services အတွက် F0 (free) tier ကို အသုံးပြုပါ
- Development အတွက် Search Service ကို Basic tier သို့ ပြောင်းပါ
- Function များအတွက် Consumption plan ကို စဉ်းစားပါ

## Module 4: လုံခြုံရေးနှင့် Production အကောင်းဆုံးအလေ့အထ

### အဆင့် 4.1: Credential စီမံခန့်ခွဲမှုကို လုံခြုံစွာ ပြုလုပ်ပါ

**လက်ရှိအခက်အခဲ**: အများစုသော AI app များသည် API key များကို code ထဲတွင် hardcode လုပ်ထားသည် သို့မဟုတ် မလုံခြုံသော storage ကို အသုံးပြုသည်။

**AZD ဖြေရှင်းချက်**: Managed Identity + Key Vault integration

1. **Template ထဲရှိ security configuration ကို ပြန်လည်သုံးသပ်ပါ:**
```bash
# Look for Key Vault and Managed Identity configuration
grep -r "keyVault\|managedIdentity" infra/
```

2. **Managed Identity အလုပ်လုပ်နေမှုကို စစ်ဆေးပါ:**
```bash
# Check if the web app has the correct identity configuration
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### အဆင့် 4.2: Network Security

1. **Private endpoint များကို enable လုပ်ပါ** (configure မလုပ်ထားပါက):

သင့် bicep template ထဲတွင် ထည့်သွင်းပါ:
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
# Application Insights should be automatically configured
# Check the configuration:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **AI-specific monitoring ကို စီမံပါ:**

AI operation များအတွက် custom metric များ ထည့်သွင်းပါ:
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

**လုပ်ဆောင်ရန်**: Deployment ကို security အကောင်းဆုံးအလေ့အထများအတွက် ပြန်လည်သုံးသပ်ပါ။

**စစ်ဆေးရန်စာရင်း:**
- [ ] Code သို့မဟုတ် configuration ထဲတွင် hardcoded secret မရှိပါ
- [ ] Service-to-service authentication အတွက် Managed Identity ကို အသုံးပြုထားပါ
- [ ] Sensitive configuration များကို Key Vault ထဲတွင် သိမ်းဆည်းထားပါ
- [ ] Network access ကို သင့်တင့်စွာ ကန့်သတ်ထားပါ
- [ ] Monitoring နှင့် logging ကို enable လုပ်ထားပါ

## Module 5: သင့်ကိုယ်ပိုင် AI အက်ပလီကေးရှင်းကို ပြောင်းလဲခြင်း

### အဆင့် 5.1: Assessment Worksheet

**သင့် app ကို ပြောင်းလဲမည်မပြုမီ**, ဒီမေးခွန်းများကို ဖြေပါ:

1. **Application Architecture:**
   - သင့် app သည် ဘယ် AI ဝန်ဆောင်မှုများကို အသုံးပြုပါသလဲ?
   - ဘယ် compute resource များလိုအပ်ပါသလဲ?
   - Database လိုအပ်ပါသလား?
   - Service များအကြား dependency များရှိပါသလား?

2. **Security Requirements:**
   - သင့် app သည် ဘယ် sensitive data ကို handle လုပ်ပါသလဲ?
   - Compliance လိုအပ်ချက်များရှိပါသလား?
   - Private networking လိုအပ်ပါသလား?

3. **Scaling Requirements:**
   - မျှော်မှန်းထားသော load ဘယ်လောက်ရှိပါသလဲ?
   - Auto-scaling လိုအပ်ပါသလား?
   - Region-specific လိုအပ်ချက်များရှိပါသလား?

### အဆင့် 5.2: သင့် AZD Template ကို ဖန်တီးပါ

**သင့် app ကို ပြောင်းလဲရန် ဒီ pattern ကို လိုက်နာပါ:**

1. **အခြေခံဖွဲ့စည်းမှုကို ဖန်တီးပါ:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Initialize AZD template
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

**အခက်အခဲ**: Document processing AI app အတွက် AZD template တစ်ခု ဖန်တီးပါ။

**လိုအပ်ချက်များ:**
- Content analysis အတွက် Azure OpenAI
- OCR အတွက် Document Intelligence
- Document upload အတွက် Storage Account
- Processing logic အတွက် Function App
- User interface အတွက် Web app

**အပိုအမှတ်များ:**
- Error handling ကို သင့်တင့်စွာ ထည့်သွင်းပါ
- စရိတ်ခန့်မှန်းမှုကို ထည့်သွင်းပါ
- Monitoring dashboard များကို စီမံပါ

## Module 6: အခက်အခဲများကို Troubleshoot လုပ်ခြင်း

### Deployment အခက်အခဲများ

#### အခက်အခဲ 1: OpenAI Service Quota ကျော်လွန်မှု
**လက္ခဏာများ:** Deployment quota error ဖြင့် မအောင်မြင်ပါ
**ဖြေရှင်းချက်များ:**
```bash
# Check current quotas
az cognitiveservices usage list --location eastus

# Request quota increase or try different region
azd env set AZURE_LOCATION westus2
azd up
```

#### အခက်အခဲ 2: Model သည် Region တွင် မရရှိနိုင်မှု
**လက္ခဏာများ:** AI response မအောင်မြင်ခြင်း သို့မဟုတ် model deployment error
**ဖြေရှင်းချက်များ:**
```bash
# Check model availability by region
az cognitiveservices model list --location eastus

# Update to available model
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### အခက်အခဲ 3: Permission အခက်အခဲ
**လက္ခဏာများ:** AI service များကို ခေါ်ဆိုသောအခါ 403 Forbidden error
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

### Performance အခက်အခဲများ

#### အခက်အခဲ 4: AI Response နှေးကွေးမှု
**စစ်ဆေးရန်အဆင့်များ:**
1. Application Insights တွင် performance metric များကို စစ်ဆေးပါ
2. Azure portal တွင် OpenAI service metric များကို ပြန်လည်သုံးသပ်ပါ
3. Network connectivity နှင့် latency ကို စစ်ဆေးပါ

**ဖြေရှင်းချက်များ:**
- မကြာခဏဖြစ်သော query များအတွက် caching ကို အသုံးပြုပါ
- သင့် use case အတွက် သင့်တင့်သော OpenAI model ကို အသုံးပြုပါ
- High-load scenario များအတွက် read replica များကို စဉ်းစားပါ

### **Lab Exercise 6.1: Debugging Challenge**

**အခြေအနေ**: Deployment အောင်မြင်ခဲ့သော်လည်း application သည် 500 error များပြန်ပေးသည်။

**Debugging လုပ်ဆောင်ရန်များ:**
1. Application log များကို စစ်ဆေးပါ
2. Service connectivity ကို စစ်ဆေးပါ
3. Authentication ကို စမ်းသပ်ပါ
4. Configuration ကို ပြန်လည်သုံးသပ်ပါ

**အသုံးပြုရန် Tools:**
- `azd show` ဖြင့် deployment overview ကို ကြည့်ပါ
- Azure portal တွင် service log များကို ကြည့်ပါ
- Application Insights တွင် application telemetry ကို စစ်ဆေးပါ

## Module 7: Monitoring နှင့် Optimization

### အဆင့် 7.1: Comprehensive Monitoring ကို Set Up လုပ်ပါ

1. **Custom dashboard များကို ဖန်တီးပါ:**

Azure portal သို့ သွားပြီး dashboard တစ်ခု ဖန်တီးပါ:
- OpenAI request count နှင့် latency
- Application error rate
- Resource utilization
- Cost tracking

2. **Alert များကို Set Up လုပ်ပါ:**
```bash
# Alert for high error rate
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### အဆင့် 7.2: စရိတ် Optimization

1. **လက်ရှိစရိတ်ကို ခန့်မှန်းပါ:**
```bash
# Use Azure CLI to get cost data
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **စရိတ်ထိန်းချုပ်မှုကို အကောင်အထည်ဖော်ပါ:**
- Budget alert များကို သတ်မှတ်ပါ
- Autoscaling policy များကို အသုံးပြုပါ
- Request caching ကို အကောင်အထည်ဖော်ပါ
- OpenAI token usage ကို စောင့်ကြည့်ပါ

### **Lab Exercise 7.1: Performance Optimization**

**လုပ်ဆောင်ရန်**: သင့် AI application ကို performance နှင့် cost အတွက် optimize လုပ်ပါ။

**တိုးတက်စေရန် Metric များ:**
- အလယ် response time ကို 20% လျှော့ချပါ
- လစဉ်စရိတ်ကို 15% လျှော့ချပါ
- 99.9%
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 အောင်မြင်မှုလက်မှတ်

ဂုဏ်ယူပါတယ်! သင် AI Workshop Lab ကိုပြီးစီးလိုက်ပါပြီ။ အခုတော့ သင်အောက်ပါအရာများကိုလုပ်နိုင်ပါပြီ-

- ✅ ရှိပြီးသား AI အက်ပလီကေးရှင်းများကို AZD templates သို့ပြောင်းနိုင်ခြင်း
- ✅ ထုတ်လုပ်မှုအဆင်သင့် AI အက်ပလီကေးရှင်းများကို Deploy လုပ်နိုင်ခြင်း
- ✅ AI workload များအတွက် လုံခြုံရေးအကောင်းဆုံးနည်းလမ်းများကို အကောင်အထည်ဖော်နိုင်ခြင်း
- ✅ AI အက်ပလီကေးရှင်းများ၏ performance ကိုကြည့်ရှုပြီး အကောင်းဆုံးအခြေအနေသို့ရောက်အောင်လုပ်နိုင်ခြင်း
- ✅ Deployment အခက်အခဲများကို ဖြေရှင်းနိုင်ခြင်း

### နောက်တစ်ဆင့်လုပ်ဆောင်ရန်
1. ဒီ pattern များကို သင်၏ကိုယ်ပိုင် AI project များတွင် အသုံးချပါ
2. Template များကို community သို့ပြန်လည်ပေးပို့ပါ
3. အဆက်မပြတ်အထောက်အပံ့ရရှိရန် Azure AI Foundry Discord ကို join လုပ်ပါ
4. Multi-region deployments ကဲ့သို့သော အဆင့်မြင့်အကြောင်းအရာများကိုလေ့လာပါ

---

**Workshop Feedback**: ဒီ workshop ကိုပိုမိုကောင်းမွန်အောင်လုပ်ဆောင်ရန် သင်၏အတွေ့အကြုံကို [Azure AI Foundry Discord #Azure channel](https://discord.gg/microsoft-azure) တွင်မျှဝေပါ။

---

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 2 - AI-First Development
- **⬅️ Previous**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Next**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 Next Chapter**: [Chapter 3: Configuration](../getting-started/configuration.md)

**Need Help?** AZD နှင့် AI deployment များအကြောင်းအတွက် အထောက်အပံ့နှင့် ဆွေးနွေးရန် ကျွန်ုပ်တို့၏ community ကို join လုပ်ပါ။

---

**ဝက်ဘ်ဆိုက်မှတ်ချက်**:  
ဤစာရွက်စာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ကို အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှန်ကန်မှုအတွက် ကြိုးစားနေပါသော်လည်း၊ အလိုအလျောက်ဘာသာပြန်ဆိုမှုများတွင် အမှားများ သို့မဟုတ် မမှန်ကန်မှုများ ပါဝင်နိုင်သည်ကို ကျေးဇူးပြု၍ သတိပြုပါ။ မူရင်းစာရွက်စာတမ်းကို ၎င်း၏ မူလဘာသာစကားဖြင့် အာဏာတည်သောရင်းမြစ်အဖြစ် သတ်မှတ်သင့်ပါသည်။ အရေးကြီးသောအချက်အလက်များအတွက် လူပညာရှင်များမှ ဘာသာပြန်ဆိုမှုကို အကြံပြုပါသည်။ ဤဘာသာပြန်ဆိုမှုကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော နားလည်မှုမှားများ သို့မဟုတ် အဓိပ္ပါယ်မှားများအတွက် ကျွန်ုပ်တို့သည် တာဝန်မယူပါ။