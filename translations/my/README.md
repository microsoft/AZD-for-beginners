<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "21dcf6a2d8a223a853d965138d4fb045",
  "translation_date": "2025-09-18T13:12:52+00:00",
  "source_file": "README.md",
  "language_code": "my"
}
-->
# AZD အခြေခံသင်ခန်းစာများ: တစ်ဆင့်ဆင့်လေ့လာရေးခရီးစဉ်

![AZD-for-beginners](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.my.png) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Azure AI Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/kzRShWzttr)](https://discord.gg/kzRShWzttr)

## ဒီသင်ခန်းစာကို စတင်အသုံးပြုခြင်း

AZD ကိုလေ့လာရန်အောက်ပါအဆင့်များကိုလိုက်နာပါ-

1. **Repository ကို Fork လုပ်ပါ**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork) ကိုနှိပ်ပါ
2. **Repository ကို Clone လုပ်ပါ**: `git clone https://github.com/microsoft/azd-for-beginners.git`
3. **Community ကို Join လုပ်ပါ**: [Azure Discord Communities](https://discord.com/invite/ByRwuEEgH4) မှာ အကူအညီရယူပါ
4. **သင့်ရဲ့လေ့လာရေးလမ်းကြောင်းကို ရွေးချယ်ပါ**: အောက်ပါအခန်းများထဲမှ သင့်အတွေ့အကြုံအဆင့်နှင့် ကိုက်ညီသောအခန်းကို ရွေးပါ

### ဘာသာစကားများအထောက်အပံ့

#### အလိုအလျောက်ဘာသာပြန် (အမြဲ Update ဖြစ်နေသည်)

[French](../fr/README.md) | [Spanish](../es/README.md) | [German](../de/README.md) | [Russian](../ru/README.md) | [Arabic](../ar/README.md) | [Persian (Farsi)](../fa/README.md) | [Urdu](../ur/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Japanese](../ja/README.md) | [Korean](../ko/README.md) | [Hindi](../hi/README.md) | [Bengali](../bn/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Portuguese (Brazil)](../br/README.md) | [Italian](../it/README.md) | [Polish](../pl/README.md) | [Turkish](../tr/README.md) | [Greek](../el/README.md) | [Thai](../th/README.md) | [Swedish](../sv/README.md) | [Danish](../da/README.md) | [Norwegian](../no/README.md) | [Finnish](../fi/README.md) | [Dutch](../nl/README.md) | [Hebrew](../he/README.md) | [Vietnamese](../vi/README.md) | [Indonesian](../id/README.md) | [Malay](../ms/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Swahili](../sw/README.md) | [Hungarian](../hu/README.md) | [Czech](../cs/README.md) | [Slovak](../sk/README.md) | [Romanian](../ro/README.md) | [Bulgarian](../bg/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Croatian](../hr/README.md) | [Slovenian](../sl/README.md) | [Ukrainian](../uk/README.md) | [Burmese (Myanmar)](./README.md)

## သင်ခန်းစာအကျဉ်းချုပ်

Azure Developer CLI (azd) ကို တစ်ဆင့်ဆင့်လေ့လာနိုင်ရန် အခန်းများဖြင့် ဖွဲ့စည်းထားသည်။ **Azure AI Foundry ကို ပေါင်းစပ်ပြီး AI application များကို deploy လုပ်ခြင်းအပေါ် အထူးအာရုံစိုက်ထားသည်။**

### ဒီသင်ခန်းစာသည် ခေတ်မီ Developer များအတွက် အရေးကြီးသောအကြောင်းအရင်း

Azure AI Foundry Discord community မှ အချက်အလက်များအရ **Developer များ၏ 45% သည် AZD ကို AI workload များအတွက် အသုံးပြုလိုကြသည်**။ သို့သော် အောက်ပါအခက်အခဲများကြုံတွေ့ရသည်-
- AI architecture များ၏ အဆင့်ဆင့်ဖွဲ့စည်းမှု
- Production AI deployment အကောင်းဆုံးအလေ့အကျင့်များ  
- Azure AI service များကို ပေါင်းစပ်ခြင်းနှင့် configuration
- AI workload များအတွက် ကုန်ကျစရိတ်ကို အထိရောက်ဆုံးဖြစ်စေရန် optimization
- AI-specific deployment အခက်အခဲများကို ဖြေရှင်းခြင်း

### သင်ခန်းစာ၏ ရည်မှန်းချက်များ

ဒီသင်ခန်းစာကို ပြီးမြောက်စွာလေ့လာပြီးပါက-
- **AZD အခြေခံကို ကျွမ်းကျင်စွာ သိရှိမည်**: အဓိကအကြောင်းအရာများ၊ installation နှင့် configuration
- **AI Application များကို Deploy လုပ်နိုင်မည်**: AZD ကို Azure AI Foundry services နှင့်အတူ အသုံးပြုခြင်း
- **Infrastructure as Code ကို အသုံးပြုနိုင်မည်**: Bicep templates ဖြင့် Azure resources များကို စီမံခန့်ခွဲခြင်း
- **Deployments များကို Troubleshoot လုပ်နိုင်မည်**: အခက်အခဲများကို ဖြေရှင်းခြင်းနှင့် debugging
- **Production အတွက် Optimize လုပ်နိုင်မည်**: လုံခြုံရေး၊ scale လုပ်ခြင်း၊ monitoring နှင့် ကုန်ကျစရိတ်စီမံခန့်ခွဲမှု
- **Multi-Agent Solutions များကို ဖန်တီးနိုင်မည်**: AI architecture များကို deploy လုပ်ခြင်း

## 📚 သင်ခန်းစာအခန်းများ

*သင့်ရဲ့အတွေ့အကြုံနှင့် ရည်မှန်းချက်အပေါ်မူတည်ပြီး သင့်လမ်းကြောင်းကို ရွေးချယ်ပါ*

### 🚀 အခန်း 1: အခြေခံနှင့် Quick Start
**လိုအပ်ချက်များ**: Azure subscription, command line အခြေခံအသိ  
**ကြာမြင့်ချိန်**: 30-45 မိနစ်  
**အဆင့်**: ⭐

#### သင်လေ့လာမည့်အရာများ
- Azure Developer CLI အခြေခံကို နားလည်ခြင်း
- သင့် platform တွင် AZD ကို install လုပ်ခြင်း
- ပထမဆုံး deployment ကို အောင်မြင်စွာလုပ်ဆောင်ခြင်း

#### သင်ခန်းစာအရင်းအမြစ်များ
- **🎯 ဒီနေရာမှ စတင်ပါ**: [Azure Developer CLI ဆိုတာဘာလဲ?](../..)
- **📖 သီအိုရီ**: [AZD အခြေခံ](docs/getting-started/azd-basics.md) - အဓိကအကြောင်းအရာများနှင့် အဓိပ္ပါယ်
- **⚙️ Setup**: [Installation & Setup](docs/getting-started/installation.md) - Platform-specific လမ်းညွှန်
- **🛠️ လက်တွေ့လုပ်ဆောင်မှု**: [သင့်ရဲ့ပထမဆုံး Project](docs/getting-started/first-project.md) - အဆင့်ဆင့်လမ်းညွှန်
- **📋 Quick Reference**: [Command Cheat Sheet](resources/cheat-sheet.md)

#### လက်တွေ့လေ့ကျင့်မှုများ
```bash
# Quick installation check
azd version

# Deploy your first application
azd init --template todo-nodejs-mongo
azd up
```

**💡 အခန်းရလဒ်**: AZD ကို အသုံးပြု၍ Azure တွင် ရိုးရှင်းသော web application တစ်ခုကို deploy လုပ်နိုင်ခြင်း

---

### 🤖 အခန်း 2: AI-First Development (AI Developer များအတွက် အကြံပြုသည်)
**လိုအပ်ချက်များ**: အခန်း 1 ကို ပြီးမြောက်ထားရမည်  
**ကြာမြင့်ချိန်**: 1-2 နာရီ  
**အဆင့်**: ⭐⭐

#### သင်လေ့လာမည့်အရာများ
- AZD နှင့် Azure AI Foundry ကို ပေါင်းစပ်ခြင်း
- AI-powered application များကို deploy လုပ်ခြင်း
- AI service configuration များကို နားလည်ခြင်း

#### သင်ခန်းစာအရင်းအမြစ်များ
- **🎯 ဒီနေရာမှ စတင်ပါ**: [Azure AI Foundry Integration](docs/ai-foundry/azure-ai-foundry-integration.md)
- **📖 Patterns**: [AI Model Deployment](docs/ai-foundry/ai-model-deployment.md) - AI model များကို deploy လုပ်ခြင်းနှင့် စီမံခန့်ခွဲခြင်း
- **🛠️ Workshop**: [AI Workshop Lab](docs/ai-foundry/ai-workshop-lab.md) - AZD-ready AI solution များကို ဖန်တီးခြင်း
- **📋 Templates**: [Azure AI Foundry Templates](../..)

#### လက်တွေ့လေ့ကျင့်မှုများ
```bash
# Deploy your first AI application
azd init --template azure-search-openai-demo
azd up

# Try additional AI templates
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 အခန်းရလဒ်**: RAG စွမ်းရည်များပါဝင်သော AI-powered chat application တစ်ခုကို deploy လုပ်နိုင်ခြင်း

---

### ⚙️ အခန်း 3: Configuration & Authentication
**လိုအပ်ချက်များ**: အခန်း 1 ကို ပြီးမြောက်ထားရမည်  
**ကြာမြင့်ချိန်**: 45-60 မိနစ်  
**အဆင့်**: ⭐⭐

#### သင်လေ့လာမည့်အရာများ
- Environment configuration နှင့် စီမံခန့်ခွဲမှု
- Authentication နှင့် လုံခြုံရေးအကောင်းဆုံးအလေ့အကျင့်များ
- Resource naming နှင့် organization

#### သင်ခန်းစာအရင်းအမြစ်များ
- **📖 Configuration**: [Configuration Guide](docs/getting-started/configuration.md) - Environment setup
- **🔐 Security**: Authentication patterns နှင့် managed identity
- **📝 Examples**: [Database App Example](../../examples/database-app) - Configuration patterns

#### လက်တွေ့လေ့ကျင့်မှုများ
- Environment များ (dev, staging, prod) ကို configure လုပ်ခြင်း
- Managed identity authentication ကို setup လုပ်ခြင်း
- Environment-specific configuration များကို implement လုပ်ခြင်း

**💡 အခန်းရလဒ်**: Environment များကို စီမံခန့်ခွဲပြီး authentication နှင့် security ကို သေချာစွာလုပ်ဆောင်နိုင်ခြင်း

---

### 🏗️ အခန်း 4: Infrastructure as Code & Deployment
**လိုအပ်ချက်များ**: အခန်း 1-3 ကို ပြီးမြောက်ထားရမည်  
**ကြာမြင့်ချိန်**: 1-1.5 နာရီ  
**အဆင့်**: ⭐⭐⭐

#### သင်လေ့လာမည့်အရာများ
- Deployment patterns များ၏ အဆင့်မြင့်နည်းလမ်းများ
- Infrastructure as Code ကို Bicep ဖြင့် အသုံးပြုခြင်း
- Resource provisioning strategies

#### သင်ခန်းစာအရင်းအမြစ်များ
- **📖 Deployment**: [Deployment Guide](docs/deployment/deployment-guide.md) - လုပ်ငန်းစဉ်များ
- **🏗️ Provisioning**: [Provisioning Resources](docs/deployment/provisioning.md) - Azure resource စီမံခန့်ခွဲမှု
- **📝 Examples**: [Container App Example](../../examples/container-app) - Containerized deployments

#### လက်တွေ့လေ့ကျင့်မှုများ
- Custom Bicep templates များကို ဖန်တီးခြင်း
- Multi-service application များကို deploy လုပ်ခြင်း
- Blue-green deployment strategies ကို implement လုပ်ခြင်း

**💡 အခန်းရလဒ်**: Custom infrastructure templates များကို အသုံးပြု၍ Multi-service application များကို deploy လုပ်နိုင်ခြင်း

---

### 🎯 အခန်း 5: Multi-Agent AI Solutions (Advanced)
**လိုအပ်ချက်များ**: အခန်း 1-2 ကို ပြီးမြောက်ထားရမည်  
**ကြာမြင့်ချိန်**: 2-3 နာရီ  
**အဆင့်**: ⭐⭐⭐⭐

#### သင်လေ့လာမည့်အရာများ
- Multi-agent architecture patterns
- Agent orchestration နှင့် coordination
- Production-ready AI deployments

#### သင်ခန်းစာအရင်းအမြစ်များ
- **🤖 Featured Project**: [Retail Multi-Agent Solution](examples/retail-scenario.md) - အပြည့်အစုံ implementation
- **🛠️ ARM Templates**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - One-click deployment
- **📖 Architecture**: Multi-agent coordination patterns

#### လက်တွေ့လေ့ကျင့်မှုများ
```bash
# Deploy the complete retail multi-agent solution
cd examples/retail-multiagent-arm-template
./deploy.sh

# Explore agent configurations
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 အခန်းရလဒ်**: Customer နှင့် Inventory agents ပါဝင်သော production-ready multi-agent AI solution တစ်ခုကို deploy လုပ်နိုင်ခြင်း

---

### 🔍 အခန်း 6: Pre-Deployment Validation & Planning
**လိုအပ်ချက်များ**: အခန်း 4 ကို ပြီးမြောက်ထားရမည်  
**ကြာမြင့်ချိန်**: 1 နာရီ  
**အဆင့်**: ⭐⭐

#### သင်လေ့လာမည့်အရာများ
- Capacity planning နှင့် resource validation
- SKU selection strategies
- Pre-flight checks နှင့် automation

#### သင်ခန်းစာအရင်းအမြစ်များ
- **📊 Planning**: [Capacity Planning](docs/pre-deployment/capacity-planning.md) - Resource validation
- **💰 Selection**: [SKU Selection](docs/pre-deployment/sku-selection.md) - ကုန်ကျစရိတ်သက်သာစေရန်ရွေးချယ်မှု
- **✅ Validation**: [Pre-flight Checks](docs/pre-deployment/preflight-checks.md) - Automated scripts

#### လက်တွေ့လေ့ကျင့်မှုများ
- Capacity validation scripts များကို run လုပ်ခြင်း
- SKU selection များကို optimize လုပ်ခြင်း
- Automated pre-deployment checks များကို implement လုပ်ခြင်း

**💡 အခန်းရလဒ်**: Deployment မလုပ်မီ validation နှင့် optimization ကို အောင်မြင်စွာလုပ်ဆောင်နိုင်ခြင်း

---

### 🚨 အခန်း 7: Troubleshooting & Debugging
**လိုအပ်ချက်များ**: Deployment အခန်းတစ်ခုခုကို ပြီးမြောက်ထားရမည်  
**ကြာမြင့်ချိန်**: 1-1.5 နာရီ  
**အဆင့်**: ⭐⭐

#### သင်လေ့လာမည့်အရာများ
- Debugging နည်းလမ်းများကို စနစ်တကျအသုံးပြုခြင်း
- အများဆုံးကြုံတွေ့ရသော အခက်အခဲများနှင့် ဖြေရှင်းနည်းများ
- AI-specific troubleshooting

#### သင်ခန်းစာအရင်းအမြစ်များ
- **🔧 Common Issues**: [Common Issues](docs/troubleshooting/common-issues.md) - FAQ နှင့် ဖြေရှင်းနည်းများ
- **🕵️ Debugging**: [Debugging Guide](docs/troubleshooting/debugging.md) - အဆင့်ဆင့်နည်းလမ်းများ
- **🤖 AI Issues**: [AI-Specific Troubleshooting](docs/troubleshooting/ai-troubleshooting.md) - AI service အခက်အခဲများ

#### လက်တွေ့လေ့ကျင့်မှုများ
- Deployment failure များကို diagnose လုပ်ခြင်း
- Authentication အခက်အခဲများကို ဖြေရှင်းခြင်း
- AI service connectivity ကို debug လုပ်ခြင်း

**💡 အခန်းရလဒ်**: Deployment အခက်အခဲများကို ကိုယ်တိုင် diagnose လုပ်ပြီး ဖြေရှင်းနိုင်ခြင်း

---

### 🏢 အခန်း 8: Production & Enterprise Patterns
**လိုအပ်ချက်များ**: အခန်း 
- **📊 စောင့်ကြည့်မှု**: Application Insights ပေါင်းစည်းမှု

#### လက်တွေ့လေ့ကျင့်မှုများ
- စီးပွားရေးလုံခြုံရေးပုံစံများကို အကောင်အထည်ဖော်ပါ  
- ပြည့်စုံသော စောင့်ကြည့်မှုကို စတင်ပါ  
- အုပ်ချုပ်မှုမှန်ကန်စွာဖြင့် ထုတ်လုပ်မှုအဆင့်သို့ တင်ပို့ပါ  

**💡 အခန်းရလဒ်**: ထုတ်လုပ်မှုအဆင့်အပြည့်အစုံဖြင့် စီးပွားရေးအဆင့်အထိ အသင့်ဖြစ်သော အက်ပ်များကို တင်ပို့ပါ  

---

## 📖 Azure Developer CLI ဆိုတာဘာလဲ?

Azure Developer CLI (azd) သည် Azure သို့ အက်ပ်များတည်ဆောက်ခြင်းနှင့် တင်ပို့ခြင်းလုပ်ငန်းစဉ်ကို အရှိန်မြှင့်ပေးသည့် developer-အလယ်ပြင် command-line interface တစ်ခုဖြစ်သည်။ ၎င်းသည် အောက်ပါအရာများကို ပေးစွမ်းသည် -

- **Template-based deployments** - အများဆုံးအသုံးပြုသော အက်ပ်ပုံစံများအတွက် ကြိုတင်ပြင်ဆင်ထားသော template များကို အသုံးပြုပါ  
- **Infrastructure as Code** - Bicep သို့မဟုတ် Terraform ကို အသုံးပြု၍ Azure အရင်းအမြစ်များကို စီမံပါ  
- **Integrated workflows** - အက်ပ်များကို စီမံဆောင်ရွက်ခြင်း၊ တင်ပို့ခြင်းနှင့် စောင့်ကြည့်ခြင်းကို အလွယ်တကူလုပ်ဆောင်ပါ  
- **Developer-friendly** - Developer များအတွက် ထိရောက်မှုနှင့် အတွေ့အကြုံကို အထူးပြုထားသည်  

### **AZD + Azure AI Foundry: AI Deployments အတွက် အကောင်းဆုံး**

**AI Solutions အတွက် AZD ကို ဘာကြောင့်ရွေးချယ်သင့်သလဲ?** AZD သည် AI developer များကြုံတွေ့ရသော အဓိကစိန်ခေါ်မှုများကို ဖြေရှင်းပေးသည် -

- **AI-Ready Templates** - Azure OpenAI, Cognitive Services နှင့် ML workloads များအတွက် ကြိုတင်ပြင်ဆင်ထားသော template များ  
- **Secure AI Deployments** - AI services, API key များနှင့် model endpoint များအတွက် လုံခြုံရေးပုံစံများ  
- **Production AI Patterns** - AI အက်ပ်များကို အတိုင်းအတာကျပြီး စရိတ်သက်သာစွာ တင်ပို့ရန် အကောင်းဆုံးလေ့ကျင့်မှုများ  
- **End-to-End AI Workflows** - Model တည်ဆောက်မှုမှ ထုတ်လုပ်မှုအဆင့်တိုင်အောင် စောင့်ကြည့်မှုမှန်ကန်စွာဖြင့်  
- **Cost Optimization** - AI workloads များအတွက် အရင်းအမြစ်ခွဲဝေမှုနှင့် အတိုင်းအတာချိန်ညှိမှု  
- **Azure AI Foundry Integration** - AI Foundry model catalog နှင့် endpoint များနှင့် အလွယ်တကူချိတ်ဆက်မှု  

---

## 🎯 Templates & Examples Library

### Featured: Azure AI Foundry Templates  
**AI အက်ပ်များကို တင်ပို့လိုက်ပါ!**

| Template | Chapter | Complexity | Services |
|----------|---------|------------|----------|
| [**AI chat စတင်အသုံးပြုရန်**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Chapter 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights |
| [**AI agents စတင်အသုံးပြုရန်**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Chapter 2 | ⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights|
| [**Multi-agent workflow automation**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Chapter 5 | ⭐⭐⭐ | AzureOpenAI + Azure AI Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|
| [**သင့်ဒေတာမှ စာရွက်စာတမ်းများထုတ်လုပ်ရန်**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Chapter 4 | ⭐⭐⭐  | AzureOpenAI + Azure AI Search + Azure AI Services + Azure CosmosDB|
| [**Agent များဖြင့် ဖောက်သည်အစည်းအဝေးများကို တိုးတက်စေပါ**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Chapter 5 | ⭐⭐⭐| AzureOpenAI + Azure AI Search + Azure CosmosDB + Azure SQL Database |
| [**သင့်ကုဒ်ကို Agent များဖြင့် ခေတ်မီစေပါ**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Chapter 5 | ⭐⭐⭐ | AzureOpenAI + Azure Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|
| [**သင့်စကားပြော Agent ကို တည်ဆောက်ပါ**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Chapter 4 | ⭐⭐⭐ | AI Language + AzureOpenAI + AI Search + Azure Storage + Azure Container Registry|
| [**စကားပြောဒေတာမှ အထောက်အထားများကို ဖွင့်ပါ**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Chapter 8 | ⭐⭐⭐ | AzureOpenAI + AI Search + Semantic Kernel + Azure Agent Service + AI AI Content Understanding|
| [**Multi-modal content processing**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Chapter 8 | ⭐⭐⭐⭐ | AzureOpenAI + Azure Content Understanding + Azure CosmosDB + Azure Container Apps|

### Featured: Complete Learning Scenarios  
**ထုတ်လုပ်မှုအဆင့်အထိ အသင့်ဖြစ်သော အက်ပ် template များ**

| Template | Learning Chapter | Complexity | Key Learning |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chapter 2 | ⭐ | AI တင်ပို့မှုအခြေခံပုံစံများ |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Chapter 2 | ⭐⭐ | RAG ကို Azure AI Search ဖြင့် အကောင်အထည်ဖော်ခြင်း |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Chapter 4 | ⭐⭐ | Document Intelligence ပေါင်းစည်းမှု |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Chapter 5 | ⭐⭐⭐ | Agent framework နှင့် function calling |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Chapter 8 | ⭐⭐⭐ | စီးပွားရေး AI စီမံခန့်ခွဲမှု |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Chapter 5 | ⭐⭐⭐⭐ | ဖောက်သည်နှင့် စတော့ရှယ်ယာ Agent များပါဝင်သော Multi-agent architecture |

### Learning by Example Type  

#### ရိုးရှင်းသော အက်ပ်များ (Chapters 1-2)  
- [Simple Web App](../../examples/simple-web-app) - အခြေခံတင်ပို့မှုပုံစံများ  
- [Static Website](../../examples/static-site) - Static content တင်ပို့မှု  
- [Basic API](../../examples/basic-api) - REST API တင်ပို့မှု  

#### ဒေတာဘေ့စ်ပေါင်းစည်းမှု (Chapter 3-4)  
- [Database App](../../examples/database-app) - ဒေတာဘေ့စ် ချိတ်ဆက်မှုပုံစံများ  
- [Data Processing](../../examples/data-processing) - ETL workflow တင်ပို့မှု  

#### အဆင့်မြင့်ပုံစံများ (Chapters 4-8)  
- [Container Apps](../../examples/container-app) - Containerized တင်ပို့မှု  
- [Microservices](../../examples/microservices) - Multi-service architecture များ  
- [Enterprise Solutions](../../examples/enterprise) - ထုတ်လုပ်မှုအဆင့်အထိ ပုံစံများ  

### အပြင်ပေါ် Template စုစည်းမှုများ  
- [**Azure-Samples AZD Templates**](https://github.com/Azure-Samples/azd-templates) - Microsoft မှ တရားဝင်နမူနာများ  
- [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) - အသိုင်းအဝိုင်းမှ ပံ့ပိုးထားသော template များ  
- [**Examples Directory**](examples/README.md) - အသေးစိတ်ရှင်းလင်းချက်များနှင့် အတူရှိသော ဒေသခံလေ့လာမှုနမူနာများ  

---

## 📚 Learning Resources & References  

### Quick References  
- [**Command Cheat Sheet**](resources/cheat-sheet.md) - အရေးကြီးသော azd command များကို အခန်းအလိုက် စီစဉ်ထားသည်  
- [**Glossary**](resources/glossary.md) - Azure နှင့် azd အဘိဓာန်  
- [**FAQ**](resources/faq.md) - အခန်းအလိုက် စီစဉ်ထားသော မကြာခဏမေးလေ့ရှိသောမေးခွန်းများ  
- [**Study Guide**](resources/study-guide.md) - လေ့ကျင့်မှုလက်တွေ့အလုပ်များ  

### လက်တွေ့အလုပ်ရုံဆွေးနွေးပွဲများ  
- [**AI Workshop Lab**](docs/ai-foundry/ai-workshop-lab.md) - သင့် AI ဖြေရှင်းချက်များကို AZD ဖြင့် deploy လုပ်နိုင်အောင် ပြင်ဆင်ပါ  
- [**AZD For Beginners Workshop**](workshop/README.md) - လက်တွေ့အလုပ်ရုံဆွေးနွေးပွဲအတွက် ပြည့်စုံသော ပစ္စည်းများ  

### အပြင်ပေါ်လေ့လာမှုအရင်းအမြစ်များ  
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)  
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)  
- [Azure Status](https://status.azure.com/)  

---

## 🎓 သင်တန်းပြီးမြောက်မှုနှင့် လက်မှတ်  

### တိုးတက်မှုကို စစ်ဆေးခြင်း  
သင်တန်းအခန်းတစ်ခုစီကို အောင်မြင်စွာပြီးမြောက်မှုကို စစ်ဆေးပါ -  

- [ ] **Chapter 1**: အခြေခံနှင့် အမြန်စတင်မှု ✅  
- [ ] **Chapter 2**: AI-First Development ✅  
- [ ] **Chapter 3**: Configuration & Authentication ✅  
- [ ] **Chapter 4**: Infrastructure as Code & Deployment ✅  
- [ ] **Chapter 5**: Multi-Agent AI Solutions ✅  
- [ ] **Chapter 6**: Pre-Deployment Validation & Planning ✅  
- [ ] **Chapter 7**: Troubleshooting & Debugging ✅  
- [ ] **Chapter 8**: Production & Enterprise Patterns ✅  

### သင်တန်းပြီးမြောက်မှုအကျိုးကျေးဇူးများ  
အခန်းအားလုံးကို ပြီးမြောက်ပြီးနောက် သင်သည် -  

- **ထုတ်လုပ်မှုအတွေ့အကြုံ**: Azure သို့ အမှန်တကယ် AI အက်ပ်များကို တင်ပို့နိုင်မည်  
- **ပရော်ဖက်ရှင်နယ်ကျွမ်းကျင်မှုများ**: စီးပွားရေးအဆင့်အထိ တင်ပို့နိုင်စွမ်း  
- **အသိုင်းအဝိုင်းမှ အသိအမှတ်ပြုမှု**: Azure developer အသိုင်းအဝိုင်း၏ အကျင့်သင့်အဖွဲ့ဝင်  
- **အလုပ်အကိုင်တိုးတက်မှု**: AZD နှင့် AI တင်ပို့မှုကျွမ်းကျင်မှု  

---

## 🤝 အသိုင်းအဝိုင်းနှင့် ပံ့ပိုးမှု  

### အကူအညီရယူရန်  
- **နည်းပညာဆိုင်ရာပြဿနာများ**: [Bug များကို report လုပ်ပြီး feature များကို တောင်းဆိုပါ](https://github.com/microsoft/azd-for-beginners/issues)  
- **သင်ကြားမှုဆိုင်ရာမေးခွန်းများ**: [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure)  
- **AI-ဆိုင်ရာအကူအညီ**: AZD + AI Foundry ဆွေးနွေးမှုများအတွက် [#Azure channel](https://discord.gg/microsoft-azure) ကို ဝင်ပါ  
- **စာရွက်စာတမ်းများ**: [Azure Developer CLI တရားဝင်စာရွက်စာတမ်းများ](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  

### Azure AI Foundry Discord မှ အသိုင်းအဝိုင်းအမြင်များ  

**#Azure Channel မှ မဲပေးရလဒ်များ**:  
- **45%** Developer များသည် AZD ကို AI workloads အတွက် အသုံးပြုလိုကြသည်  
- **အဓိကစိန်ခေါ်မှုများ**: Multi-service တင်ပို့မှုများ, လက်မှတ်စီမံခန့်ခွဲမှု, ထုတ်လုပ်မှုအဆင့်အထိ အသင့်ဖြစ်မှု  
- **အများဆုံးတောင်းဆိုမှုများ**: AI-အထူး template များ, troubleshooting လမ်းညွှန်များ, အကောင်းဆုံးလေ့ကျင့်မှုများ  

**အသိုင်းအဝိုင်းနှင့် ပူးပေါင်းပါ**:  
- သင့် AZD + AI အတွေ့အကြုံများကို မျှဝေပြီး အကူအညီရယူပါ  
- AI template အသစ်များ၏ စောင့်ကြည့်မှုများကို ရယူပါ  
- AI တင်ပို့မှုအကောင်းဆုံးလေ့ကျင့်မှုများကို ပံ့ပိုးပါ  
- အနာဂတ် AI + AZD အင်္ဂါရပ်ဖွံ့ဖြိုးမှုကို သက်ရောက်မှုရှိစေပါ  

### သင်တန်းအတွက် ပံ့ပိုးမှု  
ကျွန်ုပ်တို့သည် ပံ့ပိုးမှုများကို ကြိုဆိုပါသည်! [Contributing Guide](CONTRIBUTING.md) ကို ဖတ်ရှုပါ -  
- **အကြောင်းအရာတိုးတက်မှုများ**: ရှိပြီးသားအခန်းများနှင့် နမူနာများကို တိုးတက်စေပါ  
- **နမူနာအသစ်များ**: အမှန်တကယ်အခြေအနေများနှင့် template များကို ထည့်သွင်းပါ  
- **ဘာသာပြန်ခြင်း**: ဘာသာစကားများစွာကို ထိန်းသိမ်းရန် ကူညီပါ  
- **Bug Report များ**: တိကျမှုနှင့် ရှင်းလင်းမှုကို တိုးတက်စေပါ  
- **အသိုင်းအဝိုင်းစံနှုန်းများ**: ကျွန်ုပ်တို့၏ အပါဝင်အသိုင်းအဝိုင်းလမ်းညွှန်များကို လိုက်နာပါ  

---

## 📄 သင်တန်းအချက်အလက်  

### လိုင်စင်  
ဤပရောဂျက်သည် MIT License အောက်တွင် လိုင်စင်ရရှိထားသည် - အသေးစိတ်အချက်အလက်များအတွက် [LICENSE](../../LICENSE) ဖိုင်ကို ကြည့်ပါ  

### Microsoft Learning Resources နှင့် ဆက်စပ်မှု  

ကျွန်ုပ်တို့၏အဖွဲ့သည် အခြားလေ့လာမှုသင်တန်းများကိုလည်း ထုတ်လုပ်သည် -  

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
- [Mastering GitHub Copilot for AI Paired Programming](https://aka.ms/GitHubCopilotAI?WT.mc_id=
**အတွေ့အကြုံရှိသော Developer များ**: [အခန်း ၃ - Configuration & Authentication](../..) ကိုစတင်ပါ

**နောက်ထပ်အဆင့်များ**: [အခန်း ၁ - AZD အခြေခံများ](docs/getting-started/azd-basics.md) →

---

**အကြောင်းကြားချက်**:  
ဤစာရွက်စာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ကို အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှုအတွက် ကြိုးစားနေသော်လည်း၊ အလိုအလျောက် ဘာသာပြန်မှုများတွင် အမှားများ သို့မဟုတ် မမှန်ကန်မှုများ ပါဝင်နိုင်သည်ကို သတိပြုပါ။ မူရင်းစာရွက်စာတမ်းကို ၎င်း၏ မူရင်းဘာသာစကားဖြင့် အာဏာရှိသောအရင်းအမြစ်အဖြစ် ရှုလေ့ရှိသင့်ပါသည်။ အရေးကြီးသော အချက်အလက်များအတွက် လူ့ဘာသာပြန်ပညာရှင်များမှ ပရော်ဖက်ရှင်နယ် ဘာသာပြန်မှုကို အကြံပြုပါသည်။ ဤဘာသာပြန်မှုကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော အလွဲအလွတ်များ သို့မဟုတ် အနားလွဲမှုများအတွက် ကျွန်ုပ်တို့သည် တာဝန်မယူပါ။