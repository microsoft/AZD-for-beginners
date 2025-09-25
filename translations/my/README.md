<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "3df05e83c2307e92452bd7c3307ae849",
  "translation_date": "2025-09-25T01:34:24+00:00",
  "source_file": "README.md",
  "language_code": "my"
}
-->
# AZD သင်ခန်းစာများအတွက် အခြေခံ: တစ်ဆင့်ဆင့် သင်ယူမှု ခရီးစဉ်

![AZD-for-beginners](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.my.png) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Azure AI Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/kzRShWzttr)](https://discord.gg/kzRShWzttr)

## ဒီသင်ခန်းစာကို စတင်အသုံးပြုခြင်း

AZD သင်ယူမှု ခရီးစဉ်ကို စတင်ရန် အောက်ပါအဆင့်များကို လိုက်နာပါ။

1. **Repository ကို Fork လုပ်ပါ**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork) ကိုနှိပ်ပါ။
2. **Repository ကို Clone လုပ်ပါ**: `git clone https://github.com/microsoft/azd-for-beginners.git`
3. **Community ကို Join လုပ်ပါ**: [Azure Discord Communities](https://discord.com/invite/ByRwuEEgH4) မှာ အတတ်ပညာရှင်များ၏ အထောက်အပံ့ရယူပါ။
4. **သင်ယူမှုလမ်းကြောင်းကို ရွေးချယ်ပါ**: အတွေ့အကြုံအဆင့်နှင့် ကိုက်ညီသော အခန်းကို အောက်တွင် ရွေးချယ်ပါ။

### ဘာသာစကားများ အထောက်အပံ့

#### အလိုအလျောက် ဘာသာပြန် (အမြဲ Update ဖြစ်နေသည်)

[French](../fr/README.md) | [Spanish](../es/README.md) | [German](../de/README.md) | [Russian](../ru/README.md) | [Arabic](../ar/README.md) | [Persian (Farsi)](../fa/README.md) | [Urdu](../ur/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Japanese](../ja/README.md) | [Korean](../ko/README.md) | [Hindi](../hi/README.md) | [Bengali](../bn/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Portuguese (Brazil)](../br/README.md) | [Italian](../it/README.md) | [Polish](../pl/README.md) | [Turkish](../tr/README.md) | [Greek](../el/README.md) | [Thai](../th/README.md) | [Swedish](../sv/README.md) | [Danish](../da/README.md) | [Norwegian](../no/README.md) | [Finnish](../fi/README.md) | [Dutch](../nl/README.md) | [Hebrew](../he/README.md) | [Vietnamese](../vi/README.md) | [Indonesian](../id/README.md) | [Malay](../ms/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Swahili](../sw/README.md) | [Hungarian](../hu/README.md) | [Czech](../cs/README.md) | [Slovak](../sk/README.md) | [Romanian](../ro/README.md) | [Bulgarian](../bg/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Croatian](../hr/README.md) | [Slovenian](../sl/README.md) | [Ukrainian](../uk/README.md) | [Burmese (Myanmar)](./README.md)

## သင်ခန်းစာ အကျဉ်းချုပ်

Azure Developer CLI (azd) ကို တစ်ဆင့်ဆင့် သင်ယူနိုင်ရန် အခန်းများဖြင့် ဖွဲ့စည်းထားသည်။ **Azure AI Foundry ကို ပေါင်းစပ်ပြီး AI အပလီကေးရှင်းများကို Deploy လုပ်ခြင်းအပေါ် အထူးအာရုံစိုက်ထားသည်။**

### ဒီသင်ခန်းစာသည် ခေတ်မီ Developer များအတွက် အရေးကြီးသော အကြောင်းအရင်း

Azure AI Foundry Discord Community မှ အချက်အလက်များအရ **Developer များ၏ ၄၅% သည် AZD ကို AI workload များအတွက် အသုံးပြုလိုကြသည်**။ သို့သော် အောက်ပါအခက်အခဲများကြောင့် အခက်အခဲများရှိသည်။
- Multi-service AI architecture များ၏ ရှုပ်ထွေးမှု
- Production AI deployment အကောင်းဆုံး လုပ်ထုံးလုပ်နည်းများ  
- Azure AI service များကို ပေါင်းစပ်ခြင်းနှင့် configuration
- AI workload များအတွက် ကုန်ကျစရိတ် အထူးပြုခြင်း
- AI-specific deployment အခက်အခဲများကို ဖြေရှင်းခြင်း

### သင်ယူမှု ရည်မှန်းချက်များ

ဒီသင်ခန်းစာကို ပြီးမြောက်ပါက သင်သည် အောက်ပါအရာများကို လေ့လာနိုင်ပါမည်။
- **AZD အခြေခံကို ကျွမ်းကျင်ခြင်း**: အဓိကအကြောင်းအရာများ၊ installation နှင့် configuration
- **AI အပလီကေးရှင်းများကို Deploy လုပ်ခြင်း**: AZD ကို Azure AI Foundry services နှင့် အသုံးပြုခြင်း
- **Infrastructure as Code ကို အကောင်အထည်ဖော်ခြင်း**: Bicep templates ဖြင့် Azure resources ကို စီမံခြင်း
- **Deployments ကို Troubleshoot လုပ်ခြင်း**: အခက်အခဲများကို ဖြေရှင်းခြင်းနှင့် ပြဿနာများကို Debug လုပ်ခြင်း
- **Production အတွက် Optimize လုပ်ခြင်း**: လုံခြုံရေး၊ အရွယ်အစားချဲ့ခြင်း၊ စောင့်ကြည့်ခြင်းနှင့် ကုန်ကျစရိတ် စီမံခြင်း
- **Multi-Agent Solutions တည်ဆောက်ခြင်း**: ရှုပ်ထွေးသော AI architecture များကို Deploy လုပ်ခြင်း

## 📚 သင်ခန်းစာ အခန်းများ

*သင်၏ အတွေ့အကြုံနှင့် ရည်မှန်းချက်အပေါ် မူတည်၍ သင်ယူမှုလမ်းကြောင်းကို ရွေးချယ်ပါ*

### 🚀 အခန်း ၁: အခြေခံနှင့် အမြန်စတင်ခြင်း
**လိုအပ်ချက်များ**: Azure subscription, command line အခြေခံအသိ  
**ကြာမြင့်ချိန်**: ၃၀-၄၅ မိနစ်  
**ရှုပ်ထွေးမှုအဆင့်**: ⭐

#### သင်လေ့လာမည့်အရာများ
- Azure Developer CLI အခြေခံကို နားလည်ခြင်း
- သင်၏ platform တွင် AZD ကို install လုပ်ခြင်း
- ပထမဆုံး deployment ကို အောင်မြင်စွာ ပြုလုပ်ခြင်း

#### သင်ယူမှု အရင်းအမြစ်များ
- **🎯 ဒီနေရာမှ စတင်ပါ**: [Azure Developer CLI ဆိုတာဘာလဲ?](../..)
- **📖 သီအိုရီ**: [AZD အခြေခံ](docs/getting-started/azd-basics.md) - အဓိကအကြောင်းအရာများနှင့် အဓိပ္ပါယ်
- **⚙️ Setup**: [Installation & Setup](docs/getting-started/installation.md) - Platform-specific လမ်းညွှန်များ
- **🛠️ လက်တွေ့လုပ်ဆောင်မှု**: [သင်၏ ပထမဆုံး Project](docs/getting-started/first-project.md) - အဆင့်ဆင့် လမ်းညွှန်
- **📋 အမြန်ရယူရန်**: [Command Cheat Sheet](resources/cheat-sheet.md)

#### လက်တွေ့ လေ့ကျင့်မှုများ
```bash
# Quick installation check
azd version

# Deploy your first application
azd init --template todo-nodejs-mongo
azd up
```

**💡 အခန်းရလဒ်**: AZD ကို အသုံးပြု၍ Azure တွင် ရိုးရှင်းသော web application ကို အောင်မြင်စွာ Deploy လုပ်ပါ။

---

### 🤖 အခန်း ၂: AI-First Development (AI Developer များအတွက် အကြံပြုသည်)
**လိုအပ်ချက်များ**: အခန်း ၁ ကို ပြီးမြောက်ထားရမည်  
**ကြာမြင့်ချိန်**: ၁-၂ နာရီ  
**ရှုပ်ထွေးမှုအဆင့်**: ⭐⭐

#### သင်လေ့လာမည့်အရာများ
- AZD နှင့် Azure AI Foundry ကို ပေါင်းစပ်ခြင်း
- AI-powered application များကို Deploy လုပ်ခြင်း
- AI service configuration များကို နားလည်ခြင်း

#### သင်ယူမှု အရင်းအမြစ်များ
- **🎯 ဒီနေရာမှ စတင်ပါ**: [Azure AI Foundry Integration](docs/ai-foundry/azure-ai-foundry-integration.md)
- **📖 Patterns**: [AI Model Deployment](docs/ai-foundry/ai-model-deployment.md) - AI model များကို Deploy လုပ်ခြင်းနှင့် စီမံခြင်း
- **🛠️ Workshop**: [AI Workshop Lab](docs/ai-foundry/ai-workshop-lab.md) - သင်၏ AI solution များကို AZD-ready ဖြစ်စေရန်
- **🎥 Interactive Guide**: [Workshop Materials](workshop/README.md) - Browser-based learning နှင့် MkDocs * DevContainer Environment
- **📋 Templates**: [Azure AI Foundry Templates](../..)

#### လက်တွေ့ လေ့ကျင့်မှုများ
```bash
# Deploy your first AI application
azd init --template azure-search-openai-demo
azd up

# Try additional AI templates
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 အခန်းရလဒ်**: RAG စွမ်းရည်များပါဝင်သော AI-powered chat application ကို Deploy လုပ်ပါ။

---

### ⚙️ အခန်း ၃: Configuration & Authentication
**လိုအပ်ချက်များ**: အခန်း ၁ ကို ပြီးမြောက်ထားရမည်  
**ကြာမြင့်ချိန်**: ၄၅-၆၀ မိနစ်  
**ရှုပ်ထွေးမှုအဆင့်**: ⭐⭐

#### သင်လေ့လာမည့်အရာများ
- Environment configuration နှင့် စီမံခြင်း
- Authentication နှင့် လုံခြုံရေး အကောင်းဆုံး လုပ်ထုံးလုပ်နည်းများ
- Resource naming နှင့် စီမံခြင်း

#### သင်ယူမှု အရင်းအမြစ်များ
- **📖 Configuration**: [Configuration Guide](docs/getting-started/configuration.md) - Environment setup
- **🔐 Security**: Authentication patterns နှင့် managed identity
- **📝 Examples**: [Database App Example](../../examples/database-app) - Configuration patterns

#### လက်တွေ့ လေ့ကျင့်မှုများ
- Environment များ (dev, staging, prod) ကို configure လုပ်ပါ။
- Managed identity authentication ကို setup လုပ်ပါ။
- Environment-specific configuration များကို အကောင်အထည်ဖော်ပါ။

**💡 အခန်းရလဒ်**: Authentication နှင့် လုံခြုံရေးကို သင့်တော်စွာ စီမံနိုင်သော Environment များကို စီမံပါ။

---

### 🏗️ အခန်း ၄: Infrastructure as Code & Deployment
**လိုအပ်ချက်များ**: အခန်း ၁-၃ ကို ပြီးမြောက်ထားရမည်  
**ကြာမြင့်ချိန်**: ၁-၁.၅ နာရီ  
**ရှုပ်ထွေးမှုအဆင့်**: ⭐⭐⭐

#### သင်လေ့လာမည့်အရာများ
- Deployment patterns အဆင့်မြင့်
- Infrastructure as Code ကို Bicep ဖြင့်
- Resource provisioning strategies

#### သင်ယူမှု အရင်းအမြစ်များ
- **📖 Deployment**: [Deployment Guide](docs/deployment/deployment-guide.md) - အပြည့်အစုံ workflow များ
- **🏗️ Provisioning**: [Provisioning Resources](docs/deployment/provisioning.md) - Azure resource စီမံခြင်း
- **📝 Examples**: [Container App Example](../../examples/container-app) - Containerized deployments

#### လက်တွေ့ လေ့ကျင့်မှုများ
- Custom Bicep templates များကို ဖန်တီးပါ။
- Multi-service application များကို Deploy လုပ်ပါ။
- Blue-green deployment strategies ကို အကောင်အထည်ဖော်ပါ။

**💡 အခန်းရလဒ်**: Custom infrastructure templates များကို အသုံးပြု၍ ရှုပ်ထွေးသော multi-service application များကို Deploy လုပ်ပါ။

---

### 🎯 အခန်း ၅: Multi-Agent AI Solutions (အဆင့်မြင့်)
**လိုအပ်ချက်များ**: အခန်း ၁-၂ ကို ပြီးမြောက်ထားရမည်  
**ကြာမြင့်ချိန်**: ၂-၃ နာရီ  
**ရှုပ်ထွေးမှုအဆင့်**: ⭐⭐⭐⭐

#### သင်လေ့လာမည့်အရာများ
- Multi-agent architecture patterns
- Agent orchestration နှင့် coordination
- Production-ready AI deployments

#### သင်ယူမှု အရင်းအမြစ်များ
- **🤖 Featured Project**: [Retail Multi-Agent Solution](examples/retail-scenario.md) - အပြည့်အစုံ implementation
- **🛠️ ARM Templates**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - One-click deployment
- **📖 Architecture**: Multi-agent coordination patterns

#### လက်တွေ့ လေ့ကျင့်မှုများ
```bash
# Deploy the complete retail multi-agent solution
cd examples/retail-multiagent-arm-template
./deploy.sh

# Explore agent configurations
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 အခန်းရလဒ်**: Customer နှင့် Inventory agents ပါဝင်သော production-ready multi-agent AI solution ကို Deploy လုပ်ပါ။

---

### 🔍 အခန်း ၆: Pre-Deployment Validation & Planning
**လိုအပ်ချက်များ**: အခန်း ၄ ကို ပြီးမြောက်ထားရမည်  
**ကြာမြင့်ချိန်**: ၁ နာရီ  
**ရှုပ်ထွေးမှုအဆင့်**: ⭐⭐

#### သင်လေ့လာမည့်အရာများ
- Capacity planning နှင့် resource validation
- SKU selection strategies
- Pre-flight checks နှင့် automation

#### သင်ယူမှု အရင်းအမြစ်များ
- **📊 Planning**: [Capacity Planning](docs/pre-deployment/capacity-planning.md) - Resource validation
- **💰 Selection**: [SKU Selection](docs/pre-deployment/sku-selection.md) - ကုန်ကျစရိတ် သက်သာစေရန် ရွေးချယ်မှုများ
- **✅ Validation**: [Pre-flight Checks](docs/pre-deployment/preflight-checks.md) - Automated scripts

#### လက်တွေ့ လေ့ကျင့်မှုများ
- Capacity validation scripts များကို run လုပ်ပါ။
- SKU selection များကို ကုန်ကျစရိတ် သက်သာစေရန် optimize လုပ်ပါ။
- Automated pre-deployment checks များကို အကောင်အထည်ဖော်ပါ။

**💡 အခန်းရလဒ်**: Deployment မပြုလုပ်မီ Validate နှင့် Optimize လုပ်ပါ။

---

### 🚨 အခန်း ၇: Troubleshooting & Debugging
**လိုအပ်ချက်များ**: Deployment အခန်းတစ်ခုခုကို ပြီးမြောက်ထားရမည်  
**ကြာမြင့်ချိန်**: ၁-၁.၅ နာရီ  
**ရှုပ်ထွေးမှုအဆင့်**: ⭐⭐

#### သင်လေ့လာမည့်အရာများ
- Systematic debugging လုပ်နည်းများ
- အများဆုံးတွေ့ရသော ပြဿနာများနှင့် ဖြေရှင်းနည်းများ
- AI-specific troubleshooting

#### သင်ယူမှု အရင်းအမြစ်များ
- **🔧 Common Issues**: [Common Issues](docs/troubleshooting/common-issues.md) - FAQ နှင့် ဖြေရှင်းနည်းများ
- **🕵️ Debugging**: [Debugging Guide](docs/troubleshooting/debugging.md) - အဆင့်ဆင့် လမ်းညွှန်
- **🤖 AI Issues**: [AI-Specific Troubleshooting](docs/troubleshooting/ai-troubleshooting.md) - AI service ပြဿနာများ

#### လက်တွေ့ လေ့ကျင့်မှုများ
- Deployment failure များကို ခွဲခြားပါ။
- Authentication ပြဿနာများကို ဖြေရှင်းပါ။
- AI
- **📝 ဥပမာများ**: [Microservices Example](../../examples/microservices) - ရှုပ်ထွေးသော architecture များ
- **📊 စောင့်ကြည့်မှု**: Application Insights အထောက်အပံ့

#### လက်တွေ့လေ့ကျင့်ခန်းများ
- စီးပွားရေးလုံခြုံရေးပုံစံများကို အကောင်အထည်ဖော်ပါ
- စုံလင်သော စောင့်ကြည့်မှုကို စနစ်တကျ ပြင်ဆင်ပါ
- Governance မှန်ကန်စွာဖြင့် production သို့ deploy လုပ်ပါ

**💡 အခန်းရလဒ်**: စီးပွားရေးအဆင့် application များကို production အပြည့်အစုံဖြင့် deploy လုပ်နိုင်ရန်

---

## 🎓 Workshop အကျဉ်းချုပ်: လက်တွေ့လေ့လာမှုအတွေ့အကြုံ

### Interactive Workshop Materials
**Browser-based tools နှင့် လမ်းညွှန်လေ့ကျင့်ခန်းများဖြင့် လက်တွေ့လေ့လာမှု**

ကျွန်ုပ်တို့၏ workshop ပစ္စည်းများသည် အထက်ပါ အခန်းအလိုက် သင်ခန်းစာများကို ဖြည့်စွက်ပေးသော စနစ်တကျ၊ လက်တွေ့လေ့လာမှုအတွေ့အကြုံကို ပေးစွမ်းပါသည်။ Workshop ကို ကိုယ်တိုင်လေ့လာမှုနှင့် ဆရာ/ဆရာမ ဦးဆောင်သင်တန်းများအတွက် ဒီဇိုင်းဆွဲထားပါသည်။

#### 🛠️ Workshop Features
- **Browser-Based Interface**: MkDocs-powered workshop တစ်ခုဖြင့် search, copy, နှင့် theme အင်္ဂါရပ်များပါဝင်သည်
- **GitHub Codespaces Integration**: Development environment ကို တစ်ချက်နှိပ်ရုံဖြင့် ပြင်ဆင်နိုင်သည်
- **Structured Learning Path**: 7-အဆင့် လမ်းညွှန်လေ့ကျင့်ခန်းများ (စုစုပေါင်း 3.5 နာရီ)
- **Discovery → Deployment → Customization**: တိုးတက်မှု methodology
- **Interactive DevContainer Environment**: Tools နှင့် dependencies များကို ကြိုတင်ပြင်ဆင်ထားသည်

#### 📚 Workshop Structure
Workshop သည် **Discovery → Deployment → Customization** methodology ကို လိုက်နာသည်။

1. **Discovery Phase** (45 မိနစ်)
   - Azure AI Foundry templates နှင့် services များကို ရှာဖွေပါ
   - Multi-agent architecture patterns ကို နားလည်ပါ
   - Deployment လိုအပ်ချက်များနှင့် ကြိုတင်ပြင်ဆင်မှုများကို ပြန်လည်သုံးသပ်ပါ

2. **Deployment Phase** (2 နာရီ)
   - AZD ဖြင့် AI applications များကို လက်တွေ့ deploy လုပ်ပါ
   - Azure AI services နှင့် endpoints များကို configure လုပ်ပါ
   - လုံခြုံရေးနှင့် authentication patterns များကို အကောင်အထည်ဖော်ပါ

3. **Customization Phase** (45 မိနစ်)
   - အထူးလိုအပ်ချက်များအတွက် applications များကို ပြင်ဆင်ပါ
   - Production deployment အတွက် optimize လုပ်ပါ
   - စောင့်ကြည့်မှုနှင့် ကုန်ကျစရိတ်စီမံခန့်ခွဲမှုကို အကောင်အထည်ဖော်ပါ

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
Workshop ကို ပြီးမြောက်ပါက ပါဝင်သူများသည်:
- **Production AI Applications ကို Deploy လုပ်နိုင်မည်**: AZD နှင့် Azure AI Foundry services ကို အသုံးပြုပါ
- **Multi-Agent Architectures ကို ကျွမ်းကျင်မည်**: AI agent များကို ပေါင်းစပ်ပြီး အကောင်အထည်ဖော်ပါ
- **Security Best Practices ကို အကောင်အထည်ဖော်မည်**: Authentication နှင့် access control ကို configure လုပ်ပါ
- **Scale အတွက် Optimize လုပ်မည်**: ကုန်ကျစရိတ်သက်သာပြီး အကျိုးရှိသော deployments ကို ဒီဇိုင်းဆွဲပါ
- **Deployments ကို Troubleshoot လုပ်နိုင်မည်**: အများဆုံးဖြစ်နိုင်သော ပြဿနာများကို ကိုယ်တိုင် ဖြေရှင်းပါ

#### 📖 Workshop Resources
- **🎥 Interactive Guide**: [Workshop Materials](workshop/README.md) - Browser-based learning environment
- **📋 Step-by-Step Instructions**: [Guided Exercises](../../workshop/docs/instructions) - အသေးစိတ်လမ်းညွှန်ချက်များ
- **🛠️ AI Workshop Lab**: [AI Workshop Lab](docs/ai-foundry/ai-workshop-lab.md) - AI အထူးပြုလေ့ကျင့်ခန်းများ
- **💡 Quick Start**: [Workshop Setup Guide](workshop/README.md#quick-start) - Environment configuration

**သင့်တော်သောအဖွဲ့များ**: စီးပွားရေးသင်တန်းများ၊ တက္ကသိုလ်သင်တန်းများ၊ ကိုယ်တိုင်လေ့လာမှုများနှင့် developer bootcamps

---

## 📖 Azure Developer CLI ဆိုတာဘာလဲ?

Azure Developer CLI (azd) သည် application များကို Azure သို့ တိုးတက်မြန်ဆန်စွာ တည်ဆောက်ခြင်းနှင့် deploy လုပ်ခြင်းအတွက် developer-centric command-line interface တစ်ခုဖြစ်သည်။ ၎င်းသည် အောက်ပါအင်္ဂါရပ်များကို ပေးစွမ်းသည်။

- **Template-based deployments** - အများဆုံးအသုံးပြုသော application patterns များအတွက် ကြိုတင်ပြင်ဆင်ထားသော templates များကို အသုံးပြုပါ
- **Infrastructure as Code** - Bicep သို့မဟုတ် Terraform ကို အသုံးပြု၍ Azure resources များကို စီမံခန့်ခွဲပါ  
- **Integrated workflows** - Applications များကို provision, deploy, နှင့် monitor လုပ်ခြင်းကို seamless အဖြစ်ဆောင်ရွက်ပါ
- **Developer-friendly** - Developer များအတွက် productivity နှင့် အတွေ့အကြုံကို အထူးပြုထားသည်

### **AZD + Azure AI Foundry: AI Deployments အတွက် အကောင်းဆုံး**

**AZD ကို AI Solutions အတွက် ဘာကြောင့် အသုံးပြုသင့်သလဲ?** AZD သည် AI developer များရင်ဆိုင်နေရသော အဓိကအခက်အခဲများကို ဖြေရှင်းပေးသည်။

- **AI-Ready Templates** - Azure OpenAI, Cognitive Services, နှင့် ML workloads များအတွက် ကြိုတင်ပြင်ဆင်ထားသော templates
- **Secure AI Deployments** - AI services, API keys, နှင့် model endpoints များအတွက် built-in security patterns  
- **Production AI Patterns** - Scalable, cost-effective AI application deployments အတွက် အကောင်းဆုံးအလေ့အထများ
- **End-to-End AI Workflows** - Model development မှ production deployment အထိ monitoring မှန်ကန်စွာဖြင့်
- **Cost Optimization** - AI workloads အတွက် resource allocation နှင့် scaling strategies များကို smart အဖြစ်ဆောင်ရွက်ပါ
- **Azure AI Foundry Integration** - AI Foundry model catalog နှင့် endpoints များကို seamless အဖြစ်ချိတ်ဆက်ပါ

---

## 🎯 Templates & Examples Library

### Featured: Azure AI Foundry Templates
**AI applications များကို deploy လုပ်ရန် ဒီနေရာမှ စတင်ပါ!**

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
**Production-ready application templates များကို သင်ခန်းစာအလိုက် mapping လုပ်ထားသည်**

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
- [**Azure-Samples AZD Templates**](https://github.com/Azure-Samples/azd-templates) - Microsoft မှ တရားဝင်နမူနာများ
- [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) - Community-contributed templates
- [**Examples Directory**](examples/README.md) - အသေးစိတ်ရှင်းလင်းချက်များပါဝင်သော နမူနာများ

---

## 📚 Learning Resources & References

### Quick References
- [**Command Cheat Sheet**](resources/cheat-sheet.md) - အခန်းအလိုက် စီစဉ်ထားသော အရေးကြီး azd commands
- [**Glossary**](resources/glossary.md) - Azure နှင့် azd အဘိဓာန်  
- [**FAQ**](resources/faq.md) - အခန်းအလိုက် စီစဉ်ထားသော အများဆုံးမေးခွန်းများ
- [**Study Guide**](resources/study-guide.md) - လေ့ကျင့်ခန်းများပါဝင်သော comprehensive guide

### Hands-On Workshops
- [**AI Workshop Lab**](docs/ai-foundry/ai-workshop-lab.md) - AZD-deployable AI solutions ကို ပြုလုပ်ပါ (2-3 နာရီ)
- [**Interactive Workshop Guide**](workshop/README.md) - MkDocs နှင့် DevContainer Environment ပါဝင်သော browser-based workshop
- [**Structured Learning Path**](../../workshop/docs/instructions) - Discovery → Deployment → Customization အဆင့် 7-လမ်းညွှန်လေ့ကျင့်ခန်းများ
- [**AZD For Beginners Workshop**](workshop/README.md) - GitHub Codespaces integration ပါဝင်သော လက်တွေ့ workshop ပစ္စည်းများ

### External Learning Resources
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

---

## 🎓 Course Completion & Certification

### Progress Tracking
သင်ခန်းစာအလိုက် သင်ယူမှုတိုးတက်မှုကို စစ်ဆေးပါ:

- [ ] **Chapter 1**: Foundation & Quick Start ✅
- [ ] **Chapter 2**: AI-First Development ✅  
- [ ] **Chapter 3**: Configuration & Authentication ✅
- [ ] **Chapter 4**: Infrastructure as Code & Deployment ✅
- [ ] **Chapter 5**: Multi-Agent AI Solutions ✅
- [ ] **Chapter 6**: Pre-Deployment Validation & Planning ✅
- [ ] **Chapter 7**: Troubleshooting & Debugging ✅
- [ ] **Chapter 8**: Production & Enterprise Patterns ✅

### Learning Verification
အခန်းတစ်ခုစီကို ပြီးမြောက်ပြီးနောက် သင်၏အသိပညာကို စစ်ဆေးပါ:
1. **Practical Exercise**: အခန်း၏ လက်တွေ့ deployment ကို ပြီးမြောက်ပါ
2. **Knowledge Check**: သင်၏အခန်းအတွက် FAQ အပိုင်းကို ပြန်လည်သုံးသပ်ပါ
3. **Community Discussion**: Azure Discord တွင် သင်၏အတွေ့အကြုံကို မျှဝေပါ
4. **Next Chapter**: ရှုပ်ထွေးမှုအဆင့်သို့ ရွှေ့ပါ

### Course Completion Benefits
အခန်းအားလုံးကို ပြီးမြောက်ပါက သင်သည်:
- **Production Experience**: Azure သို့ AI applications အမှန်တကယ် deploy လုပ်နိုင်မည်
- **Professional Skills**: စီးပွားရေးအဆင့် deployment ကျွမ်းကျင်မှု  
- **Community Recognition**: Azure developer community ၏ အကျိုးရှိသောအဖွဲ့ဝင်
- **Career Advancement**: AZD နှင့် AI deployment ကျွမ်းကျင်မှုအတွက် အလုပ်အကိုင်အခွင့်အလမ်းများ

---

## 🤝 Community & Support

### Get Help & Support
- **Technical Issues**: [Report bugs and request features](https://github.com/microsoft/azd-for-beginners/issues)
- **Learning Questions**: [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure)
- **AI-Specific Help**: AZD + AI Foundry ဆွေးနွေးမှုများအတွက် [#Azure channel](https://discord.gg/microsoft-azure) ကို join လုပ်ပါ
- **Documentation**: [Official Azure Developer CLI documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Community Insights from Azure AI Foundry Discord

**#Azure Channel မှ မဲပေးရလဒ်များ:**
- **45%** developer များသည် AZD ကို AI workloads အတွက် အသုံးပြုလိုသည်
- **Top challenges**: Multi-service deployments, credential management, production readiness  
- **Most requested**: AI-specific templates, troubleshooting guides, best practices

**ကျွန်ုပ်တို့၏ community ကို join လုပ်ပါ:**
- AZD + AI အတွေ့အကြုံများကို မျှဝေပြီး အကူအညီရယူပါ
- AI templates အသစ်များ၏ early previews ကို access လုပ်ပါ
- AI deployment best practices များကို ပံ့ပိုးပါ
- အနာဂတ် AI + AZD အင်္ဂါရပ်ဖွံ့ဖြိုးမှုကို အကျိုးသက်ရောက်မှုရှိစွာ ဆောင်ရွက်ပါ

### Contributing to the Course
ကျွန်ုပ်တို့သည် အထောက်အကူပြုမှုများကို ကြိုဆိုပါသည်! [Contributing Guide](CONTRIBUTING.md) ကို ဖတ်ရှု၍ အောက်ပါအကြောင်းအရာများအတွက် အသေးစိတ်ကို သိရှိပါ:
- **Content Improvements**: ရှိပြီးသား အခန်းများနှင့် ဥပမာများကို တိုးတက်အောင် ပြုလုပ်ပါ
- **New Examples**: အမှန်တကယ် scenario များနှင့် templates များကို ထည့်သွင်းပါ  
- **Translation**: Multi-language support ကို ထိန်းသိမ်းရန် အကူအညီပေးပါ
- **Bug Reports**: တိကျမှုနှင့် ရှင်းလင်းမှုကို တိုးတက်အောင် ပြုလုပ်ပါ
- **Community Standards**: ကျွန်ုပ်တို့၏ အကျိုးရှိသော community guidelines ကို လိုက်နာပါ
### Microsoft Learning အရင်းအမြစ်များနှင့် ဆက်စပ်သော အချက်အလက်များ

ကျွန်ုပ်တို့၏အဖွဲ့သည် အခြေခံသင်တန်းများကို အကျွမ်းတဝင် ဖန်တီးပေးပါသည်-

- [Model Context Protocol (MCP) အခြေခံသင်တန်း](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
- [AI Agents အခြေခံသင်တန်း](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [Generative AI အခြေခံသင်တန်း (.NET အသုံးပြုခြင်း)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
- [Generative AI အခြေခံသင်တန်း](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
- [Generative AI အခြေခံသင်တန်း (Java အသုံးပြုခြင်း)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
- [ML အခြေခံသင်တန်း](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
- [Data Science အခြေခံသင်တန်း](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
- [AI အခြေခံသင်တန်း](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
- [Cybersecurity အခြေခံသင်တန်း](https://github.com/microsoft/Security-101??WT.mc_id=academic-96948-sayoung)
- [Web Development အခြေခံသင်တန်း](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
- [IoT အခြေခံသင်တန်း](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
- [XR Development အခြေခံသင်တန်း](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)
- [GitHub Copilot ကို AI Paired Programming အတွက် ကျွမ်းကျင်စွာ အသုံးပြုခြင်း](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
- [GitHub Copilot ကို C#/.NET Developer များအတွက် ကျွမ်းကျင်စွာ အသုံးပြုခြင်း](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
- [Choose Your Own Copilot Adventure](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)

---

## 🗺️ သင်တန်း လမ်းညွှန်

**🚀 သင်ယူရန် အဆင်သင့်ဖြစ်ပါပြီလား?**

**အခြေခံသင်ယူသူများ**: [အခန်း ၁: အခြေခံနှင့် အမြန်စတင်ခြင်း](../..) မှ စတင်ပါ  
**AI Developer များ**: [အခန်း ၂: AI-First Development](../..) သို့ တိုက်ရိုက်သွားပါ  
**အတွေ့အကြုံရှိ Developer များ**: [အခန်း ၃: Configuration & Authentication](../..) မှ စတင်ပါ

**နောက်တစ်ဆင့်**: [အခန်း ၁ - AZD အခြေခံများ စတင်ပါ](docs/getting-started/azd-basics.md) →

---

