<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "be5fd7bf2b02d878efdb442580d98d96",
  "translation_date": "2025-10-16T16:16:33+00:00",
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

AZD လေ့လာရေးခရီးကို စတင်ရန် အောက်ပါအဆင့်များကို လိုက်နာပါ-

1. **Repository ကို Fork လုပ်ပါ**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork) ကိုနှိပ်ပါ။
2. **Repository ကို Clone လုပ်ပါ**: `git clone https://github.com/microsoft/azd-for-beginners.git`
3. **Community ကို Join လုပ်ပါ**: [Azure Discord Communities](https://discord.com/invite/ByRwuEEgH4) မှာ အတတ်ပညာရှင်များ၏ အထောက်အပံ့ရယူပါ။
4. **သင့်ရဲ့ လေ့လာရေးလမ်းကြောင်းကို ရွေးချယ်ပါ**: အောက်ပါ အခန်းများထဲမှ သင့်အတွေ့အကြုံအဆင့်နှင့် ကိုက်ညီသော အခန်းကို ရွေးချယ်ပါ။

### ဘာသာစကားများအတွက် အထောက်အပံ့

#### အလိုအလျောက် ဘာသာပြန်ခြင်း (အမြဲနောက်ဆုံးပေါ်)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](./README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../br/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## သင်ခန်းစာအကျဉ်းချုပ်

Azure Developer CLI (azd) ကို တစ်ဆင့်ဆင့်လေ့လာရေးအခန်းများမှတစ်ဆင့် ကျွမ်းကျင်စွာ လေ့လာပါ။ **Azure AI Foundry ကို ပေါင်းစပ်ပြီး AI အက်ပလီကေးရှင်းများကို Deploy လုပ်ခြင်းအပေါ် အထူးအာရုံစိုက်ထားသည်။**

### အခေတ်သစ် Developer များအတွက် ဒီသင်ခန်းစာက အရေးကြီးတဲ့အကြောင်း

Azure AI Foundry Discord Community မှ အမြင်အာရုံအရ **Developer 45% က AZD ကို AI workload များအတွက် အသုံးပြုချင်ကြောင်း** ပြောကြပြီး အောက်ပါအခက်အခဲများကြုံတွေ့ရသည်-
- AI ဝန်ဆောင်မှုများစွာပါဝင်သော architecture များ၏ ရှုပ်ထွေးမှု
- Production AI deployment အကောင်းဆုံးလက်တွေ့ကျကျနည်းလမ်းများ
- Azure AI ဝန်ဆောင်မှုများကို ပေါင်းစပ်ခြင်းနှင့် configuration
- AI workload များအတွက် ကုန်ကျစရိတ်ကို အကောင်းဆုံးဖြေရှင်းခြင်း
- AI-specific deployment အခက်အခဲများကို ဖြေရှင်းခြင်း

### သင်ခန်းစာရည်မှန်းချက်များ

ဒီသင်ခန်းစာကို ပြီးမြောက်စွာ လေ့လာပြီးပါက သင်သည်-
- **AZD အခြေခံများကို ကျွမ်းကျင်စွာ သိရှိမည်**: အဓိကအကြောင်းအရာများ၊ installation နှင့် configuration
- **AI အက်ပလီကေးရှင်းများကို Deploy လုပ်ခြင်း**: AZD ကို Azure AI Foundry ဝန်ဆောင်မှုများနှင့် အသုံးပြုခြင်း
- **Infrastructure as Code ကို အကောင်းဆုံးအသုံးပြုခြင်း**: Bicep template များဖြင့် Azure resources ကို စီမံခြင်း
- **Deployments ကို Troubleshoot လုပ်ခြင်း**: အခက်အခဲများကို ဖြေရှင်းခြင်းနှင့် ပြဿနာများကို Debug လုပ်ခြင်း
- **Production အတွက် Optimize လုပ်ခြင်း**: လုံခြုံရေး၊ အရွယ်အစားချဲ့ခြင်း၊ စောင့်ကြည့်ခြင်းနှင့် ကုန်ကျစရိတ်စီမံခြင်း
- **Multi-Agent Solutions တည်ဆောက်ခြင်း**: ရှုပ်ထွေးသော AI architecture များကို Deploy လုပ်ခြင်း

## 📚 သင်ခန်းစာအခန်းများ

*သင့်ရဲ့ အတွေ့အကြုံအဆင့်နှင့် ရည်မှန်းချက်များအပေါ် မူတည်ပြီး သင့်လမ်းကြောင်းကို ရွေးချယ်ပါ*

### 🚀 အခန်း ၁: အခြေခံနှင့် အမြန်စတင်ခြင်း
**လိုအပ်ချက်များ**: Azure subscription, command line အခြေခံအသိ  
**ကြာမြင့်ချိန်**: ၃၀-၄၅ မိနစ်  
**ရှုပ်ထွေးမှုအဆင့်**: ⭐

#### သင်လေ့လာမည့်အရာများ
- Azure Developer CLI အခြေခံများကို နားလည်ခြင်း
- သင့် platform တွင် AZD ကို install လုပ်ခြင်း
- သင့်ရဲ့ ပထမဆုံး deployment ကို အောင်မြင်စွာ ပြုလုပ်ခြင်း

#### သင်ခန်းစာအရင်းအမြစ်များ
- **🎯 ဒီနေရာမှ စတင်ပါ**: [What is Azure Developer CLI?](../..)
- **📖 သီအိုရီ**: [AZD Basics](docs/getting-started/azd-basics.md) - အဓိကအကြောင်းအရာများနှင့် အဓိပ္ပါယ်
- **⚙️ Setup**: [Installation & Setup](docs/getting-started/installation.md) - Platform-specific လမ်းညွှန်များ
- **🛠️ လက်တွေ့လုပ်ဆောင်မှု**: [Your First Project](docs/getting-started/first-project.md) - အဆင့်ဆင့်လမ်းညွှန်
- **📋 အမြန်ရည်ညွှန်းစာရင်း**: [Command Cheat Sheet](resources/cheat-sheet.md)

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

### 🤖 အခန်း ၂: AI-First Development (AI Developer များအတွက် အကြံပြု)
**လိုအပ်ချက်များ**: အခန်း ၁ ကို ပြီးမြောက်ထားရမည်  
**ကြာမြင့်ချိန်**: ၁-၂ နာရီ  
**ရှုပ်ထွေးမှုအဆင့်**: ⭐⭐

#### သင်လေ့လာမည့်အရာများ
- AZD နှင့် Azure AI Foundry ကို ပေါင်းစပ်ခြင်း
- AI-powered application များကို deploy လုပ်ခြင်း
- AI service configuration များကို နားလည်ခြင်း

#### သင်ခန်းစာအရင်းအမြစ်များ
- **🎯 ဒီနေရာမှ စတင်ပါ**: [Azure AI Foundry Integration](docs/ai-foundry/azure-ai-foundry-integration.md)
- **📖 Patterns**: [AI Model Deployment](docs/ai-foundry/ai-model-deployment.md) - AI model များကို deploy လုပ်ခြင်းနှင့် စီမံခြင်း
- **🛠️ Workshop**: [AI Workshop Lab](docs/ai-foundry/ai-workshop-lab.md) - သင့်ရဲ့ AI solution များကို AZD-ready ဖြစ်အောင် ပြုလုပ်ပါ။
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

**💡 အခန်းရလဒ်**: RAG စွမ်းရည်များပါဝင်သော AI-powered chat application ကို deploy လုပ်ပြီး configure လုပ်ပါ။

---

### ⚙️ အခန်း ၃: Configuration & Authentication
**လိုအပ်ချက်များ**: အခန်း ၁ ကို ပြီးမြောက်ထားရမည်  
**ကြာမြင့်ချိန်**: ၄၅-၆၀ မိနစ်  
**ရှုပ်ထွေးမှုအဆင့်**: ⭐⭐

#### သင်လေ့လာမည့်အရာများ
- Environment configuration နှင့် စီမံခြင်း
- Authentication နှင့် လုံခြုံရေးအကောင်းဆုံးနည်းလမ်းများ
- Resource naming နှင့် စီမံခြင်း

#### သင်ခန်းစာအရင်းအမြစ်များ
- **📖 Configuration**: [Configuration Guide](docs/getting-started/configuration.md) - Environment setup
- **🔐 Security**: Authentication patterns နှင့် managed identity
- **📝 Examples**: [Database App Example](../../examples/database-app) - Configuration patterns

#### လက်တွေ့လေ့ကျင့်မှုများ
- Environment များစွာကို configure လုပ်ပါ (dev, staging, prod)
- Managed identity authentication ကို setup လုပ်ပါ
- Environment-specific configuration များကို implement လုပ်ပါ

**💡 အခန်းရလဒ်**: လုံခြုံရေးနှင့် authentication အဆင့်မြင့်ဖြစ်သော environment များစွာကို စီမံပါ။

---

### 🏗️ အခန်း ၄: Infrastructure as Code & Deployment
**လိုအပ်ချက်များ**: အခန်း ၁-၃ ကို ပြီးမြောက်ထားရမည်  
**ကြာမြင့်ချိန်**: ၁-၁.၅ နာရီ  
**ရှုပ်ထွေးမှုအဆင့်**: ⭐⭐⭐

#### သင်လေ့လာမည့်အရာများ
- Deployment pattern များ၏ အဆင့်မြင့်နည်းလမ်းများ
- Infrastructure as Code ကို Bicep ဖြင့် အသုံးပြုခြင်း
- Resource provisioning strategy များ

#### သင်ခန်းစာအရင်းအမြစ်များ
- **📖 Deployment**: [Deployment Guide](docs/deployment/deployment-guide.md) - အပြည့်အစုံ workflow များ
- **🏗️ Provisioning**: [Provisioning Resources](docs/deployment/provisioning.md) - Azure resource စီမံခြင်း
- **📝 Examples**: [Container App Example](../../examples/container-app) - Containerized deployment များ

#### လက်တွေ့လေ့ကျင့်မှုများ
- Custom Bicep template များကို ဖန်တီးပါ
- Multi-service application များကို deploy လုပ်ပါ
- Blue-green deployment strategy များကို implement လုပ်ပါ

**💡 အခန်းရလဒ်**: Custom infrastructure template များကို အသုံးပြု၍ ရှုပ်ထွေးသော multi-service application များကို deploy လုပ်ပါ။

---

### 🎯 အခန်း ၅: Multi-Agent AI Solutions (အဆင့်မြင့်)
**လိုအပ်ချက်များ**: အခန်း ၁-၂ ကို ပြီးမြောက်ထားရမည်  
**ကြာမြင့်ချိန်**: ၂-၃ နာရီ  
**ရှုပ်ထွေးမှုအဆင့်**: ⭐⭐⭐⭐

#### သင်လေ့လာမည့်အရာများ
- Multi-agent architecture pattern များ
- Agent orchestration နှင့် coordination
- Production-ready AI deployment များ

#### သင်ခန်းစာအရင်းအမြစ်များ
- **🤖 Featured Project**: [Retail Multi-Agent Solution](examples/retail-scenario.md) - အပြည့်အစုံ implementation
- **🛠️ ARM Templates**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - One-click deployment
- **📖 Architecture**: Multi-agent coordination pattern များ

#### လက်တွေ့လေ့ကျင့်မှုများ
```bash
# Deploy the complete retail multi-agent solution
cd examples/retail-multiagent-arm-template
./deploy.sh

# Explore agent configurations
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 အခန်းရလဒ်**: Customer နှင့် Inventory agent များပါဝင်သော production-ready multi-agent AI solution ကို deploy လုပ်ပြီး စီမံပါ။

---

### 🔍 အခန်း ၆: Pre-Deployment Validation & Planning
**လိုအပ်ချက်များ**: အခန်း ၄ ကို ပြီးမြောက်ထားရမည်  
**ကြာမြင့်ချိန်**: ၁ နာရီ  
**ရှုပ်ထွေးမှုအဆင့်**: ⭐⭐

#### သင်လေ့လာမည့်အရာများ
- Capacity planning နှင့် resource validation
- SKU selection strategy များ
- Pre-flight check များနှင့် automation

#### သင်ခန်းစာအရင်းအမြစ်များ
- **📊 Planning**: [Capacity Planning](docs/pre-deployment/capacity-planning.md) - Resource validation
- **💰 Selection**: [SKU Selection](docs/pre-deployment/sku-selection.md) - ကုန်ကျစရိတ်သက်သာသော ရွေးချယ်မှုများ
- **✅ Validation**: [Pre-flight Checks](docs/pre-deployment/preflight-checks.md) - Automated script များ

#### လက်တွေ့လေ့ကျင့်မှုများ
- Capacity validation script များကို run လုပ်ပါ
- SKU selection များကို ကုန်ကျစရိတ်သက်သာအောင် optimize လုပ်ပါ
- Automated pre-deployment check များကို implement လုပ်ပါ

**💡 အခန်းရလဒ်**: Deployment မပြုလုပ်မီ validate လုပ်ပြီး optimize လုပ်ပါ။

---

### 🚨 အခန်း ၇: Troubleshooting & Debugging
**လိုအပ်ချက်များ**: Deployment အခန်းတစ်ခုခုကို ပြီးမြောက်ထားရမည်  
**ကြာမြင့်ချိန်**: ၁-၁.၅ နာရီ  
**ရှုပ်ထွေးမှုအဆင့်**: ⭐⭐

#### သင်လေ့လာမည့်အရာများ
- Systematic debugging နည်းလမ်းများ
- အများဆုံးဖြစ်သော ပြဿနာများနှင့် ဖြေရှင်းနည်းများ
- AI-specific troubleshooting

#### သ
**ရှုပ်ထွေးမှု**: ⭐⭐⭐⭐

#### သင်လေ့လာနိုင်မည့်အရာများ
- ထုတ်လုပ်မှု deployment များအတွက် မဟာဗျူဟာများ
- အဖွဲ့အစည်းအဆင့်လုံခြုံရေးပုံစံများ
- စောင့်ကြည့်မှုနှင့်ကုန်ကျစရိတ်အကောင်းဆုံးဖြစ်စေရေး

#### သင်ကြားရေးအရင်းအမြစ်များ
- **🏭 ထုတ်လုပ်မှု**: [Production AI Best Practices](docs/ai-foundry/production-ai-practices.md) - အဖွဲ့အစည်းပုံစံများ
- **📝 ဥပမာများ**: [Microservices Example](../../examples/microservices) - ရှုပ်ထွေးသော architecture များ
- **📊 စောင့်ကြည့်မှု**: Application Insights integration

#### လက်တွေ့လေ့ကျင့်မှုများ
- အဖွဲ့အစည်းလုံခြုံရေးပုံစံများကို အကောင်အထည်ဖော်ပါ
- စုံလင်သောစောင့်ကြည့်မှုကို စတင်တည်ဆောက်ပါ
- governance မှန်ကန်စွာဖြင့် ထုတ်လုပ်မှုအဆင့်သို့ deployment ပြုလုပ်ပါ

**💡 အခန်းရလဒ်**: ထုတ်လုပ်မှုစွမ်းရည်အပြည့်အစုံဖြင့် အဖွဲ့အစည်းအသင့် applications များကို deploy ပြုလုပ်ပါ

---

## 🎓 Workshop အကျဉ်းချုပ်: လက်တွေ့လေ့လာမှုအတွေ့အကြုံ

### Interactive Workshop Materials
**Browser-based tools နှင့် လမ်းညွှန် exercises များဖြင့် စုံလင်သော လက်တွေ့လေ့လာမှု**

ကျွန်ုပ်တို့၏ workshop materials များသည် အထက်ပါ အခန်းအခြေခံ curriculum ကို ဖြည့်စွမ်းရန် အဆင့်လိုက်၊ interactive လေ့လာမှုအတွေ့အကြုံကို ပေးစွမ်းသည်။ Workshop သည် ကိုယ်တိုင်လေ့လာမှုနှင့် ဆရာ/ဆရာမ ဦးဆောင်သင်တန်းများအတွက် အထူးသင့်လျော်သည်။

#### 🛠️ Workshop Features
- **Browser-Based Interface**: MkDocs-powered workshop ကို search, copy, နှင့် theme features များဖြင့် ပြီးစီးပါ
- **GitHub Codespaces Integration**: Development environment ကို တစ်ချက်နှိပ်ခြင်းဖြင့် စတင်ပါ
- **Structured Learning Path**: 7-အဆင့် လမ်းညွှန် exercises (စုစုပေါင်း 3.5 နာရီ)
- **Discovery → Deployment → Customization**: တိုးတက်မှု methodology
- **Interactive DevContainer Environment**: အကြိုတပ်ဆင်ထားသော tools နှင့် dependencies

#### 📚 Workshop Structure
Workshop သည် **Discovery → Deployment → Customization** methodology ကို လိုက်နာသည်။

1. **Discovery Phase** (45 မိနစ်)
   - Azure AI Foundry templates နှင့် services များကို ရှာဖွေပါ
   - Multi-agent architecture patterns ကို နားလည်ပါ
   - Deployment လိုအပ်ချက်များနှင့် ကြိုတင်လိုအပ်ချက်များကို ပြန်လည်သုံးသပ်ပါ

2. **Deployment Phase** (2 နာရီ)
   - AZD ဖြင့် AI applications များကို လက်တွေ့ deployment ပြုလုပ်ပါ
   - Azure AI services နှင့် endpoints များကို configure ပြုလုပ်ပါ
   - လုံခြုံရေးနှင့် authentication patterns များကို အကောင်အထည်ဖော်ပါ

3. **Customization Phase** (45 မိနစ်)
   - သတ်မှတ်ထားသော အသုံးပြုမှုများအတွက် applications များကို ပြင်ဆင်ပါ
   - ထုတ်လုပ်မှု deployment အတွက် အကောင်းဆုံးဖြစ်စေရေး optimize ပြုလုပ်ပါ
   - စောင့်ကြည့်မှုနှင့်ကုန်ကျစရိတ်စီမံခန့်ခွဲမှုကို အကောင်အထည်ဖော်ပါ

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
Workshop ကို ပြီးမြောက်ခြင်းဖြင့် ပါဝင်သူများသည်:
- **Production AI Applications ကို Deploy ပြုလုပ်နိုင်မည်**: AZD နှင့် Azure AI Foundry services ကို အသုံးပြုပါ
- **Multi-Agent Architectures ကို ကျွမ်းကျင်မည်**: AI agent များကို စည်းလုံးညှိနှိုင်းပြီး အကောင်အထည်ဖော်ပါ
- **Security Best Practices ကို အကောင်အထည်ဖော်မည်**: Authentication နှင့် access control ကို configure ပြုလုပ်ပါ
- **Scale အတွက် Optimize ပြုလုပ်မည်**: ကုန်ကျစရိတ်သက်သာပြီး စွမ်းဆောင်ရည်မြင့်မားသော deployment များကို ဒီဇိုင်းဆွဲပါ
- **Deployments များကို Troubleshoot ပြုလုပ်မည်**: အများဆုံးတွေ့ရသော ပြဿနာများကို ကိုယ်တိုင်ဖြေရှင်းပါ

#### 📖 Workshop Resources
- **🎥 Interactive Guide**: [Workshop Materials](workshop/README.md) - Browser-based learning environment
- **📋 Step-by-Step Instructions**: [Guided Exercises](../../workshop/docs/instructions) - အသေးစိတ်လမ်းညွှန်
- **🛠️ AI Workshop Lab**: [AI Workshop Lab](docs/ai-foundry/ai-workshop-lab.md) - AI-focused exercises
- **💡 Quick Start**: [Workshop Setup Guide](workshop/README.md#quick-start) - Environment configuration

**သင့်လျော်သောအဖွဲ့များ**: Corporate training, တက္ကသိုလ်သင်တန်းများ, ကိုယ်တိုင်လေ့လာမှုများနှင့် developer bootcamps

---

## 📖 Azure Developer CLI ဆိုတာဘာလဲ?

Azure Developer CLI (azd) သည် Azure တွင် applications များကို တည်ဆောက်ခြင်းနှင့် deploy ပြုလုပ်ခြင်းလုပ်ငန်းစဉ်ကို အရှိန်မြှင့်ပေးသော developer-centric command-line interface တစ်ခုဖြစ်သည်။ ၎င်းသည် အောက်ပါအကျိုးကျေးဇူးများကို ပေးစွမ်းသည်-

- **Template-based deployments** - အများဆုံးတွေ့ရသော application patterns များအတွက် pre-built templates များကို အသုံးပြုပါ
- **Infrastructure as Code** - Bicep သို့မဟုတ် Terraform ကို အသုံးပြု၍ Azure resources များကို စီမံပါ  
- **Integrated workflows** - Applications များကို provision, deploy, နှင့် monitor ပြုလုပ်ခြင်းကို အဆင်ပြေစွာလုပ်ဆောင်ပါ
- **Developer-friendly** - Developer များ၏ productivity နှင့် အတွေ့အကြုံအတွက် အကောင်းဆုံးဖြစ်စေရန် optimize ပြုလုပ်ထားသည်

### **AZD + Azure AI Foundry: AI Deployments အတွက် အကောင်းဆုံး**

**AI Solutions အတွက် AZD ကို ဘာကြောင့်ရွေးချယ်သင့်သလဲ?** AZD သည် AI developers များရင်ဆိုင်နေရသော အဓိကပြဿနာများကို ဖြေရှင်းပေးသည်-

- **AI-Ready Templates** - Azure OpenAI, Cognitive Services, နှင့် ML workloads များအတွက် pre-configured templates
- **Secure AI Deployments** - AI services, API keys, နှင့် model endpoints များအတွက် built-in security patterns  
- **Production AI Patterns** - Scalable, cost-effective AI application deployments အတွက် အကောင်းဆုံးဖြစ်စေရေး
- **End-to-End AI Workflows** - Model development မှ production deployment အထိ monitoring မှန်ကန်စွာဖြင့်
- **Cost Optimization** - AI workloads များအတွက် resource allocation နှင့် scaling strategies
- **Azure AI Foundry Integration** - AI Foundry model catalog နှင့် endpoints များနှင့် seamless connection

---

## 🎯 Templates & Examples Library

### Featured: Azure AI Foundry Templates
**AI applications များကို deploy ပြုလုပ်ရန် ဒီနေရာမှ စတင်ပါ!**

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
**Production-ready application templates များကို learning chapters များနှင့် mapping ပြုလုပ်ထားသည်**

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
- [**Command Cheat Sheet**](resources/cheat-sheet.md) - Essential azd commands organized by chapter
- [**Glossary**](resources/glossary.md) - Azure and azd terminology  
- [**FAQ**](resources/faq.md) - Common questions organized by learning chapter
- [**Study Guide**](resources/study-guide.md) - Comprehensive practice exercises

### Hands-On Workshops
- [**AI Workshop Lab**](docs/ai-foundry/ai-workshop-lab.md) - Make your AI solutions AZD-deployable (2-3 hours)
- [**Interactive Workshop Guide**](workshop/README.md) - Browser-based workshop with MkDocs and DevContainer Environment
- [**Structured Learning Path**](../../workshop/docs/instructions) -7-step guided exercises (Discovery → Deployment → Customization)
- [**AZD For Beginners Workshop**](workshop/README.md) - Complete hands-on workshop materials with GitHub Codespaces integration

### External Learning Resources
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

---

## 🎓 Course Completion & Certification

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
အခန်းတစ်ခုချင်းစီကို ပြီးမြောက်ပြီးနောက် သင်၏အသိပညာကို စစ်ဆေးပါ:
1. **Practical Exercise**: အခန်း၏ လက်တွေ့ deployment ကို ပြီးမြောက်ပါ
2. **Knowledge Check**: သင်၏အခန်းအတွက် FAQ အပိုင်းကို ပြန်လည်သုံးသပ်ပါ
3. **Community Discussion**: Azure Discord တွင် သင်၏အတွေ့အကြုံကို မျှဝေပါ
4. **Next Chapter**: ရှုပ်ထွေးမှုအဆင့်သို့ ရောက်ရှိပါ

### Course Completion Benefits
အခန်းအားလုံးကို ပြီးမြောက်ပြီးနောက် သင်သည်:
- **Production Experience**: Azure တွင် အမှန်တကယ် AI applications များကို deploy ပြုလုပ်ထားသည်
- **Professional Skills**: အဖွဲ့အစည်းအသင့် deployment စွမ်းရည်များ  
- **Community Recognition**: Azure developer community ၏ အကျိုးတူဝင်ရောက်မှု
- **Career Advancement**: AZD နှင့် AI deployment ကျွမ်းကျင်မှုအတွက် အလုပ်အကိုင်အခွင့်အလမ်းများ

---

## 🤝 Community & Support

### Get Help & Support
- **Technical Issues**: [Report bugs and request features](https://github.com/microsoft/azd-for-beginners/issues)
- **Learning Questions**: [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure)
- **AI-Specific Help**: AZD + AI Foundry ဆွေးနွေးမှုများအတွက် [#Azure channel](https://discord.gg/microsoft-azure) ကို join ပြုလုပ်ပါ
- **Documentation**: [Official Azure Developer CLI documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Community Insights from Azure AI Foundry Discord

**#Azure Channel မှ နောက်ဆုံး Poll ရလဒ်များ**:
- **45%** အတွက် developer များသည် AI workloads အတွက် AZD ကို အသုံးပြုလိုသည်
- **Top challenges**: Multi-service deployments, credential management, production readiness  
- **Most requested**: AI-specific templates, troubleshooting guides, best practices

**ကျွန်ုပ်တို့၏ community ကို join ပြုလုပ်ပါ**:
- သင်၏ AZD + AI အတွေ့အကြုံများကို မျှဝေပြီး အကူအညီရယူပါ
- AI templates အသစ်များ၏ early previews ကို access ပြုလုပ်ပါ
- AI deployment best practices များကို အထောက်အကူပြုပါ
- အနာဂတ် AI + AZD feature development ကို အကျိုးတူဝင်ရောက်ပါ

### Contributing to the Course
ကျွန်ုပ်တို့သည် အထောက်အကူပြုမှုများကို ကြိုဆိုပါသည်! [Contributing Guide](CONTRIBUTING.md) ကို ဖတ်ရှုပြီး အောက်ပါအချက်များအတွက် အသေးစိတ်ကို သိရှိပါ:
- **Content Improvements**: ရှိပြီးသား အခန်းများနှင့် ဥပမာများကို တိုးတက်အောင် ပြုလုပ်ပါ
- **အသစ်သော ဥပမာများ**: အမှန်တကယ်ဖြစ်ပျက်နေသော အခြေအနေများနှင့် template များ ထည့်သွင်းပါ  
- **ဘာသာပြန်ခြင်း**: ဘာသာစကားများစွာကို ထိန်းသိမ်းရန် အကူအညီပေးပါ  
- **အမှားအစီရင်ခံစာများ**: တိကျမှုနှင့် ရှင်းလင်းမှုကို တိုးတက်စေပါ  
- **အသိုင်းအဝိုင်း စံသတ်မှတ်ချက်များ**: ကျွန်ုပ်တို့၏ အတန်းမတူညီသော အသိုင်းအဝိုင်း လမ်းညွှန်ချက်များကို လိုက်နာပါ  

---

## 📄 သင်ခန်းစာ အချက်အလက်

### လိုင်စင်
ဤပရောဂျက်သည် MIT License အောက်တွင် လိုင်စင်ရရှိထားသည် - အသေးစိတ်အချက်အလက်များအတွက် [LICENSE](../../LICENSE) ဖိုင်ကို ကြည့်ပါ။

### Microsoft သင်ကြားရေး အရင်းအမြစ်များနှင့် ဆက်စပ်မှု

ကျွန်ုပ်တို့၏အဖွဲ့သည် အခြားသော အကျယ်အဝန်းရှိသော သင်ကြားရေး သင်ခန်းစာများကို ထုတ်လုပ်ပါသည်-

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

## 🗺️ သင်ခန်းစာ လမ်းညွှန်

**🚀 သင်ကြားမှုကို စတင်ရန် အသင့်ဖြစ်ပါပြီလား?**

**Beginner များ**: [အခန်း ၁: အခြေခံ & အမြန်စတင်ခြင်း](../..) မှ စတင်ပါ  
**AI Developer များ**: [အခန်း ၂: AI-First Development](../..) သို့ ခုန်သွားပါ  
**အတွေ့အကြုံရှိ Developer များ**: [အခန်း ၃: Configuration & Authentication](../..) မှ စတင်ပါ  

**နောက်တစ်ဆင့်**: [အခန်း ၁ - AZD အခြေခံများကို စတင်ပါ](docs/getting-started/azd-basics.md) →

---

**အကြောင်းကြားချက်**:  
ဤစာရွက်စာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ကို အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှုအတွက် ကြိုးစားနေသော်လည်း အလိုအလျောက် ဘာသာပြန်မှုများတွင် အမှားများ သို့မဟုတ် မတိကျမှုများ ပါဝင်နိုင်သည်ကို သတိပြုပါ။ မူရင်းဘာသာစကားဖြင့် ရေးသားထားသော စာရွက်စာတမ်းကို အာဏာတရ အရင်းအမြစ်အဖြစ် သတ်မှတ်သင့်ပါသည်။ အရေးကြီးသော အချက်အလက်များအတွက် လူသားမှ ပရော်ဖက်ရှင်နယ် ဘာသာပြန်မှုကို အကြံပြုပါသည်။ ဤဘာသာပြန်မှုကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော အလွဲအမှားများ သို့မဟုတ် အနားယူမှုများအတွက် ကျွန်ုပ်တို့သည် တာဝန်မယူပါ။