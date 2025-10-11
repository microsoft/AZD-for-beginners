<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "56313679644ccd28e9d15bb7089ae5ca",
  "translation_date": "2025-10-11T15:21:47+00:00",
  "source_file": "README.md",
  "language_code": "my"
}
-->
# AZD အတွက် အခြေခံသင်ခန်းစာများ: တစ်ဆင့်ဆင့်လေ့လာရေးခရီး

![AZD-for-beginners](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.my.png)

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Azure AI Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/kzRShWzttr)](https://discord.gg/kzRShWzttr)

## ဒီသင်ခန်းစာကို စတင်အသုံးပြုခြင်း

AZD လေ့လာရေးခရီးကို စတင်ရန် အောက်ပါအဆင့်များကို လိုက်နာပါ။

1. **Repository ကို Fork လုပ်ပါ**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork) ကိုနှိပ်ပါ။
2. **Repository ကို Clone လုပ်ပါ**: `git clone https://github.com/microsoft/azd-for-beginners.git`
3. **Community ကို Join လုပ်ပါ**: [Azure Discord Communities](https://discord.com/invite/ByRwuEEgH4) မှာ အကူအညီရယူပါ။
4. **သင့်ရဲ့ လေ့လာရေးလမ်းကြောင်းကို ရွေးချယ်ပါ**: အောက်ပါ အခန်းများထဲမှ သင့်အတွေ့အကြုံအဆင့်နှင့် ကိုက်ညီသော အခန်းကို ရွေးချယ်ပါ။

### ဘာသာစကားများအတွက် အထောက်အပံ့

#### အလိုအလျောက် ဘာသာပြန် (အမြဲနောက်ဆုံးအခြေအနေ)

[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](./README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../br/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

## သင်ခန်းစာအကျဉ်းချုပ်

Azure Developer CLI (azd) ကို တစ်ဆင့်ဆင့်လေ့လာနိုင်သော အခန်းများမှတစ်ဆင့် ကျွမ်းကျင်ပါ။ **AI application deployment ကို Azure AI Foundry integration ဖြင့် အထူးအာရုံစိုက်ထားပါသည်။**

### ဒီသင်ခန်းစာက အခေတ်မီ Developer တွေအတွက် အရေးကြီးတဲ့အကြောင်း

Azure AI Foundry Discord community မှ အချက်အလက်အရ **Developer 45% က AZD ကို AI workload တွေအတွက် အသုံးပြုချင်ကြောင်း** ပြောကြပြီး အောက်ပါအခက်အခဲများကြုံတွေ့ရသည်။
- AI အတွက် multi-service architecture များ၏ ရှုပ်ထွေးမှု
- Production AI deployment အကောင်းဆုံးလက်တွေ့ကျကျနည်းလမ်းများ
- Azure AI service တွေကို ပေါင်းစပ်ပြီး စနစ်တကျဖွဲ့စည်းခြင်း
- AI workload များအတွက် ကုန်ကျစရိတ်ကို အထိရောက်ဆုံးဖြစ်အောင်လုပ်ခြင်း
- AI-specific deployment အခက်အခဲများကို ဖြေရှင်းခြင်း

### သင်ခန်းစာ၏ ရည်မှန်းချက်များ

ဒီသင်ခန်းစာကို ပြီးမြောက်ပါက သင်သည်:
- **AZD အခြေခံများကို ကျွမ်းကျင်ပါမည်**: အဓိကအကြောင်းအရာများ၊ installation နှင့် configuration
- **AI Applications များကို Deploy လုပ်ပါမည်**: AZD ကို Azure AI Foundry services နှင့်အတူ အသုံးပြုခြင်း
- **Infrastructure as Code ကို အသုံးပြုပါမည်**: Bicep templates ဖြင့် Azure resources များကို စနစ်တကျစီမံခြင်း
- **Deployments များကို Troubleshoot လုပ်ပါမည်**: အခက်အခဲများကို ဖြေရှင်းခြင်းနှင့် debugging
- **Production အတွက် Optimize လုပ်ပါမည်**: လုံခြုံရေး၊ အရွယ်အစားချဲ့ခြင်း၊ စောင့်ကြည့်ခြင်းနှင့် ကုန်ကျစရိတ်စီမံခြင်း
- **Multi-Agent Solutions များကို ဖန်တီးပါမည်**: ရှုပ်ထွေးသော AI architectures များကို Deploy လုပ်ခြင်း

## 📚 သင်ခန်းစာအခန်းများ

*သင့်ရဲ့ အတွေ့အကြုံအဆင့်နှင့် ရည်မှန်းချက်အပေါ်မူတည်ပြီး သင့်လမ်းကြောင်းကို ရွေးချယ်ပါ*

### 🚀 အခန်း 1: အခြေခံနှင့် အမြန်စတင်ခြင်း
**လိုအပ်ချက်များ**: Azure subscription, command line အခြေခံအသိ  
**ကြာမြင့်ချိန်**: 30-45 မိနစ်  
**ရှုပ်ထွေးမှုအဆင့်**: ⭐

#### သင်လေ့လာရမည့်အရာများ
- Azure Developer CLI အခြေခံကို နားလည်ခြင်း
- သင့် platform တွင် AZD ကို install လုပ်ခြင်း
- ပထမဆုံး deployment ကို အောင်မြင်စွာလုပ်ဆောင်ခြင်း

#### သင်ခန်းစာအရင်းအမြစ်များ
- **🎯 ဒီနေရာက စတင်ပါ**: [Azure Developer CLI ဆိုတာဘာလဲ?](../..)
- **📖 သီအိုရီ**: [AZD အခြေခံများ](docs/getting-started/azd-basics.md) - အဓိကအကြောင်းအရာများနှင့် အဓိပ္ပါယ်
- **⚙️ Setup**: [Installation & Setup](docs/getting-started/installation.md) - Platform-specific လမ်းညွှန်ချက်များ
- **🛠️ လက်တွေ့လုပ်ဆောင်မှု**: [သင့်ရဲ့ ပထမဆုံး Project](docs/getting-started/first-project.md) - အဆင့်ဆင့်လမ်းညွှန်ချက်
- **📋 အမြန်ရယူရန်**: [Command Cheat Sheet](resources/cheat-sheet.md)

#### လက်တွေ့လေ့ကျင့်မှုများ
```bash
# Quick installation check
azd version

# Deploy your first application
azd init --template todo-nodejs-mongo
azd up
```

**💡 အခန်းရလဒ်**: AZD ကို အသုံးပြု၍ Azure တွင် ရိုးရှင်းသော web application ကို အောင်မြင်စွာ deploy လုပ်ပါ။

---

### 🤖 အခန်း 2: AI-First Development (AI Developer များအတွက် အကြံပြု)
**လိုအပ်ချက်များ**: အခန်း 1 ကို ပြီးမြောက်ထားရမည်  
**ကြာမြင့်ချိန်**: 1-2 နာရီ  
**ရှုပ်ထွေးမှုအဆင့်**: ⭐⭐

#### သင်လေ့လာရမည့်အရာများ
- AZD နှင့် Azure AI Foundry ကို ပေါင်းစပ်ခြင်း
- AI-powered applications များကို deploy လုပ်ခြင်း
- AI service configurations ကို နားလည်ခြင်း

#### သင်ခန်းစာအရင်းအမြစ်များ
- **🎯 ဒီနေရာက စတင်ပါ**: [Azure AI Foundry Integration](docs/ai-foundry/azure-ai-foundry-integration.md)
- **📖 Patterns**: [AI Model Deployment](docs/ai-foundry/ai-model-deployment.md) - AI models များကို deploy နှင့် စီမံခြင်း
- **🛠️ Workshop**: [AI Workshop Lab](docs/ai-foundry/ai-workshop-lab.md) - AZD-ready AI solutions ဖန်တီးခြင်း
- **🎥 Interactive Guide**: [Workshop Materials](workshop/README.md) - Browser-based learning with MkDocs * DevContainer Environment
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

**💡 အခန်းရလဒ်**: RAG စွမ်းရည်များပါဝင်သော AI-powered chat application ကို deploy နှင့် configure လုပ်ပါ။

---

### ⚙️ အခန်း 3: Configuration & Authentication
**လိုအပ်ချက်များ**: အခန်း 1 ကို ပြီးမြောက်ထားရမည်  
**ကြာမြင့်ချိန်**: 45-60 မိနစ်  
**ရှုပ်ထွေးမှုအဆင့်**: ⭐⭐

#### သင်လေ့လာရမည့်အရာများ
- Environment configuration နှင့် စီမံခြင်း
- Authentication နှင့် လုံခြုံရေးအကောင်းဆုံးနည်းလမ်းများ
- Resource naming နှင့် စီမံခြင်း

#### သင်ခန်းစာအရင်းအမြစ်များ
- **📖 Configuration**: [Configuration Guide](docs/getting-started/configuration.md) - Environment setup
- **🔐 Security**: Authentication patterns နှင့် managed identity
- **📝 Examples**: [Database App Example](../../examples/database-app) - Configuration patterns

#### လက်တွေ့လေ့ကျင့်မှုများ
- အမျိုးမျိုးသော environment များ (dev, staging, prod) ကို configure လုပ်ပါ။
- Managed identity authentication ကို setup လုပ်ပါ။
- Environment-specific configurations ကို အကောင်အထည်ဖော်ပါ။

**💡 အခန်းရလဒ်**: Authentication နှင့် လုံခြုံရေးကို သေချာစွာ စီမံပြီး အမျိုးမျိုးသော environment များကို စီမံပါ။

---

### 🏗️ အခန်း 4: Infrastructure as Code & Deployment
**လိုအပ်ချက်များ**: အခန်း 1-3 ကို ပြီးမြောက်ထားရမည်  
**ကြာမြင့်ချိန်**: 1-1.5 နာရီ  
**ရှုပ်ထွေးမှုအဆင့်**: ⭐⭐⭐

#### သင်လေ့လာရမည့်အရာများ
- Deployment patterns advanced
- Infrastructure as Code ကို Bicep ဖြင့် အသုံးပြုခြင်း
- Resource provisioning strategies

#### သင်ခန်းစာအရင်းအမြစ်များ
- **📖 Deployment**: [Deployment Guide](docs/deployment/deployment-guide.md) - Complete workflows
- **🏗️ Provisioning**: [Provisioning Resources](docs/deployment/provisioning.md) - Azure resource management
- **📝 Examples**: [Container App Example](../../examples/container-app) - Containerized deployments

#### လက်တွေ့လေ့ကျင့်မှုများ
- Custom Bicep templates ဖန်တီးပါ။
- Multi-service applications များကို deploy လုပ်ပါ။
- Blue-green deployment strategies ကို အကောင်အထည်ဖော်ပါ။

**💡 အခန်းရလဒ်**: Custom infrastructure templates အသုံးပြု၍ ရှုပ်ထွေးသော multi-service applications များကို deploy လုပ်ပါ။

---

### 🎯 အခန်း 5: Multi-Agent AI Solutions (Advanced)
**လိုအပ်ချက်များ**: အခန်း 1-2 ကို ပြီးမြောက်ထားရမည်  
**ကြာမြင့်ချိန်**: 2-3 နာရီ  
**ရှုပ်ထွေးမှုအဆင့်**: ⭐⭐⭐⭐

#### သင်လေ့လာရမည့်အရာများ
- Multi-agent architecture patterns
- Agent orchestration နှင့် coordination
- Production-ready AI deployments

#### သင်ခန်းစာအရင်းအမြစ်များ
- **🤖 Featured Project**: [Retail Multi-Agent Solution](examples/retail-scenario.md) - Complete implementation
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

**💡 အခန်းရလဒ်**: Customer နှင့် Inventory agents ပါဝင်သော production-ready multi-agent AI solution ကို deploy နှင့် စီမံပါ။

---

### 🔍 အခန်း 6: Pre-Deployment Validation & Planning
**လိုအပ်ချက်များ**: အခန်း 4 ကို ပြီးမြောက်ထားရမည်  
**ကြာမြင့်ချိန်**: 1 နာရီ  
**ရှုပ်ထွေးမှုအဆင့်**: ⭐⭐

#### သင်လေ့လာရမည့်အရာများ
- Capacity planning နှင့် resource validation
- SKU selection strategies
- Pre-flight checks နှင့် automation

#### သင်ခန်းစာအရင်းအမြစ်များ
- **📊 Planning**: [Capacity Planning](docs/pre-deployment/capacity-planning.md) - Resource validation
- **💰 Selection**: [SKU Selection](docs/pre-deployment/sku-selection.md) - Cost-effective choices
- **✅ Validation**: [Pre-flight Checks](docs/pre-deployment/preflight-checks.md) - Automated scripts

#### လက်တွေ့လေ့ကျင့်မှုများ
- Capacity validation scripts ကို run လုပ်ပါ။
- SKU selections ကို ကုန်ကျစရိတ်အထိရောက်ဆုံးဖြစ်အောင် optimize လုပ်ပါ။
- Automated pre-deployment checks ကို အကောင်အထည်ဖော်ပါ။

**💡 အခန်းရလဒ်**: Deployment မလုပ်မီ validate နှင့် optimize လုပ်ပါ။

---

### 🚨 အခန်း 7: Troubleshooting & Debugging
**လိုအပ်ချက်များ**: Deployment အခန်းတစ်ခုခုကို ပြီးမြောက်ထားရမည်  
**ကြာမြင့်ချိန်**: 1-1.5 နာရီ  
**ရှုပ်ထွေးမှုအဆင့်**: ⭐⭐

#### သင်လေ့လာရမည့်အရာများ
- Systematic debugging approaches
- အများဆုံးကြုံတွေ့ရသော အခက်အခဲများနှင့် ဖြေရှင်းနည်းများ
- AI-specific troubleshooting

#### သင်ခန်းစာအရင်းအမြစ်များ
- **🔧 Common Issues**: [Common Issues](docs/troubleshooting/common-issues.md) - FAQ နှင့် solutions
- **🕵️ Debugging**: [Debugging Guide](docs/troubleshooting/debugging.md) - အဆင့်ဆင့် strategies
- **🤖 AI Issues**: [AI-Specific Troubleshooting](docs/troubleshooting/ai-troubleshooting.md) - AI service problems

#### လက်တွေ့လေ့ကျင့်မှုများ
- Deployment failure များကို diagnose လုပ်ပါ။
- Authentication အခက်အခဲများကို ဖြေရှင်းပါ။
- AI service connectivity ကို debug လုပ်ပါ။

**💡 အခန်းရလဒ်**: Deployment အခက်အခဲများကို ကိုယ်တိုင် diagnose
**အဆင့်အတန်း**: ⭐⭐⭐⭐

#### သင်လေ့လာနိုင်မည့်အရာများ
- ထုတ်လုပ်မှု deployment များအတွက် မဟာဗျူဟာများ
- စီးပွားရေးလုံခြုံရေး ပုံစံများ
- စောင့်ကြည့်မှုနှင့်ကုန်ကျစရိတ် အခွင့်အရေးများ

#### သင်ကြားရေးအရင်းအမြစ်များ
- **🏭 ထုတ်လုပ်မှု**: [Production AI Best Practices](docs/ai-foundry/production-ai-practices.md) - စီးပွားရေးပုံစံများ
- **📝 ဥပမာများ**: [Microservices Example](../../examples/microservices) - ရှုပ်ထွေးသော architecture များ
- **📊 စောင့်ကြည့်မှု**: Application Insights integration

#### လက်တွေ့လေ့ကျင့်မှုများ
- စီးပွားရေးလုံခြုံရေးပုံစံများကို အကောင်အထည်ဖော်ပါ
- စုံလင်သော စောင့်ကြည့်မှုကို စနစ်တကျတပ်ဆင်ပါ
- Governance အဆင့်ဆင့်ဖြင့် ထုတ်လုပ်မှုအတွက် deployment ပြုလုပ်ပါ

**💡 အခန်းရလဒ်**: စီးပွားရေးအဆင့်အတန်းရှိသော application များကို ထုတ်လုပ်မှုစွမ်းရည်အပြည့်အဝဖြင့် deploy ပြုလုပ်နိုင်ရန်

---

## 🎓 Workshop အကျဉ်းချုပ်: လက်တွေ့လေ့လာမှုအတွေ့အကြုံ

### Interactive Workshop Materials
**Browser-based tools နှင့် လမ်းညွှန်လေ့ကျင့်မှုများဖြင့် လက်တွေ့လေ့လာမှု**

ကျွန်ုပ်တို့၏ workshop materials တွင် အခန်းအလိုက် သင်ကြားရေးအစီအစဉ်ကို ဖြည့်စွက်ပေးသော စနစ်တကျ၊ interactive လေ့လာမှုအတွေ့အကြုံကို ပေးစွမ်းပါသည်။ Workshop သည် ကိုယ်တိုင်လေ့လာမှုနှင့် ဆရာကြီးမောင်းနှင်သင်တန်းများအတွက် အထူးသင့်လျော်သည်။

#### 🛠️ Workshop Features
- **Browser-Based Interface**: MkDocs-powered workshop ကို search, copy, နှင့် theme features ဖြင့် ပြီးစီးပါ
- **GitHub Codespaces Integration**: Development environment ကို တစ်ချက်နှိပ်ရုံဖြင့် စတင်နိုင်ပါသည်
- **Structured Learning Path**: 7-အဆင့် လမ်းညွှန်လေ့ကျင့်မှုများ (စုစုပေါင်း 3.5 နာရီ)
- **Discovery → Deployment → Customization**: တိုးတက်မှု methodology
- **Interactive DevContainer Environment**: Tools နှင့် dependencies များကို ကြိုတင်ပြင်ဆင်ထားသည်

#### 📚 Workshop Structure
Workshop သည် **Discovery → Deployment → Customization** methodology ကို လိုက်နာသည်။

1. **Discovery Phase** (45 မိနစ်)
   - Azure AI Foundry templates နှင့် services များကို ရှာဖွေပါ
   - Multi-agent architecture patterns ကို နားလည်ပါ
   - Deployment လိုအပ်ချက်များနှင့် ကြိုတင်ပြင်ဆင်မှုများကို ပြန်လည်သုံးသပ်ပါ

2. **Deployment Phase** (2 နာရီ)
   - AZD ဖြင့် AI application များကို လက်တွေ့ deployment ပြုလုပ်ပါ
   - Azure AI services နှင့် endpoints များကို configure ပြုလုပ်ပါ
   - လုံခြုံရေးနှင့် authentication patterns များကို အကောင်အထည်ဖော်ပါ

3. **Customization Phase** (45 မိနစ်)
   - အသုံးပြုမှုအတွက် application များကို ပြင်ဆင်ပါ
   - ထုတ်လုပ်မှု deployment အတွက် optimize ပြုလုပ်ပါ
   - စောင့်ကြည့်မှုနှင့်ကုန်ကျစရိတ် စီမံခန့်ခွဲမှုကို အကောင်အထည်ဖော်ပါ

#### 🚀 Workshop စတင်ရန်
```bash
# Option 1: GitHub Codespaces (Recommended)
# Click "Code" → "Create codespace on main" in the repository

# Option 2: Local Development
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Follow the setup instructions in workshop/README.md
```

#### 🎯 Workshop Learning Outcomes
Workshop ကို ပြီးမြောက်ပါက ပါဝင်သူများသည်:
- **Production AI Applications ကို Deploy ပြုလုပ်နိုင်မည်**: AZD နှင့် Azure AI Foundry services ကို အသုံးပြုပါ
- **Multi-Agent Architectures ကို ကျွမ်းကျင်မည်**: AI agent များကို ပေါင်းစည်းပြီး အကောင်အထည်ဖော်ပါ
- **Security Best Practices ကို အကောင်အထည်ဖော်မည်**: Authentication နှင့် access control ကို configure ပြုလုပ်ပါ
- **Scale အတွက် Optimize ပြုလုပ်မည်**: ကုန်ကျစရိတ်သက်သာပြီး စွမ်းဆောင်ရည်မြင့်သော deployment များကို ဒီဇိုင်းဆွဲပါ
- **Deployments ကို Troubleshoot ပြုလုပ်နိုင်မည်**: အများဆုံးတွေ့ရသော ပြဿနာများကို ကိုယ်တိုင်ဖြေရှင်းပါ

#### 📖 Workshop Resources
- **🎥 Interactive Guide**: [Workshop Materials](workshop/README.md) - Browser-based learning environment
- **📋 Step-by-Step Instructions**: [Guided Exercises](../../workshop/docs/instructions) - အသေးစိတ်လမ်းညွှန်မှုများ
- **🛠️ AI Workshop Lab**: [AI Workshop Lab](docs/ai-foundry/ai-workshop-lab.md) - AI အာရုံစိုက်လေ့ကျင့်မှုများ
- **💡 Quick Start**: [Workshop Setup Guide](workshop/README.md#quick-start) - Environment configuration

**သင့်လျော်သောအဖွဲ့များ**: ကုမ္ပဏီသင်တန်းများ၊ တက္ကသိုလ်သင်တန်းများ၊ ကိုယ်တိုင်လေ့လာမှုများနှင့် developer bootcamps

---

## 📖 Azure Developer CLI ဆိုတာဘာလဲ?

Azure Developer CLI (azd) သည် application များကို Azure တွင် တည်ဆောက်ခြင်းနှင့် deploy ပြုလုပ်ခြင်းကို အရှိန်မြှင့်ပေးသော developer-centric command-line interface ဖြစ်သည်။ ၎င်းသည် အောက်ပါအရာများကို ပေးစွမ်းသည်-

- **Template-based deployments** - အများဆုံးတွေ့ရသော application patterns များအတွက် ကြိုတင်ပြင်ဆင်ထားသော templates များကို အသုံးပြုပါ
- **Infrastructure as Code** - Bicep သို့မဟုတ် Terraform ကို အသုံးပြု၍ Azure resources များကို စီမံခန့်ခွဲပါ  
- **Integrated workflows** - Application များကို provision, deploy, နှင့် monitor ပြုလုပ်ရန် seamless workflow များ
- **Developer-friendly** - Developer productivity နှင့် အတွေ့အကြုံအတွက် optimize ပြုလုပ်ထားသည်

### **AZD + Azure AI Foundry: AI Deployments အတွက် အကောင်းဆုံး**

**AI Solutions အတွက် AZD ကို ဘာကြောင့်ရွေးချယ်သင့်သလဲ?** AZD သည် AI developer များရင်ဆိုင်နေရသော အဓိကအခက်အခဲများကို ဖြေရှင်းပေးသည်-

- **AI-Ready Templates** - Azure OpenAI, Cognitive Services, နှင့် ML workloads များအတွက် ကြိုတင်ပြင်ဆင်ထားသော templates
- **Secure AI Deployments** - AI services, API keys, နှင့် model endpoints များအတွက် built-in security patterns  
- **Production AI Patterns** - Scalable, cost-effective AI application deployments အတွက် အကောင်းဆုံးအလေ့အကျင့်များ
- **End-to-End AI Workflows** - Model development မှ production deployment အထိ monitoring အပြည့်အစုံဖြင့်
- **Cost Optimization** - AI workloads များအတွက် resource allocation နှင့် scaling strategy များ
- **Azure AI Foundry Integration** - AI Foundry model catalog နှင့် endpoints များနှင့် seamless connection

---

## 🎯 Templates & Examples Library

### Featured: Azure AI Foundry Templates
**AI application များကို deploy ပြုလုပ်ရန် ဒီနေရာမှ စတင်ပါ!**

| Template | Chapter | Complexity | Services |
|----------|---------|------------|----------|
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Chapter 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights |
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Chapter 2 | ⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights|
| [**Multi-agent workflow automation**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Chapter 5 | ⭐⭐⭐ | AzureOpenAI + Azure AI Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|
| [**Generate documents from your data**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Chapter 4 | ⭐⭐⭐  | AzureOpenAI + Azure AI Search + Azure AI Services + Azure CosmosDB|
| [**Improve client meetings with agents**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Chapter 5 | ⭐⭐⭐| AzureOpenAI + Azure AI Search + Azure CosmosDB + Azure SQL Database |
| [**Modernize your code with agents**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Chapter 5 | ⭐⭐⭐ | AzureOpenAI + Azure Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|
| [**Build your conversational agent**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Chapter 4 | ⭐⭐⭐ | AI Language + AzureOpenAI + AI Search + Azure Storage + Azure Container Registry|
| [**Unlock insights from conversational data**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Chapter 8 | ⭐⭐⭐ | AzureOpenAI + AI Search + Semantic Kernel + Azure Agent Service + AI AI Content Understanding|
| [**Multi-modal content processing**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Chapter 8 | ⭐⭐⭐⭐ | AzureOpenAI + Azure Content Understanding + Azure CosmosDB + Azure Container Apps|

### Featured: Complete Learning Scenarios
**Production-ready application templates များကို သင်ကြားရေးအခန်းများနှင့် mapping ပြုလုပ်ထားသည်**

| Template | Learning Chapter | Complexity | Key Learning |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chapter 2 | ⭐ | Basic AI deployment patterns |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Chapter 2 | ⭐⭐ | RAG implementation with Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Chapter 4 | ⭐⭐ | Document Intelligence integration |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Chapter 5 | ⭐⭐⭐ | Agent framework and function calling |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Chapter 8 | ⭐⭐⭐ | Enterprise AI orchestration |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Chapter 5 | ⭐⭐⭐⭐ | Multi-agent architecture with Customer and Inventory agents |

### Learning by Example Type

#### Simple Applications (Chapters 1-2)
- [Simple Web App](../../examples/simple-web-app) - Basic deployment patterns
- [Static Website](../../examples/static-site) - Static content deployment
- [Basic API](../../examples/basic-api) - REST API deployment

#### Database Integration (Chapter 3-4)  
- [Database App](../../examples/database-app) - Database connectivity patterns
- [Data Processing](../../examples/data-processing) - ETL workflow deployment

#### Advanced Patterns (Chapters 4-8)
- [Container Apps](../../examples/container-app) - Containerized deployments
- [Microservices](../../examples/microservices) - Multi-service architectures  
- [Enterprise Solutions](../../examples/enterprise) - Production-ready patterns

### External Template Collections
- [**Azure-Samples AZD Templates**](https://github.com/Azure-Samples/azd-templates) - Official Microsoft samples
- [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) - Community-contributed templates
- [**Examples Directory**](examples/README.md) - Local learning examples with detailed explanations

---

## 📚 Learning Resources & References

### Quick References
- [**Command Cheat Sheet**](resources/cheat-sheet.md) - အရေးကြီးသော azd command များကို အခန်းအလိုက် စီစဉ်ထားသည်
- [**Glossary**](resources/glossary.md) - Azure နှင့် azd အဓိပ္ပါယ်များ  
- [**FAQ**](resources/faq.md) - အခန်းအလိုက် အများဆုံးမေးလေ့ရှိသောမေးခွန်းများ
- [**Study Guide**](resources/study-guide.md) - လေ့ကျင့်မှုများကို အပြည့်အစုံလေ့လာရန်

### Hands-On Workshops
- [**AI Workshop Lab**](docs/ai-foundry/ai-workshop-lab.md) - AZD-deployable AI solution များကို ပြုလုပ်ပါ (2-3 နာရီ)
- [**Interactive Workshop Guide**](workshop/README.md) - MkDocs နှင့် DevContainer Environment ဖြင့် Browser-based workshop
- [**Structured Learning Path**](../../workshop/docs/instructions) - Discovery → Deployment → Customization အဆင့် 7-လမ်းညွှန်လေ့ကျင့်မှုများ
- [**AZD For Beginners Workshop**](workshop/README.md) - GitHub Codespaces integration ဖြင့် လက်တွေ့လေ့ကျင့်မှုများ

### External Learning Resources
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

---

## 🎓 သင်တန်းပြီးမြောက်မှုနှင့် လက်မှတ်

### Progress Tracking
သင်၏လေ့လာမှုတိုးတက်မှုကို အခန်းတစ်ခုချင်းစီတွင် စစ်ဆေးပါ:

- [ ] **Chapter 1**: Foundation & Quick Start ✅
- [ ] **Chapter 2**: AI-First Development ✅  
- [ ] **Chapter 3**: Configuration & Authentication ✅
- [ ] **Chapter 4**: Infrastructure as Code & Deployment ✅
- [ ] **Chapter 5**: Multi-Agent AI Solutions ✅
- [ ] **Chapter 6**: Pre-Deployment Validation & Planning ✅
- [ ] **Chapter 7**: Troubleshooting & Debugging ✅
- [ ] **Chapter 8**: Production & Enterprise Patterns ✅

### Learning Verification
အခန်းတစ်ခုချင်းစီပြီးမြောက်ပါက သင်၏အသိပညာကို အတည်ပြုပါ:
1. **Practical Exercise**: အခန်း၏ လက်တွေ့ deployment ကို ပြုလုပ်ပါ
2. **Knowledge Check**: သင်၏အခန်းအတွက် FAQ အပိုင်းကို ပြန်လည်သုံးသပ်ပါ
3. **Community Discussion**: Azure Discord တွင် သင်၏အတွေ့အကြုံကို မျှဝေပါ
4. **Next Chapter**: နောက်ထပ်အဆင့်အတန်းကို ဆက်လက်လေ့လာပါ

### သင်တန်းပြီးမြောက်မှုအကျိုးကျေးဇူးများ
အခန်းအားလုံးကို ပြီးမြောက်ပါက သင်သည်:
- **Production အတွေ့အကြုံ**: Azure တွင် အမှန်တကယ် AI application များကို deploy ပြုလုပ်နိုင်မည်
- **Professional Skills**: စီးပွားရေးအဆင့်အတန်း deployment စွမ်းရည်များ  
- **Community Recognition**: Azure developer community ၏ အကျိုးကျေးဇူးကို ရရှိမည်
- **Career Advancement**: AZD နှင့် AI deployment expertise အတွက် အလုပ်အကိုင်အခွင့်အရေးများ

---

## 🤝 Community & Support

### အကူအညီနှင့် ပံ့ပိုးမှု
- **Technical Issues**: [Report bugs and request features](https://github.com/microsoft/azd-for-beginners/issues)
- **Learning Questions**: [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure)
- **AI-Specific Help**: AZD + AI Foundry ဆွေးနွေးမှုများအတွက် [#Azure channel](https://discord.gg/microsoft-azure) ကို ဝင်ရောက်ပါ
- **Documentation**: [Official Azure Developer CLI documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Azure AI Foundry Discord မှ Community Insights

**#Azure Channel မှ မဲပေးရလဒ်များ**:
- **45%** developer များသည် AI workloads အတွက် AZD ကို အသုံးပြုလိုကြသည်
- **အဓိကအခက်အခဲများ**: Multi-service deployments, credential management, production readiness  
- **အများဆုံးတောင်းဆိုမှုများ**: AI-specific templates, troubleshooting guides, best practices

**ကျွန်ုပ်တို့၏ community ကို ဝင်ရောက်ပါ**:
- AZD + AI အတွေ့အကြုံများကို မျှဝေပြီး အကူအညီရယူပါ
- AI templates အသစ်များ၏ early previews ကို ရယူပါ
- AI deployment best practices များကို ပံ့ပိုးပါ
- အနာဂတ် AI + AZD feature development ကို အကျိုးသက်ရောက်မှုရှိစေပါ

### သင်တန်းအတွက် ပံ့ပိုးမှု
ကျွန်ုပ်တို့သည် ပံ့ပိုးမှုများကို ကြိုဆိုပါသည်! [Contributing Guide](CONTRIBUTING.md) ကို ဖတ်ရှ
- **ဘာသာပြန်ခြင်း**: ဘာသာစကားများစွာကို ပံ့ပိုးရန် ကူညီပါ  
- **အမှားအစီရင်ခံချက်များ**: တိကျမှုနှင့် ရှင်းလင်းမှုကို တိုးတက်စေပါ  
- **အသိုင်းအဝိုင်းစံနှုန်းများ**: ကျွန်ုပ်တို့၏ အတန်းမရွေး အသိုင်းအဝိုင်းလမ်းညွှန်ချက်များကို လိုက်နာပါ  

---

## 📄 သင်ခန်းစာအချက်အလက်  

### လိုင်စင်  
ဒီပရောဂျက်ကို MIT လိုင်စင်ဖြင့် လိုင်စင်သတ်မှတ်ထားသည် - အသေးစိတ်အချက်အလက်များကို [LICENSE](../../LICENSE) ဖိုင်တွင် ကြည့်ရှုနိုင်ပါသည်။  

### Microsoft သင်ကြားရေးအရင်းအမြစ်များနှင့် ဆက်စပ်မှု  

ကျွန်ုပ်တို့၏အဖွဲ့သည် အခြားစုံလင်သော သင်ကြားရေးသင်ခန်းစာများကို ထုတ်လုပ်ပါသည်-  

- [Model Context Protocol (MCP) For Beginners](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)  
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

## 🗺️ သင်ခန်းစာလမ်းညွှန်  

**🚀 သင်ကြားမှုကို စတင်ရန် အဆင်သင့်ဖြစ်ပါပြီလား?**  

**Beginner များ**: [အခန်း ၁: အခြေခံနှင့် အမြန်စတင်ခြင်း](../..) မှ စတင်ပါ  
**AI Developer များ**: [အခန်း ၂: AI-First Development](../..) သို့ ခုန်သွားပါ  
**အတွေ့အကြုံရှိ Developer များ**: [အခန်း ၃: Configuration & Authentication](../..) မှ စတင်ပါ  

**နောက်တစ်ဆင့်**: [အခန်း ၁ - AZD အခြေခံများကို စတင်ပါ](docs/getting-started/azd-basics.md) →  

---

**အကြောင်းကြားချက်**:  
ဤစာရွက်စာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ကို အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှုအတွက် ကြိုးစားနေသော်လည်း အလိုအလျောက် ဘာသာပြန်ခြင်းတွင် အမှားများ သို့မဟုတ် မတိကျမှုများ ပါဝင်နိုင်သည်ကို သတိပြုပါ။ မူရင်းစာရွက်စာတမ်းကို ၎င်း၏ မူရင်းဘာသာစကားဖြင့် အာဏာတရားရှိသော အရင်းအမြစ်အဖြစ် သတ်မှတ်သင့်ပါသည်။ အရေးကြီးသော အချက်အလက်များအတွက် လူက ဘာသာပြန်ခြင်းကို အကြံပြုပါသည်။ ဤဘာသာပြန်ကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော အလွဲအလွဲအချော်များ သို့မဟုတ် အနားယူမှုများအတွက် ကျွန်ုပ်တို့သည် တာဝန်မယူပါ။