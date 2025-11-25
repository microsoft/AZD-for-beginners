<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6a804be263d09a0fd6f36d6ab251707a",
  "translation_date": "2025-11-25T12:50:44+00:00",
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
4. **သင်ကြားမှုလမ်းကြောင်းကို ရွေးချယ်ပါ**: အောက်ပါအခန်းများထဲမှ သင့်အတွေ့အကြုံအဆင့်နှင့် ကိုက်ညီသောအခန်းကို ရွေးချယ်ပါ။

### ဘာသာစကားအမျိုးမျိုးအတွက် ပံ့ပိုးမှု

#### အလိုအလျောက် ဘာသာပြန်ခြင်း (အမြဲနောက်ဆုံးပေါ်)

[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](./README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../br/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

## သင်တန်းအကျဉ်းချုပ်

Azure Developer CLI (azd) ကို အဆင့်ဆင့်သင်ကြားမှုအခန်းများမှတဆင့် ကျွမ်းကျင်ပါ။ **Microsoft Foundry နှင့်ပေါင်းစပ်ပြီး AI အပလီကေးရှင်းများကို တင်သွင်းခြင်းအပေါ် အထူးအာရုံစိုက်ထားသည်။**

### ဒီသင်တန်းက အခေတ်မီ Developer များအတွက် အရေးကြီးတဲ့အကြောင်း

Microsoft Foundry Discord အသိုင်းအဝိုင်းမှ အချက်အလက်အရ **Developer များ၏ ၄၅% သည် AZD ကို AI workload များအတွက် အသုံးပြုလိုကြသည်**။ သို့သော် အောက်ပါအခက်အခဲများကြောင့် ရင်ဆိုင်နေရသည်-
- AI ဝန်ဆောင်မှုများစွာပါဝင်သော architecture များ၏ ရှုပ်ထွေးမှု
- AI ကို production အဆင့်သို့ တင်သွင်းရာတွင် အကောင်းဆုံးလက်တွေ့ကျသောနည်းလမ်းများ
- Azure AI ဝန်ဆောင်မှုများနှင့် ပေါင်းစပ်ခြင်းနှင့် ဖွဲ့စည်းခြင်း
- AI workload များအတွက် ကုန်ကျစရိတ်ကို လျှော့ချခြင်း
- AI အထူး deployment ပြဿနာများကို ဖြေရှင်းခြင်း

### သင်ကြားမှုရည်မှန်းချက်များ

ဒီသင်တန်းကို ပြီးမြောက်စွာတက်ရောက်ပြီးပါက၊ သင်သည်-
- **AZD အခြေခံများကို ကျွမ်းကျင်ပါမည်**: အဓိကအကြောင်းအရာများ၊ ထည့်သွင်းခြင်းနှင့် ဖွဲ့စည်းခြင်း
- **AI အပလီကေးရှင်းများကို တင်သွင်းပါမည်**: AZD ကို Microsoft Foundry ဝန်ဆောင်မှုများနှင့် အသုံးပြုခြင်း
- **Infrastructure as Code ကို အကောင်အထည်ဖော်ပါမည်**: Bicep template များဖြင့် Azure အရင်းအမြစ်များကို စီမံခန့်ခွဲခြင်း
- **Deployment များကို ပြဿနာဖြေရှင်းပါမည်**: ရှိသမျှပြဿနာများကို ဖြေရှင်းခြင်းနှင့် debugging ပြုလုပ်ခြင်း
- **Production အတွက် အကောင်းဆုံးဖြစ်အောင် ပြုလုပ်ပါမည်**: လုံခြုံရေး၊ အတိုင်းအတာချိန်ညှိခြင်း၊ စောင့်ကြည့်ခြင်းနှင့် ကုန်ကျစရိတ်စီမံခန့်ခွဲမှု
- **Multi-Agent ဖြေရှင်းချက်များကို တည်ဆောက်ပါမည်**: ရှုပ်ထွေးသော AI architecture များကို တင်သွင်းခြင်း

## 📚 သင်ကြားမှုအခန်းများ

*သင့်အတွေ့အကြုံအဆင့်နှင့် ရည်မှန်းချက်များအပေါ်မူတည်၍ သင်ကြားမှုလမ်းကြောင်းကို ရွေးချယ်ပါ*

### 🚀 အခန်း ၁: အခြေခံနှင့် အမြန်စတင်ခြင်း
**လိုအပ်ချက်များ**: Azure subscription, command line အခြေခံအသိ  
**ကြာချိန်**: ၃၀-၄၅ မိနစ်  
**ရှုပ်ထွေးမှုအဆင့်**: ⭐

#### သင်လေ့လာမည့်အရာများ
- Azure Developer CLI အခြေခံများကို နားလည်ခြင်း
- သင့်ပလက်ဖောင်းပေါ်တွင် AZD ကို ထည့်သွင်းခြင်း
- သင့်ရဲ့ ပထမဆုံးအောင်မြင်သော deployment

#### သင်ကြားမှုအရင်းအမြစ်များ
- **🎯 ဒီနေရာမှ စတင်ပါ**: [Azure Developer CLI ဆိုတာဘာလဲ?](../..)
- **📖 သီအိုရီ**: [AZD အခြေခံများ](docs/getting-started/azd-basics.md) - အဓိကအကြောင်းအရာများနှင့် အသုံးအနှုန်းများ
- **⚙️ Setup**: [Installation & Setup](docs/getting-started/installation.md) - ပလက်ဖောင်းအလိုက် လမ်းညွှန်ချက်များ
- **🛠️ လက်တွေ့လုပ်ဆောင်မှု**: [သင့်ရဲ့ ပထမဆုံး Project](docs/getting-started/first-project.md) - အဆင့်ဆင့်လမ်းညွှန်ချက်
- **📋 အမြန်ကိုးကားချက်**: [Command Cheat Sheet](resources/cheat-sheet.md)

#### လက်တွေ့လေ့ကျင့်မှုများ
```bash
# အမြန်တင်သွင်းမှုစစ်ဆေးခြင်း
azd version

# သင့်ရဲ့ပထမဆုံးအက်ပလီကေးရှင်းကိုဖြန့်ဝေပါ
azd init --template todo-nodejs-mongo
azd up
```

**💡 အခန်းရလဒ်**: AZD ကို အသုံးပြု၍ Azure ပေါ်တွင် ရိုးရှင်းသော web application တစ်ခုကို အောင်မြင်စွာ တင်သွင်းနိုင်ခြင်း

**✅ အောင်မြင်မှုအတည်ပြုချက်**:
```bash
# အခန်း ၁ ကိုပြီးမြောက်ပြီးနောက်တွင် သင်တစ်ဦးတည်းလုပ်နိုင်ရမည်မှာ-
azd version              # တပ်ဆင်ထားသော ဗားရှင်းကို ပြသသည်
azd init --template todo-nodejs-mongo  # ပရောဂျက်ကို စတင်သည်
azd up                  # Azure သို့ တင်ပို့သည်
azd show                # လည်ပတ်နေသော app URL ကို ပြသသည်
# အက်ပလီကေးရှင်းသည် browser တွင် ဖွင့်ပြီး အလုပ်လုပ်သည်
azd down --force --purge  # အရင်းအမြစ်များကို ရှင်းလင်းသည်
```

**📊 အချိန်ရင်းနှီးမှု**: ၃၀-၄၅ မိနစ်  
**📈 အတန်းအဆင့်ပြီးနောက်**: ရိုးရှင်းသော application များကို ကိုယ်တိုင်တင်သွင်းနိုင်ခြင်း

**✅ အောင်မြင်မှုအတည်ပြုချက်**:
```bash
# အခန်း ၁ ကိုပြီးမြောက်ပြီးနောက်တွင် သင်တော်တော်လေးတတ်နိုင်ပါမည်။
azd version              # တပ်ဆင်ထားသော ဗားရှင်းကို ပြသသည်။
azd init --template todo-nodejs-mongo  # ပရောဂျက်ကို စတင်သည်။
azd up                  # Azure သို့ တင်ပို့သည်။
azd show                # လည်ပတ်နေသော app URL ကို ပြသသည်။
# အက်ပလီကေးရှင်းသည် browser တွင် ဖွင့်ပြီး အလုပ်လုပ်သည်။
azd down --force --purge  # အရင်းအမြစ်များကို ရှင်းလင်းသည်။
```

**📊 အချိန်ရင်းနှီးမှု**: ၃၀-၄၅ မိနစ်  
**📈 အတန်းအဆင့်ပြီးနောက်**: ရိုးရှင်းသော application များကို ကိုယ်တိုင်တင်သွင်းနိုင်ခြင်း

---

### 🤖 အခန်း ၂: AI-First Development (AI Developer များအတွက် အကြံပြုသည်)
**လိုအပ်ချက်များ**: အခန်း ၁ ပြီးစီးထားရမည်  
**ကြာချိန်**: ၁-၂ နာရီ  
**ရှုပ်ထွေးမှုအဆင့်**: ⭐⭐

#### သင်လေ့လာမည့်အရာများ
- Microsoft Foundry နှင့် AZD ပေါင်းစပ်ခြင်း
- AI-powered application များကို တင်သွင်းခြင်း
- AI ဝန်ဆောင်မှုဖွဲ့စည်းမှုများကို နားလည်ခြင်း

#### သင်ကြားမှုအရင်းအမြစ်များ
- **🎯 ဒီနေရာမှ စတင်ပါ**: [Microsoft Foundry Integration](docs/microsoft-foundry/microsoft-foundry-integration.md)
- **📖 Patterns**: [AI Model Deployment](docs/microsoft-foundry/ai-model-deployment.md) - AI မော်ဒယ်များကို တင်သွင်းခြင်းနှင့် စီမံခန့်ခွဲခြင်း
- **🛠️ Workshop**: [AI Workshop Lab](docs/microsoft-foundry/ai-workshop-lab.md) - သင့် AI ဖြေရှင်းချက်များကို AZD-ready ဖြစ်အောင် ပြုလုပ်ခြင်း
- **🎥 Interactive Guide**: [Workshop Materials](workshop/README.md) - Browser-based learning with MkDocs * DevContainer Environment
- **📋 Templates**: [Microsoft Foundry Templates](../..)
- **📝 Examples**: [AZD Deployment Examples](examples/README.md)

#### လက်တွေ့လေ့ကျင့်မှုများ
```bash
# သင့်ရဲ့ပထမဆုံး AI အက်ပလီကေးရှင်းကို တင်သွင်းပါ
azd init --template azure-search-openai-demo
azd up

# အပို AI အခြေခံပုံစံများကို စမ်းသုံးပါ
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 အခန်းရလဒ်**: RAG စွမ်းရည်များပါဝင်သော AI-powered chat application တစ်ခုကို တင်သွင်းပြီး ဖွဲ့စည်းနိုင်ခြင်း

**✅ အောင်မြင်မှုအတည်ပြုချက်**:
```bash
# အခန်း ၂ ပြီးနောက်တွင် သင်တော်တော်လေးတတ်နိုင်ရမည်မှာ
azd init --template azure-search-openai-demo
azd up
# AI စကားပြောအင်တာဖေ့စ်ကို စမ်းသပ်ပါ
# မေးခွန်းများမေးပြီး အရင်းအမြစ်များပါဝင်သော AI အားဖြင့်ဖြေကြားမှုများရယူပါ
# ရှာဖွေမှုပေါင်းစည်းမှုအလုပ်လုပ်မှုကို အတည်ပြုပါ
azd monitor  # Application Insights တွင် တယ်လီမီတာကို ပြသမှုကို စစ်ဆေးပါ
azd down --force --purge
```

**📊 အချိန်ရင်းနှီးမှု**: ၁-၂ နာရီ  
**📈 အတန်းအဆင့်ပြီးနောက်**: Production-ready AI application များကို တင်သွင်းပြီး ဖွဲ့စည်းနိုင်ခြင်း  
**💰 ကုန်ကျစရိတ်သိရှိမှု**: $80-150/လ dev ကုန်ကျစရိတ်၊ $300-3500/လ production ကုန်ကျစရိတ်ကို နားလည်ခြင်း

#### 💰 AI Deployment များအတွက် ကုန်ကျစရိတ်စဉ်းစားမှု

**Development ပတ်ဝန်းကျင် (ခန့်မှန်း $80-150/လ):**
- Azure OpenAI (Pay-as-you-go): $0-50/လ (token အသုံးပြုမှုအပေါ်မူတည်)
- AI Search (Basic tier): $75/လ
- Container Apps (Consumption): $0-20/လ
- Storage (Standard): $1-5/လ

**Production ပတ်ဝန်းကျင် (ခန့်မှန်း $300-3,500+/လ):**
- Azure OpenAI (PTU for consistent performance): $3,000+/လ OR Pay-as-go with high volume
- AI Search (Standard tier): $250/လ
- Container Apps (Dedicated): $50-100/လ
- Application Insights: $5-50/လ
- Storage (Premium): $10-50/လ

**💡 ကုန်ကျစရိတ်လျှော့ချရန် အကြံပြုချက်များ:**
- သင်ကြားမှုအတွက် **Free Tier** Azure OpenAI ကို အသုံးပြုပါ (50,000 tokens/လ ပါဝင်သည်)
- `azd down` ကို အသုံးပြု၍ ဖွံ့ဖြိုးမှုမလုပ်နေချိန်တွင် အရင်းအမြစ်များကို deallocate လုပ်ပါ
- Consumption-based billing ဖြင့် စတင်ပြီး production အတွက်သာ PTU ကို အဆင့်မြှင့်ပါ
- Deployment မပြုမီ `azd provision --preview` ကို အသုံးပြု၍ ကုန်ကျစရိတ်ကို ခန့်မှန်းပါ
- Auto-scaling ကို ဖွင့်ပါ: အသုံးပြုမှုအတိုင်းသာ ပေးဆောင်ပါ

**ကုန်ကျစရိတ်စောင့်ကြည့်မှု:**
```bash
# ခန့်မှန်းထားသော လစဉ်ကုန်ကျစရိတ်များကို စစ်ဆေးပါ
azd provision --preview

# Azure Portal တွင် အမှန်တကယ်ကုန်ကျစရိတ်များကို ကြည့်ရှုပါ
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ အခန်း ၃: Configuration & Authentication
**လိုအပ်ချက်များ**: အခန်း ၁ ပြီးစီးထားရမည်  
**ကြာချိန်**: ၄၅-၆၀ မိနစ်  
**ရှုပ်ထွေးမှုအဆင့်**: ⭐⭐

#### သင်လေ့လာမည့်အရာများ
- ပတ်ဝန်းကျင်ဖွဲ့စည်းမှုနှင့် စီမံခန့်ခွဲမှု
- Authentication နှင့် လုံခြုံရေးအကောင်းဆုံးနည်းလမ်းများ
- အရင်းအမြစ်အမည်ပေးခြင်းနှင့် ဖွဲ့စည်းမှု

#### သင်ကြားမှုအရင်းအမြစ်များ
- **📖 Configuration**: [Configuration Guide](docs/getting-started/configuration.md) - ပတ်ဝန်းကျင်ဖွဲ့စည်းမှု
- **🔐 Security**: [Authentication patterns and managed identity](docs/getting-started/authsecurity.md) - Authentication နည်းလမ်းများ
- **📝 Examples**: [Database App Example](examples/database-app/README.md) - AZD Database ตัวอย่าง

#### လက်တွေ့လေ့ကျင့်မှုများ
- ပတ်ဝန်းကျင်များ (dev, staging, prod) ကို ဖွဲ့စည်းပါ
- Managed identity authentication ကို စတင်ပါ
- ပတ်ဝန်းကျင်အလိုက် ဖွဲ့စည်းမှုများကို အကောင်အထည်ဖော်ပါ

**💡 အခန်းရလဒ်**: လုံခြုံရေးနှင့် authentication မှန်ကန်စွာဖြင့် ပတ်ဝန်းကျင်များစီမံနိုင်ခြင်း

---

### 🏗️ အခန်း ၄: Infrastructure as Code & Deployment
**လိုအပ်ချက်များ**: အခန်း ၁-၃ ပြီးစီးထားရမည်  
**ကြာချိန်**: ၁-၁.၅ နာရီ  
**ရှုပ်ထွေးမှုအဆင့်**: ⭐⭐⭐

#### သင်လေ့လာမည့်အရာများ
- အဆင့်မြင့် deployment နည်းလမ်းများ
- **🛠️ ARM Templates**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - တစ်ချက်တည်းနှိပ်ပြီး deploy လုပ်နိုင်ပါသည်။
- **📖 Architecture**: [Multi-agent coordination patterns](/docs/pre-deployment/coordination-patterns.md) - ပုံစံများ

#### လက်တွေ့လေ့ကျင့်မှုများ
```bash
# စျေးဝယ်ရေး များ Agent ဖြေရှင်းချက် အပြည့်အစုံကို တင်သွင်းပါ
cd examples/retail-multiagent-arm-template
./deploy.sh

# Agent configuration များကို စူးစမ်းပါ
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Chapter Outcome**: Customer နှင့် Inventory agents များပါဝင်သော production-ready multi-agent AI solution ကို deploy လုပ်ပြီး စီမံခန့်ခွဲခြင်း။

---

### 🔍 Chapter 6: Pre-Deployment Validation & Planning
**လိုအပ်ချက်များ**: Chapter 4 အပြီး  
**ကြာမြင့်ချိန်**: ၁ နာရီ  
**အဆင့်**: ⭐⭐

#### သင်ယူရမည့်အရာများ
- စွမ်းဆောင်ရည်စီမံခန့်ခွဲမှုနှင့် resource အတည်ပြုခြင်း
- SKU ရွေးချယ်မှုနည်းလမ်းများ
- Pre-flight checks နှင့် automation

#### သင်ယူရန်အရင်းအမြစ်များ
- **📊 Planning**: [Capacity Planning](docs/pre-deployment/capacity-planning.md) - Resource အတည်ပြုခြင်း
- **💰 Selection**: [SKU Selection](docs/pre-deployment/sku-selection.md) - စျေးနှုန်းသက်သာသောရွေးချယ်မှုများ
- **✅ Validation**: [Pre-flight Checks](docs/pre-deployment/preflight-checks.md) - Automated scripts

#### လက်တွေ့လေ့ကျင့်မှုများ
- စွမ်းဆောင်ရည်အတည်ပြု scripts များ run လုပ်ပါ။
- SKU ရွေးချယ်မှုများကို စျေးနှုန်းသက်သာအောင် optimize လုပ်ပါ။
- Automated pre-deployment checks များကို အကောင်အထည်ဖော်ပါ။

**💡 Chapter Outcome**: Deploy လုပ်မည့်အချိန်မတိုင်မီ အတည်ပြုခြင်းနှင့် optimize လုပ်ခြင်း။

---

### 🚨 Chapter 7: Troubleshooting & Debugging
**လိုအပ်ချက်များ**: Deployment chapter မည်သည့် chapter မဆို အပြီး  
**ကြာမြင့်ချိန်**: ၁-၁.၅ နာရီ  
**အဆင့်**: ⭐⭐

#### သင်ယူရမည့်အရာများ
- Debugging နည်းလမ်းများကို စနစ်တကျအသုံးပြုခြင်း
- အများဆုံးဖြစ်လေ့ရှိသောပြဿနာများနှင့် ဖြေရှင်းနည်းများ
- AI-specific troubleshooting

#### သင်ယူရန်အရင်းအမြစ်များ
- **🔧 Common Issues**: [Common Issues](docs/troubleshooting/common-issues.md) - FAQ နှင့် ဖြေရှင်းနည်းများ
- **🕵️ Debugging**: [Debugging Guide](docs/troubleshooting/debugging.md) - အဆင့်ဆင့်နည်းလမ်းများ
- **🤖 AI Issues**: [AI-Specific Troubleshooting](docs/troubleshooting/ai-troubleshooting.md) - AI service ပြဿနာများ

#### လက်တွေ့လေ့ကျင့်မှုများ
- Deployment failure များကို diagnose လုပ်ပါ။
- Authentication ပြဿနာများကို ဖြေရှင်းပါ။
- AI service connectivity ကို debug လုပ်ပါ။

**💡 Chapter Outcome**: Deployment ပြဿနာများကို ကိုယ်တိုင် diagnose လုပ်ပြီး ဖြေရှင်းနိုင်ခြင်း။

---

### 🏢 Chapter 8: Production & Enterprise Patterns
**လိုအပ်ချက်များ**: Chapters 1-4 အပြီး  
**ကြာမြင့်ချိန်**: ၂-၃ နာရီ  
**အဆင့်**: ⭐⭐⭐⭐

#### သင်ယူရမည့်အရာများ
- Production deployment နည်းလမ်းများ
- Enterprise security patterns
- Monitoring နှင့် စျေးနှုန်း optimize လုပ်ခြင်း

#### သင်ယူရန်အရင်းအမြစ်များ
- **🏭 Production**: [Production AI Best Practices](docs/microsoft-foundry/production-ai-practices.md) - Enterprise patterns
- **📝 Examples**: [Microservices Example](../../examples/microservices) - Architecture များ
- **📊 Monitoring**: [Application Insights integration](docs/pre-deployment/application-insights.md) - Monitoring

#### လက်တွေ့လေ့ကျင့်မှုများ
- Enterprise security patterns များကို အကောင်အထည်ဖော်ပါ။
- Monitoring ကို စုံလင်စွာတပ်ဆင်ပါ။
- Governance အပြည့်အစုံဖြင့် production သို့ deploy လုပ်ပါ။

**💡 Chapter Outcome**: Enterprise-ready application များကို production capabilities အပြည့်အစုံဖြင့် deploy လုပ်နိုင်ခြင်း။

---

## 🎓 Workshop Overview: လက်တွေ့လေ့လာမှုအတွေ့အကြုံ

> **⚠️ WORKSHOP STATUS: Active Development**  
> Workshop materials များကို လက်ရှိအခြေအနေတွင် ဖွံ့ဖြိုးတိုးတက်စေခြင်းနှင့် ပြုပြင်မွမ်းမံနေပါသည်။ Core modules များကို အသုံးပြုနိုင်ပြီး advanced sections များအချို့မှာ မပြီးစီးသေးပါ။ [Track progress →](workshop/README.md)

### Interactive Workshop Materials
**Browser-based tools နှင့် guided exercises များဖြင့် လက်တွေ့လေ့လာမှုကို အပြည့်အဝခံစားနိုင်ပါသည်။**

Workshop materials များသည် chapter-based curriculum ကို ဖြည့်စွက်ပေးသော structured, interactive learning အတွေ့အကြုံကို ပေးစွမ်းပါသည်။ Workshop သည် ကိုယ်တိုင်လေ့လာမှုနှင့် သင်တန်းဆရာများအကြောင်းအရာကို အထောက်အကူပြုရန် ရည်ရွယ်ထားပါသည်။

#### 🛠️ Workshop Features
- **Browser-Based Interface**: MkDocs-powered workshop ကို search, copy, နှင့် theme features များဖြင့် ပြုလုပ်ထားသည်။
- **GitHub Codespaces Integration**: Development environment ကို တစ်ချက်တည်းနှိပ်ပြီး setup လုပ်နိုင်သည်။
- **Structured Learning Path**: ၇-အဆင့် guided exercises (3.5 နာရီ စုစုပေါင်း)
- **Discovery → Deployment → Customization**: Progressive methodology
- **Interactive DevContainer Environment**: Tools နှင့် dependencies များကို pre-configured ပြုလုပ်ထားသည်။

#### 📚 Workshop Structure
Workshop သည် **Discovery → Deployment → Customization** methodology ကို လိုက်နာပါသည်။

1. **Discovery Phase** (၄၅ မိနစ်)
   - Microsoft Foundry templates နှင့် services များကို ရှာဖွေပါ။
   - Multi-agent architecture patterns များကို နားလည်ပါ။
   - Deployment requirements နှင့် prerequisites များကို ပြန်လည်သုံးသပ်ပါ။

2. **Deployment Phase** (၂ နာရီ)
   - AZD ဖြင့် AI applications များကို လက်တွေ့ deploy လုပ်ပါ။
   - Azure AI services နှင့် endpoints များကို configure လုပ်ပါ။
   - Security နှင့် authentication patterns များကို အကောင်အထည်ဖော်ပါ။

3. **Customization Phase** (၄၅ မိနစ်)
   - Specific use cases များအတွက် applications များကို ပြုပြင်ပါ။
   - Production deployment အတွက် optimize လုပ်ပါ။
   - Monitoring နှင့် cost management ကို အကောင်အထည်ဖော်ပါ။

#### 🚀 Getting Started with the Workshop
```bash
# အရွေးချယ်မှု ၁: GitHub Codespaces (အကြံပြုထားသည်)
# "Code" ကိုနှိပ်ပါ → "Create codespace on main" ကို repository တွင်ဖန်တီးပါ

# အရွေးချယ်မှု ၂: ဒေသတွင်းဖွံ့ဖြိုးမှု
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# workshop/README.md တွင် setup လမ်းညွှန်ချက်များကိုလိုက်နာပါ
```

#### 🎯 Workshop Learning Outcomes
Workshop ကို ပြီးမြောက်ပါက ပါဝင်သူများသည်:
- **Deploy Production AI Applications**: Microsoft Foundry services ဖြင့် AZD ကို အသုံးပြုပါ။
- **Master Multi-Agent Architectures**: Coordinated AI agent solutions များကို အကောင်အထည်ဖော်ပါ။
- **Implement Security Best Practices**: Authentication နှင့် access control ကို configure လုပ်ပါ။
- **Optimize for Scale**: စျေးနှုန်းသက်သာပြီး စွမ်းဆောင်ရည်မြင့်မားသော deployments များကို design လုပ်ပါ။
- **Troubleshoot Deployments**: Deployment ပြဿနာများကို ကိုယ်တိုင်ဖြေရှင်းနိုင်ပါ။

#### 📖 Workshop Resources
- **🎥 Interactive Guide**: [Workshop Materials](workshop/README.md) - Browser-based learning environment
- **📋 Step-by-Step Instructions**: [Guided Exercises](../../workshop/docs/instructions) - အသေးစိတ်လမ်းညွှန်ချက်များ
- **🛠️ AI Workshop Lab**: [AI Workshop Lab](docs/microsoft-foundry/ai-workshop-lab.md) - AI-focused exercises
- **💡 Quick Start**: [Workshop Setup Guide](workshop/README.md#quick-start) - Environment configuration

**သင့်တော်သောအရာများ**: Corporate training, university courses, ကိုယ်တိုင်လေ့လာမှုများနှင့် developer bootcamps များ။

---

## 📖 Azure Developer CLI ဆိုတာဘာလဲ?

Azure Developer CLI (azd) သည် application များကို Azure သို့ တိုးတက်မြန်ဆန်စွာ build လုပ်ခြင်းနှင့် deploy လုပ်ခြင်းအတွက် developer-centric command-line interface တစ်ခုဖြစ်သည်။ ၎င်းသည် အောက်ပါအရာများကို ပေးစွမ်းပါသည်။

- **Template-based deployments** - အများဆုံးအသုံးပြု application patterns များအတွက် pre-built templates များကို အသုံးပြုပါ။
- **Infrastructure as Code** - Bicep သို့မဟုတ် Terraform ကို အသုံးပြု၍ Azure resources များကို စီမံခန့်ခွဲပါ။
- **Integrated workflows** - Applications များကို provision, deploy, နှင့် monitor လုပ်ခြင်းကို seamless ပြုလုပ်ပါ။
- **Developer-friendly** - Developer productivity နှင့် အတွေ့အကြုံအတွက် optimize ပြုလုပ်ထားသည်။

### **AZD + Microsoft Foundry: AI Deployments အတွက် အကောင်းဆုံး**

**AI Solutions အတွက် AZD ကို ရွေးချယ်ရသည့်အကြောင်းရင်းများ**: AZD သည် AI developers များရင်ဆိုင်ရသော အဓိကအခက်အခဲများကို ဖြေရှင်းပေးပါသည်။

- **AI-Ready Templates** - Azure OpenAI, Cognitive Services, နှင့် ML workloads များအတွက် pre-configured templates
- **Secure AI Deployments** - AI services, API keys, နှင့် model endpoints များအတွက် built-in security patterns
- **Production AI Patterns** - Scalable, cost-effective AI application deployments အတွက် အကောင်းဆုံးနည်းလမ်းများ
- **End-to-End AI Workflows** - Model development မှ production deployment အထိ monitoring အပြည့်အစုံဖြင့်
- **Cost Optimization** - AI workloads များအတွက် resource allocation နှင့် scaling strategies
- **Microsoft Foundry Integration** - Microsoft Foundry model catalog နှင့် endpoints များသို့ seamless ချိတ်ဆက်မှု

---

## 🎯 Templates & Examples Library

### Featured: Microsoft Foundry Templates
**AI applications များကို deploy လုပ်ရန် ဒီနေရာမှ စတင်ပါ။**

> **Note:** ဒီ templates များသည် AI patterns များကို ပြသပေးပါသည်။ အချို့မှာ external Azure Samples ဖြစ်ပြီး အချို့မှာ local implementations ဖြစ်ပါသည်။

| Template | Chapter | Complexity | Services | Type |
|----------|---------|------------|----------|------|
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Chapter 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | External |
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Chapter 2 | ⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| External |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Chapter 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | External |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chapter 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | External |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Chapter 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | External |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Chapter 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | External |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Chapter 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Local** |

### Featured: Complete Learning Scenarios
**Production-ready application templates များကို learning chapters များနှင့် mapping ပြုလုပ်ထားသည်။**

| Template | Learning Chapter | Complexity | Key Learning |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chapter 2 | ⭐ | Basic AI deployment patterns |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Chapter 2 | ⭐⭐ | RAG implementation with Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Chapter 4 | ⭐⭐ | Document Intelligence integration |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Chapter 5 | ⭐⭐⭐ | Agent framework and function calling |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Chapter 8 | ⭐⭐⭐ | Enterprise AI orchestration |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Chapter 5 | ⭐⭐⭐⭐ | Multi-agent architecture with Customer and Inventory agents |

### Learning by Example Type

> **📌 Local vs. External Examples:**  
> **Local Examples** (ဒီ repo မှာ) = ချက်ချင်းအသုံးပြုနိုင်သည်  
> **External Examples** (Azure Samples) = Linked repositories မှ clone လုပ်ပါ။

#### Local Examples (Ready to Use)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - ARM templates ဖြင့် production-ready implementation
  - Multi-agent architecture (Customer + Inventory agents)
  - Comprehensive monitoring နှင့် အကဲဖြတ်ခြင်း
  - ARM template ဖြင့် တစ်ချက်တည်းနှိပ်ပြီး deploy လုပ်နိုင်သည်။

#### Local Examples - Container Applications (Chapters 2-5)
**ဒီ repository မှာ Comprehensive container deployment examples များ:**
- [**Container App Examples**](examples/container-app/README.md) - Containerized deployments အတွက် လမ်းညွှန်ချက်များ
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - Basic REST API with scale-to-zero
  - [Microservices Architecture](../../examples/container-app/microservices) - Production-ready multi-service deployment
  - Quick Start, Production, နှင့် Advanced deployment patterns
  - Monitoring, security, နှင့် cost optimization လမ်းညွှန်ချက်များ

#### External Examples - Simple Applications (Chapters 1-2)
**Azure Samples repositories များကို clone လုပ်ပြီး စတင်ပါ:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Basic deployment patterns
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Static content deployment
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API deployment

#### External Examples - Database Integration (Chapter 3-4)  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Database connectivity patterns
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverless data workflow

#### External Examples - Advanced Patterns (Chapters 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - Multi-service architectures
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Background processing  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Production-ready ML patterns

### External Template Collections
- [**Official AZD Template Gallery**](https://azure.github.io/awesome-azd/) - Official နှင့် community templates များကို စုစည်းထားသည်။
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn template documentation
- [**Examples Directory**](examples/README.md) - Local learning examples များနှင့် အသေးစိတ်ရှင်းလင်းချက်များ

---

## 📚 Learning Resources & References

### Quick References
- [**Command Cheat Sheet**](resources/cheat-sheet.md) - အခန်းအလိုက် စီစဉ်ထားသော azd အမိန့်များ
- [**Glossary**](resources/glossary.md) - Azure နှင့် azd အဓိပ္ပါယ်များ  
- [**FAQ**](resources/faq.md) - အခန်းအလိုက် စီစဉ်ထားသော မေးခွန်းများ
- [**Study Guide**](resources/study-guide.md) - လေ့ကျင့်ခန်းများကို အပြည့်အစုံ

### လက်တွေ့ လေ့ကျင့်ခန်းများ
- [**AI Workshop Lab**](docs/microsoft-foundry/ai-workshop-lab.md) - AI ဖြေရှင်းချက်များကို AZD ဖြင့် deploy လုပ်နိုင်ရန် (2-3 နာရီ)
- [**Interactive Workshop Guide**](workshop/README.md) - MkDocs နှင့် DevContainer Environment ဖြင့် browser-based workshop
- [**Structured Learning Path**](../../workshop/docs/instructions) - 7-အဆင့် လမ်းညွှန်လေ့ကျင့်ခန်းများ (Discovery → Deployment → Customization)
- [**AZD For Beginners Workshop**](workshop/README.md) - GitHub Codespaces အထောက်အပံ့ပါသော လက်တွေ့ workshop အထောက်အပံ့များ

### အပြင်ပညာရေး အရင်းအမြစ်များ
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

---

## 🔧 အမြန် ပြဿနာဖြေရှင်း လမ်းညွှန်

**အသစ်စတင်သူများ ကြုံတွေ့နိုင်သော ပြဿနာများနှင့် ချက်ချင်း ဖြေရှင်းနည်းများ**

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
# ရရှိနိုင်သော subscription များစာရင်းပြပါ
az account list --output table

# ပုံမှန် subscription ကို သတ်မှတ်ပါ
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
# infra/main.parameters.json ကို တည်းဖြတ်ပါ:
{
  "sku": "B1"  // Instead of "P1V2"
}
```

### ❌ "azd up" fails halfway through

```bash
# အရွေးချယ်မှု ၁: သန့်စင်ပြီး ထပ်မံကြိုးစားပါ
azd down --force --purge
azd up

# အရွေးချယ်မှု ၂: အခြေခံအဆောက်အအုံကိုသာ ပြုပြင်ပါ
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

**ပုံမှန် စောင့်ဆိုင်းချိန်များ:**
- ရိုးရှင်းသော web app: 5-10 မိနစ်
- database ပါသော app: 10-15 မိနစ်
- AI application: 15-25 မိနစ် (OpenAI provisioning အချိန်ကြာသည်)

```bash
# တိုးတက်မှုကို စစ်ဆေးပါ
azd show

# ၃၀ မိနစ်ထက်ပိုကြာလျှင် Azure Portal ကို စစ်ဆေးပါ:
azd monitor
# မအောင်မြင်သော တပ်ဆင်မှုများကို ရှာပါ
```

### ❌ "Permission denied" or "Forbidden"

```bash
# သင့် Azure အခန်းကဏ္ဍကို စစ်ဆေးပါ
az role assignment list --assignee $(az account show --query user.name -o tsv)

# အနည်းဆုံး "Contributor" အခန်းကဏ္ဍလိုအပ်သည်
# သင့် Azure အုပ်ချုပ်ရေးမှူးကို အောက်ပါအခန်းကဏ္ဍများပေးရန် တောင်းဆိုပါ:
# - Contributor (အရင်းအမြစ်များအတွက်)
# - User Access Administrator (အခန်းကဏ္ဍပေးအပ်မှုများအတွက်)
```

### ❌ Can't find deployed application URL

```bash
# ဝန်ဆောင်မှုအဆုံးစွန်များအားလုံးကို ပြပါ
azd show

# ဒါမှမဟုတ် Azure Portal ကိုဖွင့်ပါ
azd monitor

# အထူးဝန်ဆောင်မှုကို စစ်ဆေးပါ
azd env get-values
# *_URL အပြောင်းအလဲများကို ရှာပါ
```

### 📚 ပြဿနာဖြေရှင်း အရင်းအမြစ်များ

- **ပုံမှန် ပြဿနာများ လမ်းညွှန်:** [အသေးစိတ် ဖြေရှင်းနည်းများ](docs/troubleshooting/common-issues.md)
- **AI-ဆိုင်ရာ ပြဿနာများ:** [AI Troubleshooting](docs/troubleshooting/ai-troubleshooting.md)
- **Debugging လမ်းညွှန်:** [အဆင့်လိုက် Debugging](docs/troubleshooting/debugging.md)
- **အကူအညီရယူရန်:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🔧 အမြန် ပြဿနာဖြေရှင်း လမ်းညွှန်

**အသစ်စတင်သူများ ကြုံတွေ့နိုင်သော ပြဿနာများနှင့် ချက်ချင်း ဖြေရှင်းနည်းများ**

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

# ပုံမှန် subscription ကို သတ်မှတ်ပါ
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
# infra/main.parameters.json ကို တည်းဖြတ်ပါ
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" fails halfway through"</strong></summary>

```bash
# အရွေးချယ်မှု ၁: သန့်စင်ပြီး ထပ်မံကြိုးစားပါ
azd down --force --purge
azd up

# အရွေးချယ်မှု ၂: အခြေခံအဆောက်အအုံကိုသာ ပြုပြင်ပါ
azd provision

# အရွေးချယ်မှု ၃: အသေးစိတ်မှတ်တမ်းများကို စစ်ဆေးပါ
azd show
azd logs
```
</details>

<details>
<summary><strong>❌ "Authentication failed" or "Token expired"</strong></summary>

```bash
# ပြန်လည်အတည်ပြုခြင်း
az logout
az login

azd auth logout
azd auth login

# အတည်ပြုခြင်းကိုစစ်ဆေးပါ
az account show
```
</details>

<details>
<summary><strong>❌ "Resource already exists" or naming conflicts"</strong></summary>

```bash
# AZD သည် ထူးခြားသောအမည်များကို ဖန်တီးပေးသည်၊ သို့သော် အကြောင်းပြချက်ဖြစ်ပါက:
azd down --force --purge

# ထို့နောက် အသစ်သောပတ်ဝန်းကျင်ဖြင့် ထပ်မံကြိုးစားပါ
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Template deployment taking too long"</strong></summary>

**ပုံမှန် စောင့်ဆိုင်းချိန်များ:**
- ရိုးရှင်းသော web app: 5-10 မိနစ်
- database ပါသော app: 10-15 မိနစ်
- AI application: 15-25 မိနစ် (OpenAI provisioning အချိန်ကြာသည်)

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
# သင်၏ Azure အက်ဒမင်ကို အောက်ပါအခန်းကဏ္ဍများပေးရန် တောင်းဆိုပါ:
# - Contributor (အရင်းအမြစ်များအတွက်)
# - User Access Administrator (အခန်းကဏ္ဍပေးအပ်မှုများအတွက်)
```
</details>

<details>
<summary><strong>❌ Can't find deployed application URL"</strong></summary>

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

### 📚 ပြဿနာဖြေရှင်း အရင်းအမြစ်များ

- **ပုံမှန် ပြဿနာများ လမ်းညွှန်:** [အသေးစိတ် ဖြေရှင်းနည်းများ](docs/troubleshooting/common-issues.md)
- **AI-ဆိုင်ရာ ပြဿနာများ:** [AI Troubleshooting](docs/troubleshooting/ai-troubleshooting.md)
- **Debugging လမ်းညွှန်:** [အဆင့်လိုက် Debugging](docs/troubleshooting/debugging.md)
- **အကူအညီရယူရန်:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 သင်တန်းပြီးစီးမှုနှင့် လက်မှတ်

### တိုးတက်မှုကို စစ်ဆေးခြင်း
အခန်းတစ်ခုချင်းစီတွင် သင်ယူမှု တိုးတက်မှုကို စစ်ဆေးပါ:

- [ ] **Chapter 1**: Foundation & Quick Start ✅
- [ ] **Chapter 2**: AI-First Development ✅  
- [ ] **Chapter 3**: Configuration & Authentication ✅
- [ ] **Chapter 4**: Infrastructure as Code & Deployment ✅
- [ ] **Chapter 5**: Multi-Agent AI Solutions ✅
- [ ] **Chapter 6**: Pre-Deployment Validation & Planning ✅
- [ ] **Chapter 7**: Troubleshooting & Debugging ✅
- [ ] **Chapter 8**: Production & Enterprise Patterns ✅

### သင်ယူမှု အတည်ပြုခြင်း
အခန်းတစ်ခုပြီးစီးပြီးနောက် သင်၏ အသိပညာကို အတည်ပြုပါ:
1. **လက်တွေ့ လေ့ကျင့်ခန်း**: အခန်း၏ deployment ကို ပြီးစီးပါ
2. **အသိပညာ စစ်ဆေးခြင်း**: FAQ အခန်းကို ပြန်လည်သုံးသပ်ပါ
3. **အသိုင်းအဝိုင်း ဆွေးနွေးမှု**: Azure Discord တွင် သင်၏ အတွေ့အကြုံကို မျှဝေပါ
4. **နောက်အခန်း**: နောက်ထပ် အဆင့်မြင့်အခန်းသို့ ရောက်ပါ

### သင်တန်းပြီးစီးမှု အကျိုးကျေးဇူးများ
အခန်းအားလုံးကို ပြီးစီးပြီးနောက် သင်သည်:
- **လုပ်ငန်းအတွေ့အကြုံ**: Azure တွင် အမှန်တကယ် AI application များကို deploy လုပ်နိုင်ခြင်း
- **ပရော်ဖက်ရှင်နယ် ကျွမ်းကျင်မှု**: လုပ်ငန်းအဆင့် deployment စွမ်းရည်များ  
- **အသိုင်းအဝိုင်း အသိအမှတ်ပြုမှု**: Azure developer အသိုင်းအဝိုင်း၏ အကျိုးကျေးဇူးရှိသော အဖွဲ့ဝင်
- **အလုပ်အကိုင် တိုးတက်မှု**: AZD နှင့် AI deployment ကျွမ်းကျင်မှုများ

---

## 🤝 အသိုင်းအဝိုင်းနှင့် အထောက်အပံ့

### အကူအညီရယူရန်
- **နည်းပညာဆိုင်ရာ ပြဿနာများ**: [bug report နှင့် feature request](https://github.com/microsoft/azd-for-beginners/issues)
- **သင်ယူမှုဆိုင်ရာ မေးခွန်းများ**: [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure) နှင့် [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI-ဆိုင်ရာ အကူအညီ**: [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **စာရွက်စာတမ်းများ**: [Azure Developer CLI စာရွက်စာတမ်းများ](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Microsoft Foundry Discord မှ အသိုင်းအဝိုင်း အမြင်များ

**#Azure Channel မှ မဲပေးရလဒ်များ:**
- **45%** developer များသည် AZD ကို AI workload များအတွက် အသုံးပြုလိုသည်
- **အဓိက စိန်ခေါ်မှုများ**: Multi-service deployments, credential management, production readiness  
- **အများဆုံး တောင်းဆိုမှုများ**: AI-specific templates, troubleshooting guides, best practices

**အသိုင်းအဝိုင်းတွင် ပါဝင်ရန်:**
- AZD + AI အတွေ့အကြုံများကို မျှဝေပြီး အကူအညီရယူပါ
- AI templates အသစ်များ၏ အစောပိုင်း preview များကို ရယူပါ
- AI deployment best practices များကို ပံ့ပိုးပါ
- အနာဂတ် AI + AZD feature development ကို အကျိုးသက်ရောက်မှု ရှိစေပါ

### သင်တန်းအတွက် ပံ့ပိုးမှု
ကျွန်ုပ်တို့သည် ပံ့ပိုးမှုများကို ကြိုဆိုပါသည်! [Contributing Guide](CONTRIBUTING.md) ကို ဖတ်ရှုပြီး အောက်ပါအကြောင်းအရာများအတွက် အသေးစိတ် သိပါ:
- **အကြောင်းအရာ တိုးတက်မှုများ**: ရှိပြီးသား အခန်းများနှင့် ဥပမာများကို တိုးတက်စေပါ
- **ဥပမာအသစ်များ**: အမှန်တကယ် အခြေအနေများနှင့် templates များ ထည့်သွင်းပါ  
- **ဘာသာပြန်ခြင်း**: ဘာသာစကားများကို ထိန်းသိမ်းရန် ကူညီပါ
- **Bug Report**: တိကျမှုနှင့် ရှင်းလင်းမှုကို တိုးတက်စေပါ
- **အသိုင်းအဝိုင်း စံသတ်မှတ်ချက်များ**: ကျွန်ုပ်တို့၏ အတန်းအစားအသိုင်းအဝိုင်း လမ်းညွှန်ချက်များကို လိုက်နာပါ

---

## 📄 သင်တန်းအချက်အလက်

### လိုင်စင်
ဤပရောဂျက်သည် MIT License အောက်တွင် လိုင်စင်ရရှိထားသည် - အသေးစိတ်အချက်အလက်များအတွက် [LICENSE](../../LICENSE) ဖိုင်ကို ကြည့်ပါ။

### Microsoft Learning Resources နှင့် ဆက်စပ်

ကျွန်ုပ်တို့၏အဖွဲ့သည် အခြား လေ့လာရေးသင်တန်းများကို ထုတ်လုပ်ပါသည်:

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

## 🗺️ သင်ခန်းစာ လမ်းညွှန်

**🚀 သင်ကြားမှုကို စတင်လိုက်ပါ!**

**အသစ်စတင်သူများ**: [အခန်း ၁: အခြေခံနှင့် အမြန်စတင်ခြင်း](../..) မှ စတင်ပါ  
**AI ဖွံ့ဖြိုးရေးသူများ**: [အခန်း ၂: AI-ပထမ ဖွံ့ဖြိုးတိုးတက်မှု](../..) သို့ တိုက်ရိုက်သွားပါ  
**အတွေ့အကြုံရှိ ဖွံ့ဖြိုးရေးသူများ**: [အခန်း ၃: Configuration & Authentication](../..) မှ စတင်ပါ  

**နောက်တစ်ဆင့်များ**: [အခန်း ၁ - AZD အခြေခံများ စတင်ပါ](docs/getting-started/azd-basics.md) →  

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**အကြောင်းကြားချက်**:  
ဤစာရွက်စာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ကို အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှုအတွက် ကြိုးစားနေသော်လည်း အလိုအလျောက် ဘာသာပြန်မှုများတွင် အမှားများ သို့မဟုတ် မမှန်ကန်မှုများ ပါဝင်နိုင်သည်ကို သတိပြုပါ။ မူရင်းဘာသာစကားဖြင့် ရေးသားထားသော စာရွက်စာတမ်းကို အာဏာတရားရှိသော အရင်းအမြစ်အဖြစ် သတ်မှတ်သင့်ပါသည်။ အရေးကြီးသော အချက်အလက်များအတွက် လူ့ဘာသာပြန်ပညာရှင်များကို အသုံးပြုရန် အကြံပြုပါသည်။ ဤဘာသာပြန်မှုကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော နားလည်မှုမှားများ သို့မဟုတ် အဓိပ္ပါယ်မှားများအတွက် ကျွန်ုပ်တို့သည် တာဝန်မယူပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->