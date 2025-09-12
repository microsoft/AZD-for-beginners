<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ee9a026a572535444287d531dbd75d78",
  "translation_date": "2025-09-12T22:45:49+00:00",
  "source_file": "README.md",
  "language_code": "my"
}
-->
# AZD အတွက် အခြေခံလမ်းညွှန်

![AZD-for-beginners](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.my.png) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/?WT.mc_id=academic-105485-koreyst)  
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/?WT.mc_id=academic-105485-koreyst)  
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/?WT.mc_id=academic-105485-koreyst)  

![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)  
![Azure AI Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/kzRShWzttr)  

ဒီအရင်းအမြစ်တွေကို အသုံးပြုဖို့ အဆင့်တွေကို လိုက်နာပါ။  
1. **Repository ကို Fork လုပ်ပါ**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork) ကိုနှိပ်ပါ  
2. **Repository ကို Clone လုပ်ပါ**: `git clone https://github.com/microsoft/azd-for-beginners.git`  
3. [**Azure Discord Communities ကို Join လုပ်ပြီး ကျွမ်းကျင်သူများနှင့် Developer မိတ်ဆွေများနှင့် တွေ့ဆုံပါ**](https://discord.com/invite/ByRwuEEgH4)  

### ဘာသာစကားများအထောက်အပံ့

#### GitHub Action (အလိုအလျောက် & အမြဲ Update ဖြစ်နေသော) မှတဆင့် ထောက်ပံ့ထားသည်

[French](../fr/README.md) | [Spanish](../es/README.md) | [German](../de/README.md) | [Russian](../ru/README.md) | [Arabic](../ar/README.md) | [Persian (Farsi)](../fa/README.md) | [Urdu](../ur/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Japanese](../ja/README.md) | [Korean](../ko/README.md) | [Hindi](../hi/README.md) | [Bengali](../bn/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Portuguese (Brazil)](../br/README.md) | [Italian](../it/README.md) | [Polish](../pl/README.md) | [Turkish](../tr/README.md) | [Greek](../el/README.md) | [Thai](../th/README.md) | [Swedish](../sv/README.md) | [Danish](../da/README.md) | [Norwegian](../no/README.md) | [Finnish](../fi/README.md) | [Dutch](../nl/README.md) | [Hebrew](../he/README.md) | [Vietnamese](../vi/README.md) | [Indonesian](../id/README.md) | [Malay](../ms/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Swahili](../sw/README.md) | [Hungarian](../hu/README.md) | [Czech](../cs/README.md) | [Slovak](../sk/README.md) | [Romanian](../ro/README.md) | [Bulgarian](../bg/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Croatian](../hr/README.md) | [Slovenian](../sl/README.md) | [Ukrainian](../uk/README.md) | [Burmese (Myanmar)](./README.md)  

**ထပ်မံသော ဘာသာစကားများကို ထည့်သွင်းလိုပါက [ဒီမှာ](https://github.com/Azure/co-op-translator/blob/main/getting_started/supported-languages.md) ရှိသော အထောက်အပံ့ရနိုင်သော ဘာသာစကားများကို ကြည့်ပါ**  

## မိတ်ဆက်

Azure Developer CLI (azd) အတွက် လမ်းညွှန်လမ်းကြောင်းကို ကြိုဆိုပါတယ်။ ဒီ Repository ကို ကျောင်းသားများမှ စ၍ ကျွမ်းကျင် Developer များအထိ Azure Developer CLI ကို သင်ယူပြီး Cloud Deployment ကို ထိရောက်စွာ လုပ်ဆောင်နိုင်ရန် ရည်ရွယ်ထားပါသည်။ **အထူးသဖြင့် Azure AI Foundry ကို အသုံးပြု၍ AI Application Deployment အတွက် အာရုံစိုက်ထားပါသည်**။ ဒီ Structured Learning Resource သည် Azure Cloud Deployment ကို လက်တွေ့ကျကျ လေ့လာနိုင်ရန်၊ အခက်အခဲများကို ဖြေရှင်းနိုင်ရန်နှင့် AZD Template Deployment အတွက် အကောင်းဆုံး လုပ်ဆောင်မှုများကို အကောင်အထည်ဖော်နိုင်ရန် အထောက်အကူပြုပါသည်။  

### **AI Developer များအတွက် ဒီလမ်းညွှန်အရေးကြီးသောအကြောင်းအရင်း**
Azure AI Foundry Discord Community Poll အရ **Developer များ၏ 45% သည် AZD ကို AI Workload များအတွက် အသုံးပြုလိုကြောင်း** ဖော်ပြထားပြီး အခက်အခဲများကို ရင်ဆိုင်နေရသည်။  
- AI Service များစွာပါဝင်သော Architecture များ၏ ရှုပ်ထွေးမှု  
- Production AI Deployment အတွက် အကောင်းဆုံး လုပ်ဆောင်မှုများ  
- Azure AI Service များနှင့် Integration  
- AI Workload များအတွက် ကုန်ကျစရိတ် အထိရောက်ဆုံးဖြေရှင်းမှု  
- AI Deployment အတွက် အထူးပြု အခက်အခဲများကို ဖြေရှင်းခြင်း  

## သင်ယူရမည့် ရည်မှန်းချက်များ

ဒီ Repository ကို လေ့လာပြီးနောက်တွင် သင်သည် -  
- Azure Developer CLI ၏ အခြေခံနှင့် အဓိက Concepts များကို ကျွမ်းကျင်စွာ သိရှိနိုင်မည်  
- Infrastructure as Code ကို အသုံးပြု၍ Azure Resources များကို Deploy နှင့် Provision လုပ်နိုင်မည်  
- AZD Deployment အခက်အခဲများကို ဖြေရှင်းနိုင်မည်  
- Pre-deployment Validation နှင့် Capacity Planning ကို နားလည်နိုင်မည်  
- Security နှင့် Cost Optimization အတွက် အကောင်းဆုံး လုပ်ဆောင်မှုများကို အကောင်အထည်ဖော်နိုင်မည်  
- Azure တွင် Production-ready Application များကို Deploy လုပ်နိုင်ရန် ယုံကြည်မှု ရရှိမည်  

## သင်ယူပြီးနောက်ရရှိမည့် အကျိုးကျေးဇူးများ

ဒီ Course ကို ပြီးမြောက်ပြီးနောက်တွင် -  
- Azure Developer CLI ကို အောင်မြင်စွာ Install, Configure နှင့် အသုံးပြုနိုင်မည်  
- AZD Templates ကို အသုံးပြု၍ Application များကို Create နှင့် Deploy လုပ်နိုင်မည်  
- Authentication, Infrastructure နှင့် Deployment အခက်အခဲများကို Troubleshoot လုပ်နိုင်မည်  
- Pre-deployment Checks များကို လုပ်ဆောင်နိုင်မည် (Capacity Planning နှင့် SKU Selection အပါအဝင်)  
- Monitoring, Security နှင့် Cost Management အတွက် အကောင်းဆုံး လုပ်ဆောင်မှုများကို အကောင်အထည်ဖော်နိုင်မည်  
- AZD Workflow များကို CI/CD Pipelines တွင် ထည့်သွင်းနိုင်မည်  

## အကြောင်းအရာများ

- [Azure Developer CLI ဆိုတာဘာလဲ?](../..)  
- [Quick Start](../..)  
- [Learning Path](../..)  
  - [AI Developer များအတွက် (ဒီနေရာမှ စတင်ရန် အကြံပြုပါသည်!)](../..)  
  - [ကျောင်းသားများနှင့် အခြေခံသင်ယူသူများအတွက်](../..)  
  - [Developer များအတွက်](../..)  
  - [DevOps Engineer များအတွက်](../..)  
- [Documentation](../..)  
  - [စတင်ရန်](../..)  
  - [Deployment & Provisioning](../..)  
  - [Pre-Deployment Checks](../..)  
  - [AI & Azure AI Foundry](../..)  
  - [Troubleshooting](../..)  
- [ဥပမာများနှင့် Templates](../..)  
  - [Featured: Azure AI Foundry Templates](../..)  
  - [Featured: Azure AI Foundry E2E Scenarios](../..)  
  - [Additional AZD Templates](../..)  
  - [Hands-On Labs & Workshops](../..)  
- [Resources](../..)  
- [Contributing](../..)  
- [Support](../..)  
- [Community](../..)  

## Azure Developer CLI ဆိုတာဘာလဲ?

Azure Developer CLI (azd) သည် Developer များအတွက် အထူးပြု Command-Line Interface ဖြစ်ပြီး Azure တွင် Application များကို Build နှင့် Deploy လုပ်ခြင်းကို အရှိန်မြှင့်ပေးသည်။  

- **Template-based Deployment** - Application Pattern များအတွက် Pre-built Templates များကို အသုံးပြုနိုင်သည်  
- **Infrastructure as Code** - Bicep သို့မဟုတ် Terraform ကို အသုံးပြု၍ Azure Resources များကို စီမံနိုင်သည်  
- **Integrated Workflows** - Application များကို Provision, Deploy နှင့် Monitor လုပ်ခြင်းကို အလွယ်တကူလုပ်နိုင်သည်  
- **Developer-friendly** - Developer များအတွက် Productivity နှင့် Experience ကို အထူးပြုထားသည်  

### **AZD + Azure AI Foundry: AI Deployment အတွက် အကောင်းဆုံး**

**AI Solutions အတွက် AZD ကို ဘာကြောင့် အသုံးပြုသင့်သလဲ?** AZD သည် AI Developer များရင်ဆိုင်နေရသော အခက်အခဲများကို ဖြေရှင်းပေးသည် -  
- **AI-Ready Templates** - Azure OpenAI, Cognitive Services နှင့် ML Workload များအတွက် Pre-configured Templates  
- **Secure AI Deployments** - AI Services, API Keys နှင့် Model Endpoints အတွက် Built-in Security Patterns  
- **Production AI Patterns** - Scalable, Cost-effective AI Application Deployment အတွက် အကောင်းဆုံး လုပ်ဆောင်မှုများ  
- **End-to-End AI Workflows** - Model Development မှ Production Deployment အထိ Monitoring အပြည့်အစုံ  
- **Cost Optimization** - AI Workload များအတွက် Smart Resource Allocation နှင့် Scaling Strategies  
- **Azure AI Foundry Integration** - AI Foundry Model Catalog နှင့် Endpoints များနှင့် Seamless Connection  

## Quick Start

### လိုအပ်ချက်များ  
- Azure Subscription  
- Azure CLI Install လုပ်ထားရမည်  
- Git (Templates များကို Clone လုပ်ရန်)  

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

## Learning Path

### AI Developer များအတွက် (ဒီနေရာမှ စတင်ရန် အကြံပြုပါသည်!)  
1. **Quick Start**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) Template ကို စမ်းသုံးပါ  
2. **အခြေခံများကို သင်ယူပါ**: [AZD Basics](docs/getting-started/azd-basics.md) + [Azure AI Foundry Integration](docs/ai-foundry/azure-ai-foundry-integration.md)  
3. **လက်တွေ့ကျကျ လေ့ကျင့်ပါ**: [AI Workshop Lab](docs/ai-foundry/ai-workshop-lab.md) ကို ပြီးမြောက်ပါ  
4. **Production Ready**: [Production AI Best Practices](docs/ai-foundry/production-ai-practices.md) ကို ပြန်လည်သုံးသပ်ပါ  
5. **အဆင့်မြင့်**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat) Enterprise Template ကို Deploy လုပ်ပါ  

### ကျောင်းသားများနှင့် အခြေခံသင်ယူသူများအတွက်  
1. [AZD Basics](docs/getting-started/azd-basics.md) ကို စတင်ပါ  
2. [Installation Guide](docs/getting-started/installation.md) ကို လိုက်နာပါ  
3. [Your First Project](docs/getting-started/first-project.md) ကို ပြီးမြောက်ပါ  
4. [Simple Web App Example](../../examples/simple-web-app) ကို လေ့ကျင့်ပါ  

### Developer များအတွက်  
1. [Configuration Guide](docs/getting-started/configuration.md) ကို ပြန်လည်သုံးသပ်ပါ  
2. [Deployment Guide](docs/deployment/deployment-guide.md) ကို လေ့လာပါ  
3. [Database App Example](../../examples/database-app) ကို လုပ်ဆောင်ပါ  
4. [Container App Example](../../examples/container-app) ကို စမ်းသုံးပါ  

### DevOps Engineer များအတွက်  
1. [Provisioning Resources](docs/deployment/provisioning.md) ကို ကျွမ်းကျင်ပါ  
2. [Pre-flight Checks](docs/pre-deployment/preflight-checks.md) ကို အကောင်အထည်ဖော်ပါ  
3. [Capacity Planning](docs/pre-deployment/capacity-planning.md) ကို လေ့ကျင့်ပါ  
4. [Microservices Example](../../examples/microservices) ကို စမ်းသုံးပါ  

## Documentation

### စတင်ရန်  
- [**AZD Basics**](docs/getting-started/azd-basics.md) - အဓိက Concepts နှင့် Terminology  
- [**Installation & Setup**](docs/getting-started/installation.md) - Platform-specific Installation Guide များ  
- [**Configuration**](docs/getting-started/configuration.md) - Environment Setup နှင့် Authentication  
- [**Your First Project**](docs/getting-started/first-project.md) - လမ်းညွှန် Tutorial  

### Deployment & Provisioning  
- [**Deployment Guide**](docs/deployment/deployment-guide.md) - Deployment Workflow အပြည့်အစုံ  
- [**Provisioning Resources**](docs/deployment/provisioning.md) - Azure Resource Management  

### Pre-Deployment Checks  
- [**Capacity Planning**](docs/pre-deployment/capacity-planning.md) - Azure Resource Capacity Validation  
- [**SKU Selection**](docs/pre-deployment/sku-selection.md) - Azure SKUs ရွေးချယ်ခြင်း  
- [**Pre-flight Checks**](docs/pre-deployment/preflight-checks.md) - Automated Validation Scripts  

### AI & Azure AI Foundry  
- [**Azure AI Foundry Integration**](docs/ai-foundry/azure-ai-foundry-integration.md) - AZD ကို Azure AI Foundry Services နှင့် ချိတ်ဆက်ခြင်း  
- [**AI Model Deployment Patterns**](docs/ai-foundry/ai-model-deployment.md) - AZD ဖြင့် AI Models များကို Deploy နှင့် စီမံခြင်း  
- [**AI Workshop Lab**](docs/ai-foundry/ai-workshop-lab.md) - Hands-on Lab: AI Solutions ကို AZD-ready ဖြစ်အောင် ပြင်ဆင်ခြင်း  
- [**Production AI Best Practices**](docs/ai-foundry/production-ai-practices.md) - AI Workload များအတွက် Security, Scaling နှင့် Monitoring  

### Troubleshooting  
- [**Common Issues**](docs/troubleshooting/common-issues.md) - မကြုံစဖူးသော အခက်အခဲများနှင့် ဖြေရှင်းနည်းများ  
- [**Debugging Guide**](docs/troubleshooting/debugging.md) - အဆင့်ဆင့် Debugging နည်းလမ်းများ  
- [**AI-Specific Troubleshooting**](docs/troubleshooting/ai-troubleshooting.md) - AI ဝန်ဆောင်မှုနှင့် မော်ဒယ်တင်သွင်းမှုဆိုင်ရာ ပြဿနာများ  

## ဥပမာများနှင့် Template များ  

### [Featured: Azure AI Foundry Templates](https://ai.azure.com/resource/build/templates)  
**AI အက်ပလီကေးရှင်းများကို တင်သွင်းမည်ဆိုပါက ဒီနေရာမှ စတင်ပါ!**  

| Template | ဖော်ပြချက် | အဆင့်အတန်း | ဝန်ဆောင်မှုများ |  
|----------|-------------|------------|----------|  
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Azure Container Apps ကို အသုံးပြု၍ သင့်ဒေတာနှင့် Telemetry အမြင်များနှင့် ပေါင်းစပ်ထားသော Chat အက်ပလီကေးရှင်းကို ဖန်တီးပြီး တင်သွင်းပါ |⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights |  
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Azure Container Apps ကို အသုံးပြု၍ လုပ်ဆောင်မှုများနှင့် Telemetry အမြင်များပါဝင်သော Agent အက်ပလီကေးရှင်းကို ဖန်တီးပြီး တင်သွင်းပါ။ |⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights|  
| [**Multi-agent workflow automation**](https://github.com/Azure-Samples/get-started-with-ai-chat) | AI Agent အုပ်စုကို စီမံခန့်ခွဲခြင်းဖြင့် Task စီမံခန့်ခွဲမှုနှင့် အလိုအလျောက်လုပ်ဆောင်မှုကို တိုးတက်စေပါ။ |⭐⭐⭐ | AzureOpenAI + Azure AI Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|  
| [**Generate documents from your data**](https://github.com/Azure-Samples/get-started-with-ai-chat) | သင့်ဒေတာမှ သက်ဆိုင်သော အချက်အလက်များကို ရှာဖွေပြီး အကျဉ်းချုပ်ခြင်းဖြင့် စာချုပ်များ၊ ငွေတောင်းခံလွှာများနှင့် ရင်းနှီးမြှုပ်နှံမှု အဆိုပြုချက်များကို အမြန်ဖန်တီးပါ။ |⭐⭐⭐ | AzureOpenAI + Azure AI Search + Azure AI Services + Azure CosmosDB|  
| [**Improve client meetings with agents**](https://github.com/Azure-Samples/get-started-with-ai-chat) | အေးဂျင့်အဖွဲ့ကို အသုံးပြု၍ ရှေးဟောင်းကုဒ်များကို ခေတ်မီဘာသာစကားများသို့ ပြောင်းလဲပါ။ |⭐⭐⭐| AzureOpenAI + Azure AI Search + Azure CosmosDB + Azure SQL Database |  
| [**Modernize your code with agents**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Azure Container Apps ကို အသုံးပြု၍ သင့်ဒေတာနှင့် Telemetry အမြင်များနှင့် ပေါင်းစပ်ထားသော Chat အက်ပလီကေးရှင်းကို ဖန်တီးပြီး တင်သွင်းပါ။ |⭐⭐⭐ | AzureOpenAI + Azure Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|  
| [**Build your conversational agent**](https://github.com/Azure-Samples/get-started-with-ai-chat) | စကားပြောနားလည်မှုကို တိုးတက်စေပြီး Deterministic နှင့် လူ့ထိန်းချုပ်မှု Workflow များပါဝင်သော Chatbot များနှင့် အေးဂျင့်များကို ဖန်တီးပါ။ |⭐⭐⭐ | AI Language + AzureOpenAI + AI Search + Azure Storage + Azure Container Registry|  
| [**Unlock insights from conversational data**](https://github.com/Azure-Samples/get-started-with-ai-chat) | အကြောင်းအရာနားလည်မှုစွမ်းရည်များကို အသုံးပြု၍ အကြီးစား Audio နှင့် Text-based ဒေတာများမှ အမြင်များကို ရှာဖွေပါ။ |⭐⭐⭐ | AzureOpenAI + AI Search + Semantic Kernel + Azure Agent Service + AI AI Content Understanding|  
| [**Multi-modal content processing**](https://github.com/Azure-Samples/get-started-with-ai-chat) | စာချုပ်များ၊ ငွေတောင်းခံလွှာများ၊ စာရွက်များနှင့် အခြားစာရွက်စာတမ်းများကို အမြန်နှင့် တိကျစွာ လုပ်ဆောင်ပါ။ Text, Images, Tables နှင့် Graphs ကို ပံ့ပိုးပါသည်။ |⭐⭐⭐⭐ | AzureOpenAI + Azure Content Understanding + Azure CosmosDB + Azure Container Apps|  

### Featured: Azure AI Foundry E2E Scenarios  
**AI အက်ပလီကေးရှင်းများကို တင်သွင်းမည်ဆိုပါက ဒီနေရာမှ စတင်ပါ!**  

| Template | ဖော်ပြချက် | အဆင့်အတန်း | ဝန်ဆောင်မှုများ |  
|----------|-------------|------------|----------|  
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Azure OpenAI ဖြင့် ရိုးရှင်းသော Chat Interface | ⭐ | AzureOpenAI + Container Apps |  
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG-enabled Chat App with Azure OpenAI | ⭐⭐ | AzureOpenAI + Search + App Service |  
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | AI ဝန်ဆောင်မှုများဖြင့် စာရွက်စာတမ်းများကို ခွဲခြမ်းစိတ်ဖြာပါ | ⭐⭐ | Azure Document Intelligence + Functions |  
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Function Calling ပါဝင်သော AI Agent Framework | ⭐⭐⭐ | AzureOpenAI + Azure Container Apps + Functions |  
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | AI Orchestration ပါဝင်သော Enterprise Chat | ⭐⭐⭐ | AzureOpenAI + Azure AI Search + Container Apps |  

### Additional AZD Templates  
- [**Examples Directory**](examples/README.md) - လက်တွေ့ ဥပမာများ၊ Template များနှင့် အမှန်တကယ် အခြေအနေများ  
- [**Azure-Samples AZD Templates**](https://github.com/Azure-Samples/azd-templates) - Microsoft မှ တရားဝင် Template များ  
- [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) - Community မှ ပံ့ပိုးထားသော Template များ  

### လက်တွေ့ လေ့လာရေးနှင့် Workshop များ  
- [**AI Workshop Lab**](docs/ai-foundry/ai-workshop-lab.md) - **အသစ်**: AZD ဖြင့် AI ဖြေရှင်းချက်များကို တင်သွင်းနိုင်ရန်  
- [**AZD For Beginners Workshop**](workshop/README.md) - AI Agents AZD Template တင်သွင်းမှုအပေါ် အာရုံစိုက်  

## Resources  

### Quick References  
- [**Command Cheat Sheet**](resources/cheat-sheet.md) - AZD Command အရေးကြီးများ  
- [**Glossary**](resources/glossary.md) - Azure နှင့် AZD အဓိပ္ပါယ်များ  
- [**FAQ**](resources/faq.md) - မကြာခဏ မေးလေ့ရှိသော မေးခွန်းများ  
- [**Study Guide**](resources/study-guide.md) - လေ့လာရေးရည်ရွယ်ချက်များနှင့် လက်တွေ့လေ့ကျင့်မှုများ  

### အပြင်ပန်း Resources  
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)  
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)  
- [Azure Status](https://status.azure.com/)  

## Contributing  

ကျွန်ုပ်တို့သည် အထောက်အကူပြုမှုများကို ကြိုဆိုပါသည်! [Contributing Guide](CONTRIBUTING.md) ကို ဖတ်ရှုပါ:  
- ပြဿနာများနှင့် Feature တောင်းဆိုမှုများကို တင်သွင်းရန်  
- Code ပံ့ပိုးမှု လမ်းညွှန်များ  
- Documentation တိုးတက်မှုများ  
- Community စံနှုန်းများ  

## Support  

- **Issues**: [Bug များကို Report လုပ်ပြီး Feature တောင်းဆိုပါ](https://github.com/microsoft/azd-for-beginners/issues)  
- **Discussions**: [Microsoft Azure Discord Community Q&A နှင့် ဆွေးနွေးမှုများ](https://discord.gg/microsoft-azure)  
- **AI-Specific Support**: AZD + AI Foundry ဆွေးနွေးမှုများအတွက် [#Azure channel](https://discord.gg/microsoft-azure) ကို ဝင်ရောက်ပါ  
- **Email**: Private မေးမြန်းမှုများအတွက်  
- **Microsoft Learn**: [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  

### Azure AI Foundry Discord မှ Community အမြင်များ  

**#Azure Channel Poll ရလဒ်များ:**  
- **45%** Developer များသည် AZD ကို AI Workload များအတွက် အသုံးပြုလိုသည်  
- **Top Challenges**: Multi-service တင်သွင်းမှုများ၊ Credential စီမံခန့်ခွဲမှု၊ Production အဆင့်သင့်ဖြစ်မှု  
- **Most Requested**: AI-specific Template များ၊ Troubleshooting Guide များ၊ Best Practices  

**Community ကို ဝင်ရောက်ပါ:**  
- AZD + AI အတွေ့အကြုံများကို မျှဝေပြီး အကူအညီရယူပါ  
- AI Template အသစ်များ၏ အစောပိုင်း Preview များကို ရယူပါ  
- AI Deployment Best Practices များကို ပံ့ပိုးပါ  
- အနာဂတ် AI + AZD Feature တိုးတက်မှုကို သက်ရောက်မှုရှိစေပါ  

## License  

ဤ Project သည် MIT License ဖြင့် လိုင်စင်ရရှိထားသည် - [LICENSE](../../LICENSE) ဖိုင်ကို ကြည့်ပါ။  

## အခြားသင်တန်းများ  

ကျွန်ုပ်တို့၏အဖွဲ့သည် အခြားသင်တန်းများကို ထုတ်လုပ်ပါသည်! ကြည့်ပါ:  

- [**အသစ်** Model Context Protocol (MCP) For Beginners](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)  
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
ဤစာရွက်စာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ကို အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှုအတွက် ကြိုးစားနေသော်လည်း၊ အလိုအလျောက် ဘာသာပြန်ခြင်းတွင် အမှားများ သို့မဟုတ် မတိကျမှုများ ပါဝင်နိုင်သည်ကို သတိပြုပါ။ မူရင်းစာရွက်စာတမ်းကို ၎င်း၏ မူရင်းဘာသာစကားဖြင့် အာဏာတရ အရင်းအမြစ်အဖြစ် ရှုလေ့လာသင့်ပါသည်။ အရေးကြီးသော အချက်အလက်များအတွက် လူ့ဘာသာပြန်ပညာရှင်များမှ ပရော်ဖက်ရှင်နယ် ဘာသာပြန်ခြင်းကို အကြံပြုပါသည်။ ဤဘာသာပြန်ကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော အလွဲအလွတ်များ သို့မဟုတ် အနားယူမှားမှုများအတွက် ကျွန်ုပ်တို့သည် တာဝန်မယူပါ။