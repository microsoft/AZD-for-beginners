<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6c3d0f9ef66c2cd692a55a2811d9c3e5",
  "translation_date": "2025-09-15T15:39:09+00:00",
  "source_file": "README.md",
  "language_code": "my"
}
-->
# AZD အတွက် အခြေခံလမ်းညွှန်

![AZD-for-beginners](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.my.png) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)

[![Azure AI Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/kzRShWzttr)](https://discord.gg/kzRShWzttr)

ဤအရင်းအမြစ်များကို အသုံးပြုရန် အောက်ပါအဆင့်များကို လိုက်နာပါ။
1. **Repository ကို Fork လုပ်ပါ**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork) ကိုနှိပ်ပါ။
2. **Repository ကို Clone လုပ်ပါ**: `git clone https://github.com/microsoft/azd-for-beginners.git`
3. [**Azure Discord Communities ကို Join လုပ်ပြီး ကျွမ်းကျင်သူများနှင့် Developer မိတ်ဆွေများနှင့် တွေ့ဆုံပါ**](https://discord.com/invite/ByRwuEEgH4)

### ဘာသာစကားများ အထောက်အပံ့

#### GitHub Action မှတဆင့် အလိုအလျောက် (အမြဲ Update ဖြစ်နေသော)

[French](../fr/README.md) | [Spanish](../es/README.md) | [German](../de/README.md) | [Russian](../ru/README.md) | [Arabic](../ar/README.md) | [Persian (Farsi)](../fa/README.md) | [Urdu](../ur/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Japanese](../ja/README.md) | [Korean](../ko/README.md) | [Hindi](../hi/README.md) | [Bengali](../bn/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Portuguese (Brazil)](../br/README.md) | [Italian](../it/README.md) | [Polish](../pl/README.md) | [Turkish](../tr/README.md) | [Greek](../el/README.md) | [Thai](../th/README.md) | [Swedish](../sv/README.md) | [Danish](../da/README.md) | [Norwegian](../no/README.md) | [Finnish](../fi/README.md) | [Dutch](../nl/README.md) | [Hebrew](../he/README.md) | [Vietnamese](../vi/README.md) | [Indonesian](../id/README.md) | [Malay](../ms/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Swahili](../sw/README.md) | [Hungarian](../hu/README.md) | [Czech](../cs/README.md) | [Slovak](../sk/README.md) | [Romanian](../ro/README.md) | [Bulgarian](../bg/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Croatian](../hr/README.md) | [Slovenian](../sl/README.md) | [Ukrainian](../uk/README.md) | [Burmese (Myanmar)](./README.md)

**အပိုဘာသာစကားများထည့်သွင်းလိုပါက [ဒီမှာ](https://github.com/Azure/co-op-translator/blob/main/getting_started/supported-languages.md) ရှိသောစာရင်းကို ကြည့်ပါ။**

## မိတ်ဆက်

Azure Developer CLI (azd) အတွက် လမ်းညွှန်အပြည့်အစုံကို ကြိုဆိုပါတယ်။ ဒီ repository ကို ကျောင်းသားများမှ စ၍ ပရော်ဖက်ရှင်နယ် developer များအထိ Azure Developer CLI ကို သင်ယူပြီး cloud deployment ကို ထိရောက်စွာလုပ်ဆောင်နိုင်ရန် ရည်ရွယ်ထားပါတယ်။ **အထူးသဖြင့် Azure AI Foundry ကို အသုံးပြုသော AI application deployment အပေါ် အာရုံစိုက်ထားပါတယ်။** ဒီ structured learning resource က Azure cloud deployment, အခက်အခဲများကို ဖြေရှင်းခြင်းနှင့် AZD template deployment အောင်မြင်စွာလုပ်ဆောင်ရန်အတွက် လုပ်ဆောင်ရမည့်အကောင်းဆုံးနည်းလမ်းများကို လက်တွေ့ကျကျ သင်ပေးပါမည်။

### **AI Developer များအတွက် ဒီလမ်းညွှန်က အရေးကြီးတဲ့အကြောင်း**
Azure AI Foundry Discord community poll အရ **developer များ၏ 45% က AZD ကို AI workload များအတွက် အသုံးပြုလိုကြောင်း စိတ်ဝင်စားနေကြသည်**။ သို့သော် အောက်ပါအခက်အခဲများကြောင့် အခက်အခဲရှိနေသည်။
- AI service များစွာပါဝင်သော architecture များ၏ ရှုပ်ထွေးမှု
- Production AI deployment အတွက် အကောင်းဆုံးနည်းလမ်းများ
- Azure AI service များကို ပေါင်းစည်းခြင်းနှင့် configuration
- AI workload များအတွက် ကုန်ကျစရိတ်ကို အထိရောက်ဆုံးဖြေရှင်းခြင်း
- AI-specific deployment အခက်အခဲများကို ဖြေရှင်းခြင်း

## သင်ယူရမည့်ရည်မှန်းချက်များ

ဒီ repository ကို လေ့လာပြီးနောက်တွင် သင်သည်:
- Azure Developer CLI အခြေခံနှင့် အဓိကအကြောင်းအရာများကို ကျွမ်းကျင်စွာ သိရှိမည်။
- Infrastructure as Code ကို အသုံးပြု၍ Azure resource များကို deploy နှင့် provision လုပ်နိုင်မည်။
- AZD deployment အခက်အခဲများကို ဖြေရှင်းနိုင်မည်။
- Pre-deployment validation နှင့် capacity planning ကို နားလည်မည်။
- Security နှင့် cost optimization strategy များကို အကောင်းဆုံးလုပ်ဆောင်နိုင်မည်။
- Azure တွင် production-ready application များကို deploy လုပ်ရာတွင် ယုံကြည်မှုရှိမည်။

## သင်ယူပြီးရရှိမည့်ရလဒ်များ

ဒီ course ကို ပြီးမြောက်ပြီးနောက်တွင် သင်သည်:
- Azure Developer CLI ကို အောင်မြင်စွာ install, configure နှင့် အသုံးပြုနိုင်မည်။
- AZD template များကို အသုံးပြု၍ application များကို create နှင့် deploy လုပ်နိုင်မည်။
- Authentication, infrastructure နှင့် deployment အခက်အခဲများကို troubleshoot လုပ်နိုင်မည်။
- Pre-deployment check များကို လုပ်ဆောင်နိုင်မည် (capacity planning နှင့် SKU selection အပါအဝင်)။
- Monitoring, security နှင့် cost management အကောင်းဆုံးနည်းလမ်းများကို အကောင်အထည်ဖော်နိုင်မည်။
- AZD workflow များကို CI/CD pipeline များတွင် ပေါင်းစည်းနိုင်မည်။

## အကြောင်းအရာများ

- [Azure Developer CLI ဆိုတာဘာလဲ?](../..)
- [Quick Start](../..)
- [သင်ယူလမ်းကြောင်း](../..)
  - [AI Developer များအတွက် (ဒီမှာစတင်ရန် အကြံပြုပါသည်!)](../..)
  - [ကျောင်းသားများနှင့် အခြေခံသူများအတွက်](../..)
  - [Developer များအတွက်](../..)
  - [DevOps Engineer များအတွက်](../..)
- [Documentation](../..)
  - [စတင်ခြင်း](../..)
  - [Deployment နှင့် Provisioning](../..)
  - [Pre-Deployment Checks](../..)
  - [AI နှင့် Azure AI Foundry](../..)
  - [Troubleshooting](../..)
- [ဥပမာများနှင့် Template များ](../..)
  - [Featured: Azure AI Foundry Templates](../..)
  - [Featured: Azure AI Foundry E2E Scenarios](../..)
  - [အပို AZD Template များ](../..)
  - [လက်တွေ့ကျကျ လေ့ကျင့်ခန်းများနှင့် Workshop များ](../..)
- [အရင်းအမြစ်များ](../..)
- [Contributing](../..)
- [အထောက်အပံ့](../..)
- [Community](../..)

## Azure Developer CLI ဆိုတာဘာလဲ?

Azure Developer CLI (azd) သည် Azure တွင် application များကို တိုးတက်မြန်ဆန်စွာ build နှင့် deploy လုပ်ရန်အတွက် developer များအတွက် အထူးပြု command-line interface တစ်ခုဖြစ်သည်။ ၎င်းသည် အောက်ပါအကျိုးကျေးဇူးများကို ပေးစွမ်းသည်။

- **Template-based deployments** - Application pattern များအတွက် pre-built template များကို အသုံးပြုနိုင်သည်။
- **Infrastructure as Code** - Bicep သို့မဟုတ် Terraform ကို အသုံးပြု၍ Azure resource များကို စီမံနိုင်သည်။
- **Integrated workflows** - Application များကို provision, deploy နှင့် monitor လုပ်ရန် seamless workflow များကို ပေးစွမ်းသည်။
- **Developer-friendly** - Developer များအတွက် productivity နှင့် အတွေ့အကြုံကို အထူးပြုထားသည်။

### **AZD + Azure AI Foundry: AI Deployment များအတွက် အကောင်းဆုံး**

**AI Solution များအတွက် AZD ကို ဘာကြောင့် အသုံးပြုသင့်သလဲ?** AZD သည် AI developer များရင်ဆိုင်နေရသော အခက်အခဲများကို ဖြေရှင်းပေးသည်။

- **AI-Ready Templates** - Azure OpenAI, Cognitive Services နှင့် ML workload များအတွက် pre-configured template များ
- **Secure AI Deployments** - AI service များ, API key များနှင့် model endpoint များအတွက် built-in security pattern များ
- **Production AI Patterns** - Scalable, cost-effective AI application deployment များအတွက် အကောင်းဆုံးနည်းလမ်းများ
- **End-to-End AI Workflows** - Model development မှ production deployment အထိ monitoring အပြည့်အစုံ
- **Cost Optimization** - AI workload များအတွက် resource allocation နှင့် scaling strategy များ
- **Azure AI Foundry Integration** - AI Foundry model catalog နှင့် endpoint များနှင့် seamless connection

## Quick Start

### လိုအပ်ချက်များ
- Azure subscription
- Azure CLI install လုပ်ထားရမည်
- Git (template များကို clone လုပ်ရန်)

### Installation
```bash
# Windows (PowerShell)
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"

# macOS/Linux
curl -fsSL https://aka.ms/install-azd.sh | bash
```

### သင့်ရဲ့ ပထမဆုံး Deployment
```bash
# Initialize a new project
azd init --template todo-nodejs-mongo

# Provision Azure resources and deploy
azd up
```

### သင့်ရဲ့ ပထမဆုံး AI Deployment
```bash
# Initialize an AI-powered chat application with Azure OpenAI
azd init --template azure-search-openai-demo

# Configure AI services and deploy
azd up

# Or try other AI templates:
azd init --template openai-chat-app-quickstart
azd init --template ai-document-processing
azd init --template contoso-chat
```

## သင်ယူလမ်းကြောင်း

### AI Developer များအတွက် (ဒီမှာစတင်ရန် အကြံပြုပါသည်!)
1. **Quick Start**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) template ကို စမ်းသုံးပါ။
2. **အခြေခံများကို သင်ယူပါ**: [AZD Basics](docs/getting-started/azd-basics.md) + [Azure AI Foundry Integration](docs/ai-foundry/azure-ai-foundry-integration.md)
3. **လက်တွေ့ကျကျ လေ့ကျင့်ပါ**: [AI Workshop Lab](docs/ai-foundry/ai-workshop-lab.md) ကို ပြီးမြောက်ပါ။
4. **Production Ready**: [Production AI Best Practices](docs/ai-foundry/production-ai-practices.md) ကို ပြန်လည်သုံးသပ်ပါ။
5. **အဆင့်မြင့်**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat) enterprise template ကို deploy လုပ်ပါ။

### ကျောင်းသားများနှင့် အခြေခံသူများအတွက်
1. [AZD Basics](docs/getting-started/azd-basics.md) ကို စတင်ပါ။
2. [Installation Guide](docs/getting-started/installation.md) ကို လိုက်နာပါ။
3. [Your First Project](docs/getting-started/first-project.md) ကို ပြီးမြောက်ပါ။
4. [Simple Web App Example](../../examples/simple-web-app) ကို လေ့ကျင့်ပါ။

### Developer များအတွက်
1. [Configuration Guide](docs/getting-started/configuration.md) ကို ပြန်လည်သုံးသပ်ပါ။
2. [Deployment Guide](docs/deployment/deployment-guide.md) ကို လေ့လာပါ။
3. [Database App Example](../../examples/database-app) ကို လုပ်ဆောင်ပါ။
4. [Container App Example](../../examples/container-app) ကို စမ်းသုံးပါ။

### DevOps Engineer များအတွက်
1. [Provisioning Resources](docs/deployment/provisioning.md) ကို ကျွမ်းကျင်ပါ။
2. [Pre-flight Checks](docs/pre-deployment/preflight-checks.md) ကို လေ့ကျင့်ပါ။
3. [Capacity Planning](docs/pre-deployment/capacity-planning.md) ကို လုပ်ဆောင်ပါ။
4. [Microservices Example](../../examples/microservices) ကို စမ်းသုံးပါ။

## Documentation

### စတင်ခြင်း
- [**AZD Basics**](docs/getting-started/azd-basics.md) - အဓိကအကြောင်းအရာများနှင့် အခြေခံအချက်များ
- [**Installation & Setup**](docs/getting-started/installation.md) - Platform-specific installation လမ်းညွှန်များ
- [**Configuration**](docs/getting-started/configuration.md) - Environment setup နှင့် authentication
- [**Your First Project**](docs/getting-started/first-project.md) - အဆင့်ဆင့် လမ်းညွှန်

### Deployment နှင့် Provisioning
- [**Deployment Guide**](docs/deployment/deployment-guide.md) - Deployment workflow အပြည့်အစုံ
- [**Provisioning Resources**](docs/deployment/provisioning.md) - Azure resource စီမံခန့်ခွဲမှု

### Pre-Deployment Checks
- [**Capacity Planning**](docs/pre-deployment/capacity-planning.md) - Azure resource capacity validation
- [**SKU Selection**](docs/pre-deployment/sku-selection.md) - Azure SKU များကို ရွေးချယ်ခြင်း
- [**Pre-flight Checks**](docs/pre-deployment/preflight-checks.md) - Automated validation script များ

### AI နှင့် Azure AI Foundry
- [**Azure AI Foundry Integration**](docs/ai-foundry/azure-ai-foundry-integration.md) - AZD ကို Azure AI Foundry service များနှင့် ချိတ်ဆက်ခြင်း
- [**AI Model Deployment Patterns**](docs/ai-foundry/ai-model-deployment.md) - AZD ဖြင့် AI model များကို deploy နှင့် စီမံခြင်း
- [**AI Workshop Lab**](docs/ai-foundry/ai-workshop-lab.md) - Hands-on lab: AI solution များကို AZD-ready ဖြစ်အောင် ပြင်ဆင်ခြင်း
- [**Production AI Best Practices**](docs/ai-foundry/production-ai-practices.md) - AI workload များအတွက် security, scaling နှင့် monitoring

### Troubleshooting
- [**Common Issues**](docs/troubleshooting/common-issues.md) - မကြုံဖူးသော အခက်အခဲများနှင့် ဖြေရှင်းနည်းများ
- [**Debugging Guide**](docs/troubleshooting/debugging.md) - အဆင့်ဆင့် Debugging နည်းလမ်းများ  
- [**AI-Specific Troubleshooting**](docs/troubleshooting/ai-troubleshooting.md) - AI ဝန်ဆောင်မှုနှင့် မော်ဒယ်တင်သွင်းမှုဆိုင်ရာ ပြဿနာများ  

## ဥပမာများနှင့် Template များ  

### [Featured: Azure AI Foundry Templates](https://ai.azure.com/resource/build/templates)  
**AI အက်ပလီကေးရှင်းများကို တင်သွင်းမည်ဆိုပါက ဒီနေရာမှ စတင်ပါ!**  

| Template | ဖော်ပြချက် | အဆင့်အတန်း | ဝန်ဆောင်မှုများ |  
|----------|-------------|------------|----------|  
| [**AI chat ဖြင့် စတင်ပါ**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Azure Container Apps ကို အသုံးပြု၍ သင့်ဒေတာနှင့် telemetry အမြင်များနှင့် ပေါင်းစပ်ထားသော chat application တစ်ခုကို ဖန်တီးပြီး တင်သွင်းပါ |⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights |  
| [**AI agents ဖြင့် စတင်ပါ**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Azure Container Apps ကို အသုံးပြု၍ လုပ်ဆောင်မှုများနှင့် telemetry အမြင်များပါဝင်သော agent application တစ်ခုကို ဖန်တီးပြီး တင်သွင်းပါ။ |⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights|  
| [**Multi-agent workflow automation**](https://github.com/Azure-Samples/get-started-with-ai-chat) | AI agents အုပ်စုကို စီမံခန့်ခွဲခြင်းဖြင့် လုပ်ငန်းစဉ်များကို အဆင့်မြှင့်တင်ပါ။ |⭐⭐⭐ | AzureOpenAI + Azure AI Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|  
| [**သင့်ဒေတာမှ စာရွက်စာတမ်းများ ဖန်တီးပါ**](https://github.com/Azure-Samples/get-started-with-ai-chat) | သင့်ဒေတာမှ သက်ဆိုင်သော အချက်အလက်များကို ရှာဖွေပြီး အကျဉ်းချုပ်ခြင်းဖြင့် စာရွက်စာတမ်းများကို အမြန်ဖန်တီးပါ။ |⭐⭐⭐ | AzureOpenAI + Azure AI Search + Azure AI Services + Azure CosmosDB|  
| [**Client တွေ့ဆုံမှုများကို အဆင့်မြှင့်တင်ပါ**](https://github.com/Azure-Samples/get-started-with-ai-chat) | အဟောင်း code များကို အခေတ်မီ programming language များသို့ ပြောင်းလဲပါ။ |⭐⭐⭐| AzureOpenAI + Azure AI Search + Azure CosmosDB + Azure SQL Database |  
| [**Agent များဖြင့် code ကို အခေတ်မီအောင် ပြောင်းလဲပါ**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Azure Container Apps ကို အသုံးပြု၍ သင့်ဒေတာနှင့် telemetry အမြင်များနှင့် ပေါင်းစပ်ထားသော chat application တစ်ခုကို ဖန်တီးပြီး တင်သွင်းပါ။ |⭐⭐⭐ | AzureOpenAI + Azure Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|  
| [**သင့် conversational agent ကို ဖန်တီးပါ**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Chatbot များနှင့် agent များကို deterministic နှင့် လူ့အဆင့်ထိန်းချုပ်မှု workflow များဖြင့် ဖန်တီးပါ။ |⭐⭐⭐ | AI Language + AzureOpenAI + AI Search + Azure Storage + Azure Container Registry|  
| [**Conversational data မှ အမြင်များ ရယူပါ**](https://github.com/Azure-Samples/get-started-with-ai-chat) | အကြီးစား audio နှင့် text-based data set များမှ အချက်အလက်များ ရှာဖွေခြင်းဖြင့် contact center ထိရောက်မှုကို တိုးတက်စေပါ။ |⭐⭐⭐ | AzureOpenAI + AI Search + Semantic Kernel + Azure Agent Service + AI AI Content Understanding|  
| [**Multi-modal content ကို အဆင့်မြှင့်တင်ပါ**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Unstructured content မှ အချက်အလက်များကို ရှာဖွေပြီး structured format သို့ ပြောင်းလဲပါ။ Text, images, tables နှင့် graphs ကို ပံ့ပိုးပါသည်။ |⭐⭐⭐⭐ | AzureOpenAI + Azure Content Understanding + Azure CosmosDB + Azure Container Apps|  

### Featured: Azure AI Foundry E2E Scenarios  
**AI အက်ပလီကေးရှင်းများကို တင်သွင်းမည်ဆိုပါက ဒီနေရာမှ စတင်ပါ!**  

| Template | ဖော်ပြချက် | အဆင့်အတန်း | ဝန်ဆောင်မှုများ |  
|----------|-------------|------------|----------|  
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Azure OpenAI ဖြင့် ရိုးရှင်းသော chat interface | ⭐ | AzureOpenAI + Container Apps |  
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG-enabled chat app with Azure OpenAI | ⭐⭐ | AzureOpenAI + Search + App Service |  
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | AI services ဖြင့် စာရွက်စာတမ်းများကို ခွဲခြမ်းစိတ်ဖြာပါ | ⭐⭐ | Azure Document Intelligence + Functions |  
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Function calling ပါဝင်သော AI agent framework | ⭐⭐⭐ | AzureOpenAI + Azure Container Apps + Functions |  
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | AI orchestration ပါဝင်သော Enterprise chat | ⭐⭐⭐ | AzureOpenAI + Azure AI Search + Container Apps |  

### အပို AZD Template များ  
- [**Examples Directory**](examples/README.md) - လက်တွေ့ ဥပမာများ၊ Template များနှင့် အမှန်တကယ် အခြေအနေများ  
- [**Azure-Samples AZD Templates**](https://github.com/Azure-Samples/azd-templates) - Microsoft မှ တရားဝင် Template များ  
- [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) - Community မှ ပံ့ပိုးထားသော Template များ  

### လက်တွေ့ လေ့လာရေးနှင့် Workshop များ  
- [**AI Workshop Lab**](docs/ai-foundry/ai-workshop-lab.md) - **NEW**: သင့် AI ဖြေရှင်းချက်များကို AZD-deployable အဖြစ် ပြင်ဆင်ပါ  
- [**AZD For Beginners Workshop**](workshop/README.md) - AI Agents AZD Template တင်သွင်းမှုကို အဓိကထားပါ  

## Resources  

### Quick References  
- [**Command Cheat Sheet**](resources/cheat-sheet.md) - AZD command အရေးကြီးများ  
- [**Glossary**](resources/glossary.md) - Azure နှင့် AZD အဓိပ္ပါယ်များ  
- [**FAQ**](resources/faq.md) - မကြာခဏ မေးလေ့ရှိသော မေးခွန်းများ  
- [**Study Guide**](resources/study-guide.md) - လေ့လာရေးရည်ရွယ်ချက်များနှင့် လက်တွေ့လေ့ကျင့်မှုများ  

### အပြင်မှ Resources  
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)  
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)  
- [Azure Status](https://status.azure.com/)  

## Contributing  

ကျွန်ုပ်တို့သည် အထောက်အကူပြုမှုများကို ကြိုဆိုပါသည်! [Contributing Guide](CONTRIBUTING.md) ကို ဖတ်ရှုပါ:  
- ပြဿနာများနှင့် အင်္ဂါရပ်တောင်းဆိုမှုများ တင်သွင်းရန်  
- Code ပံ့ပိုးမှု လမ်းညွှန်များ  
- Documentation တိုးတက်မှုများ  
- Community စံနှုန်းများ  

## Support  

- **Issues**: [ပြဿနာများကို တင်သွင်းပြီး အင်္ဂါရပ်များ တောင်းဆိုပါ](https://github.com/microsoft/azd-for-beginners/issues)  
- **Discussions**: [Microsoft Azure Discord Community Q&A နှင့် ဆွေးနွေးမှုများ](https://discord.gg/microsoft-azure)  
- **AI-Specific Support**: AZD + AI Foundry ဆွေးနွေးမှုများအတွက် [#Azure channel](https://discord.gg/microsoft-azure) ကို ဝင်ရောက်ပါ  
- **Email**: ကိုယ်ပိုင်မေးမြန်းမှုများအတွက်  
- **Microsoft Learn**: [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  

### Azure AI Foundry Discord မှ Community Insights  

**#Azure Channel မှ Poll ရလဒ်များ:**  
- **45%** Developer များသည် AZD ကို AI workload များအတွက် အသုံးပြုလိုကြသည်  
- **Top challenges**: Multi-service deployment, credential management, production readiness  
- **အများဆုံး တောင်းဆိုမှုများ**: AI-specific Template များ၊ Troubleshooting Guide များ၊ အကောင်းဆုံး လုပ်နည်းလမ်းများ  

**Community ကို ဝင်ရောက်ပါ:**  
- AZD + AI အတွေ့အကြုံများကို မျှဝေပြီး အကူအညီရယူပါ  
- AI Template အသစ်များ၏ အစောပိုင်း preview များကို ရယူပါ  
- AI deployment အကောင်းဆုံး လုပ်နည်းလမ်းများကို ပံ့ပိုးပါ  
- အနာဂတ် AI + AZD အင်္ဂါရပ်ဖွံ့ဖြိုးမှုကို သက်ရောက်မှုရှိစေပါ  

## License  

ဤ Project သည် MIT License ဖြင့် လိုင်စင်ရရှိထားသည် - [LICENSE](../../LICENSE) ဖိုင်ကို ကြည့်ပါ။  

## အခြားသင်တန်းများ  

ကျွန်ုပ်တို့၏အဖွဲ့သည် အခြားသင်တန်းများကို ထုတ်လုပ်ပါသည်! ကြည့်ပါ:  

- [**NEW** Model Context Protocol (MCP) For Beginners](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [AI Agents for Beginners](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [Generative AI for Beginners using .NET](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)  
- [Generative AI for Beginners](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [Generative AI for Beginners using Java](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)  
- [ML for Beginners](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)  
- [Data Science for Beginners](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)  
- [AI for Beginners](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)  
- [Cybersecurity for Beginners](https://github.com/microsoft/Security-101??WT.mc_id=academic-96948-sayoung)  
- [Web Dev for Beginners](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)  
- [IoT for Beginners](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)  
- [XR Development for Beginners](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [Mastering GitHub Copilot for AI Paired Programming](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)  
- [Mastering GitHub Copilot for C#/.NET Developers](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)  
- [Choose Your Own Copilot Adventure](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)  

---

**Navigation**  
- **Next Lesson**: [AZD Basics](docs/getting-started/azd-basics.md)  

---

**အကြောင်းကြားချက်**:  
ဤစာရွက်စာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ကို အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှုအတွက် ကြိုးစားနေပါသော်လည်း၊ အလိုအလျောက် ဘာသာပြန်မှုများတွင် အမှားများ သို့မဟုတ် မတိကျမှုများ ပါဝင်နိုင်သည်ကို ကျေးဇူးပြု၍ သိရှိထားပါ။ မူရင်းဘာသာစကားဖြင့် ရေးသားထားသော စာရွက်စာတမ်းကို အာဏာရှိသော ရင်းမြစ်အဖြစ် သတ်မှတ်သင့်ပါသည်။ အရေးကြီးသော အချက်အလက်များအတွက် လူ့ဘာသာပြန်ပညာရှင်များမှ ပရော်ဖက်ရှင်နယ် ဘာသာပြန်မှုကို အကြံပြုပါသည်။ ဤဘာသာပြန်မှုကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော အလွဲအမှားများ သို့မဟုတ် အနားလွဲမှုများအတွက် ကျွန်ုပ်တို့သည် တာဝန်မယူပါ။