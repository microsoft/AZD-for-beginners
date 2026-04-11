# AZD အစပြုသူများအတွက်: ဖွဲ့စည်းထားသော သင်ယူခရီး

![AZD အစပြုသူများ](../../translated_images/my/azdbeginners.5527441dd9f74068.webp) 

[![GitHub ကြည့်ရှုသူများ](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub Fork များ](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub ကြယ်များ](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord ဆာဗာ](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord ဆာဗာ](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### အလိုအလျောက် ဘာသာပြန်ချက်များ (အမြဲ အပ်ဒိတ်ထားသည်)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](./README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Khmer](../km/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **ကိုယ့်စက်ပေါ်မှာ Clone လုပ်ချင်လား?**
>
> ဒီ repository မှာ ဘာသာပြန်ချက် 50 ကျော် ပါဝင်တဲ့အတွက် ဒေါင်းလုဒ် စာရင်းအရွယ်အစား အများကြီးတိုးပါတယ်။ ဘာသာပြန်ချက်များမပါဘဲ clone လုပ်ချင်ရင် sparse checkout ကို အသုံးပြုပါ:
>
> **Bash / macOS / Linux:**
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
>
> **CMD (Windows):**
> ```cmd
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone "/*" "!translations" "!translated_images"
> ```
>
> ဒါက သင့်ကို သင်ခန်းစာကို ပြီးမြောက်စေဖို့ လိုအပ်သော အရာအားလုံးကို ပိုမြန်တဲ့ ဒေါင်းလုဒ်နှုန်းနဲ့ ပေးပါလိမ့်မယ်။
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 azd တွင် ယနေ့ အသစ်များ

Azure Developer CLI သည် ရိုးရာ၀က်ဘ်အက်ပ်များနှင့် API များကျော်ပြီး တိုးချဲ့လာပြီးဖြစ်သည်။ ယနေ့ azd သည် AI အားဖြင့် အင်အားထည့်ထားသော အက်ပ်များနှင့် ပညာသိပ္ပံအေဂျင့်များအပါအဝင် မည်သည့် အက်ပ်မျိုးမဆို Azure သို့ တင်ပို့နိုင်တဲ့ တစ်ခုတည်းသော ကိရိယာ ဖြစ်လာပါပြီ။

ဒါဟာ သင့်အတွက် အဘယ်ကို ဆိုလိုတာလဲဆိုရင် -

- **AI agent များဟာ ယခု azd တွင် တန်းသတ်ထားတဲ့ အလုပ်တစ်မျိုးဖြစ်လာပါပြီ။** သင် familiar ဖြစ်တဲ့ `azd init` → `azd up` workflow တစ်ခုနဲ့ AI agent project များကို initialize, deploy, နှင့် စီမံခန့်ခွဲနိုင်ပြီ။
- **Microsoft Foundry ဆက်သွယ်မှု** က model deployment, agent hosting, နှင့် AI စနစ်ပတ်လည်ဝန်ဆောင်မှုများကို တိုက်ရိုက် azd template ecosystem ထဲ ထည့်ပေးပါတယ်။
- **မူလ workflow က မပြောင်းလဲပါ။** todo app, microservice သို့မဟုတ် multi-agent AI ဖြေရှင်းချက် တင်ပို့ဖြစ်စေ ကမ်းလှမ်းချက်တစ်ခုလုံးအတွက် အမိန့်များ ထပ်တူပဲ ဖြစ်နေပါသည်။

အကယ်၍ သင် azd ကို ယခင်က အသုံးပြုဖူးပါက AI ထောက်ခံမှုသည် သဘာဝတရားတိုးချဲ့မှုဖြစ်ပြီး — လွဲချော်ခြင်းမရှိသော ကိရိယာသစ် တစ်ခုမဟုတ်ပါ။ အသစ်စတင်ပါက သင်တစ်ခုတည်းသော workflow တစ်ခုကို သင်ယူမည်ဖြစ်ပြီး အရာအားလုံးအတွက် အလုပ်လုပ်နိုင်ပါသည်။

---

## 🚀 Azure Developer CLI (azd) ဆိုတာ ဘာလဲ?

**Azure Developer CLI (azd)** သည် developer များအတွက် သက်သာစေရေး command-line ကိရိယာတစ်ခုဖြစ်ပြီး Azure သို့ အက်ပ်များကို တင်ပို့ရန် လွယ်ကူစေသည်။ Azure resource များကို လက်ဖြင့် တစ်သိပ်ချင်းစီ ဖန်တီး ဆက်သွယ်ရန်မလိုပဲ တစ်ချက်တည်းသော အမိန့်နဲ့ အပြည့်အစုံ application များကို deploy လုပ်နိုင်သည်။

### `azd up` ၏ အံ့ဩချက်

```bash
# ဒီတစ်ကြောင်းလုံးအော်ဒါက အားလုံးကိုလုပ်ဆောင်ပါတယ်။
# ✅ Azure အရင်းအမြစ်အားလုံးကိုဖန်တီးသည်
# ✅ ကွန်ယက်နှင့်လုံခြုံရေးကိုသတ်မှတ်သည်
# ✅ သင့်အပလီကေးရှင်းကုဒ်ကိုတည်ဆောက်သည်
# ✅ Azure သို့ ထည့်သွင်းပေးသည်
# ✅ လုပ်ငန်းလုပ်ဆောင်နေသော URL ကိုပေးသည်
azd up
```

**အဲဒါပဲ ဖြစ်ပါတယ်!** Azure Portal ကို နှိပ်နေရန် မလိုတော့ပါ၊ ARM template များကို ရှင်းလင်းစွာ သင်ယူရန် မလိုတော့ပါ၊ လက်ဖြင့် config ပြုလုပ်ရန် မလိုတော့ပါ — အရင်းအမြစ် ပြည့်စုံပြီး လုပ်ကိုင်နိုင်သော အက်ပ်များကို ကနဦးမှရပါပြီ။

---

## ❓ Azure Developer CLI နှင့် Azure CLI: ဘာကွာခြားပါသလဲ?

ဒီဟာက အစပြုသူများ မကြာခဏ မေးလေ့ရှိတဲ့ မေးခွန်းပဲ။ ရိုးရှင်းတဲ့ ဖြေဆိုချက်က ဒီလိုပဲ:

| Feature | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Purpose** | တစ်ခုချင်း Azure resource များကို စီမံရေးဆွဲရန် | အပြည့်အစုံ application များကို တင်ပို့ရန် |
| **Mindset** | ဖွဲ့စည်းပုံက ဦးစားပေး | အက်ပ်ကို ဦးစားပေး |
| **Example** | `az webapp create --name myapp...` | `azd up` |
| **Learning Curve** | Azure ဝန်ဆောင်မှုများကို သိထားရမည် | သင့်အက်ပ်ကိုသာ သိလျှင်ရမည် |
| **Best For** | DevOps, အောက်ဆောက်လုပ်ငန်း | Developer များ, Prototype များအတွက် |

### ရိုးရှင်းတဲ့ ဆင်တူချက်

- **Azure CLI** က အိမ်တစ်လုံး တည်ဆောက်ဖို့ ဓါးတံ၊ လှဲ၊ မုန့်သုတ်အိတ် စသဖြင့် ကိရိယာအားလုံးကို ပိုင်ဆိုင်ထားခြင်းလို ဖြစ်သည် - မည်သည့်အရာမဆို တည်ဆောက်နိုင်ပေမယ့် ဆောက်လုပ်ရေးကို သိရှိထားရမည်။
- **Azure Developer CLI** ကတော့ စီမံခန့်ခွဲသူတစ်ယောက် အလုပ်ခေါ်ထားသလိုဖြစ်သည် - သင်လိုချင်တာကို ဖော်ပြသော်လည်း သူတို့က ဆောက်လုပ်ပေးပါလိမ့်မယ်။

### ဘယ်အချိန်မှာ ဘယ်ဟာကို အသုံးပြုသင့်လဲ

| Scenario | Use This |
|----------|----------|
| "ကျွန်တော့် web app ကို အမြန်တင်ပို့ချင်တယ်" | `azd up` |
| "ကွက်တစ်ခုသာ storage account ဖန်တီးချင်တယ်" | `az storage account create` |
| "AI အပြည့်အစုံ application တည်ဆောက်နေပါတယ်" | `azd init --template azure-search-openai-demo` |
| "တိတိကျကျ Azure resource တစ်ခုကို debug လုပ်ချင်တယ်" | `az resource show` |
| "minutes အတွင်း production-ready deployment လုပ်ချင်တယ်" | `azd up --environment production` |

### တို့နှစ်ခုက တွဲလုပ်နိုင်တယ်!

AZD သည် အောက်ခံတွင် Azure CLI ကို အသုံးပြုပါသည်။ နှစ်ခုလုံးကို မိမိလိုအပ်သလို အသုံးပြုနိုင်ပါတယ်:
```bash
# AZD ဖြင့် သင့်အက်ပ်ကို တင်ပါ
azd up

# ထို့နောက် Azure CLI ဖြင့် အထူးသတ်မှတ် အရင်းအမြစ်များကို အတိအကျ တည်းဖြတ်ပါ
az webapp config set --name myapp --always-on true
```

---

## 🌟 Awesome AZD ထဲမှာ Template များ ရှာပါ

ပဲမိတ်ဖွင့်ခြင်းမစပါနဲ့! **Awesome AZD** သည် တွဲဖက်အသုံးပြုနိုင်သော ready-to-deploy template များကို ကွန်မြူနီတီမှ စုစည်းထားသည့် ကောက်ချုပ်စုဖြစ်သည်။

| Resource | ဖော်ပြချက် |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | တစ်ချက်နှိပ်တာနဲ့ deploy လုပ်နိုင်တဲ့ 200+ templates ကို 浏览 ပါ |
| 🔗 [**Submit a Template**](https://github.com/Azure/awesome-azd/issues) | သင်၏ template ကို community ထဲသို့ ပေးပို့ပါ |
| 🔗 [**GitHub Repository**](https://github.com/Azure/awesome-azd) | ကုဒ်ကို ကြည့်ရှု၍ star တင်နိုင်ပါသည် |

### Awesome AZD မှ လူကြိုက်များသော AI Template များ

```bash
# Microsoft Foundry မော်ဒယ်များနှင့် AI ရှာဖွေရေးဖြင့် RAG စကားပြောချက်
azd init --template azure-search-openai-demo

# အမြန် AI စကားပြောလျှင်
azd init --template openai-chat-app-quickstart

# Foundry ပုဂ္ဂိုလ်များနှင့် AI ပုဂ္ဂိုလ်များ
azd init --template get-started-with-ai-agents
```

---

## 🎯 3 ပိုင်းဖြင့် စတင်ခြင်း

စတင်ခင်မှာ သင် deploy လုပ်မယ့် template အတွက် သင့်စက်က ပြင်ဆင်ပြီးကြောင်း သေချာပါစေ။

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

မလိုအပ်သော စစ်ဆေးချက်တစ်ခုခု ဖလစ်မိပါက ပထမဆုံး အဲ့ဒီကို ပြင်ဆင်ပြီးနောက် quick start ကို ဆက်လုပ်ပါ။

### အဆင့် 1: AZD ထည့်သွင်းခြင်း (2 မိနစ်)

**Windows:**
```powershell
winget install microsoft.azd
```

**macOS:**
```bash
brew tap azure/azd && brew install azd
```

**Linux:**
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

### အဆင့် 2: AZD အတွက် အတည်ပြုခြင်း

```bash
# ဒီသင်တန်းမှာ Azure CLI ကွန်မန်းများကို တိုက်ရိုက် အသုံးပြုရန် စီစဉ်ထားပါက စိတ်ကြိုက်ဖြစ်သည်
az login

# AZD အလုပ်စဉ်များအတွက် လိုအပ်ပါသည်
azd auth login
```

ဘယ်လိုအတည်ပြုချက်ကို မလိုအပ်သည်ကို မသေချာပါက [Installation & Setup](docs/chapter-01-foundation/installation.md#authentication-setup) ထဲက အပြည့်အစုံ setup လမ်းကြောင်းကို လိုက်နာပါ။

### အဆင့် 3: သင့် ပထမဆုံး အက်ပ်ကို Deploy လုပ်ရန်

```bash
# အကြမ်းဖျဉ်းမှ စတင်တည်ဆောက်ပါ
azd init --template todo-nodejs-mongo

# Azure သို့ တပ်ဆင်ပါ (အားလုံးကို ဖန်တီးပါသည်!)
azd up
```

**🎉 အဲဒါပဲ!** သင့်အက်ပ်ကို အခု Azure ပေါ်တွင် အသက်ရှင်နေပြီ။

### ရှင်းလင်းရေး (မမေ့ပါနှင့်!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 ဒီသင်ကြားမှုကို ဘယ်လို အသုံးပြုမလဲ

ဒီသင်ခန်းစာကို **အဆင့်လိုက် သင်ယူမှု** အတွက် ဒီဇိုင်းဆွဲထားသည် - သင် သက်ဆိုင်ရာ ချန်နယ်ကနေ စတင်ပြီး တဖြည်းဖြည်း တက်ပွားနိုင်ပါသည်။

| သင့် အတွေ့အကြုံ | ဒီနေရာက စပါ |
|-----------------|------------|
| **Azure အတွက် အပြင်သစ်** | [Chapter 1: Foundation](#-chapter-1-foundation--quick-start) |
| **Azure ကို သိချင်ပေမယ့် AZD အသစ်** | [Chapter 1: Foundation](#-chapter-1-foundation--quick-start) |
| **AI အက်ပ်များကို တင်ပို့ချင်သူများ** | [Chapter 2: AI-First Development](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **လက်တွေ့ လက်ဆောင်လေ့ကျင့်ချင်သူများ** | [🎓 Interactive Workshop](workshop/README.md) - 3-4 နာရီလက်တွေ့ လေ့ကျင့်ခန်း |
| **Production ဒီဇိုင်း များလိုအပ်သူများ** | [Chapter 8: Production & Enterprise](#-chapter-8-production--enterprise-patterns) |

### Quick Setup

1. **ဒီ Repository ကို Fork လုပ်ပါ**: [![GitHub Fork များ](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Clone လုပ်ပါ**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **ထောက်ခံမှု ရယူပါ**: [Azure Discord Community](https://discord.com/invite/ByRwuEEgH4)

> **ကိုယ့်စက်ပေါ်မှာ Clone လုပ်ချင်လား?**

> ဒီ repository မှာ ဘာသာပြန်ချက် 50 ကျော် ပါဝင်တဲ့အတွက် ဒေါင်းလုဒ် စာရင်းအရွယ်အစား အများကြီးတိုးပါတယ်။ ဘာသာပြန်ချက်များမပါဘဲ clone လုပ်ချင်ရင် sparse checkout ကို အသုံးပြုပါ:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> This gives you everything you need to complete the course with a much faster download.


## သင်ခန်းစာ အကျဉ်းချုပ်

Azure Developer CLI (azd) ကို structured chapter များဖြင့် master လုပ်ပါ။ သင်ယူမှုကို အဆင့်လိုက် ဖွဲ့စည်းထားသည်။ **Microsoft Foundry integration ဖြင့် AI application deployment ကို အထူး အာရုံစိုက်ထားသည်။**

### ဒီသင်ခန်းစာက မေရနှင်း နိုင်ငံ့ Developer များအတွက် အရေးကြီးတဲ့ အချက်

Microsoft Foundry Discord community မှ ရရှိသော သုံးသပ်ချက်များအပေါ် မူတည်ပြီး **ဖွံ့ဖြိုးရေးသမား 45% သည် AZD ကို AI workload များအတွက် အသုံးပြုလိုကြပေသည်**။ သို့သော်အဆိုပါ challenges များနှင့် တွေ့ကြုံကြသည် -
- ဘက်စုံ multi-service AI ဖွဲ့စည်းပုံများ ရှုပ်ထွေးခြင်း
- Production AI deployment အတွက် အကောင်းဆုံး ပုံစံများ
- Azure AI ဝန်ဆောင်မှုများနှင့် ပေါင်းစည်းမှုနှင့် configuration
- AI workload များအတွက် ကုန်ကျစရိတ် tốiငိ
- AI-specific deployment ပြဿနာများကို troubleshooting ပြုလုပ်ခြင်း

### သင်ယူရမည့် ရည်ရွယ်ချက်များ

ဒီ structured သင်ခန်းစာကို ပြီးမြောက်ပါက သင်သည် -
- **AZD အခြေခံများကို ကျွမ်းကျင်စေမည်**: အဓိက ধারণာ, installation, နှင့် configuration
- **AI အက်ပ်များကို တင်ပို့နိင်မည်**: Microsoft Foundry ဝန်ဆောင်မှုများနှင့် AZD ကို သုံးခြင်း
- **Infrastructure as Code အကောင်အထည်ဖော်နည်းများ**: Bicep template များဖြင့် Azure resource များ စီမံခြင်း
- **Deployment များကို Troubleshoot ပြုလုပ်နိင်မည်**: ရိုးရာပြဿနာများကို ဖြေရှင်းခြင်းနှင့် debug ပြုလုပ်ခြင်း
- **Production အတွက် Optimize ပြုလုပ်နိင်မည်**: စိတ်ချရမှု, scaling, မျက်နှာကြည့်မှုနှင့် ကုန်ကျစရိတ် စီမံခန့်ခွဲမှု
- **Multi-Agent ဖြေရှင်းချက်များ တည်ဆောက်နိင်မည်**: ရှုပ်ထွေးသော AI architecture များကို deploy လုပ်ခြင်း

## စတင်ခင်: အကောင့်များ၊ ခွင့်ပြုချက်များနှင့် သတ်မှတ်ချက်များ

Chapter 1 စတင်ရန်မပြုမီ အောက်ပါ အရာများ ရှိ/ပြင်ဆင်ပြီးသား ဖြစ်ရမည်။ ဤလမ်းညွှန်ထဲတွင် ဗားရှင်းဆက်ထိန်းအစီအစဉ်များ အတွက် လိုအပ်ချက်များကို အောက်တွင် ဆိုလိုထားသည်။
- **Azure စာရင်းသွင်းမှုတစ်ခု**: သင်၏ အလုပ်နေရာရှိ သို့မဟုတ် ကိုယ်ပိုင်အကောင့်ရှိ ရှိပြီးသား subscription ကို အသုံးပြုနိုင်သည်၊ သို့မဟုတ် စတင်ရန် [free trial](https://aka.ms/azurefreetrial) တစ်ခု ဖန်တီးနိုင်သည်။
- **Azure အရင်းအမြစ်များကို ဖန်တီးခွင့်**: အများသော လေ့ကျင့်ခန်းများအတွက် လက်ရှိ target subscription သို့မဟုတ် resource group ပေါ်တွင် အနည်းဆုံး **Contributor** access ရှိသင့်သည်။ တချို့ အခန်းများတွင် resource groups, managed identities, နှင့် RBAC assignments များ ဖန်တီးနိုင်မှုကိုလည်း သတ်မှတ်ထားနိုင်သည်။
- [**GitHub အကောင့်တစ်ခု**](https://github.com): ရ(repository) ကို fork ထားခြင်း၊ ကိုယ်ပိုင်ပြင်ဆင်မှုများကို ထိန်းသိမ်းခြင်း၊ နှင့် workshop အတွက် GitHub Codespaces ကို အသုံးပြုရန် အသုံးဝင်သည်။
- **Template runtime လိုအပ်ချက်များ**: အချို့သော templates များတွင် Node.js, Python, Java, သို့မဟုတ် Docker ကဲ့သို့သော ဒေသခံကိရိယာများ လိုအပ်နိုင်သည်။ စတင်မလုပ်မီ setup validator ကို ပြေးဆောင်လိုက်၍ လိုအပ်သောကိရိယာများ မရှိမှုကို ဦးစွာဖမ်းဆီးပါ။
- **အခြေခံ terminal အသိပညာ**: ကျွမ်းကျင်သူ မဖြစ်ရပါ၊ သို့သော် `git clone`, `azd auth login`, နှင့် `azd up` ကဲ့သို့ command များကို အဆင်ပြေစွာ ရိုက်ထည့်နိုင်ဖို့ လိုအပ်သည်။

> **အဖွဲ့အစည်း subscription မှာ အလုပ်လုပ်ချင်ပါသလား?**
> သင်၏ Azure ပတ်ဝန်းကျင်ကို အက်မင်မင်းက စီမံခန့်ခွဲထားပါက သင် သုံးရန်စီစဉ်ထားသော subscription သို့ resource group အတွင်း resource များကို deploy လုပ်နိုင်မလား ကြိုတင် အတည်ပြုပါ။ မဟုတ်လျှင် sandbox subscription သို့မဟုတ် Contributor access ကို စတင်မလုပ်မီ တောင်းဆိုပါ။

> **Azure အသစ်တစ်ယောက်လား?**
> သင်၏ကိုယ်ပိုင် Azure trial သို့ pay-as-you-go subscription (https://aka.ms/azurefreetrial) ဖြင့် စတင်ပါ၊ ထို့ဖြင့် tenant-level ခွင့်ပြုချက်များကို စောင့်ဆိုင်းလိုက်စရာမလိုဘဲ လေ့ကျင့်ခန်းများကို အဆုံးသတ်နိုင်မည်။

## 🗺️ Course Map: Quick Navigation by Chapter

Each chapter has a dedicated README with learning objectives, quick starts, and exercises:

| Chapter | Topic | Lessons | Duration | Complexity |
|---------|-------|---------|----------|------------|
| **[အခန်း ၁: အခြေခံ](docs/chapter-01-foundation/README.md)** | စတင်ခြင်း | [AZD အခြေခံ](docs/chapter-01-foundation/azd-basics.md) &#124; [ထည့်သွင်းခြင်း](docs/chapter-01-foundation/installation.md) &#124; [ပထမဆုံး ပရောဂျက်](docs/chapter-01-foundation/first-project.md) | 30-45 မိနစ် | ⭐ |
| **[အခန်း ၂: AI ဖွံ့ဖြိုးရေး](docs/chapter-02-ai-development/README.md)** | AI-ဦးစားပေး အက်ပ်များ | [Foundry ပေါင်းစည်းခြင်း](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI ကိုယ်စားလှယ်များ](docs/chapter-02-ai-development/agents.md) &#124; [မော်ဒယ် တပ်ဆင်ခြင်း](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Workshop](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 နာရီ | ⭐⭐ |
| **[အခန်း ၃: ပြင်ဆင်ခြင်း](docs/chapter-03-configuration/README.md)** | အာသင့် & လုံခြုံရေး | [Configuration](docs/chapter-03-configuration/configuration.md) &#124; [Auth & Security](docs/chapter-03-configuration/authsecurity.md) | 45-60 မိနစ် | ⭐⭐ |
| **[အခန်း ၄: အခြေစိုက်အင်ဖာစ്ട്രပ်ချာ](docs/chapter-04-infrastructure/README.md)** | IaC & Deployment | [Deployment Guide](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisioning](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 နာရီ | ⭐⭐⭐ |
| **[အခန်း ၅: Multi-Agent](docs/chapter-05-multi-agent/README.md)** | AI ကိုယ်စားလှယ် ဖြေရှင်းချက်များ | [Retail Scenario](examples/retail-scenario.md) &#124; [Coordination Patterns](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 နာရီ | ⭐⭐⭐⭐ |
| **[အခန်း ၆: Pre-Deployment](docs/chapter-06-pre-deployment/README.md)** | စီစဉ်မှု & အတည်ပြုခြင်း | [Preflight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 နာရီ | ⭐⭐ |
| **[အခန်း ၇: ပြဿနာရှာဖွေခြင်း](docs/chapter-07-troubleshooting/README.md)** | ဒီဘတ် & ပြုပြင်ခြင်း | [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Debugging](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI Issues](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 နာရီ | ⭐⭐ |
| **[အခန်း ၈: ထုတ်လုပ်ရေး](docs/chapter-08-production/README.md)** | အဖွဲ့အစည်း ပုံစံများ | [Production Practices](docs/chapter-08-production/production-ai-practices.md) | 2-3 နာရီ | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | လက်တွေ့ လေ့ကျင့်ခန်း | [Introduction](workshop/docs/instructions/0-Introduction.md) &#124; [Selection](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validation](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Deconstruction](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Configuration](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Customization](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Teardown](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Wrap-up](workshop/docs/instructions/7-Wrap-up.md) | 3-4 နာရီ | ⭐⭐ |

**စုစုပေါင်း သင်တန်း ကြာချိန်:** ~10-14 နာရီ | **ကျွမ်းကျင်မှု တိုးတက်မှု:** Beginner → Production-Ready

---

## 📚 သင်ယူမည့် အခန်းများ

*သင်၏ အတတ်ပညာ အဆင့်နှင့် ရည်မှန်းချက်ပေါ် မူတည်၍ သင်ယူမည့် လမ်းကြောင်းကို ရွေးချယ်ပါ*

### 🚀 အခန်း 1: အခြေခံ & အမြန်စတาร์့
**လိုအပ်ချက်များ**: Azure subscription, အခြေခံ command line အသိပညာ  
**ကြာချိန်**: 30-45 မိနစ်  
**ခက်ခဲမှု**: ⭐

#### သင်ယူမည့် အချက်များ
- Azure Developer CLI အခြေခံများကို နားလည်ခြင်း
- သင်၏ ပလက်ဖောင်းပေါ်တွင် AZD ထည့်သွင်းခြင်း
- ပထမဆုံး အောင်မြင်သော deployment

#### သင်ယူရန် အရင်းအမြစ်များ
- **🎯 စတင်ရန်**: [Azure Developer CLI ဆိုတာဘာလဲ?](#what-is-azure-developer-cli)
- **📖 သီအိုရီ**: [AZD အခြေခံ](docs/chapter-01-foundation/azd-basics.md) - မူလ အယူအဆများနှင့် အသုံးအနှုန်းများ
- **⚙️ ထည့်သွင်းခြင်း**: [ထည့်သွင်းခြင်း & စက်တင်](docs/chapter-01-foundation/installation.md) - ပလက်ဖောင်းအလိုက် လမ်းညွှန်များ
- **🛠️ လက်တွေ့**: [ပထမဆုံး ပရောဂျက်](docs/chapter-01-foundation/first-project.md) - လုပ်ဆောင်ချက်အဆင့်ဆင့် လမ်းညွှန်
- **📋 အမြန် အညွှန်း**: [Command Cheat Sheet](resources/cheat-sheet.md)

#### လက်တွေ့ လေ့ကျင့်ခန်းများ
```bash
# တပ်ဆင်ခြင်း အမြန်စစ်ဆေးခြင်း
azd version

# သင့် ပထမဆုံး အပလီကေးရှင်းကို တပ်ဆင်ပါ
azd init --template todo-nodejs-mongo
azd up
```

**💡 အခန်းရလဒ်**: AZD ကို အသုံးပြုပြီး Azure ပေါ်တွင် ရိုးရှင်းသော web လျှောက်လွှာတစ်ခုကို အောင်မြင်စွာ deploy ပြုလုပ်နိုင်ခြင်း

**✅ အောင်မြင်မှု အတည်ပြုချက်:**
```bash
# အခန်း ၁ ကို ပြီးမြောက်လျှင် သင်အောက်ပါအရာများကို လုပ်ဆောင်နိုင်ပါမည်
azd version              # တပ်ဆင်ထားသော ဗားရှင်းကို ပြသည်
azd init --template todo-nodejs-mongo  # ပရောဂျက်ကို အစပြုသည်
azd up                  # Azure သို့ တင်ပို့သည်
azd show                # ပြေးဆဲအက်ပ်၏ URL ကို ပြသည်
# အပလီကေးရှင်းကို ဘရောက်ဇာတွင် ဖွင့်ပြီး လုပ်ဆောင်သည်
azd down --force --purge  # အရင်းအမြစ်များကို ရှင်းလင်းသည်
```

**📊 အချိန် ဝင်ရောက်မှု:** 30-45 မိနစ်  
**📈 အတတ်အကျွမ်း အဆင့်နောက်ဆက်တွဲ:** မူလ အက်ပ်များကို ကိုယ်တိုင် deploy ပြုလုပ်နိုင်သည်  
**📈 အတတ်အကျွမ်း အဆင့်နောက်ဆက်တွဲ:** မူလ အက်ပ်များကို ကိုယ်တိုင် deploy ပြုလုပ်နိုင်သည်

---

### 🤖 အခန်း 2: AI-ဦးစားပေး ဖွံ့ဖြိုးရေး (AI ဖွံ့ဖြိုးရေးသူများအတွက် အကြံပြု)
**လိုအပ်ချက်များ**: အခန်း 1 အပြီးစီး済  
**ကြာချိန်**: 1-2 နာရီ  
**ခက်ခဲမှု**: ⭐⭐

#### သင်ယူမည့် အချက်များ
- AZD နှင့် Microsoft Foundry ပေါင်းစည်းခြင်း
- AI အင်အားဖြင့် လုပ်ဆောင်သော အက်ပ်များ တပ်ဆင်ခြင်း
- AI ဖန်တီးမှုဆိုင်ရာ service တွေအတွက် သတ်မှတ်ချက်များနားလည်ခြင်း

#### သင်ယူရန် အရင်းအမြစ်များ
- **🎯 စတင်ရန်**: [Microsoft Foundry Integration](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI ကိုယ်စားလှယ်များ**: [AI Agents Guide](docs/chapter-02-ai-development/agents.md) - AZD ဖြင့် တို့ထိန်းချုပ်နိုင်သော အချက်ပေး agent များ တပ်ဆင်ခြင်း
- **📖 ပုံစံများ**: [မော်ဒယ် တပ်ဆင်ခြင်း](docs/chapter-02-ai-development/ai-model-deployment.md) - AI မော်ဒယ်များ တပ်ဆင်ခြင်းနှင့် စီမံခန့်ခွဲခြင်း
- **🛠️ ဆိုင်အလုပ္ရုံ**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - သင့် AI ဖြေရှင်းချက်များကို AZD အဆင်သင့် ပြင်ဆင်ခြင်း
- **🎥 အပြန်အလှန် လမ်းညွှန်**: [Workshop Materials](workshop/README.md) - MkDocs * DevContainer ပတ်ဝန်းကျင်ဖြင့် browser-based သင်ယူမှု
- **📋 စမ်းသပ်ပုံစံများ**: [Featured Microsoft Foundry Templates](#workshop-resources)
- **📝 ဥပမာများ**: [AZD Deployment Examples](examples/README.md)

#### လက်တွေ့ လေ့ကျင့်ခန်းများ
```bash
# သင်၏ ပထမဆုံး AI အက်ပလီကေးရှင်းကို တပ်ဆင်ပါ
azd init --template azure-search-openai-demo
azd up

# နောက်ထပ် AI နမူနာများကို စမ်းကြည့်ပါ
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 အခန်းရလဒ်**: RAG စွမ်းရည်များပါရှိသည့် AI ဖွဲ့စည်းထားသော chat application တစ်ခုကို deploy နှင့် ဖွဲ့စည်းနိုင်ခြင်း

**✅ အောင်မြင်မှု အတည်ပြုချက်:**
```bash
# အခန်း ၂ အပြီး၌ သင် အောက်ပါအရာများကို ပြုလုပ်နိုင်ပါလိမ့်မည်:
azd init --template azure-search-openai-demo
azd up
# AI စကားပြော အင်တာဖေ့စ်ကို စမ်းသပ်ပါ
# မေးခွန်းများ မေး၍ အရင်းအမြစ်များပါသော AI အဖြေများကို ရယူပါ
# ရှာဖွေမှု ပေါင်းစည်းမှု အလုပ်လုပ်ပုံကို စစ်ဆေးပါ
azd monitor  # Application Insights တွင် တယ်လီမီထရီများ ပြသနေသည်ကို စစ်ဆေးပါ
azd down --force --purge
```

**📊 အချိန် ဝင်ရောက်မှု:** 1-2 နာရီ  
**📈 အတတ်အကျွမ်း အဆင့်နောက်ဆက်တွဲ:** ထုတ်လုပ်ရေးစနစ်အဆင်သင့် AI အက်ပ်များကို deploy နှင့် ဖွဲ့စည်းနိုင်သည်  
**💰 ကုန်ကျစရိတ် သတိပြုရန်:** ဖွံ့ဖြိုးရေးအတွက် $80-150/လ၊ ထုတ်လုပ်ရေးအတွက် $300-3500/လ အထိ ခန့်မှန်းနိုင်သည်

#### 💰 AI Deployments အတွက် ကုန်ကျစရိတ်ဆိုင်ရာ အချက်များ

**ဖွံ့ဖြိုးရေး ပတ်ဝန်းကျင် (ခန့်မှန်း $80-150/လ):**
- Microsoft Foundry Models (Pay-as-you-go): $0-50/လ (token အသုံးအမာပေါ်မူတည်)
- AI Search (Basic tier): $75/လ
- Container Apps (Consumption): $0-20/လ
- Storage (Standard): $1-5/လ

**ထုတ်လုပ်ရေး ပတ်ဝန်းကျင် (ခန့်မှန်း $300-3,500+/လ):**
- Microsoft Foundry Models (PTU အတွက် performance တည်ငြိမ်စေမှု): $3,000+/လ သို့မဟုတ် အမြင့်အသုံးမားလျှင် Pay-as-you-go
- AI Search (Standard tier): $250/လ
- Container Apps (Dedicated): $50-100/လ
- Application Insights: $5-50/လ
- Storage (Premium): $10-50/လ

**💡 ကုန်ကျစရိတ် စောင့်ကြည့်နည်း အကြံပြုချက်များ:**
- သင်သင်ကြားရာအတွက် Microsoft Foundry Models ရှိ **Free Tier** ကို အသုံးပြုပါ (Azure OpenAI တွင် 50,000 tokens/လ အပါ)
- ဖွံ့ဖြိုးရေးလုပ်နေမဟုတ်သောအချိန်တွင် `azd down` ကို အသုံးပြုပြီး resources များကို deallocate လုပ်ပါ
- စတင်လျှင် consumption-based billing ဖြင့် စတင်ပါ၊ ထုတ်လုပ်ရေးအဆင့်တွင်သာ PTU သို့ အဆင့်မြှင့်ပါ
- deployment မလုပ်မီ ကုန်ကျစရိတ် ခန့်မှန်းရန် `azd provision --preview` ကို အသုံးပြုပါ
- auto-scaling ကို ဖွင့်ထားပါ: အသုံးအမည်အရသာသာပင်ပေးရန်

**ကုန်ကျစရိတ် စစ်ဆေးခြင်း:**
```bash
# လစဉ် ခန့်မှန်းထားသော ကုန်ကျစရိတ်များကို စစ်ဆေးပါ
azd provision --preview

# Azure Portal တွင် တကယ့် ကုန်ကျစရိတ်ကို စောင့်ကြည့်ပါ
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ အခန်း 3: ပြင်ဆင်ခြင်း & အတည်ပြုခြင်း
**လိုအပ်ချက်များ**: အခန်း 1 အပြီးစီး済  
**ကြာချိန်**: 45-60 မိနစ်  
**ခက်ခဲမှု**: ⭐⭐

#### သင်ယူမည့် အချက်များ
- ပတ်ဝန်းကျင် ပြင်ဆင်ခြင်းနှင့် စီမံခန့်ခွဲခြင်း
- အတည်ပြုခြင်းနှင့် လုံခြုံရေး အကောင်းဆုံးလုပ်နည်းများ
- အရင်းအမြစ် အမည်ပေးခြင်းနှင့် အုပ်စုဖွဲ့လှုပ်ရှားမှု

#### သင်ယူရန် အရင်းအမြစ်များ
- **📖 Configuration**: [Configuration Guide](docs/chapter-03-configuration/configuration.md) - ပတ်ဝန်းကျင် စတင်ခြင်း
- **🔐 လုံခြုံရေး**: [Authentication patterns and managed identity](docs/chapter-03-configuration/authsecurity.md) - အတည်ပြုမှု ပုံစံများ
- **📝 ဥပမာများ**: [Database App Example](examples/database-app/README.md) - AZD Database ဥပမာများ

#### လက်တွေ့ လေ့ကျင့်ခန်းများ
- dev, staging, prod အစရှိသည့် ပတ်ဝန်းကျင်များ အမျိုးမျိုးကို ဖန်တီး ပြင်ဆင်ပါ
- managed identity authentication ကို စနစ်တကျ ပြင်ဆင်ပါ
- ပတ်ဝန်းကျင်အလိုက် သတ်မှတ်ချက်များ အကောင်အထည်ဖော်ပါ

**💡 အခန်းရလဒ်**: သင့်တွင် မှန်ကန်သော အတည်ပြုခြင်းနှင့် လုံခြုံရေးဖြင့် ပတ်ဝန်းကျင်များစွာကို စီမံနိုင်သည်

---

### 🏗️ အခန်း 4: Infrastructure as Code & Deployment
**လိုအပ်ချက်များ**: အခန်း 1-3 အပြီးစီး済  
**ကြာချိန်**: 1-1.5 နာရီ  
**ခက်ခဲမှု**: ⭐⭐⭐

#### သင်ယူမည့် အချက်များ
- မြင့်မားသော deployment ပုံစံများ
- Bicep ဖြင့် Infrastructure as Code
- အရင်းအမြစ် provisioning မျိုးစုံ

#### သင်ယူရန် အရင်းအမြစ်များ
- **📖 Deployment**: [Deployment Guide](docs/chapter-04-infrastructure/deployment-guide.md) - အပြည့်အစုံ workflow များ
- **🏗️ Provisioning**: [Provisioning Resources](docs/chapter-04-infrastructure/provisioning.md) - Azure အရင်းအမြစ် စီမံခန့်ခွဲမှု
- **📝 ဥပမာများ**: [Container App Example](../../examples/container-app) - ကွန်တိန်နာ ရှင််း deployment ဥပမာများ

#### လက်တွေ့ လေ့ကျင့်ခန်းများ
- custom Bicep templates များ ဖန်တီးပါ
- multi-service အက်ပ်များကို deploy ပြုလုပ်ပါ
- blue-green deployment များ အကောင်အထည်ဖော်ပါ

**💡 အခန်းရလဒ်**: custom infrastructure templates အသုံးပြု၍ ရှုပ်ထွေးသော multi-service အက်ပ်များကို deploy လုပ်နိုင်သည်

---

### 🎯 အခန်း 5: Multi-Agent AI Solutions (အဆင့်မြင့်)
**လိုအပ်ချက်များ**: အခန်း 1-2 အပြီးစီး済  
**ကြာချိန်**: 2-3 နာရီ  
**ခက်ခဲမှု**: ⭐⭐⭐⭐

#### သင်ယူမည့် အချက်များ
- multi-agent architecture ပုံစံများ
- agent များ၏ orchestration နှင့် coordination
- ထုတ်လုပ်ရေးအဆင့် အသင့် AI deployment များ

#### သင်ယူရန် အရင်းအမြစ်များ
- **🤖 ထူးခြားသော ပရောဂျက်**: [Retail Multi-Agent Solution](examples/retail-scenario.md) - အပြည့်အစုံ အကောင်အထည်ဖော်မှု
- **🛠️ ARM Templates**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - တစ်ချက်နှိပ် ထည့်သွင်းနိုင်သော package
- **📖 အင်ဂျင်နီယာပုံစံ**: [Multi-agent coordination patterns](docs/chapter-06-pre-deployment/coordination-patterns.md) - coordination ပုံစံများ

#### လက်တွေ့ လေ့ကျင့်ခန်းများ
```bash
# ပြည့်စုံသော လက်လီအတွက် အေးဂျင့်များ ပါဝင်သော ဖြေရှင်းချက်ကို တပ်ဆင်ပါ
cd examples/retail-multiagent-arm-template
./deploy.sh

# အေးဂျင့် ဖွဲ့စည်းပုံများကို စူးစမ်းပါ
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 အခန်းရလဒ်**: Customer နှင့် Inventory agent များပါရှိသည့် ထုတ်လုပ်ရေးအဆင့် multi-agent AI ဖြေရှင်းချက်ကို deploy နှင့် စီမံနိုင်သည်

---

### 🔍 အခန်း 6: Pre-Deployment အတည်ပြုခြင်း & စီမံကိန်း
**လိုအပ်ချက်များ**: အခန်း 4 အပြီးစီး済  
**ကြာချိန်**: 1 နာရီ  
**ခက်ခဲမှု**: ⭐⭐
#### သင်ယူမည့်အချက်များ
- စွမ်းဆောင်ရည် စီမံခန့်ခွဲမှုနှင့် အရင်းအမြစ် အတည်ပြုခြင်း
- SKU ရွေးချယ်မှု နည်းဗျူဟာများ
- မတိုင်မီ စစ်ဆေးမှုများနှင့် အလိုအလျောက်လုပ်ငန်းစဉ်များ

#### သင်ယူရန် အရင်းအမြစ်များ
- **📊 Planning**: [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) - အရင်းအမြစ် အတည်ပြုမှု
- **💰 Selection**: [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) - ကုန်ကျစရိတ် ထိရောက်စွာ ရွေးချယ်မှုများ
- **✅ Validation**: [Pre-flight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) - အလိုအလျောက် စကရစ်ပ့်များ

#### လက်တွေ့ လေ့ကျင့်ခန်းများ
- စွမ်းဆောင်ရည် အတည်ပြုရေး စကရစ်ပ့်များကို chạy/run ပြုလုပ်ပါ
- ကုန်ကျစရိတ်အတွက် SKU ရွေးချယ်မှုများကို အလေ့အကျင့် ထိထိရောက်ရောက် ပြုပြင်ပါ
- တင်သွင်းမှုမတိုင်ခင် အလိုအလျောက် စစ်ဆေးမှုများကို အကောင်အထည်ဖော်ပါ

**💡 အခန်းရလဒ်**: တင်သွင်းမှုပြုလုပ်မီ အတည်ပြု၍ ထိထိရောက်ရောက် အမြှင့်တင်ပါ

---

### 🚨 Chapter 7: Troubleshooting & Debugging
**လိုအပ်ချက်များ**: မည်သည့် တင်သွင်းရေး အခန်းမဆို ပြီးမြောက်ထားသင့်သည်  
**သက်တမ်း**: 1-1.5 နာရီ  
**ရှုပ်ထွေးမှု**: ⭐⭐

#### သင်ယူမည့်အချက်များ
- စနစ်တကျ ဒက်ဘတ်ဂ်လုပ်နည်းများ
- ပုံမှန် ဖြစ်တတ်သော ပြဿနာများနှင့် ဖြေရှင်းနည်းများ
- AI သက်ဆိုင်ရာ ပြဿနာရှာဖွေရေး

#### သင်ယူရန် အရင်းအမြစ်များ
- **🔧 Common Issues**: [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) - မကြာခဏ တွေ့ရသောမေးခွန်းများနှင့် ဖြေရှင်းချက်များ
- **🕵️ Debugging**: [Debugging Guide](docs/chapter-07-troubleshooting/debugging.md) - အဆင့်လိုက် နည်းဗျူဟာများ
- **🤖 AI Issues**: [AI-Specific Troubleshooting](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AI ဝန်ဆောင်မှု ပြဿနာများ

#### လက်တွေ့ လေ့ကျင့်ခန်းများ
- တင်သွင်းမှု မအောင်မြင်သည့် အချက်များကို ရှာဖွေ သုံးသပ်ပါ
- အထောက်အထား ဆက်သွယ်ရေး ပြဿနာများကို ဖြေရှင်းပါ
- AI ဝန်ဆောင်မှု ချိတ်ဆက်မှုများကို ဒက်ဘတ်ဂ် ပြုလုပ်ပါ

**💡 အခန်းရလဒ်**: ပုံမှန် တင်သွင်းမှု ပြဿနာများကို ကိုယ့်တိုင် သတ်မှတ်၍ ဖြေရှင်းနိုင်ခြင်း

---

### 🏢 Chapter 8: Production & Enterprise Patterns
**လိုအပ်ချက်များ**: အခန်း ၁-၄ ပြီးမြောက်ထားရမည်  
**သက်တမ်း**: 2-3 နာရီ  
**ရှုပ်ထွေးမှု**: ⭐⭐⭐⭐

#### သင်ယူမည့်အချက်များ
- ထုတ်လုပ်ရေး တင်သွင်းနည်းဗျူဟာများ
- စီးပွားရေးလုံခြုံရေး ပုံစံများ
- မော်နီတာနှင့် ကုန်ကျစရိတ် တိုးတက်အောင် ပြုပြင်ခြင်း

#### သင်ယူရန် အရင်းအမြစ်များ
- **🏭 Production**: [Production AI Best Practices](docs/chapter-08-production/production-ai-practices.md) - စီးပွားရေး ပုံစံများ
- **📝 Examples**: [Microservices Example](../../examples/microservices) - ရှုပ်ထွေးသော ဖွဲ့စည်းပုံများ
- **📊 Monitoring**: [Application Insights integration](docs/chapter-06-pre-deployment/application-insights.md) - မော်နီတာခြင်း

#### လက်တွေ့ လေ့ကျင့်ခန်းများ
- စီးပွားရေး လုံခြုံရေး ပုံစံများကို အကောင်အထည်ဖော်ပါ
- ပြည့်စုံသည့် မော်နီတာ စနစ် တပ်ဆင်ပါ
- သတ်မှတ်ထားသော အုပ်ချုပ်မှုနှင့်အတူ ထုတ်လုပ်ရေးသို့ တင်သွင်းပါ

**💡 အခန်းရလဒ်**: ထုတ်လုပ်ရေးအဆင့် ပြီးပြည့်စုံသော၊ စီးပွားရေးအသုံးပြုနိုင်သော အပလီကေးရှင်းများကို တင်သွင်းနိုင်ခြင်း

---

## 🎓 အလုပ်ရုံကျောင်း အကျဉ်းချုပ်: လက်တွေ့ သင်ယူမှု အတွေ့အကြုံ

> **⚠️ အလုပ်ရုံကျောင်း အခြေအနေ: လက်ရှိ ဖွံ့ဖြိုးဆဲ**  
> အလုပ်ရုံကျောင်း ပစ္စည်းများကို လက်ရှိ ဖန်တီးနေဆဲနှင့် တိုးတက်ကောင်းမွန်အောင် ပြုပြင်နေပါသည်။ အဓိက မော်ဂျူးများ အလုပ်လုပ်နေသော်လည်း အဆင့်မြင့် အပိုင်းများ တချို့ မပြည့်စုံသေးပါ။ ကျွန်ုပ်တို့သည် အကြောင်းအရာများအားလုံး ပြီးမြောက်စေရန် တိုက်တွန်း လုပ်ကိုင်နေပါသည်။ [Track progress →](workshop/README.md)

### Interactive Workshop Materials
**ဘရောက်ဇာအခြေပြု ကိရိယာများနှင့် လမ်းညွန်ထားသော လက်တွေ့ လေ့ကျင့်ခန်းများဖြင့် ပြည့်စုံသော လက်တွေ့သင်ယူမှု**

ကျွန်ုပ်တို့၏ အလုပ်ရုံပစ္စည်းများသည် အခန်းများအပေါ်အခြေခံ သင်ကြားမှုအစီအစဉ်အား ထိန်းသိမ်းပေးပြီး လက်တွေ့ သင်ယူရန်နှင့် သင်ကြားရေးမှူးဦးဆောင်သင်ကြားရန် နှစ်မျိုးစလုံးအတွက် အဆင်ပြေစေပါသည်။

#### 🛠️ Workshop Features
- **Browser-Based Interface**: MkDocs အား အသုံးပြုထားသော ဘရောက်ဇာအခြေပြု အလုပ်ရုံကျောင်း၊ ရှာဖွေခြင်း၊ အသစ်ကူးယူခြင်းနှင့် အကြောင်းအရာမျိုးစုံ theme အင်္ဂါရပ်များ
- **GitHub Codespaces Integration**: တစ်ချက်နှိပ်ခြင်းဖြင့် ဖွံ့ဖြိုးရေးပတ်ဝန်းကျင် ထည့်သွင်းခြင်း
- **Structured Learning Path**: 8-မော်ဂျူး ဦးတည်ထားသော လမ်းကြောင်း (စုစုပေါင်း 3-4 နာရီ)
- **Progressive Methodology**: မိတ်ဆက် → ရွေးချယ်မှု → အတည်ပြုမှု → ဖျက်သိမ်း၍ ပိုင်းခြား လေ့လာမှု → ကွန်ဖစ်ဂျာရေးရှင်း → စိတ်တိုင်းအောင် ပြင်ဆင်မှု → ဖျက်ပစ်ခြင်း → အဖုံးချုပ်
- **Interactive DevContainer Environment**: ကြိုတင် ကွန်ဖစ်ဂျာလုပ်ထားသော ကိရိယာများနှင့် အသုံးပြုရန်လိုအပ်ချက်များ

#### 📚 Workshop Module Structure
This workshop follows an **8-module progressive methodology** that takes you from discovery to deployment mastery:

| Module | Topic | What You'll Do | Duration |
|--------|-------|----------------|----------|
| **0. Introduction** | Workshop Overview | သင်ယူနိုင်မှုပန်းတိုင်များ၊ လိုအပ်ချက်များနှင့် အလုပ်ရုံဖွဲ့စည်းပုံကို နားလည်ပါ | 15 min |
| **1. Selection** | Template Discovery | AZD templates များကို ရှာဖွေပြီး သင့်အခြေအနေကို အသင့်တော်ဆုံး AI template ကို ရွေးချယ်မည် | 20 min |
| **2. Validation** | Deploy & Verify | `azd up` ဖြင့် template ကို တင်သွင်းပြီး အင်ဖရာစတာက်ချာကို အတည်ပြုမည် | 30 min |
| **3. Deconstruction** | Understand Structure | GitHub Copilot ကို အသုံးပြု၍ template အင်္ဂါပေါင်းများ၊ Bicep ဖိုင်များနှင့် ကုဒ် ဂုဏ်သိက္ခာကို လေ့လည်မည် | 30 min |
| **4. Configuration** | azure.yaml Deep Dive | `azure.yaml` ကို နက်နက်ရှိုင်းရှိုင်း လေ့လာပြီး lifecycle hooks နှင့် environment variables များကို ဗဟုသုတ ခုပ်ခြင်း | 30 min |
| **5. Customization** | Make It Yours | AI Search, tracing, evaluation များကို ဖွင့်ကာ သင့်အခြေအနေအတွက် ပြင်ဆင်မည် | 45 min |
| **6. Teardown** | Clean Up | `azd down --purge` ဖြင့် လုံခြုံစွာ အရင်းအမြစ်များကို ဖျက်ပစ်မည် | 15 min |
| **7. Wrap-up** | Next Steps | ဆောင်ရွက်ချက်များ၊ အချက်အလက်အဓိကများကို ပြန်လည်သုံးသပ်ပြီး ပညာသင်ကြားရေး ခရီးကို ဆက်လက်တိုးတက်စေမည် | 15 min |

**Workshop Flow:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 Getting Started with the Workshop
```bash
# ရွေးချယ်မှု ၁: GitHub Codespaces (အကြံပြု)
# Repository အတွင်း "Code" ကို နှိပ်ပြီး → "Create codespace on main" ကို ရွေးပါ

# ရွေးချယ်မှု ၂: ဒေသීය ဖွံ့ဖြိုးရေး
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# workshop/README.md ထဲရှိ ဆက်တင် ဖော်ပြချက်များကို လိုက်နာပါ
```

#### 🎯 Workshop Learning Outcomes
By completing the workshop, participants will:
- **Deploy Production AI Applications**: AZD နှင့် Microsoft Foundry ဝန်ဆောင်မှုများကို အသုံးပြု၍ ထုတ်လုပ်ရေးအဆင့် AI အက်ပလီကေးရှင်းများ တင်သွင်းနိုင်မည်
- **Master Multi-Agent Architectures**: ချိတ်ဆက်ထားသော AI agent ဖြေရှင်းနည်းများကို အကောင်အထည်ဖော်နိုင်မည်
- **Implement Security Best Practices**: အတည်ပြုမှုနှင့် လက်လှမ်းရယူခြင်း ထိန်းချုပ်မှုများကို ကွန်ဖစ်ဂျာလုပ်နိုင်မည်
- **Optimize for Scale**: ကုန်ကျစရိတ်နှင့် အမြန်နှုန်းကို ထိန်းသိမ်းနိုင်သော စီမံချက်များ ဖန်တီးနိုင်မည်
- **Troubleshoot Deployments**: တင်သွင်းမှု ပြဿနာများကို ကိုယ့်တိုင် ဖြေရှင်းနိုင်မည်

#### 📖 Workshop Resources
- **🎥 Interactive Guide**: [Workshop Materials](workshop/README.md) - ဘရောက်ဇာအခြေပြု သင်ယူမှု ပတ်ဝန်းကျင်
- **📋 Module-by-Module Instructions**:
  - [0. Introduction](workshop/docs/instructions/0-Introduction.md) - အလုပ်ရုံကျောင်း အကျဉ်းချုပ်နှင့် ရည်မှန်းချက်များ
  - [1. Selection](workshop/docs/instructions/1-Select-AI-Template.md) - AI templates ရှာဖွေရေးနှင့် ရွေးချယ်နည်း
  - [2. Validation](workshop/docs/instructions/2-Validate-AI-Template.md) - Template တင်သွင်းသည့်နည်းလမ်းနှင့် အတည်ပြုခြင်း
  - [3. Deconstruction](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Template ဖွဲ့စည်းပုံကို လေ့လာခြင်း
  - [4. Configuration](workshop/docs/instructions/4-Configure-AI-Template.md) - azure.yaml ကို ကျွမ်းကျင်စွာ အသုံးပြုခြင်း
  - [5. Customization](workshop/docs/instructions/5-Customize-AI-Template.md) - သင့်အခြေအနေအတိုင်း ပြင်ဆင်ခြင်း
  - [6. Teardown](workshop/docs/instructions/6-Teardown-Infrastructure.md) - အရင်းအမြစ်များ ရှင်းလင်းဖျက်ပစ်ခြင်း
  - [7. Wrap-up](workshop/docs/instructions/7-Wrap-up.md) - ပြန်လည်သုံးသပ်ခြင်းနှင့် နောက်တစ်ဆင့်များ
- **🛠️ AI Workshop Lab**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI အလေ့အကျင့်များအတွက် စမ်းသပ်ပါ
- **💡 Quick Start**: [Workshop Setup Guide](workshop/README.md#quick-start) - ပတ်ဝန်းကျင် အတွက် အမြန်စတင်အသုံးပြုနည်း

**သင့်တော်ပါသည်**: ကော်ပိုရေးရှင်း သင်တန်းများ၊ တက္ကသိုလ် အတန်းများ၊ ကိုယ်တိုင် လေ့လာရသော သင်တန်းများနှင့် Developer bootcamps များအတွက်။

---

## 📖 နက်ရှိုင်းစွာ ကြည့်ရှုခြင်း: AZD ၏ စွမ်းဆောင်ရည်များ

အခြေခံအရာများ အပြင်၊ AZD သည် ထုတ်လုပ်ရေး တင်သွင်းမှုများအတွက် အလွန်အစွမ်းထက်သော လုပ်ဆောင်ချက်များကို ပံ့ပိုးပေးပါသည်။

- **Template-based deployments** - ပုံမှန် အက်ပလီကေးရှင်း ပုံစံများအတွက် ကြိုတင်ဆောက်ထားသော template များ အသုံးပြုနိုင်သည်
- **Infrastructure as Code** - Bicep သို့မဟုတ် Terraform အသုံးပြု၍ Azure အရင်းအမြစ်များကို စီမံနိုင်သည်  
- **Integrated workflows** - အက်ပလီကေးရှင်းများကို ချောမွေ့စွာ ပရော်ဗိုင်းရှင်း၊ တင်သွင်းနှင့် မော်နီတာလုပ်နိုင်သည်
- **Developer-friendly** - ဖွံ့ဖြိုးရေးသူများ၏ ထုတ်လုပ်မှုနှင့် အတွေ့အကြုံအတွက် အထူးတိုးတက်စေထားသည်

### **AZD + Microsoft Foundry: AI တင်သွင်းမှုများအတွက် အကောင်းဆုံး သတ်မှတ်ချက်**

**AZD ကို AI ဖြေရှင်းချက်များအတွက် ဘာကြောင့် အသုံးပြုသင့်သလဲ?** AZD သည် AI ဖွံ့ဖြိုးရေးသမားများ ကြုံတွေ့ရသော ထိပ်တန်း စိန်ခေါ်မှုများကို ဖြေရှင်းပေးသည်။

- **AI-Ready Templates** - Microsoft Foundry Models, Cognitive Services, နှင့် ML လုပ်ငန်းများအတွက် ကြိုတင်ကွန်ဖစ်ဂျာထားသော template များ
- **Secure AI Deployments** - AI ဝန်ဆောင်မှုများ၊ API keys နှင့် model endpoints များအတွက် တည်ဆောက်ထားသော လုံခြုံရေး ပုံစံများ  
- **Production AI Patterns** - တိုးချဲ့နိုင်ပြီး ကုန်ကျစရိတ်ထိရောက်သော AI အက်ပလီကေးရှင်း တင်သွင်းရေးအတွက် အကောင်းဆုံး လက်တွေ့ကျကျ နည်းလမ်းများ
- **End-to-End AI Workflows** - မော်ဒယ် ဖွံ့ဖြိုးရေးမှ ထုတ်လုပ်ရေး တင်သွင်းမှုထိ မော်နီတာခြင်းနှင့်အတူ အလုံးစုံလုပ်ဆောင်မှုများ
- **Cost Optimization** - AI လုပ်ငန်းတင်သွင်းမှုများအတွက် အရင်းအမြစ် ချမှတ်ခြင်းနှင့် စွမ်းဆောင်ရည် တစ်စိတ်တစ်ပိုင်း အတွက်စီမံချက်များ
- **Microsoft Foundry Integration** - Microsoft Foundry မော်ဒယ် ကတ်ထလော့အာနှင့် endpoint များနှင့် ချိတ်ဆက်အသုံးပြုနိုင်မှု

---

## 🎯 Templates & Examples Library

### Featured: Microsoft Foundry Templates
**AI အက်ပလီကေးရှင်းများ တင်သွင်းမည့်သူများ အတွက် ဒီနေရာမှ စတင်ပါ!**

> **မှတ်ချက်:** ဤ template များသည် အမျိုးမျိုးသော AI ပုံစံများကို ပြသသည်။ တချို့မှာ ပြင်ပ Azure Samples ဖြစ်ကာ တချို့ကို ဒေသတွင်း အကောင်အထည်ဖော်ထားသည်။

| Template | Chapter | Complexity | Services | Type |
|----------|---------|------------|----------|------|
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Chapter 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | ပြင်ပ |
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Chapter 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| ပြင်ပ |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Chapter 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | ပြင်ပ |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chapter 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | ပြင်ပ |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Chapter 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | ပြင်ပ |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Chapter 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | ပြင်ပ |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Chapter 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **ဒေသတွင်း** |

### Featured: Complete Learning Scenarios
**ထုတ်လုပ်ရေးအသင့် အက်ပလီကေးရှင်း template များကို သင်ယူခန်းများနှင့် လိုက်၍ ဖော်ပြထားသည်**

| Template | Learning Chapter | Complexity | Key Learning |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chapter 2 | ⭐ | အခြေခံ AI တင်သွင်းနည်းပုံစံများ |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Chapter 2 | ⭐⭐ | Azure AI Search ဖြင့် RAG ကို အကောင်အထည်ဖော်ခြင်း |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Chapter 4 | ⭐⭐ | Document Intelligence တွဲဖက်ခြင်း |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Chapter 5 | ⭐⭐⭐ | Agent ဖွဲ့စည်းပုံနှင့် function calling |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Chapter 8 | ⭐⭐⭐ | စီးပွားရေးအဆင့် AI စနစ် စီမံခန့်ခွဲခြင်း |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Chapter 5 | ⭐⭐⭐⭐ | Customer နှင့် Inventory agents များပါသော Multi-agent ဖွဲ့စည်းပုံ |

### Learning by Example Type

> **📌 Local vs. External Examples:**  
> **Local Examples** (in this repo) = လက်ရှိ အသုံးပြုနိုင်သည်  
> **External Examples** (Azure Samples) = လိပ်စာနှင့် ထည့်၍ clone လုပ်ပါ

#### Local Examples (Ready to Use)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - ARM template များနှင့် အတူ ပြည့်စုံသော ထုတ်လုပ်ရေး အသင့် အကောင်အထည်ဖော်ချက်
  - Multi-agent ဖွဲ့စည်းပုံ (Customer + Inventory agents)
  - တိကျပြည့်စုံသော မော်နီတာနှင့် အကဲဖြတ်မှု
  - ARM template ဖြင့် တစ်ချက်နှိပ် တင်သွင်းနိုင်မှု

#### Local Examples - Container Applications (Chapters 2-5)
**ဤ repository တွင် ပြည့်စုံသော container တင်သွင်းမှု ဥပမာများ:**
- [**Container App Examples**](examples/container-app/README.md) - ကွန်တိန်နာ များစွာအတွက် တင်သွင်းနည်းလမ်းညွှန်
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - scale-to-zero ပါရှိသော မူလ REST API
  - [Microservices Architecture](../../examples/container-app/microservices) - ထုတ်လုပ်ရေး အသင့် များစွာသော multi-service တင်သွင်းမှု
  - Quick Start, Production, နှင့် အဆင့်မြင့် တင်သွင်းမှု ပုံစံများ
  - မော်နီတာ၊ လုံခြုံရေးနှင့် ကုန်ကျစရိတ် တိုးတက်အောင် လမ်းညွန်ချက်များ

#### External Examples - Simple Applications (Chapters 1-2)
**စတင်ရန် ဤ Azure Samples repositories များကို clone လုပ်ပါ:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - အခြေခံ တင်သွင်းမှု ပုံစံများ
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Static content တင်သွင်းခြင်း
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API တင်သွင်းမှု

#### External Examples - Database Integration (Chapter 3-4)
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - ဒေတာဘေ့စ် ချိတ်ဆက်မှု ပုံစံများ
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverless ဒေတာ လုပ်ငန်းစဉ်

#### အပြင်ဥပမာများ - တိုးတက်သော ပုံစံများ (အခန်း 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - ဝန်ဆောင်မှု မျိုးစုံဆိုင်ရာ ဖွဲ့စည်းပုံများ
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - နောက်ခံ အလုပ်လုပ်ငန်းအမှုများ  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - ထုတ်လုပ်မှု အသင့် ML ပုံစံများ

### အပြင်ပုံစံများ စုစည်းခြင်း
- [**Official AZD Template Gallery**](https://azure.github.io/awesome-azd/) - တရားဝင်နှင့် အသိုင်းအဝိုင်းပံ့ပိုးမှု ပုံစံများကို စုစည်းထားသည်
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn ပုံစံ လက်စွဲစာချုပ်
- [**Examples Directory**](examples/README.md) - အသေးစိတ် ရှင်းလင်းချက်များ ပါသော ဒေသဆိုင်ရာ သင်ယူရန် ဥပမာများ

---

## 📚 သင်ယူရန် အရင်းအမြစ်များ နှင့် ကိုးကားချက်များ

### တိုတောင်းသော ကိုးကားများ
- [**Command Cheat Sheet**](resources/cheat-sheet.md) - အဓိက azd အမိန့်များ ကို အခန်းအလိုက် စီထားသောစာရွက်
- [**Glossary**](resources/glossary.md) - Azure နှင့် azd ဆိုလိုခြင်းများ  
- [**FAQ**](resources/faq.md) - သင်ယူရေး အခန်းအလိုက် စုပြထားသော မကြာခဏ မေးခွန်းများ
- [**Study Guide**](resources/study-guide.md) - လေ့ကျင့်မှု အပြည့်အစုံ များ

### လက်တွေ့ အလုပ်ရုံများ
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - သင့် AI ဖြေရှင်းချက်များကို AZD ဖြင့် တပ်ဆင်နိုင်အောင် ပြုလုပ်ရန် (2-3 hours)
- [**Interactive Workshop**](workshop/README.md) - MkDocs နှင့် GitHub Codespaces အသုံးပြုပြီး 8-ပိုင်း ဦးဆောင်လေ့ကျင့်ခန်းများ
  - လုပ်ဆောင်မည့် အဆင့်များ: မိတ်ဆက် → ရွေးချယ်မှု → အတည်ပြုခြင်း → ခွဲခြမ်းစိစစ်ခြင်း → ဖွဲ့စည်းမှု → စိတ်ကြိုက်ပြင်ဆင်မှု → ပိတ်သိမ်းခြင်း → အနှုတ်ချုပ်

### ပြင်ပ သင်ယူရေး အရင်းအမြစ်များ
- Azure Developer CLI Documentation: https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/
- Azure Architecture Center: https://learn.microsoft.com/en-us/azure/architecture/
- Azure Pricing Calculator: https://azure.microsoft.com/pricing/calculator/
- Azure Status: https://status.azure.com/

### သင်၏ အယ်ဒီတာအတွက် AI အေဂျင့် ကျွမ်းကျင်မှုများ
- [**Microsoft Azure Skills on skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - Azure AI, Foundry, တပ်ဆင်ခြင်း၊ ရှာဖွေစစ်ဆေးခြင်း၊ ကုန်ကျစရိတ် ထိန်းချုပ်ခြင်း နှင့် အခြား အလုပ်များအတွက် ဖွင့်လှစ်ထားသော agent skill 37 ခု။ GitHub Copilot, Cursor, Claude Code, သို့မဟုတ် ပံ့ပိုးသော အေဂျင့် မည်သို့တွင်မဆို တပ်ဆင်နိုင်သည်။
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 အမြန် ပြုပြင်ရှာဖွေမှု လမ်းညွှန်

**အသစ်စစအကြုံ မရှိသေးသူများ ကြုံတွေ့ရသည့် ပျမ်းမျှ ပြဿနာများနှင့် ချက်ချင်း ဖြေရှင်းနည်းများ:**

<details>
<summary><strong>❌ "azd: command not found"</strong></summary>

```bash
# ပထမဦးစွာ AZD ကို တပ်ဆင်ပါ
# Windows (PowerShell) အတွက်:
winget install microsoft.azd

# macOS အတွက်:
brew tap azure/azd && brew install azd

# Linux အတွက်:
curl -fsSL https://aka.ms/install-azd.sh | bash

# တပ်ဆင်မှုကို စစ်ဆေးပါ
azd version
```
</details>

<details>
<summary><strong>❌ "No subscription found" or "Subscription not set"</strong></summary>

```bash
# ရရှိနိုင်သည့် subscription များကို စာရင်းပြပါ
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

# သို့မဟုတ် ဖွံ့ဖြိုးရေးတွင် အသေးငယ်သော SKU များကို အသုံးပြုပါ
# infra/main.parameters.json ကို တည်းဖြတ်ပါ:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" fails halfway through</strong></summary>

```bash
# ရွေးချယ်မှု 1: ရှင်းပြီး ထပ်မံ စမ်းကြည့်ပါ
azd down --force --purge
azd up

# ရွေးချယ်မှု 2: အဆောက်အအုံကိုသာ ပြင်ဆင်ပါ
azd provision

# ရွေးချယ်မှု 3: အသေးစိတ် အခြေအနေကို စစ်ဆေးပါ
azd show

# ရွေးချယ်မှု 4: Azure Monitor တွင် လော့ဂ်များကို စစ်ဆေးပါ
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Authentication failed" or "Token expired"</strong></summary>

```bash
# AZD အတွက် ပြန်လည် အတည်ပြုပါ
azd auth logout
azd auth login

# ရွေးချယ်စရာ — az အမိန့်များကို အသုံးပြုနေပါက Azure CLI ကိုလည်း ပြန်လည် အသစ်ပြုလုပ်ပါ
az logout
az login

# အတည်ပြုမှုကို စစ်ဆေးပါ
az account show
```
</details>

<details>
<summary><strong>❌ "Resource already exists" or naming conflicts</strong></summary>

```bash
# AZD သည် ထူးခြားသော နာမည်များကို ဖန်တီးပေးသော်လည်း၊ နာမည် တူနေခြင်း ရှိလာပါက:
azd down --force --purge

# ထို့နောက် အသစ်သော ပတ်ဝန်းကျင်ဖြင့် ထပ်မံ ကြိုးစားပါ
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Template deployment taking too long</strong></summary>

**ပျမ်းမျှ ခေတ္တစောင့်ဆိုင်းချိန်များ:**
- ရိုးရှင်းသော ဝက်ဘ် အက်ပ်: 5-10 မိနစ်
- ဒေတာဘေ့စ် ပါသော အက်ပ်: 10-15 မိနစ်
- AI အက်ပလီကေးရှင်းများ: 15-25 မိနစ် (OpenAI ပြင်ဆင်ခြင်း နောက်ကျတတ်သည်)

```bash
# တိုးတက်မှုကို စစ်ဆေးပါ
azd show

# ၃၀ မိနစ်ထက်ပို ရပ်နေပါက Azure Portal ကို စစ်ဆေးပါ:
azd monitor --overview
# မအောင်မြင်သော တပ်ဆင်မှုများကို ရှာပါ
```
</details>

<details>
<summary><strong>❌ "Permission denied" or "Forbidden"</strong></summary>

```bash
# သင့် Azure အခန်းကဏ္ဍကို စစ်ဆေးပါ
az role assignment list --assignee $(az account show --query user.name -o tsv)

# သင့်တွင် အနည်းဆုံး "Contributor" အခန်းကဏ္ဍ လိုအပ်သည်
# သင့် Azure အုပ်ချုပ်သူအား ပေးရန် တောင်းဆိုပါ:
# - Contributor (ရင်းမြစ်များအတွက်)
# - User Access Administrator (အခန်းကဏ္ဍ ပေးအပ်မှုများအတွက်)
```
</details>

<details>
<summary><strong>❌ Can't find deployed application URL</strong></summary>

```bash
# ဝန်ဆောင်မှု endpoint များအားလုံးကို ပြပါ
azd show

# သို့မဟုတ် Azure Portal ကို ဖွင့်ပါ
azd monitor

# တိကျသော ဝန်ဆောင်မှုကို စစ်ဆေးပါ
azd env get-values
# *_URL အမည်ရှိသော အပြောင်းအလဲများကို ရှာပါ
```
</details>

### 📚 ဖြည့်စွက် ပြုပြင်ရှာဖွေရေး အရင်းအမြစ်များ

- **Common Issues Guide:** [အသေးစိတ် ဖြေရှင်းချက်များ](docs/chapter-07-troubleshooting/common-issues.md)
- **AI-Specific Issues:** [AI ပြဿနာများ ပြုပြင်ရှာဖွေရေး](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Debugging Guide:** [အဆင့်လိုက် အမှားရှာဖွေရေး](docs/chapter-07-troubleshooting/debugging.md)
- **Get Help:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 သင်တန်း ပြီးမြောက်ခြင်းနှင့် လက်မှတ်

### တိုးတက်မှု ထောက်လှမ်းမှု
တစ်ခန်းချင်းစီမှ သင်ယူမှု တိုးတက်မှုကို လိုက်နာပါ။

- [ ] **Chapter 1**: အခြေခံနှင့် အလျင်အမြန် စတင်ခြင်း ✅
- [ ] **Chapter 2**: AI-First Development ✅  
- [ ] **Chapter 3**: Configuration & Authentication ✅
- [ ] **Chapter 4**: Infrastructure as Code & Deployment ✅
- [ ] **Chapter 5**: Multi-Agent AI Solutions ✅
- [ ] **Chapter 6**: Pre-Deployment Validation & Planning ✅
- [ ] **Chapter 7**: Troubleshooting & Debugging ✅
- [ ] **Chapter 8**: Production & Enterprise Patterns ✅

### သင်ယူမှု အတည်ပြုခြင်း
အခန်းတစ်ခန်းစီ ပြီးမြောက်ပြီးပါက သင့်နည်းပညာ သိမြင်မှုကို အတည်ပြုပါ။
1. **လက်တွေ့ လေ့ကျင့်ခန်း**: အခန်း၏ လက်တွေ့ တပ်ဆင်မှုကို ပြီးမြောက်ပါ။
2. **တတ်မြောက်မှု စစ်ဆေးခြင်း**: သင်၏ အခန်းအတွက် FAQ အပိုင်းကို ပြန်လည်ဆန်းစစ်ပါ။
3. **အသိုင်းအဝိုင်း ဆွေးနွေးချက်**: သင့်အတွေ့အကြုံကို Azure Discord တွင် ဝေမျှပါ။
4. **နောက်တစ်ခန်း**: နောက်အဆင့် စိန်ခေါ်မှု သို့ ရွေ့ပြောင်းပါ။

### သင်တန်း ပြီးမြောက်ခြင်း အကျိုးကျေးဇူးများ
အခန်းအားလုံး ပြီးမြောက်ပါက သင်မှာ ရရှိမည့် အရာများ -
- **ထုတ်လုပ်ရေး အတွေ့အကြုံ**: အမှန်တကယ် AI အက်ပလီကေးရှင်းများကို Azure သို့ တပ်ဆင်နိုင်ခဲ့ခြင်း
- **ပရော်ဖက်ရှင်နယ် ကျွမ်းကျင်မှုများ**: အဖွဲ့အစည်း အသင့် ဖြန့်ချိနိုင်မှုများ  
- **အသိုင်းအဝိုင်း မှတ်သားချက်**: Azure developer အသိုင်းအဝိုင်း၏ လှုပ်ရှားနေသော အဖွဲ့ဝင်
- **ဘဝအလုပ် အကောင်းမြင့်လာခြင်း**: တောင်းဆိုနေသော AZD နှင့် AI တပ်ဆင်မှု ကျွမ်းကျင်မှုများ

---

## 🤝 လူ့အသိုင်းအဝိုင်း နှင့် အထောက်အပံ့

### အကူအညီနှင့် အထောက်အပံ့ ရယူရန်
- **Technical Issues**: [အမှားများကို အစီရင်ခံရန်နှင့် အင်္ဂါရပ်များ တောင်းဆိုရန်](https://github.com/microsoft/azd-for-beginners/issues)
- **Learning Questions**: [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure) နှင့် [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI-Specific Help**: Join the [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Documentation**: [Official Azure Developer CLI documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Microsoft Foundry Discord မှ အသိုင်းအဝိုင်း အမြင်များ

**နောက်ဆုံး စစ်တမ်း ရလဒ်များ (#Azure ချန်နယ် မှ):**
- **45%** ဆော့ဖ်ဝဲ developer များသည် AI လုပ်ငန်းများအတွက် AZD ကို အသုံးချလိုသူ ဖြစ်ကြသည်
- **အဓိက စိန်ခေါ်မှုများ**: ဝန်ဆောင်မှု မျိုးစုံ ဖြန့်ချိခြင်း၊ အတည်ပြုအချက်အလက် စီမံခန့်ခွဲမှု၊ ထုတ်လုပ်ရေး အသင့်ရှိမှု  
- **အများဆန္ဒရှိဆုံး**: AI-specific ပုံစံများ၊ ပြဿနာရှာဖွေမှု လမ်းညွှန်များ၊ အကောင်းဆုံး လုပ်ထုံးလုပ်နည်းများ

### ကျွန်တော်တို့၏ အသိုင်းအဝိုင်းတွင် ပါဝင်ခြင်းအားဖြင့်
- AZD + AI အတွေ့အကြုံများကို ဝေမျှ၍ ကူညီနိုင်သည်
- AI ပုံစံအသစ်များ၏ အစမ်းသပ်ကြည့်ရှုခွင့်များကို ရရှိနိုင်သည်
- AI တပ်ဆင်ခြင်း အတွက် အကောင်းဆုံး လုပ်ထုံးလုပ်နည္းများပေးနိုင်သည်
- အနာဂတ် AI + AZD လုပ်ဆောင်ချက်များကို တိုးတက်စေသည့် အမြင်ပေးနိုင်သည်

### သင်တန်းတွင် ပါဝင် ပံ့ပိုးရန်
ကျွန်တော်တို့ သာလွန်စွာ ကြိုဆိုပါသည်! အသေးစိတ်အချက်အလက်များအတွက် ကျေးဇူးပြု၍ [Contributing Guide](CONTRIBUTING.md) ကို ဖတ်ပါ -
- **အကြောင်းအရာ တိုးတက်မှုများ**: ရှိပြီးသား အခန်းများနှင့် ဥပမာများကို တိုးမြှင့်ပါ
- **ဥပမာ အသစ်များ**: အမှန်တကယ် ဖြစ်ပျက်သော အခြေအနေများနှင့် ပုံစံများ ထည့်သွင်းပါ  
- **ဘာသာပြန်မှု**: ဘာသာစကား မျိုးစုံ အထောက်အပံ့ ထိန်းသိမ်းပေးရန် ကူညီပါ
- **အမှား အစီရင့်များ**: တိကျမှန်ကန်မှုနှင့် ရှင်းလင်းမှုကို မြှင့်တင်ပါ
- **အသိုင်းအဝိုင်း စံနှုန်းများ**: ကျွန်တော်တို့၏ ပေါင်းသင်းထိန်းသိမ်းမှု စံသတ်မှတ်ချက်များကို လိုက်နာပါ

---

## 📄 သင်တန်း သတင်းအချက်အလက်

### လိုင်စင်
ဒီ ပရောဂျက်ကို MIT License ဖြင့် လိုင်စင် ခွင့်ပြုထားသည် - အသေးစိတ်အချက်အလက်များအတွက် [LICENSE](../../LICENSE) ဖိုင်ကို ကြည့်ပါ။

### သက်ဆိုင်ရာ Microsoft သင်ယူရေး အရင်းအမြစ်များ

ကျွန်တော်တို့ အဖွဲ့သည် အခြား ပြည့်စုံသော သင်ကြားရေး သင်တန်းများကိုလည်း ထုတ်လုပ်ပါသည်။

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j for Beginners](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js for Beginners](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain for Beginners](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

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
[![အစပြုသူများအတွက် ဒေတာ သိပ္ပံ](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![အစပြုသူများအတွက် AI](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![အစပြုသူများအတွက် စိုင်ဘာလုံခြုံရေး](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![အစပြုသူများအတွက် ဝက်ဘ် ဖွံ့ဖြိုးရေး](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![အစပြုသူများအတွက် IoT](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![အစပြုသူများအတွက် XR ဖွံ့ဖြိုးရေး](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot Series
[![AI တွဲဖက် ပရိုဂရမ်ရေးခြင်းအတွက် Copilot](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![C#/.NET အတွက် Copilot](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot စွန့်စားခန်း](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ သင်တန်း လမ်းညွှန်

**🚀 စတင်လေ့လာရန် အဆင်သင့်ပြီလား?**

**အစပြုသူများ**: မှစတင်ပါ [အခန်း 1: အခြေခံခြင်းနှင့် အမြန်စတင်မှု](#-chapter-1-foundation--quick-start)  
**AI ဖန်တီးသူများ**: သွားပါ [အခန်း 2: AI-အရင်ဦးစွာ ဖွံ့ဖြိုးရေး (AI ဖန်တီးသူများအတွက် အကြံပြု)](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**အတွေ့အကြုံရှိ ဖန်တီးသူများ**: စတင်ပါ [အခန်း 3: ဖွဲ့စည်းမှုနှင့် အတည်ပြုခြင်း](#️-chapter-3-configuration--authentication)

**နောက်တစ်ဆင့်**: [အခန်း 1 စတင်ပါ - AZD အခြေခံများ](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**တာဝန်ပယ်ချက်**:
ဤစာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ဖြင့် ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှုအတွက် ကြိုးပမ်းနေပါသော်လည်း အလိုအလျောက် ဘာသာပြန်ချက်များတွင် အမှားများ သို့မဟုတ် တိကျမှု ချို့ယွင်းချက်များ ပါဝင်နိုင်ကြောင်း ကျေးဇူးပြု၍ သတိပြုပါ။ မူလစာတမ်းကို မူလဘာသာဖြင့် ရေးသားထားသော မူရင်းကို တရားဝင် အရင်းအမြစ်အဖြစ် သတ်မှတ်ရမည်။ အရေးကြီးသော သတင်းအချက်အလက်များအတွက် လူ့ဘာသာပြန် ပရော်ဖက်ရှင်နယ် ဝန်ဆောင်မှုကို အသုံးပြုရန် အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုမှုကြောင့် ဖြစ်ပေါ်နိုင်သည့် နားမလည်မှုများ သို့မဟုတ် အဓိပ္ပါယ်မှားများအတွက် ကျွန်ုပ်တို့ တာဝန်မယူပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->