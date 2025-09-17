<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "668bc93b35c9249e52245a0b037b6011",
  "translation_date": "2025-09-12T23:08:25+00:00",
  "source_file": "docs/ai-foundry/ai-workshop-lab.md",
  "language_code": "my"
}
-->
# AI Workshop Lab: AI Solution များကို AZD-Deployable အဖြစ် ပြင်ဆင်ခြင်း

**အရင်:** [AI Model Deployment](ai-model-deployment.md) | **နောက်တစ်ခု:** [Production AI Practices](production-ai-practices.md)

## Workshop အကျဉ်းချုပ်

ဒီလက်တွေ့လေ့လာရေးအခန်းမှာ Developer များကို Azure Developer CLI (AZD) ကို အသုံးပြု၍ ရှိပြီးသား AI အက်ပလီကေးရှင်းကို Deploy လုပ်နိုင်အောင် ပြင်ဆင်ခြင်း လမ်းကြောင်းကို လမ်းညွှန်ပေးပါမည်။ Azure AI Foundry ဝန်ဆောင်မှုများကို အသုံးပြု၍ Production AI Deployment များအတွက် အရေးကြီးသော Pattern များကို သင်ယူနိုင်ပါမည်။

**ကြာမြင့်ချိန်:** ၂-၃ နာရီ  
**အဆင့်:** အလယ်အလတ်  
**လိုအပ်ချက်များ:** Azure အခြေခံအသိပညာ၊ AI/ML အကြောင်းအရာများနှင့် ရင်းနှီးမှု

## 🎓 သင်ယူရမည့်အရာများ

ဒီ Workshop အဆုံးသတ်ချိန်တွင် သင်တတ်မြောက်မည့်အရာများမှာ:
- ✅ ရှိပြီးသား AI အက်ပလီကေးရှင်းကို AZD Template များသို့ ပြောင်းလဲခြင်း
- ✅ Azure AI Foundry ဝန်ဆောင်မှုများကို AZD ဖြင့် Configure လုပ်ခြင်း
- ✅ AI ဝန်ဆောင်မှုများအတွက် လုံခြုံသော Credential စီမံခန့်ခွဲမှုကို အကောင်အထည်ဖော်ခြင်း
- ✅ Monitoring ပါဝင်သော Production-Ready AI အက်ပလီကေးရှင်းများကို Deploy လုပ်ခြင်း
- ✅ AI Deployment အခက်အခဲများကို ဖြေရှင်းခြင်း

## လိုအပ်ချက်များ

### လိုအပ်သော Tools
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) ကို Install လုပ်ထားရမည်
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) ကို Install လုပ်ထားရမည်
- [Git](https://git-scm.com/) ကို Install လုပ်ထားရမည်
- Code editor (VS Code ကို အကြံပြုပါသည်)

### Azure Resources
- Contributor Access ရှိသော Azure Subscription
- Azure OpenAI ဝန်ဆောင်မှုများကို အသုံးပြုခွင့် (သို့မဟုတ် ခွင့်တောင်းနိုင်မှု)
- Resource Group ဖန်တီးခွင့်

### အသိပညာလိုအပ်ချက်များ
- Azure ဝန်ဆောင်မှုများအခြေခံကို နားလည်မှု
- Command-line Interface များနှင့် ရင်းနှီးမှု
- AI/ML အခြေခံအကြောင်းအရာများ (API, Model, Prompt)

## Lab Setup

### အဆင့် ၁: ပတ်ဝန်းကျင် ပြင်ဆင်ခြင်း

1. **Tool Installation များကို စစ်ဆေးပါ:**
```bash
# Check AZD installation
azd version

# Check Azure CLI
az --version

# Login to Azure
az login
azd auth login
```

2. **Workshop Repository ကို Clone လုပ်ပါ:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Module 1: AZD Structure ကို နားလည်ခြင်း

### AI AZD Template ၏ အခြေခံဖိုင်များ

AI-ready AZD Template ၏ အရေးကြီးသော ဖိုင်များကို လေ့လာပါ:

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
- AI Components များအတွက် Service Definition
- Environment Variable Mapping များ
- Host Configuration များ

2. **main.bicep Infrastructure ကို ပြန်လည်သုံးသပ်ပါ:**
```bash
cat infra/main.bicep
```

**AI Pattern အရေးကြီးသောအချက်များ:**
- Azure OpenAI Service Provisioning
- Cognitive Search Integration
- Secure Key Management
- Network Security Configuration

### **ဆွေးနွေးရန်အချက်:** AI အတွက် Pattern များ၏ အရေးကြီးမှု

- **Service Dependencies**: AI အက်ပလီကေးရှင်းများသည် ဝန်ဆောင်မှုများကို ပေါင်းစပ်အသုံးပြုရန် လိုအပ်သည်
- **Security**: API Key များနှင့် Endpoint များကို လုံခြုံစွာ စီမံခန့်ခွဲရန် လိုအပ်သည်
- **Scalability**: AI Workload များတွင် ထူးခြားသော Scaling လိုအပ်ချက်များ ရှိသည်
- **Cost Management**: AI ဝန်ဆောင်မှုများသည် သင့်တင့်စွာ Configure မလုပ်ပါက စရိတ်များကြီးမားနိုင်သည်

## Module 2: AI Application ကို ပထမဆုံး Deploy လုပ်ခြင်း

### အဆင့် 2.1: ပတ်ဝန်းကျင် Initialize လုပ်ခြင်း

1. **AZD Environment အသစ်တစ်ခု ဖန်တီးပါ:**
```bash
azd env new myai-workshop
```

2. **လိုအပ်သော Parameter များကို သတ်မှတ်ပါ:**
```bash
# Set your preferred Azure region
azd env set AZURE_LOCATION eastus

# Optional: Set specific OpenAI model
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

2. **Deployment Progress ကို စောင့်ကြည့်ပါ** နှင့် ဖန်တီးနေသော Resource များကို မှတ်သားပါ။

### အဆင့် 2.3: Deployment ကို Verify လုပ်ပါ

1. **Deploy လုပ်ထားသော Resource များကို စစ်ဆေးပါ:**
```bash
azd show
```

2. **Deploy လုပ်ထားသော Application ကို ဖွင့်ပါ:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **AI Functionality ကို စမ်းသပ်ပါ:**
   - Web Application သို့ သွားပါ
   - Sample Query များကို စမ်းသပ်ပါ
   - AI Response များအလုပ်လုပ်နေမှုကို Verify လုပ်ပါ

### **Lab Exercise 2.1: Troubleshooting လေ့ကျင့်မှု**

**အခြေအနေ**: Deployment အောင်မြင်ခဲ့သော်လည်း AI Response မပေးပါ။

**စစ်ဆေးရန် အကြောင်းအရာများ:**
1. **OpenAI API Key**: မှန်ကန်စွာ Set လုပ်ထားမှုကို Verify လုပ်ပါ
2. **Model Availability**: သင့် Region တွင် Model ကို Support လုပ်မှုကို စစ်ဆေးပါ
3. **Network Connectivity**: Service များအချင်းချင်း ဆက်သွယ်နိုင်မှုကို စစ်ဆေးပါ
4. **RBAC Permission**: App သည် OpenAI ကို Access လုပ်နိုင်မှုကို Verify လုပ်ပါ

**Debugging Command များ:**
```bash
# Check environment variables
azd env get-values

# View deployment logs
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Check OpenAI deployment status
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Module 3: AI Application များကို Customize လုပ်ခြင်း

### အဆင့် 3.1: AI Configuration ကို ပြင်ဆင်ခြင်း

1. **OpenAI Model ကို Update လုပ်ပါ:**
```bash
# Change to a different model (if available in your region)
azd env set AZURE_OPENAI_MODEL gpt-4

# Redeploy with the new configuration
azd deploy
```

2. **AI Service များကို ထပ်မံထည့်သွင်းပါ:**

`infra/main.bicep` ကို ပြင်ဆင်ပြီး Document Intelligence ကို ထည့်ပါ:

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

2. **Production-Specific Parameter များကို သတ်မှတ်ပါ:**
```bash
# Production typically uses higher SKUs
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Enable additional security features
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Lab Exercise 3.1: စရိတ်သက်သာမှု**

**အခက်အခဲ**: Development အတွက် စရိတ်သက်သာသော Template ကို Configure လုပ်ပါ။

**လုပ်ဆောင်ရန်များ:**
1. Free/Basic Tier သို့ Set လုပ်နိုင်သော SKU များကို ရှာပါ
2. စရိတ်သက်သာမှုအတွက် Environment Variable များကို Configure လုပ်ပါ
3. Deploy လုပ်ပြီး Production Configuration နှင့် စရိတ်ကို နှိုင်းယှဉ်ပါ

**ဖြေရှင်းရန် အကြံပြုချက်များ:**
- Cognitive Services အတွက် F0 (Free) Tier ကို အသုံးပြုပါ
- Development အတွက် Search Service အတွက် Basic Tier ကို အသုံးပြုပါ
- Function များအတွက် Consumption Plan ကို စဉ်းစားပါ

## Module 4: လုံခြုံရေးနှင့် Production အကောင်းဆုံးအလေ့အကျင့်များ

### အဆင့် 4.1: Credential Management ကို လုံခြုံစွာ စီမံခြင်း

**လက်ရှိအခက်အခဲ**: AI Application များသည် API Key များကို Code ထဲတွင် Hardcode လုပ်ခြင်း သို့မဟုတ် မလုံခြုံသော Storage ကို အသုံးပြုခြင်း။

**AZD ဖြေရှင်းနည်း**: Managed Identity + Key Vault Integration

1. **Template ထဲရှိ Security Configuration ကို ပြန်လည်သုံးသပ်ပါ:**
```bash
# Look for Key Vault and Managed Identity configuration
grep -r "keyVault\|managedIdentity" infra/
```

2. **Managed Identity အလုပ်လုပ်နေမှုကို Verify လုပ်ပါ:**
```bash
# Check if the web app has the correct identity configuration
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### အဆင့် 4.2: Network Security

1. **Private Endpoint များ Enable လုပ်ပါ** (Configure မလုပ်ထားပါက):

Bicep Template ထဲတွင် ထည့်သွင်းပါ:
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
# Application Insights should be automatically configured
# Check the configuration:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **AI-Specific Monitoring ကို Set Up လုပ်ပါ:**

AI Operation များအတွက် Custom Metrics ထည့်သွင်းပါ:
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
- [ ] Code သို့မဟုတ် Configuration ထဲတွင် Hardcoded Secret မရှိပါ
- [ ] Service-to-Service Authentication အတွက် Managed Identity ကို အသုံးပြုထားပါ
- [ ] Sensitive Configuration များကို Key Vault ထဲတွင် သိမ်းဆည်းထားပါ
- [ ] Network Access ကို သင့်တင့်စွာ ကန့်သတ်ထားပါ
- [ ] Monitoring နှင့် Logging ကို Enable လုပ်ထားပါ

## Module 5: သင့်ကိုယ်ပိုင် AI Application ကို ပြောင်းလဲခြင်း

### အဆင့် 5.1: Assessment Worksheet

**သင့် App ကို ပြောင်းလဲမည်မတိုင်မီ**, ဒီမေးခွန်းများကို ဖြေပါ:

1. **Application Architecture:**
   - သင့် App သည် ဘယ် AI Service များကို အသုံးပြုပါသလဲ?
   - ဘယ် Compute Resource များလိုအပ်ပါသလဲ?
   - Database လိုအပ်ပါသလား?
   - Service များအကြား Dependency များရှိပါသလား?

2. **Security Requirements:**
   - သင့် App သည် ဘယ် Sensitive Data ကို Handle လုပ်ပါသလဲ?
   - Compliance Requirement များရှိပါသလား?
   - Private Networking လိုအပ်ပါသလား?

3. **Scaling Requirements:**
   - မျှော်မှန်း Load ဘယ်လောက်ရှိပါသလဲ?
   - Auto-Scaling လိုအပ်ပါသလား?
   - Region-specific Requirement များရှိပါသလား?

### အဆင့် 5.2: AZD Template ကို ဖန်တီးပါ

**သင့် App ကို ပြောင်းလဲရန် ဒီ Pattern ကို လိုက်နာပါ:**

1. **အခြေခံ Structure ကို ဖန်တီးပါ:**
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

3. **Infrastructure Template များကို ဖန်တီးပါ:**

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

**အခက်အခဲ**: Document Processing AI Application အတွက် AZD Template တစ်ခု ဖန်တီးပါ။

**လိုအပ်ချက်များ:**
- Content Analysis အတွက် Azure OpenAI
- OCR အတွက် Document Intelligence
- Document Upload အတွက် Storage Account
- Processing Logic အတွက် Function App
- User Interface အတွက် Web App

**အပိုအမှတ်များ:**
- Error Handling ကို သင့်တင့်စွာ ထည့်သွင်းပါ
- စရိတ်ခန့်မှန်းမှုကို ထည့်သွင်းပါ
- Monitoring Dashboard များကို Set Up လုပ်ပါ

## Module 6: အခက်အခဲများကို Troubleshoot လုပ်ခြင်း

### Deployment အခက်အခဲများ

#### အခက်အခဲ 1: OpenAI Service Quota ကျော်လွန်မှု
**လက္ခဏာများ:** Deployment မှာ Quota Error ဖြစ်သည်  
**ဖြေရှင်းနည်းများ:**
```bash
# Check current quotas
az cognitiveservices usage list --location eastus

# Request quota increase or try different region
azd env set AZURE_LOCATION westus2
azd up
```

#### အခက်အခဲ 2: Model သည် Region တွင် မရရှိနိုင်ခြင်း
**လက္ခဏာများ:** AI Response မအောင်မြင်ခြင်း သို့မဟုတ် Model Deployment Error  
**ဖြေရှင်းနည်းများ:**
```bash
# Check model availability by region
az cognitiveservices model list --location eastus

# Update to available model
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### အခက်အခဲ 3: Permission အခက်အခဲ
**လက္ခဏာများ:** AI Service များကို ခေါ်ဆိုရာတွင် 403 Forbidden Error  
**ဖြေရှင်းနည်းများ:**
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
1. Application Insights တွင် Performance Metrics ကို စစ်ဆေးပါ
2. Azure Portal တွင် OpenAI Service Metrics ကို ပြန်လည်သုံးသပ်ပါ
3. Network Connectivity နှင့် Latency ကို Verify လုပ်ပါ

**ဖြေရှင်းနည်းများ:**
- Common Query များအတွက် Caching ကို အကောင်အထည်ဖော်ပါ
- သင့် Use Case အတွက် သင့်တင့်သော OpenAI Model ကို အသုံးပြုပါ
- High-Load အခြေအနေများအတွက် Read Replica များကို စဉ်းစားပါ

### **Lab Exercise 6.1: Debugging Challenge**

**အခြေအနေ**: Deployment အောင်မြင်ခဲ့သော်လည်း Application မှ 500 Error ပြန်ပေးသည်။

**Debugging လုပ်ဆောင်ရန်များ:**
1. Application Log များကို စစ်ဆေးပါ
2. Service Connectivity ကို Verify လုပ်ပါ
3. Authentication ကို စမ်းသပ်ပါ
4. Configuration ကို ပြန်လည်သုံးသပ်ပါ

**အသုံးပြုရန် Tools:**
- `azd show` ဖြင့် Deployment Overview ကို ကြည့်ပါ
- Azure Portal တွင် Service Log များကို ကြည့်ပါ
- Application Insights တွင် Application Telemetry ကို ကြည့်ပါ

## Module 7: Monitoring နှင့် Optimization

### အဆင့် 7.1: Comprehensive Monitoring ကို Set Up လုပ်ပါ

1. **Custom Dashboard များကို ဖန်တီးပါ:**

Azure Portal သို့ သွားပြီး Dashboard တစ်ခု ဖန်တီးပါ:
- OpenAI Request Count နှင့် Latency
- Application Error Rate
- Resource Utilization
- Cost Tracking

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

### အဆင့် 7.2: စရိတ်သက်သာမှု

1. **လက်ရှိစရိတ်ကို Analysis လုပ်ပါ:**
```bash
# Use Azure CLI to get cost data
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Cost Control များကို အကောင်အထည်ဖော်ပါ:**
- Budget Alert များကို Set Up လုပ်ပါ
- Autoscaling Policy များကို အသုံးပြုပါ
- Request Caching ကို အကောင်အထည်ဖော်ပါ
- OpenAI Token Usage ကို Monitor လုပ်ပါ

### **Lab Exercise 7.1: Performance Optimization**

**လုပ်ဆောင်ရန်**: သင့် AI Application ကို Performance နှင့် Cost အတွက် Optimize လုပ်ပါ။

**တိုးတက်စေရန် Metrics:**
- Response Time ကို ၂၀% လျှော့ချပါ
- Monthly Cost ကို ၁၅% လျှော့ချပါ
- 99.9% Uptime ကို ထိန်းသိမ်းပါ

**စဉ်းစားရန် Strategies:**
- Response Caching ကို အကောင်အထည်ဖော်ပါ
- Token Efficiency အတွက် Prompt များကို Optimize လုပ်ပါ
- သင့် Compute SKU များကို Optimize လုပ်ပါ
- Autoscaling ကို သင့်တင့်စွာ Set Up လုပ်ပါ

## Final Challenge: အဆုံး-to-အဆုံး Implementation

### Challenge အခြေအနေ

သင့်အား Production-Ready AI-Powered Customer Service Chatbot တစ်ခု ဖန်တီးရန် တာဝန်ပေးထားသည်။ အောက်ပါလိုအပ်ချက်များပါဝင်သည်:

**Functional Requirements:**
- Customer Interaction အတွက် Web Interface
- Response အတွက် Azure OpenAI Integration
- Document Search အတွက် Cognitive Search
- ရှိပြီးသား Customer Database နှင့် Integration
- Multi-Language Support

**Non-Functional Requirements:**
- 1000 Concurrent User များကို Handle လုပ်
- ✅ AI workload များအတွက် လုံခြုံရေးအကောင်းဆုံး လုပ်ထုံးလုပ်နည်းများကို အကောင်အထည်ဖော်ပါ
- ✅ AI အက်ပလီကေးရှင်း၏ လုပ်ဆောင်မှုကို စောင့်ကြည့်ပြီး အကောင်းဆုံးအခြေအနေသို့ ပြုပြင်တိုးတက်အောင်လုပ်ပါ
- ✅ Deployment အခက်အခဲများကို ဖြေရှင်းပါ

### နောက်ထပ်အဆင့်များ
1. သင်၏ကိုယ်ပိုင် AI ပရောဂျက်များတွင် ဤပုံစံများကို အသုံးပြုပါ
2. Template များကို ပြန်လည်ပေးအပ်ပြီး အသိုင်းအဝိုင်းကို အထောက်အကူပြုပါ
3. Azure AI Foundry Discord တွင် ဆက်လက်အထောက်အပံ့ရရှိရန် ပါဝင်ပါ
4. Multi-region deployment ကဲ့သို့သော အဆင့်မြင့်အကြောင်းအရာများကို လေ့လာပါ

---

**Workshop Feedback**: ဤ workshop ကို ပိုမိုကောင်းမွန်အောင် သင်၏အတွေ့အကြုံကို [Azure AI Foundry Discord #Azure channel](https://discord.gg/microsoft-azure) တွင် မျှဝေပါ။

---

**အရင်:** [AI Model Deployment](ai-model-deployment.md) | **နောက်တစ်ခု:** [Production AI Practices](production-ai-practices.md)

**အကူအညီလိုအပ်ပါသလား?** AZD နှင့် AI deployment များအကြောင်း ဆွေးနွေးရန်နှင့် အထောက်အပံ့ရရန် ကျွန်ုပ်တို့၏ အသိုင်းအဝိုင်းတွင် ပါဝင်ပါ။

---

**အကြောင်းကြားချက်**:  
ဤစာရွက်စာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ကို အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှုအတွက် ကြိုးစားနေသော်လည်း၊ အလိုအလျောက် ဘာသာပြန်မှုများတွင် အမှားများ သို့မဟုတ် မတိကျမှုများ ပါဝင်နိုင်သည်ကို သတိပြုပါ။ မူရင်းဘာသာစကားဖြင့် ရေးသားထားသော စာရွက်စာတမ်းကို အာဏာရှိသော ရင်းမြစ်အဖြစ် သတ်မှတ်သင့်ပါသည်။ အရေးကြီးသော အချက်အလက်များအတွက် လူ့ဘာသာပြန်ပညာရှင်များမှ ပရော်ဖက်ရှင်နယ် ဘာသာပြန်မှုကို အကြံပြုပါသည်။ ဤဘာသာပြန်မှုကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော အလွဲအမှားများ သို့မဟုတ် အနားလွဲမှုများအတွက် ကျွန်ုပ်တို့သည် တာဝန်မယူပါ။