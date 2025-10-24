<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "a47510110edbcc33ad1ab7e8d234f7c3",
  "translation_date": "2025-10-24T09:48:38+00:00",
  "source_file": "README.md",
  "language_code": "my"
}
-->
# AZD အတွက် စတင်သူများ: သင်ကြားမှု ခရီးစဉ်ကို စနစ်တကျ လေ့လာခြင်း

![AZD-for-beginners](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.my.png) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Azure AI Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/kzRShWzttr)](https://discord.gg/kzRShWzttr)

## ဒီသင်ခန်းစာကို စတင်အသုံးပြုခြင်း

AZD သင်ကြားမှု ခရီးစဉ်ကို စတင်ရန် အောက်ပါအဆင့်များကို လိုက်နာပါ-

1. **Repository ကို Fork လုပ်ပါ**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork) ကိုနှိပ်ပါ
2. **Repository ကို Clone လုပ်ပါ**: `git clone https://github.com/microsoft/azd-for-beginners.git`
3. **Community ကို ဝင်ပါ**: [Azure Discord Communities](https://discord.com/invite/ByRwuEEgH4) မှာ အတတ်ပညာရှင်များ၏ အထောက်အပံ့ရယူပါ
4. **သင့်ရဲ့ သင်ကြားမှုလမ်းကြောင်းကို ရွေးချယ်ပါ**: အောက်ပါ အခန်းများထဲမှ သင့်အတွေ့အကြုံအဆင့်နှင့် ကိုက်ညီသော အခန်းကို ရွေးချယ်ပါ

### ဘာသာစကားများ အထောက်အပံ့

#### အလိုအလျောက် ဘာသာပြန် (အမြဲနောက်ဆုံးပေါ်)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](./README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../br/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## သင်ခန်းစာ အကျဉ်းချုပ်

Azure Developer CLI (azd) ကို အဆင့်လိုက် သင်ကြားမှု အခန်းများမှတဆင့် ကျွမ်းကျင်ပါ။ **Azure AI Foundry ကို ပေါင်းစပ်ပြီး AI အပလီကေးရှင်းများကို Deploy လုပ်ခြင်းအပေါ် အထူးအာရုံစိုက်ထားပါသည်။**

### ဒီသင်ခန်းစာသည် ခေတ်သစ် Developer များအတွက် အရေးကြီးသော အကြောင်းအရင်း

Azure AI Foundry Discord Community မှ အမြင်အာရုံအရ **Developer များ၏ ၄၅% သည် AZD ကို AI workload များအတွက် အသုံးပြုလိုကြသည်** သို့သော် အောက်ပါအခက်အခဲများကြုံတွေ့ရသည်-
- AI အဆောက်အအုံများ၏ အဆင့်ဆင့်ဝန်ဆောင်မှုများ
- Production AI deployment အကောင်းဆုံး လုပ်ထုံးလုပ်နည်းများ  
- Azure AI ဝန်ဆောင်မှုများကို ပေါင်းစပ်ခြင်းနှင့် စီမံခန့်ခွဲခြင်း
- AI workload များအတွက် ကုန်ကျစရိတ် အကောင်းဆုံးဖြေရှင်းနည်း
- AI-specific deployment အခက်အခဲများကို ဖြေရှင်းခြင်း

### သင်ကြားမှုရည်မှန်းချက်များ

ဒီသင်ခန်းစာကို ပြီးမြောက်စွာ လေ့လာပြီးပါက သင်သည်-
- **AZD အခြေခံများကို ကျွမ်းကျင်ပါ**: အဓိကအကြောင်းအရာများ၊ Installation နှင့် Configuration
- **AI အပလီကေးရှင်းများကို Deploy လုပ်ပါ**: AZD ကို Azure AI Foundry ဝန်ဆောင်မှုများနှင့် အသုံးပြုခြင်း
- **Infrastructure as Code ကို အကောင်အထည်ဖော်ပါ**: Bicep template များဖြင့် Azure အရင်းအမြစ်များကို စီမံခန့်ခွဲခြင်း
- **Deployments များကို Troubleshoot လုပ်ပါ**: အခက်အခဲများကို ဖြေရှင်းခြင်းနှင့် ပြဿနာများကို Debug လုပ်ခြင်း
- **Production အတွက် Optimize လုပ်ပါ**: လုံခြုံရေး၊ အရွယ်အစားချိန်ညှိခြင်း၊ စောင့်ကြည့်ခြင်းနှင့် ကုန်ကျစရိတ် စီမံခန့်ခွဲခြင်း
- **Multi-Agent Solutions တည်ဆောက်ပါ**: အဆင့်မြင့် AI အဆောက်အအုံများကို Deploy လုပ်ခြင်း

## 📚 သင်ကြားမှု အခန်းများ

*သင့်ရဲ့ အတွေ့အကြုံအဆင့်နှင့် ရည်မှန်းချက်များအပေါ် မူတည်ပြီး သင့်ရဲ့ သင်ကြားမှုလမ်းကြောင်းကို ရွေးချယ်ပါ*

### 🚀 အခန်း ၁: အခြေခံနှင့် အမြန်စတင်ခြင်း
**လိုအပ်ချက်များ**: Azure subscription, command line အခြေခံအသိ  
**ကြာမြင့်ချိန်**: ၃၀-၄၅ မိနစ်  
**အဆင့်**: ⭐

#### သင်လေ့လာမည့်အရာများ
- Azure Developer CLI အခြေခံများကို နားလည်ခြင်း
- သင့် Platform တွင် AZD ကို Install လုပ်ခြင်း
- ပထမဆုံး Deployment အောင်မြင်မှု

#### သင်ကြားမှု အရင်းအမြစ်များ
- **🎯 ဒီနေရာမှ စတင်ပါ**: [Azure Developer CLI ဆိုတာဘာလဲ?](../..)
- **📖 သီအိုရီ**: [AZD အခြေခံများ](docs/getting-started/azd-basics.md) - အဓိကအကြောင်းအရာများနှင့် အဓိပ္ပါယ်
- **⚙️ Setup**: [Installation & Setup](docs/getting-started/installation.md) - Platform-specific လမ်းညွှန်ချက်များ
- **🛠️ လက်တွေ့လုပ်ငန်းများ**: [သင့်ရဲ့ ပထမဆုံး Project](docs/getting-started/first-project.md) - အဆင့်လိုက် လမ်းညွှန်ချက်
- **📋 အမြန်ကိုးကားချက်**: [Command Cheat Sheet](resources/cheat-sheet.md)

#### လက်တွေ့လေ့ကျင့်မှုများ
```bash
# Quick installation check
azd version

# Deploy your first application
azd init --template todo-nodejs-mongo
azd up
```

**💡 အခန်းရလဒ်**: AZD ကို အသုံးပြု၍ Azure တွင် ရိုးရှင်းသော web application တစ်ခုကို အောင်မြင်စွာ Deploy လုပ်ပါ

---

### 🤖 အခန်း ၂: AI-First Development (AI Developer များအတွက် အကြံပြုသည်)
**လိုအပ်ချက်များ**: အခန်း ၁ ပြီးမြောက်ထားရမည်  
**ကြာမြင့်ချိန်**: ၁-၂ နာရီ  
**အဆင့်**: ⭐⭐

#### သင်လေ့လာမည့်အရာများ
- AZD နှင့် Azure AI Foundry ပေါင်းစပ်ခြင်း
- AI-powered application များကို Deploy လုပ်ခြင်း
- AI ဝန်ဆောင်မှု Configuration များကို နားလည်ခြင်း

#### သင်ကြားမှု အရင်းအမြစ်များ
- **🎯 ဒီနေရာမှ စတင်ပါ**: [Azure AI Foundry Integration](docs/ai-foundry/azure-ai-foundry-integration.md)
- **📖 Patterns**: [AI Model Deployment](docs/ai-foundry/ai-model-deployment.md) - AI model များကို Deploy နှင့် စီမံခန့်ခွဲခြင်း
- **🛠️ Workshop**: [AI Workshop Lab](docs/ai-foundry/ai-workshop-lab.md) - သင့်ရဲ့ AI ဖြေရှင်းချက်များကို AZD-ready ဖြစ်အောင် ပြင်ဆင်ခြင်း
- **🎥 Interactive Guide**: [Workshop Materials](workshop/README.md) - MkDocs * DevContainer Environment ဖြင့် Browser-based သင်ကြားမှု
- **📋 Templates**: [Azure AI Foundry Templates](../..)

#### လက်တွေ့လေ့ကျင့်မှုများ
```bash
# Deploy your first AI application
azd init --template azure-search-openai-demo
azd up

# Try additional AI templates
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 အခန်းရလဒ်**: RAG စွမ်းရည်များပါဝင်သော AI-powered chat application တစ်ခုကို Deploy နှင့် Configure လုပ်ပါ

---

### ⚙️ အခန်း ၃: Configuration & Authentication
**လိုအပ်ချက်များ**: အခန်း ၁ ပြီးမြောက်ထားရမည်  
**ကြာမြင့်ချိန်**: ၄၅-၆၀ မိနစ်  
**အဆင့်**: ⭐⭐

#### သင်လေ့လာမည့်အရာများ
- Environment Configuration နှင့် စီမံခန့်ခွဲခြင်း
- Authentication နှင့် လုံခြုံရေး အကောင်းဆုံးလုပ်နည်းများ
- Resource Naming နှင့် Organization

#### သင်ကြားမှု အရင်းအမြစ်များ
- **📖 Configuration**: [Configuration Guide](docs/getting-started/configuration.md) - Environment setup
- **🔐 Security**: Authentication patterns နှင့် Managed Identity
- **📝 ဥပမာများ**: [Database App Example](../../examples/database-app) - Configuration patterns

#### လက်တွေ့လေ့ကျင့်မှုများ
- Environment များစီ (dev, staging, prod) ကို Configure လုပ်ပါ
- Managed Identity Authentication ကို Set up လုပ်ပါ
- Environment-specific Configuration များကို အကောင်အထည်ဖော်ပါ

**💡 အခန်းရလဒ်**: လုံခြုံရေးနှင့် Authentication ကို သေချာစီမံခန့်ခွဲထားသော Environment များစီကို စီမံပါ

---

### 🏗️ အခန်း ၄: Infrastructure as Code & Deployment
**လိုအပ်ချက်များ**: အခန်း ၁-၃ ပြီးမြောက်ထားရမည်  
**ကြာမြင့်ချိန်**: ၁-၁.၅ နာရီ  
**အဆင့်**: ⭐⭐⭐

#### သင်လေ့လာမည့်အရာများ
- Deployment Patterns အဆင့်မြင့်
- Infrastructure as Code ကို Bicep ဖြင့်
- Resource Provisioning Strategies

#### သင်ကြားမှု အရင်းအမြစ်များ
- **📖 Deployment**: [Deployment Guide](docs/deployment/deployment-guide.md) - လုပ်ငန်းစဉ်များ
- **🏗️ Provisioning**: [Provisioning Resources](docs/deployment/provisioning.md) - Azure Resource Management
- **📝 ဥပမာများ**: [Container App Example](../../examples/container-app) - Containerized Deployments

#### လက်တွေ့လေ့ကျင့်မှုများ
- Custom Bicep Template များကို ဖန်တီးပါ
- Multi-service Application များကို Deploy လုပ်ပါ
- Blue-Green Deployment Strategies ကို အကောင်အထည်ဖော်ပါ

**💡 အခန်းရလဒ်**: Custom Infrastructure Template များကို အသုံးပြု၍ Multi-service Application များကို Deploy လုပ်ပါ

---

### 🎯 အခန်း ၅: Multi-Agent AI Solutions (Advanced)
**လိုအပ်ချက်များ**: အခန်း ၁-၂ ပြီးမြောက်ထားရမည်  
**ကြာမြင့်ချိန်**: ၂-၃ နာရီ  
**အဆင့်**: ⭐⭐⭐⭐

#### သင်လေ့လာမည့်အရာများ
- Multi-agent Architecture Patterns
- Agent Orchestration နှင့် Coordination
- Production-ready AI Deployments

#### သင်ကြားမှု အရင်းအမြစ်များ
- **🤖 Featured Project**: [Retail Multi-Agent Solution](examples/retail-scenario.md) - အပြည့်အစုံ အကောင်အထည်ဖော်မှု
- **🛠️ ARM Templates**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - One-click Deployment
- **📖 Architecture**: Multi-agent Coordination Patterns

#### လက်တွေ့လေ့ကျင့်မှုများ
```bash
# Deploy the complete retail multi-agent solution
cd examples/retail-multiagent-arm-template
./deploy.sh

# Explore agent configurations
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 အခန်းရလဒ်**: Customer နှင့် Inventory Agents ပါဝင်သော Production-ready Multi-agent AI Solution တစ်ခုကို Deploy နှင့် စီမံပါ

---

### 🔍 အခန်း ၆: Pre-Deployment Validation & Planning
**လိုအပ်ချက်များ**: အခန်း ၄ ပြီးမြောက်ထားရမည်  
**ကြာမြင့်ချိန်**: ၁ နာရီ  
**အဆင့်**: ⭐⭐

#### သင်လေ့လာမည့်အရာများ
- Capacity Planning နှင့် Resource Validation
- SKU Selection Strategies
- Pre-flight Checks နှင့် Automation

#### သင်ကြားမှု အရင်းအမြစ်များ
- **📊 Planning**: [Capacity Planning](docs/pre-deployment/capacity-planning.md) - Resource Validation
- **💰 Selection**: [SKU Selection](docs/pre-deployment/sku-selection.md) - ကုန်ကျစရိတ် အကောင်းဆုံးရွေးချယ်မှု
- **✅ Validation**: [Pre-flight Checks](docs/pre-deployment/preflight-checks.md) - Automated Scripts

#### လက်တွေ့လေ့ကျင့်မှုများ
- Capacity Validation Scripts ကို Run လုပ်ပါ
- SKU Selection များကို ကုန်ကျစရိတ်အတွက် Optimize လုပ်ပါ
- Automated Pre-deployment Checks ကို အကောင်အထည်ဖော်ပါ

**💡 အခန်းရလဒ်**: Deployment မတိုင်မီ Validate နှင့် Optimize လုပ်ပါ

---

### 🚨 အခန်း ၇: Troubleshooting & Debugging
**လိုအပ်ချက်များ**: Deployment အခန်းတစ်ခုခု ပြီးမြောက်ထားရမည်  
**ကြာမြင့်ချိန်**: ၁-၁.၅ နာရီ  
**အဆင့်**: ⭐⭐

#### သင်လေ့လာမည့်အရာများ
- Debugging လုပ်ငန်းစဉ်များကို စနစ်တကျ လုပ်ဆောင်ခြင်း
- အများဆုံး ကြုံတွေ့ရသော ပြဿနာများနှင့် ဖြေရှင်းနည်းများ
- AI-specific Troubleshooting


**အဆင့်အတန်း**: ⭐⭐⭐⭐

#### သင်လေ့လာနိုင်မည့်အရာများ
- ထုတ်လုပ်မှု deployment များအတွက် မဟာဗျူဟာများ
- စီးပွားရေးလုံခြုံရေး ပုံစံများ
- စောင့်ကြည့်မှုနှင့် ကုန်ကျစရိတ် အကောင်းဆုံးဖြေရှင်းနည်းများ

#### သင်ကြားရေးအရင်းအမြစ်များ
- **🏭 ထုတ်လုပ်မှု**: [Production AI Best Practices](docs/ai-foundry/production-ai-practices.md) - စီးပွားရေးပုံစံများ
- **📝 ဥပမာများ**: [Microservices Example](../../examples/microservices) - ရှုပ်ထွေးသော architecture များ
- **📊 စောင့်ကြည့်မှု**: Application Insights integration

#### လက်တွေ့လေ့ကျင့်မှုများ
- စီးပွားရေးလုံခြုံရေးပုံစံများကို အကောင်အထည်ဖော်ပါ
- အပြည့်အစုံသော စောင့်ကြည့်မှုကို စတင်ပါ
- အုပ်ချုပ်မှုမှန်ကန်စွာဖြင့် ထုတ်လုပ်မှုအဆင့်သို့ deployment ပြုလုပ်ပါ

**💡 အခန်းရလဒ်**: စီးပွားရေးအဆင့် အသင့်ဖြစ်သော application များကို ထုတ်လုပ်မှုစွမ်းရည်အပြည့်အစုံဖြင့် deploy ပြုလုပ်နိုင်ရန်

---

## 🎓 Workshop အကျဉ်းချုပ်: လက်တွေ့လေ့လာမှုအတွေ့အကြုံ

### Interactive Workshop Materials
**Browser-based tools နှင့် လမ်းညွှန်လေ့ကျင့်မှုများဖြင့် လက်တွေ့လေ့လာမှု**

ကျွန်ုပ်တို့၏ workshop materials သည် အထက်ပါ အခန်းအလိုက် သင်ကြားရေးအစီအစဉ်ကို ဖြည့်စွက်ပေးသော စနစ်တကျ၊ interactive လေ့လာမှုအတွေ့အကြုံကို ပေးစွမ်းသည်။ Workshop သည် ကိုယ်တိုင်လေ့လာမှုနှင့် ဆရာ/ဆရာမ ဦးဆောင်သင်ကြားမှုများအတွက် အထူးသင့်လျော်သည်။

#### 🛠️ Workshop Features
- **Browser-Based Interface**: MkDocs-powered workshop ကို search, copy, နှင့် theme features ဖြင့် ပြီးစီးပါ
- **GitHub Codespaces Integration**: Development environment ကို တစ်ချက်နှိပ်ရုံဖြင့် စတင်နိုင်ပါသည်
- **Structured Learning Path**: 7-အဆင့် guided exercises (စုစုပေါင်း 3.5 နာရီ)
- **Discovery → Deployment → Customization**: တိုးတက်မှု methodology
- **Interactive DevContainer Environment**: Tools နှင့် dependencies များကို ကြိုတင်ပြင်ဆင်ထားသည်

#### 📚 Workshop Structure
Workshop သည် **Discovery → Deployment → Customization** methodology ကို လိုက်နာသည်။

1. **Discovery Phase** (45 မိနစ်)
   - Azure AI Foundry templates နှင့် services များကို ရှာဖွေပါ
   - Multi-agent architecture ပုံစံများကို နားလည်ပါ
   - Deployment လိုအပ်ချက်များနှင့် ကြိုတင်ပြင်ဆင်မှုများကို ပြန်လည်သုံးသပ်ပါ

2. **Deployment Phase** (2 နာရီ)
   - AZD ဖြင့် AI application များကို လက်တွေ့ deploy ပြုလုပ်ပါ
   - Azure AI services နှင့် endpoints များကို configure ပြုလုပ်ပါ
   - လုံခြုံရေးနှင့် authentication ပုံစံများကို အကောင်အထည်ဖော်ပါ

3. **Customization Phase** (45 မိနစ်)
   - အသုံးပြုမှုအတွက် application များကို ပြင်ဆင်ပါ
   - ထုတ်လုပ်မှု deployment အတွက် အကောင်းဆုံးဖြေရှင်းနည်းများကို optimize ပြုလုပ်ပါ
   - စောင့်ကြည့်မှုနှင့် ကုန်ကျစရိတ် စီမံခန့်ခွဲမှုကို အကောင်အထည်ဖော်ပါ

#### 🚀 Workshop ကို စတင်ပါ
```bash
# Option 1: GitHub Codespaces (Recommended)
# Click "Code" → "Create codespace on main" in the repository

# Option 2: Local Development
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Follow the setup instructions in workshop/README.md
```

#### 🎯 Workshop Learning Outcomes
Workshop ကို ပြီးမြောက်ပါက ပါဝင်သူများသည်-
- **Production AI Applications ကို Deploy ပြုလုပ်နိုင်မည်**: AZD နှင့် Azure AI Foundry services ကို အသုံးပြုပါ
- **Multi-Agent Architectures ကို ကျွမ်းကျင်မည်**: AI agent များကို ပေါင်းစပ်ပြီး အကောင်အထည်ဖော်ပါ
- **Security Best Practices ကို အကောင်အထည်ဖော်မည်**: Authentication နှင့် access control ကို configure ပြုလုပ်ပါ
- **Scale အတွက် Optimize ပြုလုပ်မည်**: ကုန်ကျစရိတ်သက်သာပြီး စွမ်းဆောင်ရည်မြင့်သော deployment များကို ဒီဇိုင်းဆွဲပါ
- **Deployments ကို Troubleshoot ပြုလုပ်မည်**: အများဆုံးဖြစ်နိုင်သော ပြဿနာများကို ကိုယ်တိုင်ဖြေရှင်းပါ

#### 📖 Workshop Resources
- **🎥 Interactive Guide**: [Workshop Materials](workshop/README.md) - Browser-based learning environment
- **📋 Step-by-Step Instructions**: [Guided Exercises](../../workshop/docs/instructions) - အသေးစိတ်လမ်းညွှန်မှုများ
- **🛠️ AI Workshop Lab**: [AI Workshop Lab](docs/ai-foundry/ai-workshop-lab.md) - AI-focused လေ့ကျင့်မှုများ
- **💡 Quick Start**: [Workshop Setup Guide](workshop/README.md#quick-start) - Environment configuration

**သင့်လျော်သောအဖွဲ့များ**: ကုမ္ပဏီသင်တန်းများ၊ တက္ကသိုလ်သင်တန်းများ၊ ကိုယ်တိုင်လေ့လာမှုများနှင့် developer bootcamps

---

## 📖 Azure Developer CLI ဆိုတာဘာလဲ?

Azure Developer CLI (azd) သည် application များကို Azure သို့ တိုးတက်မြန်ဆန်စွာ တည်ဆောက်ခြင်းနှင့် deploy ပြုလုပ်ခြင်းအတွက် developer-centric command-line interface တစ်ခုဖြစ်သည်။ ၎င်းသည်-

- **Template-based deployments** - အများဆုံးအသုံးပြုသော application ပုံစံများအတွက် ကြိုတင်ပြင်ဆင်ထားသော templates များကို အသုံးပြုပါ
- **Infrastructure as Code** - Azure resources များကို Bicep သို့မဟုတ် Terraform ဖြင့် စီမံခန့်ခွဲပါ  
- **Integrated workflows** - Application များကို provision, deploy, နှင့် monitor ပြုလုပ်ခြင်းကို seamless အဖြစ်ပြုလုပ်ပါ
- **Developer-friendly** - Developer များအတွက် productivity နှင့် အတွေ့အကြုံကို အကောင်းဆုံးဖြေရှင်းပါ

### **AZD + Azure AI Foundry: AI Deployment များအတွက် အကောင်းဆုံး**

**AI Solutions အတွက် AZD ကို ဘာကြောင့်ရွေးချယ်သင့်သလဲ?** AZD သည် AI developer များရင်ဆိုင်နေရသော အဓိကအခက်အခဲများကို ဖြေရှင်းပေးသည်-

- **AI-Ready Templates** - Azure OpenAI, Cognitive Services, နှင့် ML workloads များအတွက် ကြိုတင်ပြင်ဆင်ထားသော templates များ
- **Secure AI Deployments** - AI services, API keys, နှင့် model endpoints များအတွက် built-in security patterns
- **Production AI Patterns** - Scalable, cost-effective AI application deployment များအတွက် အကောင်းဆုံးဖြေရှင်းနည်းများ
- **End-to-End AI Workflows** - Model development မှ production deployment အထိ monitoring မှန်ကန်စွာဖြင့်
- **Cost Optimization** - AI workloads များအတွက် resource allocation နှင့် scaling strategy များ
- **Azure AI Foundry Integration** - AI Foundry model catalog နှင့် endpoints များသို့ seamless connection

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
- [**Official AZD Template Gallery**](https://azure.github.io/awesome-azd/) - Curated collection of official and community templates
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn template documentation
- [**Examples Directory**](examples/README.md) - Local learning examples with detailed explanations

---

## 📚 Learning Resources & References

### Quick References
- [**Command Cheat Sheet**](resources/cheat-sheet.md) - အရေးကြီးသော azd command များကို အခန်းအလိုက် စီစဉ်ထားသည်
- [**Glossary**](resources/glossary.md) - Azure နှင့် azd အကြောင်းအရာများ
- [**FAQ**](resources/faq.md) - အခန်းအလိုက် အများဆုံးမေးလေ့ရှိသောမေးခွန်းများ
- [**Study Guide**](resources/study-guide.md) - လေ့ကျင့်မှုများအပြည့်အစုံ

### Hands-On Workshops
- [**AI Workshop Lab**](docs/ai-foundry/ai-workshop-lab.md) - AZD-deployable AI solutions များကို ပြုလုပ်ပါ (2-3 နာရီ)
- [**Interactive Workshop Guide**](workshop/README.md) - MkDocs နှင့် DevContainer Environment ဖြင့် Browser-based workshop
- [**Structured Learning Path**](../../workshop/docs/instructions) - Discovery → Deployment → Customization အဆင့် 7-အဆင့် guided exercises
- [**AZD For Beginners Workshop**](workshop/README.md) - GitHub Codespaces integration ဖြင့် လက်တွေ့ workshop materials

### External Learning Resources
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

---

## 🎓 သင်တန်းပြီးမြောက်မှုနှင့် လက်မှတ်

### Progress Tracking
သင်တန်းအခန်းတစ်ခုချင်းစီတွင် သင်၏လေ့လာမှုတိုးတက်မှုကို စစ်ဆေးပါ-

- [ ] **Chapter 1**: Foundation & Quick Start ✅
- [ ] **Chapter 2**: AI-First Development ✅  
- [ ] **Chapter 3**: Configuration & Authentication ✅
- [ ] **Chapter 4**: Infrastructure as Code & Deployment ✅
- [ ] **Chapter 5**: Multi-Agent AI Solutions ✅
- [ ] **Chapter 6**: Pre-Deployment Validation & Planning ✅
- [ ] **Chapter 7**: Troubleshooting & Debugging ✅
- [ ] **Chapter 8**: Production & Enterprise Patterns ✅

### Learning Verification
အခန်းတစ်ခုချင်းစီပြီးမြောက်ပြီးနောက် သင်၏အသိပညာကို စစ်ဆေးပါ-
1. **Practical Exercise**: အခန်း၏ လက်တွေ့ deployment ကို ပြုလုပ်ပါ
2. **Knowledge Check**: FAQ အပိုင်းကို ပြန်လည်သုံးသပ်ပါ
3. **Community Discussion**: Azure Discord တွင် သင်၏အတွေ့အကြုံကို မျှဝေပါ
4. **Next Chapter**: အဆင့်အတန်းမြင့်မားသောအခန်းသို့ ရွှေ့ပါ

### သင်တန်းပြီးမြောက်မှုအကျိုးကျေးဇူးများ
အခန်းအားလုံးကို ပြီးမြောက်ပါက သင်သည်-
- **Production Experience**: Azure သို့ AI application များကို deploy ပြုလုပ်နိုင်မည်
- **Professional Skills**: စီးပွားရေးအဆင့် deployment စွမ်းရည်များ
- **Community Recognition**: Azure developer community ၏ အကျိုးကျေးဇူးများ
- **Career Advancement**: AZD နှင့် AI deployment ကျွမ်းကျင်မှုများ

---

## 🤝 Community & Support

### အကူအညီနှင့် Support ရယူရန်
- **Technical Issues**: [Report bugs and request features](https://github.com/microsoft/azd-for-beginners/issues)
- **Learning Questions**: [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure)
- **AI-Specific Help**: AZD + AI Foundry ဆွေးနွေးမှုများအတွက် [#Azure channel](https://discord.gg/microsoft-azure) ကို join ပြုလုပ်ပါ
- **Documentation**: [Official Azure Developer CLI documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Azure AI Foundry Discord မှ Community Insights

**#Azure Channel မှ မဲပေးမှုရလဒ်များ**:
- **45%** အတွက် developer များသည် AI workloads အတွက် AZD ကို အသုံးပြုလိုကြသည်
- **အဓိကအခက်အခဲများ**: Multi-service deployments, credential management, production readiness  
- **အများဆုံးတောင်းဆိုမှုများ**: AI-specific templates, troubleshooting guides, best practices

**ကျွန်ုပ်တို့၏ community ကို join ပြုလုပ်ပါ**:
- AZD + AI အတွေ့အကြုံများကို မျှဝေပြီး အကူအညီရယူပါ
- AI templates အသစ်များ၏ early previews ကို access ပြုလုပ်ပါ
- AI deployment best practices များကို ပံ့ပိုးပါ
- အနာဂတ် AI + AZD feature development ကို အကျိုးသက်ရောက်မှုရှိစွာ ဆွေးနွေးပါ

### သင်တန်းအတွက် ပံ့ပိုးမှု
ကျွန်ုပ်တို့သည် အထောက်အကူပြုမှုများကို ကြိုဆိုပါသည်! [Contributing Guide](CONTRIBUTING.md) ကို ဖ
- **နမူနာအသစ်များ**: အမှန်တကယ်ဖြစ်ရပ်များနှင့် template များထည့်သွင်းပါ  
- **ဘာသာပြန်ခြင်း**: ဘာသာစုံပံ့ပိုးမှုကို ထိန်းသိမ်းရန်အကူအညီပေးပါ  
- **အမှားအစီရင်ခံချက်များ**: တိကျမှုနှင့်ရှင်းလင်းမှုကိုတိုးတက်စေပါ  
- **အသိုင်းအဝိုင်းစံနှုန်းများ**: ကျွန်ုပ်တို့၏ပါဝင်မှုရှိသောအသိုင်းအဝိုင်းလမ်းညွှန်ချက်များကိုလိုက်နာပါ  

---

## 📄 သင်ခန်းစာအချက်အလက်

### လိုင်စင်
ဒီပရောဂျက်ကို MIT လိုင်စင်အောက်မှာလိုင်စင်ပေးထားပါတယ် - အသေးစိတ်အချက်အလက်များအတွက် [LICENSE](../../LICENSE) ဖိုင်ကိုကြည့်ပါ။

### Microsoft သင်ကြားရေးအရင်းအမြစ်များနှင့်ဆက်စပ်မှု

ကျွန်ုပ်တို့၏အဖွဲ့သည် အခြားသောအကျယ်အဝန်းရှိသောသင်ကြားရေးသင်ခန်းစာများကိုထုတ်လုပ်ပါသည်။

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### Azure / Edge / MCP / Agents
[![AZD for Beginners](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI for Beginners](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP for Beginners](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Agents for Beginners](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Generative AI Series
[![Generative AI for Beginners](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generative AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generative AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generative AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Core Learning
[![ML for Beginners](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science for Beginners](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI for Beginners](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersecurity for Beginners](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web Dev for Beginners](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT for Beginners](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR Development for Beginners](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot Series
[![Copilot for AI Paired Programming](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot for C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ သင်ခန်းစာလမ်းညွှန်

**🚀 သင်ကြားမှုစတင်ရန်အဆင်သင့်ဖြစ်ပါပြီ**

**Beginner များ**: [အခန်း ၁: အခြေခံနှင့် အမြန်စတင်ခြင်း](../..) မှစတင်ပါ  
**AI Developer များ**: [အခန်း ၂: AI-First Development](../..) သို့ခုန်ပါ  
**အတွေ့အကြုံရှိ Developer များ**: [အခန်း ၃: Configuration & Authentication](../..) မှစတင်ပါ  

**နောက်တစ်ဆင့်**: [အခန်း ၁ - AZD အခြေခံများစတင်ပါ](docs/getting-started/azd-basics.md) →

---

**အကြောင်းကြားချက်**:  
ဤစာရွက်စာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ကို အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှုအတွက် ကြိုးစားနေသော်လည်း အလိုအလျောက် ဘာသာပြန်မှုများတွင် အမှားများ သို့မဟုတ် မမှန်ကန်မှုများ ပါဝင်နိုင်သည်ကို သတိပြုပါ။ မူရင်းဘာသာစကားဖြင့် ရေးသားထားသော စာရွက်စာတမ်းကို အာဏာတရားရှိသော အရင်းအမြစ်အဖြစ် သတ်မှတ်သင့်ပါသည်။ အရေးကြီးသော အချက်အလက်များအတွက် လူက ဘာသာပြန်မှုကို အသုံးပြုရန် အကြံပြုပါသည်။ ဤဘာသာပြန်မှုကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော အလွဲအမှားများ သို့မဟုတ် အနားယူမှုများအတွက် ကျွန်ုပ်တို့သည် တာဝန်မယူပါ။