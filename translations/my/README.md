<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "b2e94dc30cab0675918a6ad34863b05d",
  "translation_date": "2025-11-23T22:23:34+00:00",
  "source_file": "README.md",
  "language_code": "my"
}
-->
# AZD အတွက် အခြေခံများ: သင်ကြားမှုခရီးစဉ်တစ်ခု

![AZD-for-beginners](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.my.png) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

## ဒီသင်တန်းကို စတင်အသုံးပြုခြင်း

AZD သင်ကြားမှုခရီးစဉ်ကို စတင်ရန် အောက်ပါအဆင့်များကို လိုက်နာပါ-

1. **Repository ကို Fork လုပ်ပါ**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork) ကိုနှိပ်ပါ။
2. **Repository ကို Clone လုပ်ပါ**: `git clone https://github.com/microsoft/azd-for-beginners.git`
3. **အသိုင်းအဝိုင်းကို ဝင်ပါ**: [Azure Discord Communities](https://discord.com/invite/ByRwuEEgH4) မှာ အကူအညီရယူပါ။
4. **သင်ကြားမှုလမ်းကြောင်းကို ရွေးချယ်ပါ**: အတွေ့အကြုံအဆင့်နှင့် ကိုက်ညီသော အခန်းတစ်ခုကို အောက်တွင် ရွေးချယ်ပါ။

### ဘာသာစကားအမျိုးမျိုးကို ပံ့ပိုးမှု

#### အလိုအလျောက် ဘာသာပြန်ခြင်း (အမြဲနောက်ဆုံးပေါ်)

[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](./README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../br/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

## သင်တန်းအကြောင်းအရာ

Azure Developer CLI (azd) ကို အဆင့်ဆင့် သင်ကြားမှုအခန်းများဖြင့် ကျွမ်းကျင်စေပါမည်။ **Microsoft Foundry နှင့် ပေါင်းစပ်ပြီး AI အပလီကေးရှင်းများကို Deploy လုပ်ခြင်းကို အထူးအာရုံစိုက်ထားပါသည်။**

### ယနေ့ခေတ် Developer များအတွက် ဒီသင်တန်းက အရေးကြီးတဲ့အကြောင်း

Microsoft Foundry Discord အသိုင်းအဝိုင်းမှ အချက်အလက်အရ **Developer ၄၅% က AZD ကို AI workload များအတွက် အသုံးပြုလိုကြပေမယ့် အခက်အခဲများကြုံတွေ့နေကြသည်**:
- AI အဆောက်အအုံများ၏ ရှုပ်ထွေးမှု
- AI ကို ထုတ်လုပ်မှုအဆင့်တွင် Deploy လုပ်ခြင်းဆိုင်ရာ အကောင်းဆုံးလက်တွေ့ကျင့်စဉ်များ  
- Azure AI ဝန်ဆောင်မှုများနှင့် ပေါင်းစပ်ခြင်းနှင့် ပြင်ဆင်ခြင်း
- AI workload များအတွက် ကုန်ကျစရိတ် လျှော့ချခြင်း
- AI-specific Deployment ပြဿနာများကို ဖြေရှင်းခြင်း

### သင်ကြားမှုရည်မှန်းချက်များ

ဒီသင်တန်းကို ပြီးမြောက်စွာ လေ့လာပြီးနောက်၊ သင်သည်:
- **AZD အခြေခံများကို ကျွမ်းကျင်မည်**: အဓိကအကြောင်းအရာများ၊ ထည့်သွင်းခြင်းနှင့် ပြင်ဆင်ခြင်း
- **AI အပလီကေးရှင်းများကို Deploy လုပ်မည်**: AZD ကို Microsoft Foundry ဝန်ဆောင်မှုများနှင့် အသုံးပြုခြင်း
- **Infrastructure as Code ကို အကောင်အထည်ဖော်မည်**: Bicep template များဖြင့် Azure အရင်းအမြစ်များကို စီမံခန့်ခွဲခြင်း
- **Deployments များကို Troubleshoot လုပ်မည်**: ရိုးရိုးရှင်းရှင်း ပြဿနာများကို ဖြေရှင်းခြင်းနှင့် Debug လုပ်ခြင်း
- **ထုတ်လုပ်မှုအတွက် Optimize လုပ်မည်**: လုံခြုံရေး၊ အတိုင်းအတာချိန်ညှိခြင်း၊ စောင့်ကြည့်ခြင်းနှင့် ကုန်ကျစရိတ် စီမံခန့်ခွဲခြင်း
- **Multi-Agent Solutions များကို တည်ဆောက်မည်**: ရှုပ်ထွေးသော AI အဆောက်အအုံများကို Deploy လုပ်ခြင်း

## 📚 သင်ကြားမှုအခန်းများ

*သင်၏ အတွေ့အကြုံအဆင့်နှင့် ရည်မှန်းချက်များအပေါ် မူတည်၍ သင်ကြားမှုလမ်းကြောင်းကို ရွေးချယ်ပါ*

### 🚀 အခန်း ၁: အခြေခံနှင့် အမြန်စတင်ခြင်း
**လိုအပ်ချက်များ**: Azure subscription, command line အခြေခံအသိပညာ  
**ကြာချိန်**: ၃၀-၄၅ မိနစ်  
**ရှုပ်ထွေးမှု**: ⭐

#### သင်လေ့လာမည့်အရာများ
- Azure Developer CLI အခြေခံများကို နားလည်ခြင်း
- သင့်ပလက်ဖောင်းပေါ်တွင် AZD ကို ထည့်သွင်းခြင်း
- သင့်ရဲ့ ပထမဆုံး Deployment အောင်မြင်မှု

#### သင်ကြားမှုအရင်းအမြစ်များ
- **🎯 ဒီနေရာက စတင်ပါ**: [Azure Developer CLI ဆိုတာဘာလဲ?](../..)
- **📖 သီအိုရီ**: [AZD အခြေခံများ](docs/getting-started/azd-basics.md) - အဓိကအကြောင်းအရာများနှင့် အသုံးအနှုန်းများ
- **⚙️ Setup**: [Installation & Setup](docs/getting-started/installation.md) - ပလက်ဖောင်းအလိုက် လမ်းညွှန်ချက်များ
- **🛠️ လက်တွေ့လုပ်ဆောင်မှု**: [သင့်ရဲ့ ပထမဆုံး Project](docs/getting-started/first-project.md) - အဆင့်ဆင့် လမ်းညွှန်ချက်
- **📋 အမြန်ရောက်ရန် လမ်းညွှန်ချက်**: [Command Cheat Sheet](resources/cheat-sheet.md)

#### လက်တွေ့လေ့ကျင့်မှုများ
```bash
# အမြန်တင်သွင်းမှုစစ်ဆေးခြင်း
azd version

# သင့်ရဲ့ပထမဆုံးအက်ပလီကေးရှင်းကိုဖြန့်ဝေပါ
azd init --template todo-nodejs-mongo
azd up
```

**💡 အခန်းရလဒ်**: AZD ကို အသုံးပြု၍ ရိုးရှင်းသော web application ကို Azure သို့ အောင်မြင်စွာ Deploy လုပ်နိုင်ခြင်း

**✅ အောင်မြင်မှုအတည်ပြုချက်**:
```bash
# အခန်း ၁ ကိုပြီးမြောက်ပြီးနောက်တွင် သင်တတ်နိုင်ရမည်မှာ:
azd version              # တပ်ဆင်ထားသော ဗားရှင်းကို ပြသသည်
azd init --template todo-nodejs-mongo  # ပရောဂျက်ကို စတင်သည်
azd up                  # Azure သို့ တင်ဆောင်သည်
azd show                # လည်ပတ်နေသော app URL ကို ပြသသည်
# အက်ပလီကေးရှင်းသည် browser တွင် ဖွင့်ပြီး အလုပ်လုပ်သည်
azd down --force --purge  # အရင်းအမြစ်များကို ရှင်းလင်းသည်
```

**📊 အချိန်ရင်းနှီးမှု**: ၃၀-၄၅ မိနစ်  
**📈 အတန်းအဆင့်နောက်ပိုင်း**: ရိုးရှင်းသော အပလီကေးရှင်းများကို ကိုယ်တိုင် Deploy လုပ်နိုင်ခြင်း

**✅ အောင်မြင်မှုအတည်ပြုချက်**:
```bash
# အခန်း ၁ ကိုပြီးမြောက်ပြီးနောက်တွင် သင်တတ်နိုင်ရမည်မှာ:
azd version              # တပ်ဆင်ထားသော ဗားရှင်းကို ပြသသည်
azd init --template todo-nodejs-mongo  # ပရောဂျက်ကို စတင်သည်
azd up                  # Azure သို့ တင်ပို့သည်
azd show                # လည်ပတ်နေသော app URL ကို ပြသသည်
# အက်ပလီကေးရှင်းသည် browser တွင် ဖွင့်ပြီး အလုပ်လုပ်သည်
azd down --force --purge  # အရင်းအမြစ်များကို ရှင်းလင်းသည်
```

**📊 အချိန်ရင်းနှီးမှု**: ၃၀-၄၅ မိနစ်  
**📈 အတန်းအဆင့်နောက်ပိုင်း**: ရိုးရှင်းသော အပလီကေးရှင်းများကို ကိုယ်တိုင် Deploy လုပ်နိုင်ခြင်း

---

### 🤖 အခန်း ၂: AI-First Development (AI Developer များအတွက် အကြံပြုသည်)
**လိုအပ်ချက်များ**: အခန်း ၁ ကို ပြီးစီးထားရမည်  
**ကြာချိန်**: ၁-၂ နာရီ  
**ရှုပ်ထွေးမှု**: ⭐⭐

#### သင်လေ့လာမည့်အရာများ
- AZD နှင့် Microsoft Foundry ပေါင်းစပ်ခြင်း
- AI-powered အပလီကေးရှင်းများကို Deploy လုပ်ခြင်း
- AI ဝန်ဆောင်မှုများ၏ ပြင်ဆင်မှုများကို နားလည်ခြင်း

#### သင်ကြားမှုအရင်းအမြစ်များ
- **🎯 ဒီနေရာက စတင်ပါ**: [Microsoft Foundry Integration](docs/microsoft-foundry/microsoft-foundry-integration.md)
- **📖 Patterns**: [AI Model Deployment](docs/microsoft-foundry/ai-model-deployment.md) - AI မော်ဒယ်များကို Deploy လုပ်ခြင်းနှင့် စီမံခန့်ခွဲခြင်း
- **🛠️ Workshop**: [AI Workshop Lab](docs/microsoft-foundry/ai-workshop-lab.md) - သင့် AI ဖြေရှင်းချက်များကို AZD-ready ဖြစ်အောင် ပြင်ဆင်ခြင်း
- **🎥 Interactive Guide**: [Workshop Materials](workshop/README.md) - Browser-based learning with MkDocs * DevContainer Environment
- **📋 Templates**: [Microsoft Foundry Templates](../..)
- **📝 Examples**: [AZD Deployment Examples](examples/README.md)

#### လက်တွေ့လေ့ကျင့်မှုများ
```bash
# သင့်ရဲ့ ပထမဆုံး AI အက်ပလီကေးရှင်းကို တင်ဆက်ပါ
azd init --template azure-search-openai-demo
azd up

# အပို AI အခြေခံပုံစံများကို စမ်းသပ်ပါ
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 အခန်းရလဒ်**: RAG စွမ်းရည်များပါဝင်သော AI-powered chat application ကို Deploy လုပ်ခြင်းနှင့် ပြင်ဆင်ခြင်း

**✅ အောင်မြင်မှုအတည်ပြုချက်**:
```bash
# အခန်း ၂ ပြီးနောက်တွင် သင်တစ်စုံတစ်ခုကို ပြုလုပ်နိုင်ရမည်။
azd init --template azure-search-openai-demo
azd up
# AI chat interface ကို စမ်းသပ်ပါ။
# မေးခွန်းများမေးပြီး အရင်းအမြစ်များပါဝင်သော AI-powered အဖြေများရယူပါ။
# ရှာဖွေမှု ပေါင်းစည်းမှုအလုပ်လုပ်မှုကို အတည်ပြုပါ။
azd monitor  # Application Insights တွင် telemetry ပြသမှုကို စစ်ဆေးပါ။
azd down --force --purge
```

**📊 အချိန်ရင်းနှီးမှု**: ၁-၂ နာရီ  
**📈 အတန်းအဆင့်နောက်ပိုင်း**: ထုတ်လုပ်မှုအဆင့် AI အပလီကေးရှင်းများကို Deploy လုပ်နိုင်ခြင်း  
**💰 ကုန်ကျစရိတ်သိရှိမှု**: $80-150/လ dev ကုန်ကျစရိတ်၊ $300-3500/လ ထုတ်လုပ်မှုကုန်ကျစရိတ်ကို နားလည်ခြင်း

#### 💰 AI Deployment များအတွက် ကုန်ကျစရိတ်စဉ်းစားမှု

**ဖွံ့ဖြိုးရေးပတ်ဝန်းကျင် (ခန့်မှန်း $80-150/လ):**
- Azure OpenAI (Pay-as-you-go): $0-50/လ (token အသုံးပြုမှုအပေါ်မူတည်)
- AI Search (Basic tier): $75/လ
- Container Apps (Consumption): $0-20/လ
- Storage (Standard): $1-5/လ

**ထုတ်လုပ်မှုပတ်ဝန်းကျင် (ခန့်မှန်း $300-3,500+/လ):**
- Azure OpenAI (PTU for consistent performance): $3,000+/လ OR Pay-as-go with high volume
- AI Search (Standard tier): $250/လ
- Container Apps (Dedicated): $50-100/လ
- Application Insights: $5-50/လ
- Storage (Premium): $10-50/လ

**💡 ကုန်ကျစရိတ် လျှော့ချရန် အကြံပြုချက်များ:**
- သင်ကြားမှုအတွက် **Free Tier** Azure OpenAI ကို အသုံးပြုပါ (50,000 tokens/လ ပါဝင်သည်)
- `azd down` ကို အသုံးပြု၍ ဖွံ့ဖြိုးရေးမလုပ်နေသောအချိန်တွင် အရင်းအမြစ်များကို ဖယ်ရှားပါ
- consumption-based billing ဖြင့် စတင်ပြီး production အတွက်သာ PTU သို့ အဆင့်မြှင့်ပါ
- Deploy လုပ်မီ `azd provision --preview` ကို အသုံးပြု၍ ကုန်ကျစရိတ်ကို ခန့်မှန်းပါ
- auto-scaling ကို ဖွင့်ပါ: အသုံးပြုမှုအတိုင်းသာ ပေးဆောင်ပါ

**ကုန်ကျစရိတ် စောင့်ကြည့်မှု:**
```bash
# ခန့်မှန်းထားသော လစဉ်ကုန်ကျစရိတ်များကို စစ်ဆေးပါ
azd provision --preview

# Azure Portal တွင် အမှန်တကယ်ကုန်ကျစရိတ်များကို ကြည့်ရှုပါ
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ အခန်း ၃: Configuration & Authentication
**လိုအပ်ချက်များ**: အခန်း ၁ ကို ပြီးစီးထားရမည်  
**ကြာချိန်**: ၄၅-၆၀ မိနစ်  
**ရှုပ်ထွေးမှု**: ⭐⭐

#### သင်လေ့လာမည့်အရာများ
- ပတ်ဝန်းကျင်ကို ပြင်ဆင်ခြင်းနှင့် စီမံခန့်ခွဲခြင်း
- Authentication နှင့် လုံခြုံရေးအကောင်းဆုံးလက်တွေ့ကျင့်စဉ်များ
- အရင်းအမြစ်များကို နာမည်ပေးခြင်းနှင့် စီမံခန့်ခွဲခြင်း

#### သင်ကြားမှုအရင်းအမြစ်များ
- **📖 Configuration**: [Configuration Guide](docs/getting-started/configuration.md) - ပတ်ဝန်းကျင် ပြင်ဆင်မှု
- **🔐 Security**: [Authentication patterns and managed identity](docs/getting-started/authsecurity.md) - Authentication ပုံစံများ
- **📝 Examples**: [Database App Example](examples/database-app/README.md) - AZD Database ตัวอย่าง

#### လက်တွေ့လေ့ကျင့်မှုများ
- ပတ်ဝန်းကျင်များ (dev, staging, prod) ကို ပြင်ဆင်ပါ
- managed identity authentication ကို စတင်ပါ
- ပတ်ဝန်းကျင်-specific configuration များကို အကောင်အထည်ဖော်ပါ

**💡 အခန်းရလဒ်**: လုံခြုံရေးနှင့် authentication မှန်ကန်စွာဖြင့် ပတ်ဝန်းကျင်များစီမံခန့်ခွဲနိုင်ခြင်း

---

### 🏗️ အခန်း ၄: Infrastructure as Code & Deployment
**လိုအပ်ချက်များ**: အခန်း ၁-၃ ကို ပြီးစီးထားရမည်  
**ကြာချိန်**: ၁-၁.၅ နာရီ  
**ရှုပ်ထွေးမှု**: ⭐⭐⭐

#### သင်လေ့လာမည့်အရာများ
- အဆင့်မြင့် Deployment ပုံစံများ
- Infrastructure as Code ကို Bicep ဖြင့်
- အရင်းအမြစ်များ Provisioning လုပ်ခြင်း

#### သင်ကြားမှုအရင်းအမြစ်များ
- **📖 Deployment**: [Deployment Guide](docs/deployment/deployment-guide.md) - Workflow အပြည့်အစုံ
- **🏗️ Provisioning**
**💡 အခန်းရလဒ်**: Customer နှင့် Inventory အေးဂျင့်များပါဝင်သော ထုတ်လုပ်မှုအဆင့် AI ဖြေရှင်းချက်ကို တင်သွင်းပြီး စီမံခန့်ခွဲပါ။

---

### 🔍 အခန်း ၆: တင်သွင်းမည့်အခြေအနေစစ်ဆေးခြင်းနှင့် စီမံကိန်းရေးဆွဲခြင်း
**လိုအပ်ချက်များ**: အခန်း ၄ ပြီးစီးထားရမည်  
**ကြာမြင့်ချိန်**: ၁ နာရီ  
**အဆင့်အတန်း**: ⭐⭐

#### သင်လေ့လာမည့်အရာများ
- စွမ်းရည်စီမံကိန်းရေးဆွဲခြင်းနှင့် အရင်းအမြစ်အတည်ပြုခြင်း
- SKU ရွေးချယ်မှုနည်းလမ်းများ
- Pre-flight စစ်ဆေးမှုများနှင့် အလိုအလျောက်လုပ်ငန်းစဉ်များ

#### သင်ယူရန်အရင်းအမြစ်များ
- **📊 စီမံကိန်းရေးဆွဲခြင်း**: [စွမ်းရည်စီမံကိန်း](docs/pre-deployment/capacity-planning.md) - အရင်းအမြစ်အတည်ပြုခြင်း
- **💰 ရွေးချယ်မှု**: [SKU ရွေးချယ်မှု](docs/pre-deployment/sku-selection.md) - စရိတ်သက်သာသောရွေးချယ်မှုများ
- **✅ အတည်ပြုခြင်း**: [Pre-flight စစ်ဆေးမှုများ](docs/pre-deployment/preflight-checks.md) - အလိုအလျောက် script များ

#### လက်တွေ့လေ့ကျင့်မှုများ
- စွမ်းရည်အတည်ပြု script များကို အကောင်အထည်ဖော်ပါ
- စရိတ်သက်သာစေရန် SKU ရွေးချယ်မှုများကို အကောင်းဆုံးဖြစ်အောင်လုပ်ဆောင်ပါ
- တင်သွင်းမည့်အခြေအနေများကို အလိုအလျောက်စစ်ဆေးမှုများအကောင်အထည်ဖော်ပါ

**💡 အခန်းရလဒ်**: တင်သွင်းမှုများကို အကောင်အထည်ဖော်မီ အတည်ပြုပြီး အကောင်းဆုံးဖြစ်အောင်လုပ်ဆောင်ပါ

---

### 🚨 အခန်း ၇: ပြဿနာရှာဖွေခြင်းနှင့် Debugging
**လိုအပ်ချက်များ**: တင်သွင်းမှုအခန်းတစ်ခုခု ပြီးစီးထားရမည်  
**ကြာမြင့်ချိန်**: ၁-၁.၅ နာရီ  
**အဆင့်အတန်း**: ⭐⭐

#### သင်လေ့လာမည့်အရာများ
- စနစ်တကျ Debugging လုပ်ငန်းစဉ်များ
- အများဆုံးဖြစ်သောပြဿနာများနှင့် ဖြေရှင်းနည်းများ
- AI အထူးပြဿနာရှာဖွေခြင်း

#### သင်ယူရန်အရင်းအမြစ်များ
- **🔧 အများဆုံးဖြစ်သောပြဿနာများ**: [အများဆုံးဖြစ်သောပြဿနာများ](docs/troubleshooting/common-issues.md) - FAQ နှင့် ဖြေရှင်းနည်းများ
- **🕵️ Debugging**: [Debugging လမ်းညွှန်](docs/troubleshooting/debugging.md) - အဆင့်ဆင့်လုပ်ဆောင်နည်းများ
- **🤖 AI ပြဿနာများ**: [AI အထူးပြဿနာရှာဖွေခြင်း](docs/troubleshooting/ai-troubleshooting.md) - AI ဝန်ဆောင်မှုဆိုင်ရာပြဿနာများ

#### လက်တွေ့လေ့ကျင့်မှုများ
- တင်သွင်းမှုမအောင်မြင်မှုများကို ရှာဖွေပါ
- Authentication ပြဿနာများကို ဖြေရှင်းပါ
- AI ဝန်ဆောင်မှုချိတ်ဆက်မှုများကို Debug လုပ်ပါ

**💡 အခန်းရလဒ်**: အများဆုံးဖြစ်သောတင်သွင်းမှုဆိုင်ရာပြဿနာများကို ကိုယ်တိုင်ရှာဖွေပြီး ဖြေရှင်းနိုင်ပါမည်

---

### 🏢 အခန်း ၈: ထုတ်လုပ်မှုနှင့် အဖွဲ့အစည်းပုံစံများ
**လိုအပ်ချက်များ**: အခန်း ၁-၄ ပြီးစီးထားရမည်  
**ကြာမြင့်ချိန်**: ၂-၃ နာရီ  
**အဆင့်အတန်း**: ⭐⭐⭐⭐

#### သင်လေ့လာမည့်အရာများ
- ထုတ်လုပ်မှုအဆင့်တင်သွင်းမှုနည်းလမ်းများ
- အဖွဲ့အစည်းလုံခြုံရေးပုံစံများ
- စောင့်ကြည့်မှုနှင့် စရိတ်အကောင်းဆုံးဖြစ်အောင်လုပ်ဆောင်ခြင်း

#### သင်ယူရန်အရင်းအမြစ်များ
- **🏭 ထုတ်လုပ်မှု**: [ထုတ်လုပ်မှု AI အကောင်းဆုံးလုပ်ဆောင်နည်းများ](docs/microsoft-foundry/production-ai-practices.md) - အဖွဲ့အစည်းပုံစံများ
- **📝 ဥပမာများ**: [Microservices ဥပမာ](../../examples/microservices) - ရှုပ်ထွေးသော architecture များ
- **📊 စောင့်ကြည့်မှု**: [Application Insights integration](docs/pre-deployment/application-insights.md) - စောင့်ကြည့်မှု

#### လက်တွေ့လေ့ကျင့်မှုများ
- အဖွဲ့အစည်းလုံခြုံရေးပုံစံများကို အကောင်အထည်ဖော်ပါ
- စုံလင်သောစောင့်ကြည့်မှုကို စနစ်တကျတပ်ဆင်ပါ
- Governance အကောင်းဆုံးဖြစ်အောင် ထုတ်လုပ်မှုအဆင့်တင်သွင်းပါ

**💡 အခန်းရလဒ်**: ထုတ်လုပ်မှုအဆင့်အပြည့်အစုံပါဝင်သော အဖွဲ့အစည်းအသင့် AI အက်ပလီကေးရှင်းများကို တင်သွင်းပါ

---

## 🎓 Workshop အကျဉ်းချုပ်: လက်တွေ့လေ့လာမှုအတွေ့အကြုံ

> **⚠️ WORKSHOP အခြေအနေ: ဖွံ့ဖြိုးမှုအဆင့်**  
> Workshop ပစ္စည်းများကို လက်ရှိ ဖွံ့ဖြိုးတိုးတက်နေဆဲဖြစ်သည်။ အခြေခံ module များကို အသုံးပြုနိုင်ပြီး အဆင့်မြင့်ပိုင်းများမှာ မပြီးစီးသေးပါ။ အားလုံးကို ပြီးစီးအောင် လုပ်ဆောင်နေပါသည်။ [တိုးတက်မှုကို စောင့်ကြည့်ပါ →](workshop/README.md)

### လက်တွေ့ Workshop ပစ္စည်းများ
**Browser-based tools နှင့် လမ်းညွှန်လေ့ကျင့်မှုများဖြင့် စနစ်တကျ လက်တွေ့လေ့လာမှု**

ကျွန်ုပ်တို့၏ workshop ပစ္စည်းများသည် အခန်းအလိုက် သင်ရိုးညွှန်းတမ်းကို ဖြည့်စွက်ပေးသော စနစ်တကျ၊ လက်တွေ့လေ့လာမှုအတွေ့အကြုံကို ပေးစွမ်းသည်။ Workshop သည် ကိုယ်တိုင်လေ့လာမှုနှင့် ဆရာ/ဆရာမ ဦးဆောင်သင်တန်းများအတွက် ဒီဇိုင်းဆွဲထားသည်။

#### 🛠️ Workshop အင်္ဂါရပ်များ
- **Browser-Based Interface**: MkDocs-powered workshop ဖြင့် ရှာဖွေမှု၊ ကူးယူမှုနှင့် theme အင်္ဂါရပ်များ
- **GitHub Codespaces Integration**: တစ်ချက်နှိပ်ပြီး development environment ကို စတင်နိုင်ခြင်း
- **Structured Learning Path**: ၇-အဆင့် လမ်းညွှန်လေ့ကျင့်မှုများ (စုစုပေါင်း ၃.၅ နာရီ)
- **Discovery → Deployment → Customization**: တိုးတက်မှု methodology
- **Interactive DevContainer Environment**: Tools နှင့် dependencies များကို ကြိုတင်တပ်ဆင်ထားခြင်း

#### 📚 Workshop ဖွဲ့စည်းမှု
Workshop သည် **Discovery → Deployment → Customization** methodology ကို လိုက်နာသည်။

1. **Discovery အဆင့်** (၄၅ မိနစ်)
   - Microsoft Foundry template များနှင့် ဝန်ဆောင်မှုများကို ရှာဖွေပါ
   - Multi-agent architecture ပုံစံများကို နားလည်ပါ
   - တင်သွင်းမှုလိုအပ်ချက်များနှင့် အခြေအနေများကို ပြန်လည်သုံးသပ်ပါ

2. **Deployment အဆင့်** (၂ နာရီ)
   - AZD ဖြင့် AI အက်ပလီကေးရှင်းများကို လက်တွေ့တင်သွင်းပါ
   - Azure AI ဝန်ဆောင်မှုများနှင့် endpoint များကို configure လုပ်ပါ
   - လုံခြုံရေးနှင့် authentication ပုံစံများကို အကောင်အထည်ဖော်ပါ

3. **Customization အဆင့်** (၄၅ မိနစ်)
   - အက်ပလီကေးရှင်းများကို အထူးလိုအပ်ချက်များအတွက် ပြင်ဆင်ပါ
   - ထုတ်လုပ်မှုအဆင့်တင်သွင်းမှုအတွက် အကောင်းဆုံးဖြစ်အောင်လုပ်ဆောင်ပါ
   - စောင့်ကြည့်မှုနှင့် စရိတ်စီမံခန့်ခွဲမှုကို အကောင်အထည်ဖော်ပါ

#### 🚀 Workshop စတင်ခြင်း
```bash
# အရွေးချယ်မှု ၁: GitHub Codespaces (အကြံပြုထားသည်)
# "Code" ကိုနှိပ်ပါ → repository တွင် "Create codespace on main" ကိုဖန်တီးပါ

# အရွေးချယ်မှု ၂: ဒေသတွင်းဖွံ့ဖြိုးမှု
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# workshop/README.md တွင် setup လမ်းညွှန်ချက်များကိုလိုက်နာပါ
```

#### 🎯 Workshop သင်ယူရလဒ်များ
Workshop ကို ပြီးစီးခြင်းဖြင့် ပါဝင်သူများသည်:
- **ထုတ်လုပ်မှု AI အက်ပလီကေးရှင်းများကို တင်သွင်းပါ**: AZD နှင့် Microsoft Foundry ဝန်ဆောင်မှုများကို အသုံးပြုပါ
- **Multi-Agent Architecture များကို ကျွမ်းကျင်ပါ**: AI အေးဂျင့်များကို ပေါင်းစပ်ပြီး အကောင်အထည်ဖော်ပါ
- **လုံခြုံရေးအကောင်းဆုံးလုပ်ဆောင်နည်းများကို အကောင်အထည်ဖော်ပါ**: Authentication နှင့် access control ကို configure လုပ်ပါ
- **Scale အတွက် အကောင်းဆုံးဖြစ်အောင်လုပ်ဆောင်ပါ**: စရိတ်သက်သာပြီး အကျိုးရှိသော တင်သွင်းမှုများကို ဒီဇိုင်းဆွဲပါ
- **တင်သွင်းမှုများကို Troubleshoot လုပ်ပါ**: အများဆုံးဖြစ်သောပြဿနာများကို ကိုယ်တိုင်ဖြေရှင်းပါ

#### 📖 Workshop အရင်းအမြစ်များ
- **🎥 Interactive Guide**: [Workshop ပစ္စည်းများ](workshop/README.md) - Browser-based learning environment
- **📋 လမ်းညွှန်လေ့ကျင့်မှုများ**: [Guided Exercises](../../workshop/docs/instructions) - အသေးစိတ်လမ်းညွှန်
- **🛠️ AI Workshop Lab**: [AI Workshop Lab](docs/microsoft-foundry/ai-workshop-lab.md) - AI အထူးလေ့ကျင့်မှုများ
- **💡 Quick Start**: [Workshop Setup Guide](workshop/README.md#quick-start) - Environment configuration

**သင့်လျော်သောနေရာများ**: ကုမ္ပဏီသင်တန်းများ၊ တက္ကသိုလ်သင်တန်းများ၊ ကိုယ်တိုင်လေ့လာမှုများနှင့် developer bootcamp များ။

---

## 📖 Azure Developer CLI ဆိုတာဘာလဲ?

Azure Developer CLI (azd) သည် Azure တွင် အက်ပလီကေးရှင်းများကို တည်ဆောက်ခြင်းနှင့် တင်သွင်းခြင်းလုပ်ငန်းစဉ်ကို မြန်ဆန်စေသော developer-centric command-line interface တစ်ခုဖြစ်သည်။ ၎င်းသည် အောက်ပါအင်္ဂါရပ်များကို ပေးစွမ်းသည်-

- **Template-based တင်သွင်းမှုများ** - အက်ပလီကေးရှင်းပုံစံများအတွက် ကြိုတင်ပြင်ဆင်ထားသော template များကို အသုံးပြုပါ
- **Infrastructure as Code** - Bicep သို့မဟုတ် Terraform ကို အသုံးပြု၍ Azure အရင်းအမြစ်များကို စီမံပါ  
- **Integrated workflows** - အက်ပလီကေးရှင်းများကို provision, deploy, monitor လုပ်ရန် seamless workflow
- **Developer-friendly** - Developer ၏ productivity နှင့် အတွေ့အကြုံအတွက် အကောင်းဆုံး optimize လုပ်ထားသည်

### **AZD + Microsoft Foundry: AI တင်သွင်းမှုများအတွက် အကောင်းဆုံး**

**AI Solutions အတွက် AZD ကို ဘာကြောင့်ရွေးချယ်သင့်သလဲ?** AZD သည် AI developer များရင်ဆိုင်နေရသော အဓိကအခက်အခဲများကို ဖြေရှင်းပေးသည်-

- **AI-Ready Template များ** - Azure OpenAI, Cognitive Services, ML workload များအတွက် ကြိုတင် configure လုပ်ထားသော template များ
- **လုံခြုံသော AI တင်သွင်းမှုများ** - AI ဝန်ဆောင်မှုများ၊ API key များနှင့် model endpoint များအတွက် built-in security pattern များ  
- **ထုတ်လုပ်မှု AI ပုံစံများ** - Scale လုပ်နိုင်ပြီး စရိတ်သက်သာသော AI အက်ပလီကေးရှင်းတင်သွင်းမှုများအတွက် အကောင်းဆုံးလုပ်ဆောင်နည်းများ
- **End-to-End AI Workflow များ** - Model တည်ဆောက်မှုမှ ထုတ်လုပ်မှုအဆင့်တင်သွင်းမှုအထိ စောင့်ကြည့်မှုနှင့်အတူ
- **စရိတ်အကောင်းဆုံးဖြစ်အောင်လုပ်ဆောင်ခြင်း** - AI workload များအတွက် resource allocation နှင့် scale လုပ်နိုင်မှု strategy များ
- **Microsoft Foundry Integration** - Microsoft Foundry model catalog နှင့် endpoint များကို seamless ချိတ်ဆက်မှု

---

## 🎯 Template များနှင့် ဥပမာများ Library

### Featured: Microsoft Foundry Template များ
**AI အက်ပလီကေးရှင်းများကို တင်သွင်းမည်ဆိုပါက ဒီနေရာမှ စတင်ပါ!**

> **မှတ်ချက်**: Template များသည် အမျိုးမျိုးသော AI ပုံစံများကို ပြသသည်။ အချို့မှာ Azure Samples ဖြစ်ပြီး အချို့မှာ ဒေသတွင်းအကောင်အထည်ဖော်မှုများဖြစ်သည်။

| Template | အခန်း | အဆင့်အတန်း | ဝန်ဆောင်မှုများ | အမျိုးအစား |
|----------|---------|------------|----------|------|
| [**AI chat ဖြင့် စတင်ပါ**](https://github.com/Azure-Samples/get-started-with-ai-chat) | အခန်း ၂ | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | External |
| [**AI agent များဖြင့် စတင်ပါ**](https://github.com/Azure-Samples/get-started-with-ai-agents) | အခန်း ၂ | ⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| External |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | အခန်း ၂ | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | External |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | အခန်း ၂ | ⭐ | AzureOpenAI + Container Apps + Application Insights | External |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | အခန်း ၅ | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | External |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | အခန်း ၈ | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | External |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | အခန်း ၅ | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Local** |

### Featured: အပြည့်အစုံသင်ယူမှုအခန်းများ
**ထုတ်လုပ်မှုအဆင့်အက်ပလီကေးရှင်း template များကို သင်ယူမှုအခန်းများနှင့် mapping ပြုလုပ်ထားသည်**

| Template | သင်ယူမှုအခန်း | အဆင့်အတန်း | Key Learning |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | အခန်း ၂ | ⭐ | အခြေခံ AI တင်သွင်းမှု pattern များ |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | အခန်း ၂ | ⭐⭐ | RAG ကို Azure AI Search ဖြင့် အကောင်အထည်ဖော်ခြင်း |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | အခန်း ၄ | ⭐⭐ | Document Intelligence integration |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | အခန်း ၅ | ⭐⭐⭐ |
### လက်တွေ့အလုပ်ရုံဆွေးနွေးပွဲများ
- [**AI Workshop Lab**](docs/microsoft-foundry/ai-workshop-lab.md) - သင့် AI ဖြေရှင်းချက်များကို AZD-deployable ဖြစ်အောင်လုပ်ပါ (2-3 နာရီ)
- [**Interactive Workshop Guide**](workshop/README.md) - Browser-based workshop MkDocs နှင့် DevContainer Environment ဖြင့်
- [**Structured Learning Path**](../../workshop/docs/instructions) - 7-အဆင့် လမ်းညွှန်လေ့ကျင့်မှုများ (Discovery → Deployment → Customization)
- [**AZD For Beginners Workshop**](workshop/README.md) - GitHub Codespaces အထောက်အပံ့ပါရှိသော လက်တွေ့အလုပ်ရုံဆွေးနွေးပွဲပစ္စည်းများ

### အပြင်ပညာရပ်အရင်းအမြစ်များ
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

---

## 🔧 အမြန်ပြုပြင်နည်းလမ်းညွှန်

**အသစ်စတင်သူများရင်ဆိုင်ရသော အများဆုံးပြဿနာများနှင့် ချက်ချင်းဖြေရှင်းနည်းများ**

### ❌ "azd: command not found"

```bash
# AZD ကို အရင်ဆုံး ထည့်သွင်းပါ
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# ထည့်သွင်းမှုကို အတည်ပြုပါ
azd version
```

### ❌ "No subscription found" or "Subscription not set"

```bash
# ရရှိနိုင်သော subscription များစာရင်း
az account list --output table

# ပုံမှန် subscription သတ်မှတ်ပါ
az account set --subscription "<subscription-id-or-name>"

# AZD ပတ်ဝန်းကျင်အတွက် သတ်မှတ်ပါ
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# အတည်ပြုပါ
az account show
```

### ❌ "InsufficientQuota" or "Quota exceeded"

```bash
# အခြား Azure ဒေသများကို စမ်းကြည့်ပါ
azd env set AZURE_LOCATION "westus2"
azd up

# သို့မဟုတ် ဖွံ့ဖြိုးရေးတွင် သေးငယ်သော SKU များကို အသုံးပြုပါ
# infra/main.parameters.json ကို တည်းဖြတ်ပါ
{
  "sku": "B1"  // Instead of "P1V2"
}
```

### ❌ "azd up" fails halfway through

```bash
# အရွေးချယ်မှု ၁: သန့်စင်ပြီး ထပ်မံကြိုးစားပါ
azd down --force --purge
azd up

# အရွေးချယ်မှု ၂: အခြေခံအဆောက်အအုံကိုသာ ပြင်ဆင်ပါ
azd provision

# အရွေးချယ်မှု ၃: အသေးစိတ်မှတ်တမ်းများကို စစ်ဆေးပါ
azd show
azd logs
```

### ❌ "Authentication failed" or "Token expired"

```bash
# ပြန်လည်အတည်ပြုခြင်း
az logout
az login

azd auth logout
azd auth login

# အတည်ပြုခြင်းကိုစစ်ဆေးပါ
az account show
```

### ❌ "Resource already exists" or naming conflicts

```bash
# AZD သည် ထူးခြားသောအမည်များကို ဖန်တီးပေးသည်၊ သို့သော် အကြောင်းအရာမတူပါက:
azd down --force --purge

# ထို့နောက် အသစ်သောပတ်ဝန်းကျင်ဖြင့် ထပ်မံကြိုးစားပါ
azd env new dev-v2
azd up
```

### ❌ Template deployment taking too long

**ပုံမှန်စောင့်ဆိုင်းချိန်များ:**
- ရိုးရှင်းသော web app: 5-10 မိနစ်
- Database ပါသော app: 10-15 မိနစ်
- AI applications: 15-25 မိနစ် (OpenAI provisioning အချိန်ကြာသည်)

```bash
# တိုးတက်မှုကို စစ်ဆေးပါ
azd show

# ၃၀ မိနစ်ထက်ပိုကြာလျှင် Azure Portal ကို စစ်ဆေးပါ:
azd monitor
# မအောင်မြင်သော တပ်ဆင်မှုများကို ရှာပါ
```

### ❌ "Permission denied" or "Forbidden"

```bash
# သင်၏ Azure အခန်းကဏ္ဍကို စစ်ဆေးပါ
az role assignment list --assignee $(az account show --query user.name -o tsv)

# အနည်းဆုံး "Contributor" အခန်းကဏ္ဍလိုအပ်သည်
# သင်၏ Azure admin ကို အောက်ပါအခန်းကဏ္ဍများပေးရန် တောင်းဆိုပါ:
# - Contributor (အရင်းအမြစ်များအတွက်)
# - User Access Administrator (အခန်းကဏ္ဍပေးအပ်မှုများအတွက်)
```

### ❌ Can't find deployed application URL

```bash
# ဝန်ဆောင်မှုအဆုံးစွန်များအားလုံးကို ပြပါ
azd show

# ဒါမှမဟုတ် Azure Portal ကို ဖွင့်ပါ
azd monitor

# အထူးဝန်ဆောင်မှုကို စစ်ဆေးပါ
azd env get-values
# *_URL အပြောင်းအလဲများကို ရှာပါ
```

### 📚 ပြည့်စုံသော Troubleshooting အရင်းအမြစ်များ

- **Common Issues Guide:** [အသေးစိတ်ဖြေရှင်းနည်းများ](docs/troubleshooting/common-issues.md)
- **AI-Specific Issues:** [AI Troubleshooting](docs/troubleshooting/ai-troubleshooting.md)
- **Debugging Guide:** [အဆင့်လိုက် Debugging](docs/troubleshooting/debugging.md)
- **Get Help:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🔧 အမြန်ပြုပြင်နည်းလမ်းညွှန်

**အသစ်စတင်သူများရင်ဆိုင်ရသော အများဆုံးပြဿနာများနှင့် ချက်ချင်းဖြေရှင်းနည်းများ**

<details>
<summary><strong>❌ "azd: command not found"</strong></summary>

```bash
# AZD ကို အရင်ဆုံး ထည့်သွင်းပါ
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# ထည့်သွင်းမှုကို အတည်ပြုပါ
azd version
```
</details>

<details>
<summary><strong>❌ "No subscription found" or "Subscription not set"</strong></summary>

```bash
# ရရှိနိုင်သော subscription များစာရင်း
az account list --output table

# ပုံသေ subscription သတ်မှတ်ပါ
az account set --subscription "<subscription-id-or-name>"

# AZD ပတ်ဝန်းကျင်အတွက် သတ်မှတ်ပါ
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# အတည်ပြုပါ
az account show
```
</details>

<details>
<summary><strong>❌ "InsufficientQuota" or "Quota exceeded"</strong></summary>

```bash
# အခြား Azure ဒေသကို စမ်းကြည့်ပါ
azd env set AZURE_LOCATION "westus2"
azd up

# သို့မဟုတ် ဖွံ့ဖြိုးရေးတွင် သေးငယ်သော SKU များကို အသုံးပြုပါ
# infra/main.parameters.json ကို တည်းဖြတ်ပါ:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" fails halfway through</strong></summary>

```bash
# အရွေးချယ်မှု ၁: သန့်စင်ပြီး ထပ်မံကြိုးစားပါ
azd down --force --purge
azd up

# အရွေးချယ်မှု ၂: အခြေခံအဆောက်အအုံကိုသာ ပြင်ဆင်ပါ
azd provision

# အရွေးချယ်မှု ၃: အသေးစိတ်မှတ်တမ်းများကို စစ်ဆေးပါ
azd show
azd logs
```
</details>

<details>
<summary><strong>❌ "Authentication failed" or "Token expired"</strong></summary>

```bash
# ပြန်လည်အတည်ပြုပါ
az logout
az login

azd auth logout
azd auth login

# အတည်ပြုမှုကိုစစ်ဆေးပါ
az account show
```
</details>

<details>
<summary><strong>❌ "Resource already exists" or naming conflicts</strong></summary>

```bash
# AZD သည် ထူးခြားသောအမည်များကို ဖန်တီးပေးသည်၊ သို့သော် အကြောင်းပြချက်ရှိပါက:
azd down --force --purge

# ထို့နောက် အသစ်သောပတ်ဝန်းကျင်ဖြင့် ထပ်မံကြိုးစားပါ။
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Template deployment taking too long</strong></summary>

**ပုံမှန်စောင့်ဆိုင်းချိန်များ:**
- ရိုးရှင်းသော web app: 5-10 မိနစ်
- Database ပါသော app: 10-15 မိနစ်
- AI applications: 15-25 မိနစ် (OpenAI provisioning အချိန်ကြာသည်)

```bash
# တိုးတက်မှုကို စစ်ဆေးပါ
azd show

# ၃၀ မိနစ်ထက်ပိုကြာလျှင် Azure Portal ကို စစ်ဆေးပါ:
azd monitor
# မအောင်မြင်သော တပ်ဆင်မှုများကို ရှာပါ
```
</details>

<details>
<summary><strong>❌ "Permission denied" or "Forbidden"</strong></summary>

```bash
# သင်၏ Azure အခန်းကဏ္ဍကို စစ်ဆေးပါ
az role assignment list --assignee $(az account show --query user.name -o tsv)

# အနည်းဆုံး "Contributor" အခန်းကဏ္ဍလိုအပ်သည်
# သင်၏ Azure admin ကို အောက်ပါအခန်းကဏ္ဍများပေးရန် တောင်းဆိုပါ:
# - Contributor (အရင်းအမြစ်များအတွက်)
# - User Access Administrator (အခန်းကဏ္ဍပေးအပ်မှုများအတွက်)
```
</details>

<details>
<summary><strong>❌ Can't find deployed application URL</strong></summary>

```bash
# ဝန်ဆောင်မှုအဆုံးစွန်များအားလုံးကို ပြပါ
azd show

# ဒါမှမဟုတ် Azure Portal ကို ဖွင့်ပါ
azd monitor

# အထူးဝန်ဆောင်မှုကို စစ်ဆေးပါ
azd env get-values
# *_URL အပြောင်းအလဲများကို ရှာပါ
```
</details>

### 📚 ပြည့်စုံသော Troubleshooting အရင်းအမြစ်များ

- **Common Issues Guide:** [အသေးစိတ်ဖြေရှင်းနည်းများ](docs/troubleshooting/common-issues.md)
- **AI-Specific Issues:** [AI Troubleshooting](docs/troubleshooting/ai-troubleshooting.md)
- **Debugging Guide:** [အဆင့်လိုက် Debugging](docs/troubleshooting/debugging.md)
- **Get Help:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 သင်တန်းပြီးမြောက်မှုနှင့် လက်မှတ်

### တိုးတက်မှုကိုခြေရာခံခြင်း
အခန်းတစ်ခုချင်းစီတွင် သင်၏လေ့လာမှုတိုးတက်မှုကိုခြေရာခံပါ:

- [ ] **Chapter 1**: Foundation & Quick Start ✅
- [ ] **Chapter 2**: AI-First Development ✅  
- [ ] **Chapter 3**: Configuration & Authentication ✅
- [ ] **Chapter 4**: Infrastructure as Code & Deployment ✅
- [ ] **Chapter 5**: Multi-Agent AI Solutions ✅
- [ ] **Chapter 6**: Pre-Deployment Validation & Planning ✅
- [ ] **Chapter 7**: Troubleshooting & Debugging ✅
- [ ] **Chapter 8**: Production & Enterprise Patterns ✅

### သင်ယူမှုအတည်ပြုခြင်း
အခန်းတစ်ခုပြီးမြောက်ပြီးနောက် သင်၏အသိပညာကိုအတည်ပြုရန်:
1. **Practical Exercise**: အခန်း၏ လက်တွေ့ deployment ကိုပြီးမြောက်ပါ
2. **Knowledge Check**: အခန်း၏ FAQ အပိုင်းကိုပြန်လည်သုံးသပ်ပါ
3. **Community Discussion**: Azure Discord တွင် သင်၏အတွေ့အကြုံကိုမျှဝေပါ
4. **Next Chapter**: နောက်ထပ်အဆင့်တိုးတက်မှုအဆင့်သို့ ရောက်ပါ

### သင်တန်းပြီးမြောက်မှုအကျိုးကျေးဇူးများ
အခန်းအားလုံးပြီးမြောက်ပြီးနောက် သင်သည်:
- **Production Experience**: Azure တွင် အမှန်တကယ် AI applications ကို deploy လုပ်ပြီး
- **Professional Skills**: Enterprise-ready deployment စွမ်းရည်များ  
- **Community Recognition**: Azure developer community ၏ အကျိုးရှိသောအဖွဲ့ဝင်
- **Career Advancement**: AZD နှင့် AI deployment expertise အတွက် အလုပ်အကိုင်တိုးတက်မှု

---

## 🤝 Community & Support

### အကူအညီနှင့်ထောက်ခံမှုရယူရန်
- **Technical Issues**: [Report bugs and request features](https://github.com/microsoft/azd-for-beginners/issues)
- **Learning Questions**: [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure) နှင့် [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI-Specific Help**: [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG) တွင်ပါဝင်ပါ
- **Documentation**: [Official Azure Developer CLI documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Microsoft Foundry Discord မှ Community Insights

**#Azure Channel မှ မဲပေးရလဒ်များ:**
- **45%** AZD ကို AI workloads အတွက်အသုံးပြုလိုသည်
- **Top challenges**: Multi-service deployments, credential management, production readiness  
- **Most requested**: AI-specific templates, troubleshooting guides, best practices

**ကျွန်ုပ်တို့၏ community တွင်ပါဝင်ရန်:**
- သင့် AZD + AI အတွေ့အကြုံများကိုမျှဝေပြီး အကူအညီရယူပါ
- AI templates အသစ်များ၏ early previews ကိုရယူပါ
- AI deployment best practices တွင် ပါဝင်ပါ
- အနာဂတ် AI + AZD feature development ကိုသက်ရောက်မှုရှိစေပါ

### သင်တန်းအတွက် အထောက်အကူပြုခြင်း
ကျွန်ုပ်တို့သည် အထောက်အကူပြုမှုများကိုကြိုဆိုပါသည်! [Contributing Guide](CONTRIBUTING.md) ကိုဖတ်ရှုပြီး အောက်ပါအကြောင်းအရာများအတွက် အသေးစိတ်ကိုသိပါ:
- **Content Improvements**: ရှိပြီးသားအခန်းများနှင့် ဥပမာများကိုတိုးတက်အောင်လုပ်ပါ
- **New Examples**: အမှန်တကယ်အခြေအနေများနှင့် templates အသစ်များထည့်ပါ  
- **Translation**: Multi-language support ကိုထိန်းသိမ်းရန်အကူအညီပေးပါ
- **Bug Reports**: တိကျမှုနှင့်ရှင်းလင်းမှုကိုတိုးတက်အောင်လုပ်ပါ
- **Community Standards**: ကျွန်ုပ်တို့၏ အကျိုးရှိသော community guidelines ကိုလိုက်နာပါ

---

## 📄 သင်တန်းအချက်အလက်

### License
ဤပရောဂျက်သည် MIT License အောက်တွင် licensed ဖြစ်သည် - အသေးစိတ်အချက်အလက်များအတွက် [LICENSE](../../LICENSE) ဖိုင်ကိုကြည့်ပါ။

### Microsoft Learning Resources နှင့်ဆက်စပ်

ကျွန်ုပ်တို့၏အဖွဲ့သည် အခြား comprehensive learning courses များကိုထုတ်လုပ်ပါသည်:

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
[![IoT အခြေခံသင်ခန်းစာများ](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR အခြေခံသင်ခန်းစာများ](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---

### Copilot စီးရီး
[![AI နှင့်အတူ Copilot Programming](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![C#/.NET အတွက် Copilot](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot စွန့်စားမှု](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ သင်ခန်းစာ လမ်းညွှန်

**🚀 သင်ကြားမှုကို စတင်ရန် အဆင်သင့်ဖြစ်ပါပြီလား?**

**အခြေခံသင်ကြားသူများ**: [အခန်း ၁: အခြေခံနှင့် အမြန်စတင်ခြင်း](../..) မှ စတင်ပါ  
**AI ဖွံ့ဖြိုးရေးသူများ**: [အခန်း ၂: AI-First ဖွံ့ဖြိုးမှု](../..) သို့ တိုက်ရိုက်သွားပါ  
**အတွေ့အကြုံရှိ ဖွံ့ဖြိုးရေးသူများ**: [အခန်း ၃: Configuration & Authentication](../..) မှ စတင်ပါ

**နောက်တစ်ဆင့်**: [အခန်း ၁ - AZD အခြေခံများ စတင်ပါ](docs/getting-started/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**အကြောင်းကြားချက်**:  
ဤစာရွက်စာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ကို အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှုအတွက် ကြိုးစားနေသော်လည်း အလိုအလျောက် ဘာသာပြန်မှုများတွင် အမှားများ သို့မဟုတ် မမှန်ကန်မှုများ ပါဝင်နိုင်သည်ကို သတိပြုပါ။ မူရင်းဘာသာစကားဖြင့် ရေးသားထားသော စာရွက်စာတမ်းကို အာဏာတရ အရင်းအမြစ်အဖြစ် သတ်မှတ်သင့်ပါသည်။ အရေးကြီးသော အချက်အလက်များအတွက် လူက ဘာသာပြန်မှုကို အသုံးပြုရန် အကြံပြုပါသည်။ ဤဘာသာပြန်မှုကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော အလွဲအမှားများ သို့မဟုတ် အနားလွဲမှုများအတွက် ကျွန်ုပ်တို့သည် တာဝန်မယူပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->