# AZD စတင်သင်ယူသူများအတွက်: စနစ်တကျ သင်ယူခရီး

![AZD စတင်သူများ](../../translated_images/my/azdbeginners.5527441dd9f74068.webp) 

[![GitHub ကြည့်ရှုသူများ](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub ဖော်ခ်များ](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub ဆတာများ](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord ဆာဗာ](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord ဆာဗာ](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### အလိုအလျောက် ဘာသာပြန်ချက်များ (အမြဲတမ်း အသစ်)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](./README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Khmer](../km/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **ဒီကို မိမိစက်ကို ကလୋန်းချင်ပါသလား?**
>
> ဤ repository တွင် ဘာသာပြန်ချက် 50+ ထည့်သွင်းထားသဖြင့် ဒေါင်းလုဒ် အရွယ်အစား တိုးပွားပါသည်။ ဘာသာပြန်ချက်များမပါဘဲ clone ဟန်ချက်ကို sparse checkout ဖြင့်ရယူနိုင်သည်။
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
> ၎င်းက သင့်ကို သင်တန်းကို ပြီးမြောက်စေဖို့ လိုအပ်သည့် အရာအားလုံးကို ပိုမြန်ဆန်စေရန် လိုအပ်သလိုပေးပါသည်။
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 azd တွင် ယနေ့ထည့်သွင်းထားသော အချက်များ

> 📌 ဤသင်တန်းကို **`azd 1.25.6`** (June 2026) အပေါ် သေချာစွာ စစ်ဆေးပြီးဖြန့်ချိထားသည်။ သင်၏ build ကို စစ်ရန် `azd version` ကို ပြုလုပ်ပါ၊ နောက်ဆုံးဗားရှင်းရယူရန် `azd upgrade` ကို အသုံးပြုပါ။

Azure Developer CLI သည် ရိုးရာ ဝက်ဘ်အက်ပ်များနှင့် API များထက် ပို၍ ကျယ်ပြန့်လျက်ရှိသည်။ ယနေ့တွင် azd သည် AI အခြေပြု အက်ပ်များနှင့် အင်တယ်လိဂျင့် အေးဂျင်များကို အပါအဝင် Azure သို့ မည်သည့် အက်ပ်မဆို တင်ပို့ရန် အသုံးပြုနိုင်သည့် တစ်ခုတည်းသော ကိရိယာဖြစ်လာပါသည်။

ဒါက သင့်အတွက် အဓိပ္ပာယ်ရသည်မှာ -

- **AI agent များသည် ယခုအချိန်တွင် azd workloads အဖြစ် ပထမအဆင့်ထားရှိသည်။** သင်သည် အလွန်ကျုံ့ကျုံ့ `azd init` → `azd up` workflow ကို အသုံးပြု၍ AI agent project များကို initialize, deploy, နှင့် စီမံနိုင်သည်။
- **CLI မှတဆင့် အေးဂျင်၏ တစ်လျှောက်လုံး အသက်မွေးဝမ်းကြောင်း။** `azure.ai.agents` extension သည် အစကနေ အဆုံးသို့ ဖုံးလွှမ်းပေးသည်—`azd ai agent init` ဖြင့် scaffold ပြုလုပ်ခြင်း၊ `azd ai agent invoke` ဖြင့် စမ်းသပ်ခြင်း (response-timing output ပါဝင်သည်), `azd ai agent eval generate` နှင့် `azd ai agent optimize` ဖြင့် အရည်အသွေးကို တိုင်းတာ၍ ကောင်းမွန်အောင် ဆောင်ရွက်ခြင်း၊ နှင့် `azd ai agent delete` ဖြင့် ရှင်းလင်းခြင်း။
- **AI တည်ဆောက်ရေး ဗဟိုပစ္စည်းများ ပိုမိုများပြားလာသည်။** `azure.ai.skills` နှင့် `azure.ai.connections` ဟူသော preview extensions အသစ်များက reusable agent skill များနှင့် Foundry connections များကို azd ဖြင့် တိုက်ရိုက် စီမံခွင့်ပြုသည်။
- **Microsoft Foundry အင်တီဂရေးရှင်း** သည် မော်ဒယ် deployment၊ agent hosting၊ နှင့် AI service ကို azd template ecosystem ထဲသို့ တိုက်ရိုက် ပေါင်းစည်းပေးသည်။
- **နေ့စဉ်အခြေခံ အလုပ်များ ပိုမိုချောမွေ့လာသည်။** နောက်ဆုံးထွက်ပြီများတွင် `azd init` ကို idempotent ဖြစ်အောင် ပြုလုပ်ထားပြီး (ပြန်လည် chạy နိုင်သည်), `azd auth login` အသုံးပြု၍ ရှိသေးသော token များကို အလိုအလျောက် ရှင်းလင်းပေးသည်၊ နှင့် မျက်နှာဖုံး `azd tool` အတွက် ပထမဆုံး သုံးစွဲမှု စတင်ဖျော်ဖြေတာ prompt ကို ထည့်သွင်းထားသည်။
- **မူလ workflow က မပြောင်းလဲသေးပါ။** သင်သည် todo app, microservice သို့မဟုတ် multi-agent AI ဖြေရှင်းချက်ကို တင်ပို့သူ ဖြစ်စေ၊ command များသည် ယခင်ကဲ့သို့ ဆက်လက်အသုံးပြုနိုင်သည်။

> **Aspire အသုံးပြုသူများအတွက် မှတ်ချက်။** Microsoft သည် ထုတ်ကုန်အား အမည်ရိုးရိုး **Aspire** (ယခင် ".NET Aspire") ဟု ခေါ်သည်။ azd ၏ Aspire အထောက်အပံ့တွင် ပြောင်းလဲမှု မရှိပါ—အမည်သာ ပြောင်းလဲထားသည်။

သင်သည် azd ကို ယခင်က အသုံးပြုသည့်သူဖြစ်ပါက AI အထောက်အပံ့သည် သဘာဝအတိုင်း တိုးချဲ့ခြင်းဖြစ်သည်—ကွဲပြားသည့် ကိရိယာ သို့မဟုတ် အဆင့်မြင့် လမ်းကြောင်း မဟုတ်ပါ။ သင်သည် အသစ်တစ်ယောက်အဖြစ် စတင်ပါက မည်သည့်အရာကိုမဆို အလုပ်လုပ်သည့် တစ်ခုသော workflow တစ်ခုကို သင် သင်ယူမည် ဖြစ်သည်။

---

## 🚀 Azure Developer CLI (azd) ဆိုတာ ဘာလဲ?

**Azure Developer CLI (azd)** သည် developer-friendly command-line ကိရိယာတစ်ခုဖြစ်ပြီး Azure သို့ အက်ပ်များကို တင်ပို့ရန် ရိုးရှင်းစေသည်။ Azure ရင်းမြစ်များ အနည်းငယ်ချင်းကို လက်ဖြင့် ဖန်တီးဆက်သွယ်ရန် အစား တစ်ချက်ကြောင့် အပြည့်အစုံ အက်ပ်ကို တင်ပို့နိုင်သည်။

### `azd up` ၏ မယုံနိုင်စရာ

```bash
# ဒီတစ်ကြောင်းတည်း command က အကုန်လုံးလုပ်ပေးတယ်။
# ✅ Azure ရဲ့ အရင်းအမြစ်အားလုံး ဖန်တီးတယ်
# ✅ ကွန်ယက်နှင့် လုံခြုံရေး စနစ်များ ကို ပြင်ဆင်တယ်
# ✅ သင့်အပလီကေးရှင်း ကုဒ်ကို ဆောက်တယ်
# ✅ Azure သို့ တင်ပေးတယ်
# ✅ လုပ်ဆောင်နိုင်တဲ့ URL ပေးတယ်
azd up
```

**ဒါပဲဖြစ်ပါပြီ!** Azure Portal တွင် နှိပ်ခလုတ်များ မလုပ်ရ၊ ARM template သိသင့်သည်မဟုတ်၊ လက်ဖြင့် ကိုယ်တိုင် စီမံရရန် မလို—တစ်ချက်နဲ့ Azure ပေါ်တွင် အလုပ်လုပ်နေသော အက်ပ်များကို ရရှိပါပြီ။

---

## ❓ Azure Developer CLI နှင့် Azure CLI: ကွာခြားချက် အရေးကြီးချက်များ

ဒါဟာ စတင်သင်ယူသူများ မေးမြန်းလေ့ရှိသောအကြောင်းအရာ ဖြစ်သည်။ ရိုးရှင်းသော ဖြေချက်မှာ အောက်ပါအတိုင်းဖြစ်သည်။

| Feature | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Purpose** | တစ်ခုချင်း Azure အရင်းအမြစ်များကို စီမံခြင်း | အပြည့်အစုံ အက်ပ်များကို တင်ပို့ခြင်း |
| **Mindset** | အောက်ခံအင်ဖရာစနစ် ဦးတည် | အက်ပ် ဦးတည် |
| **Example** | `az webapp create --name myapp...` | `azd up` |
| **Learning Curve** | Azure ဝန်ဆောင်မှုများကို သိထားရမည် | သင့်အက်ပ်ကိုသာ သိထားပါ |
| **Best For** | DevOps၊ အင်ဖရာစထာ | Developer များ၊ ပရိုတိုတိုက်ဖန် |

### ရိုးရှင်းသော နှိုင်းယှဉ်ချက်

- **Azure CLI** သည် အိမ်တစ်လုံး ဆောက်ရန် လက်ထောက်ကိရိယာများ စုစည်းထားသလိုဖြစ်သည်— တောက်ဘီလ်များ၊ လက်ပံများ၊ နေလံများ။ မည်သည့်အရာကိုမဆို ဆောက်နိုင်သည်၊ သို့သော် ဆောက်လုပ်ပုံကို သိထားရန် လိုအပ်သည်။
- **Azure Developer CLI** သည် စေ့စပ်စီမံရေးအဖွဲ့ တစ်ခုကို အလုပ်ပေးထားသလိုဖြစ်သည်— သင်ဘာလိုချင်သည်ကို ဖော်ပြမည်၊ သူတို့က ဆောက်လုပ်ပေးလိမ့်မည်။

### ဘယ်အချိန်တွင် ဘယ်ကို အသုံးပြုမည်

| Scenario | Use This |
|----------|----------|
| "I want to deploy my web app quickly" | `azd up` |
| "I need to create just a storage account" | `az storage account create` |
| "I'm building a full AI application" | `azd init --template azure-search-openai-demo` |
| "I need to debug a specific Azure resource" | `az resource show` |
| "I want production-ready deployment in minutes" | `azd up --environment production` |

### အတူတကွ အသုံးပြုနိုင်ပါတယ်!

AZD သည် အောက်တွင် Azure CLI ကို အသုံးပြုထားသည်။ နှစ်ခုလုံးကို အသုံးပြုနိုင်ပါသည်:
```bash
# သင့်အက်ပ်ကို AZD ဖြင့် စတင်တပ်ဆင်ပါ
azd up

# ထို့နောက် Azure CLI ဖြင့် သီးသန့်ရင်းမြစ်များကို အရေးကြီးပြင်ဆင်ပါ
az webapp config set --name myapp --always-on true
```

---

## 🌟 Awesome AZD တွင် Template များကို ရှာဖွေပါ

စတင်ကတည်းက မစပါနဲ့! **Awesome AZD** သည် community မှ တင်ထားထားသော deploy ပြုလုပ်ဖို့ အသင့်ရှိသော template များစုစည်းထားတာဖြစ်သည်။

| Resource | Description |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | တစ်ချက်နှိပ်ခြင်းဖြင့် 200+ နမူနာများကို ကြည့်ရှု၍ တင်ပို့နိုင်သည် |
| 🔗 [**Submit a Template**](https://github.com/Azure/awesome-azd/issues) | သင်၏ ကိုယ်ပိုင် template ကို community ထဲသို့ ပေးပို့ပါ |
| 🔗 [**GitHub Repository**](https://github.com/Azure/awesome-azd) | ကြယ်နှိပ်၍ မူလ အရင်းအမြစ်ကို ရှာဖွေပါ |

### Awesome AZD မှ လူကြိုက်များသော AI Templates

```bash
# Microsoft Foundry မော်ဒယ်များနှင့် AI ရှာဖွေရေးဖြင့် RAG စကားပြောချက်
azd init --template azure-search-openai-demo

# အမြန် AI စကားပြော အပလီကေးရှင်း
azd init --template openai-chat-app-quickstart

# Foundry အေဂျင့်များနှင့် AI အေဂျင့်များ
azd init --template get-started-with-ai-agents
```

---

## 🎯 ၃ ချက်ဖြင့် စတင်ခြင်း

စတင်မည့်အခါ မိမိစက်သည် သင် တင်ပို့လိုသော template အတွက် အဆင်သင့်ဖြစ်ကြောင်း သေချာစေပါ။

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

လိုအပ်သော စစ်ဆေးမှုတစ်ခုခု မအောင်မြင်ပါက အရင်ဆုံး အထိုအရာကို ပြင်ဆင်ပြီး quick start ကို ဆက်လက်လုပ်ဆောင်ပါ။

### အဆင့် 1: AZD ကို ထည့်သွင်းခြင်း (၂ မိနစ်)

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

### အဆင့် 2: AZD အတွက် အတွေ့အကြုံ အတည်ပြုခြင်း

```bash
# ဒီသင်တန်းမှာ Azure CLI အမိန့်များကိုတိုက်ရိုက်အသုံးပြုရန် အလိုရှိပါက ရွေးချယ်စရာဖြစ်သည်
az login

# AZD workflows များအတွက် လိုအပ်ပါသည်
azd auth login
```

ဘယ်ဟာလိုအပ်သည်ကို မသေချာပါက [Installation & Setup](docs/chapter-01-foundation/installation.md#authentication-setup) အတွင်းရှိ အပြည့်အစုံ တပ်ဆင်ခြင်း လမ်းကြောင်းကို လိုက်နာပါ။

### အဆင့် 3: သင့် အရင်ဆုံး အက်ပ်ကို တင်ပို့ခြင်း

```bash
# ပုံစံမှ စတင်ဖန်တီးသည်
azd init --template todo-nodejs-mongo

# Azure သို့ တင်ပြပါ (အားလုံးကို ဖန်တီးပါသည်!)
azd up
```

**🎉 ပြီးပါပြီ!** သင့်အက်ပ်သည် ယခု Azure ပေါ်တွင် လုပ်ငန်းဟန်အတိုင်းလည်ပတ်နေပြီ။

### ရှင်းလင်းခြင်း (မမေ့ပါနဲ့!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 ဤသင်တန်းကို မည်သည့်ပုံစံဖြင့် အသုံးချမည်နည်း

ဤသင်တန်းကို **တိမ်းမြေတက်ရာ အဆင့်ဆင့် သင်ယူမှု** အတွက် ဒီဇိုင်းပြုထားသည် - သင် မနေနိုင်ရာနေရာကနေ စတင်ပြီး အထက်သို့ တိုးတက်ပါ။

| သင့် အတွေ့အကြုံ | စတင်ရန် |
|-----------------|------------|
| **Azure သို့ မိမိအမြဲ အသစ်ဖြစ်သူများ** | [Chapter 1: Foundation](#-chapter-1-foundation--quick-start) |
| **Azure သိပြီး AZD အသစ်ဖြစ်သူများ** | [Chapter 1: Foundation](#-chapter-1-foundation--quick-start) |
| **AI အက်ပ်များ တင်ပို့လိုသူများ** | [Chapter 2: AI-First Development](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **လက်တွေ့လေ့ကျင့်ချင်သူများ** | [🎓 Interactive Workshop](workshop/README.md) - ၃-၄ နာရီ လမ်းညွှန်ပေးသော လက်တွေ့ပြုသင်တန်း |
| **ထုတ်လုပ်ရေး နည်းဗျူဟာများ လိုအပ်သူများ** | [Chapter 8: Production & Enterprise](#-chapter-8-production--enterprise-patterns) |

### အမြန် ပြင်ဆင်ခြင်း

1. **ဤ Repository ကို Fork လုပ်ပါ**: [![GitHub ဖော်ခ်များ](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Clone လုပ်ပါ**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **အကူအညီ ရယူရန်**: [Azure Discord အဖွဲ့အစည်း](https://discord.com/invite/ByRwuEEgH4)

> **ဒီကို မိမိစက်ကို ကလോൺချင်ပါသလား?**
>
> ဤ repository တွင် ဘာသာပြန်ချက် 50+ ထည့်သွင်းထားသဖြင့် ဒေါင်းလုဒ် အရွယ်အစား တိုးပွားပါသည်။ ဘာသာပြန်ချက်များမပါဘဲ clone ဟန်ချက်ကို sparse checkout ဖြင့်ရယူနိုင်သည်:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> ၎င်းက သင့်ကို သင်တန်းကို ပြီးမြောက်စေဖို့ လိုအပ်သည့် အရာအားလုံးကို ပိုမြန်ဆန်စေရန် လိုအပ်သလိုပေးပါသည်။


## သင်တန်း အကျဉ်းချုံး

ဖွဲ့စည်းပုံအလိုက် အဆင့်ဆင့် သင်ယူရန် ဒီဇိုင်းထားသည့် မော်ဒูล်များမှတဆင့် Azure Developer CLI (azd) ကို တက်ကြွစွာ လေ့လာပါ။ **Microsoft Foundry အင်တီဂရေးရှင်းနှင့် ပူးပေါင်း၍ AI အက်ပ်များ တင်ပို့ခြင်းတွင် အထူးအာရုံစိုက်ထားသည်။**
### ဒီ သင်တန်းက ခေတ်မီ ဖွံ့ဖြိုးရေးသူများအတွက် အရေးကြီးဖြစ်ရဲ့ အကြောင်း

Microsoft Foundry Discord အဖွဲ့အစည်းရဲ့ အမြင်အပေါ် အခြေခံပြီး၊ **ဖွံ့ဖြိုးရေးသူ ၄၅% မှာ AI အလုပ်တင်ရန် AZD ကို အသုံးပြုချင်ကြသည်** သို့သော် အောက်ပါ စိန်ခေါ်မှုများနှင့် ကြုံတွေ့ရသည် -
- အတိအကျ မပေါင်းစည်းထားသော multi-service AI ဆောက်လုပ်ရေးဖွဲ့စည်းပုံများ
- ထုတ်လုပ်ရေး AI တင်သွင်းခြင်းအတွက် အကောင်းဆုံး လေ့ကျင့်မှုများ  
- Azure AI ဝန်ဆောင်မှု ပေါင်းစည်းခြင်းနှင့် ပြင်ဆင်ခြင်း
- AI အလုပ်အတွက် ကုန်ကျစရိတ် အ tốiင်းချုပ်
- AI-ဆိုင်ရာ တင်သွင်းခြင်းပြဿနာများအား ဖြေရှင်းခြင်း

### သင်ယူရန် ရည်မှန်းချက်များ

ဒီ ဖွဲ့စည်းထားသော သင်တန်းကို ပြီးမြောက်ပါက သင်သည် -
- **AZD အခြေခံများ ကျွမ်းကျင်မည်**: အဓိက အယူအဆများ၊ တပ်ဆင်ခြင်းနှင့် ပြင်ဆင်ခြင်း
- **AI အက်ပလီကေးရှင်းများ တင်သွင်းမည်**: Microsoft Foundry ဝန်ဆောင်မှုများနှင့် AZD ကို အသုံးပြုခြင်း
- **Infrastructure as Code ကို ဆောင်ရွက်မည်**: Bicep စာရွက်များဖြင့် Azure အရင်းအမြစ်များ ကိုယ်စီ စီမံခန့်ခွဲခြင်း
- **တင်သွင်းမှုများ အပြန်အလှန် ပြဿနာရှာဖွေရန်**: ရိုးရှင်းသော ပြဿနာများ ဖြေရှင်းခြင်းနှင့် ဒေဘတ်ချ်လုပ်ခြင်း
- **ထုတ်လုပ်ရေးအတွက် အကောင်းဆုံး ပြင်ဆင်မည်**: လုံခြုံရေး၊ သတ်မှတ်မှု၊ မော်နီတာလုပ်ငန်းနှင့် ကုန်ကျစရိတ် စီမံခန့်ခွဲမှု
- **Multi-Agent ဖြေရှင်းနည်းများ တည်ဆောက်မယ်**: ကလစ်လှည့်ကြိုးနှင့် AI ပုံစံများ တင်သွင်းခြင်း

## စတင်မတိုင်ခင်: အကောင့်များ၊ အသုံးပြုခွင့်များနှင့် မျှော်လင့်ချက်များ

ခရက်တာ 1 ကို စတင်မည်မတိုင်မီ အောက်ပါ အချက်များကို ရှိဖို့ သေချာပါစေ။ ဤလမ်းညွှန်ထဲက နောက်ပိုင်း တပ်ဆင်ခြင်းအဆင့်များသည် ဒီ အခြေခံအချက်များ ရှိကြောင်း အခြေခံထားကာ ဆိုလိုသည်။

- **Azure subscription တစ်ခု**: အလုပ်ကနေ ရှိပြီးသား subscription ကို သို့မဟုတ် ကိုယ်ပိုင် အကောင့်ကို အသုံးပြုနိုင်သည်၊ သို့မဟုတ် စတင်ရန် [free trial](https://aka.ms/azurefreetrial) တစ်ခု ဖန်တီးနိုင်ပါတယ်။
- **Azure အရင်းအမြစ်များ ဖန်တီးခွင့်**: အများအားဖြင့် လေ့ကျင့်မှုများအတွက် target subscription သို့ resource group ပေါ်တွင် အနည်းဆုံး **Contributor** အဆင့်ရှိထားသင့်သည်။ ခရက်တာအချို့တွင် resource groups၊ managed identities နှင့် RBAC အသေးစိတ် ပေးအပ်နိုင်ခြင်းကိုလည်း လိုအပ်နိုင်ပါတယ်။
- [**GitHub account**](https://github.com): repository ကို fork လုပ်ရန်၊ ကိုယ်ပိုင် ပြင်ဆင်မှုများကိုလိုက်ရောက်ကြည့်ရန် နှင့် GitHub Codespaces ကို workshop အတွက် အသုံးပြုရန် အထောက်အကူဖြစ်စေသည်။
- **Template runtime အတွက် မျှော်လင့်ချက်များ**: အချို့သော template များသည် Node.js၊ Python၊ Java သို့မဟုတ် Docker ကဲ့သို့သော တိုက်ရိုက် local အကိရိယာကိရိယာများကို လိုအပ်နိုင်သည်။ စတင်မလုပ်ခင် setup validator ကို chạy လုပ်၍ လိုအပ်သည့် ကိရိယာများ မရှိသေးတာကို ကြိုတင် သိရှိပါ။
- **terminal အခြေခံ နားလည်မှု**: ကျွမ်းကျင်ခြင်း မလိုပါ၊ သို့သော် `git clone`, `azd auth login`, နှင့် `azd up` ကဲ့သို့သော ကွန်မန့်များကို ရှင်းရှင်းလင်းလင်း chạy လို့ အဆင်ပြေသင့်သည်။

> **ကုမ္ပဏီ subscription မှာ အလုပ်လုပ်နေရပါသလား?**  
> သင်၏ Azure ပတ်ဝန်းကျင်ကို အသင်းအုပ်ချုပ်သူတစ်ဦးက စီမံခန့်ခွဲနေပါက သင် အသုံးပြုရန် စီစဉ်ထားသော subscription သို့ resource group မှာ အရင်းအမြစ်များကို တင်သွင်းနိုင်မလား ဆိုတာကို ကြိုတင် အတည်ပြုပါ။ မဟုတ်ပါက စတင်မလုပ်မီ sandbox subscription သို့မဟုတ် Contributor access တောင်းပါ။

> **Azure ကို အသစ် စတင်လေ့လာနေနေပါသလား?**  
> မောင်းနှင့် စမ်းသပ်ရန် https://aka.ms/azurefreetrial မှာ ကိုယ်ပိုင် Azure trial သို့ pay-as-you-go subscription ကို စတင်ပါ၊ ထို့ဖြင့် tenant အဆင့် ခွင့်ပြုချက်များ မစောင့်ဘဲ လေ့ကျင့်ခန်းများကို အဆုံးသတ်နိုင်ပါလိမ့်မည်။

## 🗺️ သင်တန်း မြေပုံ: ခရက်တာအလိုက် အမြန် လမ်းညွှန်

각 ခရက်တာတွင် သီးသန့် README ပါရှိပြီး သင်ယူရန် ရည်မှန်းချက်များ၊ အမြန်စတင်မှုနှင့် လေ့ကျင့်ခန်းများ ပါဝင်သည်။

| Chapter | Topic | Lessons | Duration | Complexity |
|---------|-------|---------|----------|------------|
| **[Ch 1: Foundation](docs/chapter-01-foundation/README.md)** | စတင်ခြင်း | [AZD အခြေခံများ](docs/chapter-01-foundation/azd-basics.md) &#124; [တပ်ဆင်ခြင်း](docs/chapter-01-foundation/installation.md) &#124; [ပထမပရောဂျက်](docs/chapter-01-foundation/first-project.md) | 30-45 မိနစ် | ⭐ |
| **[Ch 2: AI Development](docs/chapter-02-ai-development/README.md)** | AI-ဦးစားပေး အက်ပလီကေးရှင်းများ | [Microsoft Foundry ပေါင်းစည်းခြင်း](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI ဧဂျင့်များ](docs/chapter-02-ai-development/agents.md) &#124; [မော်ဒယ် အတင်သွင်းခြင်း](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [လက်တွေ့အလုပ်ရုံ](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 နာရီ | ⭐⭐ |
| **[Ch 3: Configuration](docs/chapter-03-configuration/README.md)** | အတည်ပြုခြင်းနှင့် လုံခြုံရေး | [ပြင်ဆင်မှုများ](docs/chapter-03-configuration/configuration.md) &#124; [Auth & Security](docs/chapter-03-configuration/authsecurity.md) | 45-60 မိနစ် | ⭐⭐ |
| **[Ch 4: Infrastructure](docs/chapter-04-infrastructure/README.md)** | IaC & တင်သွင်းမှု | [Deployment Guide](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisioning](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 နာရီ | ⭐⭐⭐ |
| **[Ch 5: Multi-Agent](docs/chapter-05-multi-agent/README.md)** | AI ဧဂျင့် ဖြေရှင်းချက်များ | [လက်လီ အခြေအနေ](examples/retail-scenario.md) &#124; [Coordination Patterns](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 နာရီ | ⭐⭐⭐⭐ |
| **[Ch 6: Pre-Deployment](docs/chapter-06-pre-deployment/README.md)** | စီစဉ်ခြင်း & အတည်ပြုခြင်း မတိုင်မီ | [Preflight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 နာရီ | ⭐⭐ |
| **[Ch 7: Troubleshooting](docs/chapter-07-troubleshooting/README.md)** | ဒေဘက်နှင့် ပြုပြင်ခြင်း | [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Debugging](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI Issues](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 နာရီ | ⭐⭐ |
| **[Ch 8: Production](docs/chapter-08-production/README.md)** | ကုမ္ပဏီ ပုံစံများ | [Production Practices](docs/chapter-08-production/production-ai-practices.md) | 2-3 နာရီ | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | လက်တွေ့ လေ့ကျင့်ခန်း | [Introduction](workshop/docs/instructions/0-Introduction.md) &#124; [Selection](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validation](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Deconstruction](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Configuration](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Customization](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Teardown](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Wrap-up](workshop/docs/instructions/7-Wrap-up.md) | 3-4 နာရီ | ⭐⭐ |

**စုစုပေါင်း သင်တန်း ကြာချိန်:** ~10-14 နာရီ | **ကျွမ်းကျင်မှု တိုးတက်မှု:** Beginner → Production-Ready

---

## 📚 သင်ယူရန် ခရက်တာများ

*အတွေ့အကြုံနှင့် ရည်မှန်းချက်များအပေါ် မူတည်၍ သင်ယူခရီးကို ရွေးချယ်ပါ*

### 🚀 Chapter 1: အခြေခံနှင့် အမြန်စတင်ခြင်း
**လိုအပ်ချက်များ**: Azure subscription, command line အခြေခံ သိနိုင်မှု  
**ကြာချိန်**: 30-45 မိနစ်  
**ရှုပ်ထွေးမှု**: ⭐

#### သင်ဘာတွေ သင်ယူမလဲ
- Azure Developer CLI အခြေခံ နားလည်မှု
- သင့်ပလက်ဖောင်းပေါ်မှာ AZD တပ်ဆင်ခြင်း
- ပထမဆုံး အောင်မြင်သော တင်သွင်းမှု

#### သင်ယူရေး အရင်းအမြစ်များ
- **🎯 ဒီနေရာက စတင်ပါ**: [Azure Developer CLI ဆိုတာဘာလဲ?](#what-is-azure-developer-cli)
- **📖 သီအိုရီ**: [AZD အခြေခံများ](docs/chapter-01-foundation/azd-basics.md) - အဓိက အယူအဆများ နှင့် အသုံးအနှုန်းများ
- **⚙️ တပ်ဆင်မှု**: [တပ်ဆင်ခြင်း & ဆက်တင်](docs/chapter-01-foundation/installation.md) - ပလက်ဖောင်းအလိုက် လမ်းညွှန်များ
- **🛠️ လက်တွေ့ လုပ်ဆောင်ခြင်း**: [သင်၏ ပထမဆုံး ပရောဂျက်](docs/chapter-01-foundation/first-project.md) - အဆင့်ဆင့် လမ်းညွှန်
- **📋 အမြန်ဓာတ်ထိုးคู่**: [Command Cheat Sheet](resources/cheat-sheet.md)

#### လက်တွေ့ လေ့ကျင့်ခန်းများ
```bash
# တပ်ဆင်မှုကို အမြန်စစ်ဆေးခြင်း
azd version

# သင့် ပထမဆုံး အပလီကေးရှင်းကို ဖြန့်ချိပါ
azd init --template todo-nodejs-mongo
azd up
```

**💡 ခရက်တာရလဒ်**: AZD ကို အသုံးပြု၍ Azure ပေါ်သို့ ရိုးရှင်းသော web application တစ်ခု အောင်မြင်စွာ တင်သွင်းနိုင်ခြင်း

**✅ အောင်မြင်မှု စစ်ဆေးခြင်း:**
```bash
# အခန်း ၁ ကို ပြီးစီးပြီးနောက် သင်သည် အောက်ပါအရာများကို ပြုလုပ်နိုင်မည်:
azd version              # တပ်ဆင်ထားသော ဗားရှင်းကို ပြသည်
azd init --template todo-nodejs-mongo  # ပရောဂျက်ကို စတင်တည်ဆောက်သည်
azd up                  # Azure သို့ တင်ပို့သည်
azd show                # လည်ပတ်နေသော အက်ပ်၏ URL ကို ပြပေးသည်
# အက်ပ်ကို ဘရောက်ဇာတွင် ဖွင့်၍ အလုပ်လုပ်သည်
azd down --force --purge  # အရင်းအမြစ်များကို ရှင်းလင်းသည်
```

**📊 အချိန် အပ်နှံမှု:** 30-45 မိနစ်  
**📈 သွက်လက်မှုပမာဏ အပြီးတွင်:** အခြေခံ အက်ပလီကေးရှင်းများကို တစ်ကိုယ်တည်း တင်သွင်းနိုင်သည်  
**📈 သွက်လက်မှုပမာဏ အပြီးတွင်:** အခြေခံ အက်ပလီကေးရှင်းများကို တစ်ကိုယ်တည်း တင်သွင်းနိုင်သည်

---

### 🤖 Chapter 2: AI-ဦးစားပေး ဖွံ့ဖြိုးရေး (AI ဖွံ့ဖြိုးရေးသမားများအတွက် အကြံပြု)
**လိုအပ်ချက်များ**: Chapter 1 ပြီးမြောက်ထားပြီးကြောင်း  
**ကြာချိန်**: 1-2 နာရီ  
**ရှုပ်ထွေးမှု**: ⭐⭐

#### သင်ဘာတွေ သင်ယူမလဲ
- Microsoft Foundry ကို AZD နှင့် ပေါင်းစည်းခြင်း
- AI ပါဝင်သော အက်ပလီကေးရှင်းများ တင်သွင်းခြင်း
- AI ဝန်ဆောင်မှု ပြင်ဆင်မှုများကို နားလည်ခြင်း

#### သင်ယူရေး အရင်းအမြစ်များ
- **🎯 ဒီနေရာက စတင်ပါ**: [Microsoft Foundry ပေါင်းစည်းခြင်း](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI ဧဂျင့်များ**: [AI Agents Guide](docs/chapter-02-ai-development/agents.md) - AZD ဖြင့် ထူးခြားသော ဧဂျင့်များ တင်သွင်းခြင်း
- **📖 ပုံစံများ**: [မော်ဒယ် အတင်သွင်းခြင်း](docs/chapter-02-ai-development/ai-model-deployment.md) - AI မော်ဒယ်များ တင်သွင်းခြင်းနှင့် စီမံခန့်ခွဲခြင်း
- **🛠️ လက်တွေ့အလုပ်ရုံ**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - သင့် AI ဖြေရှင်းချက်များကို AZD-အဆင်ပြေစေရန်
- **🎥 အင်တာအက်တက် တို့**: [Workshop Materials](workshop/README.md) - MkDocs * DevContainer Environment ဖြင့် Browser-အခြေခံ လေ့လာနိုင်မှု
- **📋 Templates**: [Microsoft Foundry Templates](#ဝက်ခွပ်ရှော့-အရင်းအမြစ်များ)
- **📝 ဥာဏ်ပညာ ဥပမာများ**: [AZD Deployment Examples](examples/README.md)

#### လက်တွေ့ လေ့ကျင့်ခန်းများ
```bash
# သင်၏ ပထမဆုံး AI အက်ပလီကေးရှင်းကို ဖြန့်ချိပါ
azd init --template azure-search-openai-demo
azd up

# နောက်ထပ် AI နမူနာများကို စမ်းကြည့်ပါ
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 ခရက်တာရလဒ်**: RAG စွမ်းရည်များပါဝင်သည့် AI-စွမ်းရည် chatbot application တစ်ခု တင်သွင်း၍ ပြင်ဆင်နိုင်ခြင်း

**✅ အောင်မြင်မှု စစ်ဆေးခြင်း:**
```bash
# အခန်း ၂ ပြီးနောက် သင် အောက်ပါအရာများကို ပြုလုပ်နိုင်သင့်သည်:
azd init --template azure-search-openai-demo
azd up
# AI စကားပြော အင်တာဖေ့စ်ကို စမ်းသပ်ပါ
# မေးခွန်းများ မေးပြီး ရင်းမြစ်များပါဝင်သော AI ဖြေကြားချက်များကို ရယူပါ
# ရှာဖွေရေး ပေါင်းစည်းမှု အလုပ်လုပ်ကြောင်း အတည်ပြုပါ
azd monitor  # Application Insights တွင် telemetry ပြနေကြောင်း စစ်ဆေးပါ
azd down --force --purge
```

**📊 အချိန် အပ်နှံမှု:** 1-2 နာရီ  
**📈 သွက်လက်မှုပမာဏ အပြီးတွင်:** ထုတ်လုပ်ရေးအဆင့် အသင့်ဖြစ်သော AI အက်ပလီကေးရှင်းများကို တင်သွင်း ပြင်ဆင်နိုင်သည်  
**💰 ကုန်ကျစရိတ် အမြင်:** ဖွံ့ဖြိုးရေးအတွက် $80-150/လစဉ် ခန့်၊ ထုတ်လုပ်ရေးအတွက် $300-3500/လစဉ် ခန့်

#### 💰 AI တင်သွင်းမှုများအတွက် ကုန်ကျစရိတ် သဘောတရား

**ဖွံ့ဖြိုးရေး ပတ်ဝန်းကျင် (ခန့်မှန်း $80-150/လစဉ်):**
- Microsoft Foundry Models (Pay-as-you-go): $0-50/လစဉ် (token အသုံးအတွင်း မူတည်၍)
- AI Search (Basic tier): $75/လစဉ်
- Container Apps (Consumption): $0-20/လစဉ်
- Storage (Standard): $1-5/လစဉ်

**ထုတ်လုပ်ရေး ပတ်ဝန်းကျင် (ခန့်မှန်း $300-3,500+/လစဉ်):**
- Microsoft Foundry Models (PTU ဗဟိုထား၍ တည်ငြိမ်သော စွမ်းဆောင်မှု): $3,000+/လစဉ် သို့မဟုတ် အမြင့် အသုံးအနှုန်းဖြင့် Pay-as-you-go
- AI Search (Standard tier): $250/လစဉ်
- Container Apps (Dedicated): $50-100/လစဉ်
- Application Insights: $5-50/လစဉ်
- Storage (Premium): $10-50/လစဉ်

**💡 ကုန်ကျစရိတ် အဆင်ပြေစေသည့် အကြံပြုချက်များ:**
- သင်ယူရန် Microsoft Foundry Models ရဲ့ **Free Tier** ကို အသုံးပြုပါ (Azure OpenAI သို့မဟုတ် အခြား မော်ဒယ်များ ရှိပါက 50,000 tokens/လစဉ် အပါအဝင်)
- ဖွံ့ဖြိုးရေး လုပ်ငန်းမရှိသည့်အခါ `azd down` ဖြင့် အရင်းအမြစ်များကို deallocate လုပ်ပါ
- စတင်ရာတွင် consumption-based billing ကို အသုံးပြုပါ၊ ထုတ်လုပ်ရေးအတွက်သာ PTU သို့ မြှင့်တင်ပါ
- တင်သွင်းရခင် `azd provision --preview` ဖြင့် ကုန်ကျစရိတ် ခန့်မှန်းချက်ယူပါ
- auto-scaling ကို ဖွင့်ထားပါ: အသုံးပြုမှုအပေါ်ပဲ ပေးချေပါ

**ကုန်ကျစရိတ် စောင့်ကြည့်မှု:**
```bash
# ခန့်မှန်းထားသော လစဉ်ကုန်ကျစရိတ်ကို စစ်ဆေးပါ
azd provision --preview

# Azure Portal တွင် အမှန်တကယ် ကုန်ကျစရိတ်များကို စောင့်ကြည့်ပါ
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Chapter 3: ပြင်ဆင်မှုများ & အတည်ပြုခြင်း
**လိုအပ်ချက်များ**: Chapter 1 ပြီးမြောက်ထားပြီးကြောင်း  
**ကြာချိန်**: 45-60 မိနစ်  
**ရှုပ်ထွေးမှု**: ⭐⭐

#### သင်ဘာတွေ သင်ယူမလဲ
- ပတ်ဝန်းကျင် ပြင်ဆင်မှုနှင့် စီမံခန့်ခွဲမှု
- အတည်ပြုခြင်းနှင့် လုံခြုံရေး အကောင်းဆုံး လေ့ကျင့်မှုများ
- အရင်းအမြစ် အမည်ပေးခြင်းနှင့် အဖွဲ့အစည်း ဖွဲ့စည်းခြင်း

#### သင်ယူရေး အရင်းအမြစ်များ
- **📖 ပြင်ဆင်မှုများ**: [Configuration Guide](docs/chapter-03-configuration/configuration.md) - ပတ်ဝန်းကျင် စတင်ပြင်ဆင်ခြင်း
- **🔐 လုံခြုံရေး**: [Authentication patterns and managed identity](docs/chapter-03-configuration/authsecurity.md) - အတည်ပြုနည်းလမ်းများ
- **📝 ဥပမာများ**: [Database App Example](examples/database-app/README.md) - AZD Database ဥပမာများ

#### လက်တွေ့ လေ့ကျင့်ခန်းများ
- dev, staging, prod ကဲ့သို့သော ပတ်ဝန်းကျင်များ ကို အမျိုးမျိုး ဖန်တီး စီမံပါ
- managed identity အတည်ပြုခြင်း setup လုပ်ပါ
- ပတ်ဝန်းကျင် အလိုက် အထူးပြင်ဆင်မှုများ လက်တွဲ အကောင်အထည်ဖော်ပါ

**💡 ခရက်တာရလဒ်**: သင့်ပတ်ဝန်းကျင်များကို မှန်ကန်သော အတည်ပြုခြင်းနှင့် လုံခြုံရေးဖြင့် စီမံနိုင်ခြင်း

---

### 🏗️ Chapter 4: Infrastructure as Code & တင်သွင်းမှု
**လိုအပ်ချက်များ**: Chapters 1-3 ပြီးမြောက်ထားပြီးကြောင်း  
**ကြာချိန်**: 1-1.5 နာရီ  
**ရှုပ်ထွေးမှု**: ⭐⭐⭐

#### သင်ဘာတွေ သင်ယူမလဲ
- တင်သွင်းမှု အဆင့်မြင့် ပုံစံများ
- Bicep ဖြင့် Infrastructure as Code
- အရင်းအမြစ် Provisioning မျိုးစုံ နည်းလမ်းများ

#### သင်ယူရေး အရင်းအမြစ်များ
- **📖 တင်သွင်းခြင်း**: [Deployment Guide](docs/chapter-04-infrastructure/deployment-guide.md) - ပြီးပြည့်စုံသော လုပ်ငန်းစဉ်များ
- **🏗️ Provisioning**: [Provisioning Resources](docs/chapter-04-infrastructure/provisioning.md) - Azure အရင်းအမြစ် စီမံခန့်ခွဲမှု
- **📝 ဥပမာများ**: [Container App Example](../../examples/container-app) - Containerized တင်သွင်းမှုများ

#### လက်တွေ့ လေ့ကျင့်ခန်းများ
- custom Bicep templates များ ဖန်တီးပါ
- multi-service applications များ တင်သွင်းပါ
- blue-green deployment များ ကို အကောင်အထည်ဖော်ပါ

**💡 ခရက်တာရလဒ်**: custom infrastructure templates အသုံးပြု၍ မျိုးစုံ multi-service applications များ တင်သွင်းနိုင်ခြင်း

---
### 🎯 အခန်း ၅: မျိုးစုံ အေးဂျင့် (Multi-Agent) AI ဖြေရှင်းချက်များ (အဆင့်မြင့်)
**လိုအပ်ချက်များ**: အခန်း 1-2 ပြီးစီး  
**ကြာချိန်**: 2-3 နာရီ  
**ရှုပ်ထွေးမှု**: ⭐⭐⭐⭐

#### သင်ဘာများကို သင်ယူမည်နည်း
- မျိုးစုံအေးဂျင့် အင်ဂျင်နီယာ ပုံစံများ
- အေးဂျင့် စုပေါင်းလုပ်ဆောင်ခြင်းနှင့် ညှိနှိုင်းမှု
- ထုတ်လုပ်မှုအဆင်သင့် AI တပ်ဆင်ချက်များ

#### သင်ယူရန် အရင်းအမြစ်များ
- **🤖 Featured Project**: [Retail Multi-Agent Solution](examples/retail-scenario.md) - ပြည့်စုံစွာ အကောင်အထည်ဖော်ထားခြင်း
- **🛠️ ARM Templates**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - တစ်ချက်နှိပ် ဖြင့် တပ်ဆင်နိုင်ခြင်း
- **📖 Architecture**: [Multi-agent coordination patterns](docs/chapter-06-pre-deployment/coordination-patterns.md) - ပုံစံများ

#### လက်တွေ့ လေ့ကျင့်ခန်းများ
```bash
# လက်လီလုပ်ငန်းအတွက် ပြည့်စုံသော မူလတီ-အေဂျင့် ဖြေရှင်းချက်ကို ဖြန့်ချိပါ
cd examples/retail-multiagent-arm-template
./deploy.sh

# အေဂျင့်များ၏ ဖွဲ့စည်းပုံများကို စူးစမ်းလေ့လာပါ
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 အခန်း အပြီးသတ်ဖြစ်ချက်**: Customer နှင့် Inventory အေးဂျင့်များပါဝင်သည့် ထုတ်လုပ်မှုအဆင်သင့် မျိုးစုံအေးဂျင့် AI ဖြေရှင်းချက်ကို တပ်ဆင်၊ စီမံခန့်ခွဲနိုင်ရန်

---

### 🔍 အခန်း ၆: ကြိုတင်တပ်ဆင်ခြင်း မတိုင်မီ အတည်ပြုခြင်းနှင့် အစီအစဥ်ရေးဆွဲခြင်း
**လိုအပ်ချက်များ**: အခန်း 4 ပြီးစီး  
**ကြာချိန်**: 1 နာရီ  
**ရှုပ်ထွေးမှု**: ⭐⭐

#### သင်ဘာများကို သင်ယူမည်နည်း
- စွမ်းရည် စီမံချက်ရေးဆွဲခြင်းနှင့် အရင်းအမြစ်အတည်ပြုခြင်း
- SKU ရွေးချယ်မှု များအတွက် မဟာဗျူဟာ
- ကြိုတင်စစ်ဆေးမှုများနှင့် အလိုအလျောက်လုပ်ဆောင်မှုများ

#### သင်ယူရန် အရင်းအမြစ်များ
- **📊 Planning**: [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) - အရင်းအမြစ် အတည်ပြုခြင်း
- **💰 Selection**: [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) - စရိတ်ထိရောက်စေရန် ရွေးချယ်မှုများ
- **✅ Validation**: [Pre-flight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) - အလိုအလျောက် စစ်ဆေးရေး စာရင်းများ

#### လက်တွေ့ လေ့ကျင့်ခန်းများ
- စွမ်းရည် အတည်ပြု စာရင်းများကို ပြေးပါ
- စရိတ်အတွက် SKU ရွေးချယ်မှုများကို မြှင့်တင် အပ်ချိန်ဆင်ပါ
- ကြိုတင်တပ်ဆင်မှုများအတွက် အလိုအလျောက် စစ်ဆေးမှုများကို အကောင်အထည်ဖော်ပါ

**💡 အခန်း အပြီးသတ်ဖြစ်ချက်**: တပ်ဆင်မှုများကို အကောင်အထည်ဖော်မီ အတည်ပြု၍ အရွေးချယ်မှုများကို တိုးတက်စေရန်

---

### 🚨 အခန်း ၇: ပြဿနာဖြေရှင်းခြင်း & အမှားရှာဖွေရေး
**လိုအပ်ချက်များ**: မည်သည့် တပ်ဆင်မှု အခန်းမဆို ပြီးစီးထားရမည်  
**ကြာချိန်**: 1-1.5 နာရီ  
**ရှုပ်ထွေးမှု**: ⭐⭐

#### သင်ဘာများကို သင်ယူမည်နည်း
- စနစ်တကျ အမှားရှာဖွေရေး အဆင့်များ
- လူကြုံတွေ့ရသည့် ပြဿနာများနှင့် ဖြေရှင်းနည်းများ
- AI အတွက် ထူးခြားသည့် ပြဿနာဖြေရှင်းခြင်း

#### သင်ယူရန် အရင်းအမြစ်များ
- **🔧 Common Issues**: [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) - မေးမြန်းစာနှင့် ဖြေရှင်းနည်းများ
- **🕵️ Debugging**: [Debugging Guide](docs/chapter-07-troubleshooting/debugging.md) - အဆင့်မီ မျှဝေပေးသော မျဉ်းများ
- **🤖 AI Issues**: [AI-Specific Troubleshooting](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AI ဝန်ဆောင်မှု ပြဿနာများ

#### လက်တွေ့ လေ့ကျင့်ခန်းများ
- တပ်ဆင်မှု မအောင်မြင်မှုများကို ရှာဖွေရန်
- အတည်ပြုခြင်းဆိုင်ရာ ပြဿနာများ ကို ဖြေရှင်းရန်
- AI ဝန်ဆောင်မှု ချိတ်ဆက်မှု အမှားများကို debug ပြုလုပ်ရန်

**💡 အခန်း အပြီးသတ်ဖြစ်ချက်**: ပုံမှန်တက်ရောက်ရသော တပ်ဆင်မှု ပြဿနာများကို သီးခြား ရှာဖွေ၍ ဖြေရှင်းနိုင်ခြင်း

---

### 🏢 အခန်း ၈: ထုတ်လုပ်မှုနှင့် အဖွဲ့အစည်း ပုံစံများ
**လိုအပ်ချက်များ**: အခန်း 1-4 ပြီးစီး  
**ကြာချိန်**: 2-3 နာရီ  
**ရှုပ်ထွေးမှု**: ⭐⭐⭐⭐

#### သင်ဘာများကို သင်ယူမည်နည်း
- ထုတ်လုပ်မှု တပ်ဆင်မှု မဟာဗျူဟာများ
- အဖွဲ့အစည်း လုံခြုံရေး ပုံစံများ
- ကြည့်ရှုခြင်းနှင့် စရိတ် အကောင်းဆုံးပြုထိန်ခြင်း

#### သင်ယူရန် အရင်းအမြစ်များ
- **🏭 Production**: [Production AI Best Practices](docs/chapter-08-production/production-ai-practices.md) - အဖွဲ့အစည်း ပုံစံများ
- **📝 Examples**: [Microservices Example](../../examples/microservices) - ကြိမ်မြတ်သော အင်ဂျင်နီယာ ဖွဲ့စည်းပုံများ
- **📊 Monitoring**: [Application Insights integration](docs/chapter-06-pre-deployment/application-insights.md) - ကြည့်ရှုခြင်း

#### လက်တွေ့ လေ့ကျင့်ခန်းများ
- အဖွဲ့အစည်း လုံခြုံရေး ပုံစံများကို အကောင်အထည်ဖော်ပါ
- လုံးဝသော ကြည့်ရှုစနစ်ကို တပ်ဆင်ပါ
- သင့်အဖွဲ့အစည်း ရဲ့ စုပေါင်း အုပ်ချုပ်မှုနှင့်အတူ ထုတ်လုပ်မှုသို့ တပ်ဆင်ပါ

**💡 အခန်း အပြီးသတ်ဖြစ်ချက်**: ထုတ်လုပ်မှုအဆင့်အဆင့် ပြည့်စုံသော အက်ပလီကေးရှင်းများကို တပ်ဆင်နိုင်ခြင်း

---

## 🎓 လက်တွေ့ အလုပ်ရုံ သုံးသပ်ချက်: လက်တွေ့သင်ယူမှု အတွေ့အကြုံ

> **⚠️ WORKSHOP STATUS: Active Development**  
> ဝက်ခွပ်ရှော့ ပစ္စည်းများကို လက်ရှိအချိန်တွင် ဖန်တီးဆင်ဆာခြင်းနှင့် တိုးတက်မှု လုပ်ဆောင်နေသည်။ အခြေခံ မျော်လင့်ချက်များ လုပ်ငန်းဆောင်တာများ လည်ပတ်နိုင်ပါသော်လည်း တိုးတက်အဆင့်မြင့် အပိုင်းတချို့ မပြီးစီးသေးပါ။ ကျွန်တော်တို့သည် အကြောင်းအရာများကို အပြည့်စုံ ပြီးမြောက်စေရန် အားဖြည့်လုပ်ဆောင်နေပါသည်။ [Track progress →](workshop/README.md)

### အပြန်အလှန် ဝက်ခွပ်ရှော့ ပစ္စည်းများ
**ဘရောက်ဇာအခြေခံ ကိရိယာများနှင့် လမ်းညွှန် လက်တွေ့ လေ့ကျင့်ခန်းများဖြင့် ပြည့်စုံသော လက်တွေ့သင်ယူမှု**

ကျွန်တော်တို့၏ ဝက်ခွပ်ရှော့ ပစ္စည်းများသည် အခန်းအလိုက် သင်ခန်းစာများကို ထောက်ပံ့ရာ၌ ဖွဲ့စည်းထားသည့် လမ်းကြောင်းတစ်ခုကို ပံ့ပိုးသည်။ ဝက်ခွပ်ရှော့သည် ကိုယ်တိုင် လေ့လာရန်နှင့် လက်မှတ်တင် မောင်းကြပ်ပေးသည့် အကောင်းဆုံးပတ်ဝန်းကျင်များအတွက် ဒီဇိုင်းထုတ်ထားပါသည်။

#### 🛠️ ဝက်ခွပ်ရှော့ အင်္ဂါရပ်များ
- **Browser-Based Interface**: MkDocs ဖြင့် အပြည့်အစုံ ထောက်ပံ့ထားသော ဝက်ခွပ်ရှော့၊ ရှာဖွေမှု၊ အခြား Function များပါဝင်သည်
- **GitHub Codespaces Integration**: တစ်ချက်နှိပ် ဖြင့် ဖွင့်လှစ်နိုင်သော ဖွံ့ဖြိုးရေး ပတ်ဝန်းကျင်
- **Structured Learning Path**: 8 မော်ဂျူး ထည့်သွင်းထားသည့် လမ်းညွှန် လေ့ကျင့်ခန်းများ (စုစုပေါင်း 3-4 နာရီ)
- **Progressive Methodology**: ချိတ်ဆက်ခြင်း → ရွေးချယ်ခြင်း → အတည်ပြုခြင်း → ဖော်ထုတ်လေ့လာခြင်း → ဖွဲ့စည်းတပ်ဆင်ခြင်း → ကိုယ်ပိုင်ပြင်ဆင်ခြင်း → ပိတ်သိမ်းခြင်း → အကျဉ်းချုပ်
- **Interactive DevContainer Environment**: ကြိုတင် ထည့်သွင်းထားသော ကိရိယာများ နှင့် မလိုမဆောင် သက်ဆိုင်ရာ ဖိုင်များ

#### 📚 ဝက်ခွပ်ရှော့ မော်ဂျူး ဖွဲ့စည်းပုံ
ဝက်ခွပ်ရှော့သည် စူးစမ်းမှ စ၍ တပ်ဆင်မှု ကျွမ်းကျင်မှုထိ သင်ယူစေရန် အဆင့်လိုက် 8 မော်ဂျူး ပုံစံဖြင့် လိုက်နာသည်။

| Module | Topic | What You'll Do | Duration |
|--------|-------|----------------|----------|
| **0. Introduction** | Workshop Overview | နှီးနှောသင်ယူချင်သော ရည်မှန်းချက်များ၊ လိုအပ်ချက်များ၊ နှင့် ဝက်ခွပ်ရှော့ ဖွဲ့စည်းပုံကို နားလည်ပါ | 15 မိနစ် |
| **1. Selection** | Template Discovery | AZD templates များကို စူးစမ်း၍ သင်၏အကြောင်းအရာအတွက် သင့်တော်သော AI template ကို ရွေးချယ်ပါ | 20 မိနစ် |
| **2. Validation** | Deploy & Verify | `azd up` ဖြင့် template ကို တပ်ဆင်၍ အင်ဖ্রာစထွက်ချင်းများ လည်ပတ်မှုပြည့်စုံသည့်အချက်ကို အတည်ပြုပါ | 30 မိနစ် |
| **3. Deconstruction** | Understand Structure | GitHub Copilot ကို အသုံးပြု၍ template architecture, Bicep files, နှင့် code စီမံခန့်ခွဲမှုကို လေ့လာပါ | 30 မိနစ် |
| **4. Configuration** | azure.yaml Deep Dive | `azure.yaml` ဖိုင်၏ configuration, lifecycle hooks, နှင့် environment variables များကို ကျွမ်းကျင်ပါ | 30 မိနစ် |
| **5. Customization** | Make It Yours | AI Search, tracing, evaluation ကို ဖွင့်လှစ်ပြီး သင်၏နေရာအတွက် ကိုက်ညီစေရန် ပြင်ဆင်ပါ | 45 မိနစ် |
| **6. Teardown** | Clean Up | `azd down --purge` ဖြင့် အရင်းအမြစ်များကို အလုံအလောက် ဖျက်ရှင်းပါ | 15 မိနစ် |
| **7. Wrap-up** | Next Steps | ရရှိထားသော အောင်မြင်မှုများ၊ အဓိက အယူအဆများကို ပြန်လည် သုံးသပ်ပြီး ဆက်လက်သင်ယူရန် လမ်းကြောင်းများ ရှာပါ | 15 မိနစ် |

**Workshop Flow:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 ဝက်ခွပ်ရှော့ကို စတင်ပုံ
```bash
# ရွေးချယ်မှု ၁: GitHub Codespaces (အကြံပြု)
# Repository ထဲမှ "Code" → "Create codespace on main" ကို နှိပ်ပါ

# ရွေးချယ်မှု ၂: ဒေသတွင်း ဖွံ့ဖြိုးရေး
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# workshop/README.md ဖိုင်ထဲရှိ ပြင်ဆင်ရန် ညွှန်ကြားချက်များကို လိုက်နာပါ
```

#### 🎯 ဝက်ခွပ်ရှော့ သင်ယူပြီးရလဒ်များ
ဝက်ခွပ်ရှော့ကို ပြီးမြောက်စွာ သင်ယူပါက ပါဝင်သူများသည် -
- **ထုတ်လုပ်မှု AI အက်ပလီကေးရှင်းများ တပ်ဆင်နိုင်မည်**: AZD နှင့် Microsoft Foundry ဝန်ဆောင်မှုများကို အသုံးပြု၍
- **မျိုးစုံ အေးဂျင့် ဖွဲ့စည်းပုံများကို ကျွမ်းကျင်မည်**: ညှိနှိုင်းထားသော AI အေးဂျင့် ဖြေရှင်းချက်များကို အကောင်အထည်ဖော်နိုင်မည်
- **လုံခြုံရေး အကောင်းဆုံးနည်းလမ်းများကို အကောင်အထည်ဖော်မည်**: အသိအမှတ်ပြုမှုနှင့် ခွင့်ပြုပြဿနာများကို ဖွဲ့စည်းသတ်မှတ်နိုင်မည်
- **အတိုင်းအတာအတွက် အကောင်းဆုံး စီမံချက်ရေးဆွဲနိုင်မည်**: စရိတ်ထိရောက်ပြီး မြန်ဆန်သော တပ်ဆင်မှုများကို ဒီဇိုင်းဆွဲနိုင်မည်
- **တပ်ဆင်မှုများကို ပြဿနာဖြေရှင်းနိုင်မည်**: ပုံမှန်ပြဿနာများကို ကိုယ့်တစ်ဦးတည်း ဖြေရှင်းနိုင်မည်

#### 📖 ဝက်ခွပ်ရှော့ အရင်းအမြစ်များ
- **🎥 Interactive Guide**: [Workshop Materials](workshop/README.md) - ဘရောက်ဇာအခြေခံ သင်ယူမှုပတ်ဝန်းကျင်
- **📋 Module-by-Module Instructions**:
  - [0. Introduction](workshop/docs/instructions/0-Introduction.md) - ဝက်ခွပ်ရှော့ အကျဉ်းချုပ်နှင့် ရည်မှန်းချက်များ
  - [1. Selection](workshop/docs/instructions/1-Select-AI-Template.md) - AI templates တွေကို ရှာဖွေရွေးချယ်ခြင်း
  - [2. Validation](workshop/docs/instructions/2-Validate-AI-Template.md) - Templates များကို တပ်ဆင်ကာ အတည်ပြုခြင်း
  - [3. Deconstruction](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Template architecture ကို ဖော်ထုတ် လေ့လာခြင်း
  - [4. Configuration](workshop/docs/instructions/4-Configure-AI-Template.md) - `azure.yaml` ကို ကျွမ်းကျင်ခြင်း
  - [5. Customization](workshop/docs/instructions/5-Customize-AI-Template.md) - သင်၏ အခြေအနေအတွက် စိတ်ကြိုက် ပြင်ဆင်ခြင်း
  - [6. Teardown](workshop/docs/instructions/6-Teardown-Infrastructure.md) - အရင်းအမြစ်များကို ဖျက်ရှင်းခြင်း
  - [7. Wrap-up](workshop/docs/instructions/7-Wrap-up.md) - ပြန်လည် သုံးသပ်ခြင်းနှင့် နောက်တစ်ဆင့်များ
- **🛠️ AI Workshop Lab**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI အထူး အလေ့အကျင့်များ
- **💡 Quick Start**: [Workshop Setup Guide](workshop/README.md#quick-start) - ပတ်ဝန်းကျင် ဖွဲ့စည်းခြင်း

**သင့်လျော်သည်**: ကုမ္ပဏီထုတ် သင်တန်းများ၊ တက္ကသိုလ် သင်ရိုး၊ ကိုယ်တိုင် သင်ယူရန်နှင့် developer bootcamp များ။

---

## 📖 နက်ရှိုင်းလေ့လာမှု: AZD ၏ စွမ်းရည်များ

အခြေခံများအပြင် AZD သည် ထုတ်လုပ်မှု တပ်ဆင်မှုများအတွက် အင်အားရှင် feature များကို ပံ့ပိုးပေးပါသည် -

- **Template-based deployments** - ပုံစံပြုထားသော template များဖြင့် ပုံမှန် အက်ပလီကေးရှင်း ပုံစံများကို တပ်ဆင်ပါ
- **Infrastructure as Code** - Bicep သို့မဟုတ် Terraform ကို အသုံးပြု၍ Azure အရင်းအမြစ်များကို စီမံပါ  
- **Integrated workflows** - အလျင်အမြန် provision, deploy, နှင့် monitor အက်ပလီကေးရှင်းများကို တစ်ဆက်တည်းလုပ်ဆောင်နိုင်သည်
- **Developer-friendly** - ဖွံ့ဖြိုးရေးသူ စွမ်းဆောင်ရည်နှင့် အတွေ့အထူးအတွက် ချောမွေ့ အဆင်ပြေစေရန် အကောင်းဆုံး ပြင်ဆင်ထားသည်

### **AZD + Microsoft Foundry: AI တပ်ဆင်မှုများအတွက် သင့်တော်သည်**

**ဘာကြောင့် AI ဖြေရှင်းချက်များအတွက် AZD ကို ရွေးသင့်သနည်း?** AZD သည် AI ဖွံ့ဖြိုးရေးသူများ ကြုံတွေ့ရသည့် ထိပ်တန်း အခက်အခဲများကို ဖြေရှင်းပေးသည် -

- **AI-Ready Templates** - Microsoft Foundry Models, Azure AI Services, နှင့် ML လုပ်ဆောင်ချက်များအတွက် ကြိုတင်ဆက်ထားသော templates များ
- **Secure AI Deployments** - AI ဝန်ဆောင်မှုများ၊ API keys များ၊ နှင့် model endpoints များအတွက် တည်ငြိမ်သော လုံခြုံရေး ပုံစံများပါဝင်သည်  
- **Production AI Patterns** - တိုးချဲ့နိုင်ပြီး စရိတ်ထိရောက်သော AI အက်ပလီကေးရှင်း တပ်ဆင်မှုများအတွက် ကောင်းမွန်သည့် လက်တွေ့နည်းလမ်းများ
- **End-to-End AI Workflows** - မော်ဒယ် ဖွံ့ဖြိုးမှ ထုတ်လုပ်မှု တပ်ဆင်မှုထိ ကြည့်ရှုမှုအကောင်းဆုံးဖြင့် အချိန်နဲ့တကွ
- **Cost Optimization** - AI လုပ်န့်ဆောင်မှုများအတွက် အသုံးအဆောင်နှင့် စွမ်းရည်မျှတစေရန် ရည်ရွယ်ထားသည့် စီမံခန့်ခွဲမှုနည်းလမ်းများ
- **Microsoft Foundry Integration** - Microsoft Foundry model catalog နှင့် endpoints သို့ ချိတ်ဆက်ပေးမှု အဆင်ပြေစွာ

---

## 🎯 Templates & Examples စုပေါင်းစာကြည့်တိုက်

### Featured: Microsoft Foundry Templates
**AI အက်ပလီကေးရှင်းများကို တပ်ဆင်မည်ဆိုလျှင် ဒီနေရာကနေ စတင်ပါ!**

> **Note:** ဤ templates များသည် အမျိုးမျိုးသော AI ပုံစံများကို ပြသပါသည်။ အချို့သည် ပြင်ပ Azure Samples ဖြစ်ပြီး အချို့မှာ ဒေသတွင်း (local) အကောင်အထည်ဖော်ထားမှုများဖြစ်သည်။

| Template | Chapter | Complexity | Services | Type |
|----------|---------|------------|----------|------|
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | အခန်း 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | ပြင်ပ |
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | အခန်း 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| ပြင်ပ |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | အခန်း 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | ပြင်ပ |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | အခန်း 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | ပြင်ပ |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | အခန်း 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | ပြင်ပ |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | အခန်း 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | ပြင်ပ |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | အခန်း 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **ဒေသတွင်း** |

### Featured: Complete Learning Scenarios
**ထုတ်လုပ်မှုပုံစံအဆင့် အက်ပလီကေးရှင်း templates များကို သင်၏ သင်ယူသည့် အခန်းများနှင့် ကိုက်ညီစေရန် စီစဉ်ထားသည်**

| Template | Learning Chapter | Complexity | Key Learning |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | အခန်း 2 | ⭐ | အခြေခံ AI တပ်ဆင်မှု ပုံစံများ |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | အခန်း 2 | ⭐⭐ | Azure AI Search ဖြင့် RAG ကို အကောင်အထည်ဖော်ခြင်း |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | အခန်း 4 | ⭐⭐ | Document Intelligence ပေါင်းစည်းမှု |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | အခန်း 5 | ⭐⭐⭐ | Agent framework နှင့် function calling |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | အခန်း 8 | ⭐⭐⭐ | အဖွဲ့အစည်း AI ညှိနှိုင်းမှု |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | အခန်း 5 | ⭐⭐⭐⭐ | Customer နှင့် Inventory အေးဂျင့်များပါသည့် မျိုးစုံ အေးဂျင့် ဖွဲ့စည်းပုံ |

### ဥပမာအမျိုးအစား အလိုက် သင်ယူခြင်း

> **📌 ဒေသတွင်း vs ပြင်ပ ဥပမာများ:**  
> **ဒေသတွင်း ဥပမာများ** (repo အတွင်း) = ချက်ချင်း အသုံးပြုနိုင်ပါသည်  
> **ပြင်ပ ဥပမာများ** (Azure Samples) = ချိတ်ဆက်ထားသော repository များမှ clone ယူရန်လိုအပ်သည်

#### ဒေသတွင်း ဥပမာများ (ချက်ချင်း အသုံးပြုနိုင်)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - ARM templates များနှင့်အတူ ပြည့်စုံသော ထုတ်လုပ်မှုအဆင်သင့် အကောင်အထည်ဖော်မှု
  - မျိုးစုံ အေးဂျင့် ဖွဲ့စည်းပုံ (Customer + Inventory အေးဂျင့်)
  - ကြည့်ရှုခြင်းနှင့် အကဲဖြတ်မှု ပြည့်စုံ
  - ARM template ဖြင့် တစ်ချက်နှိပ် တပ်ဆင်နိုင်ခြင်း

#### ဒေသတွင်း ဥပမာများ - Container Applications (အခန်း 2-5)
**ဒီ repo အတွင်းရှိ သေချာပြင်ဆင်ထားသော container တပ်ဆင်မှု ဥပမာများ:**
- [**ကွန်တိန်နာ အက်ပ် ဥပမာများ**](examples/container-app/README.md) - ကွန်တိန်နာဖြင့် ထုတ်ပေးမှုများအတွက် ပြည့်စုံသော လမ်းညွှန်
  - [ရိုးရှင်းသော Flask API](../../examples/container-app/simple-flask-api) - အခြေခံ REST API (scale-to-zero)
  - [မိုက်ခရိုဆာဗစ် ဖွဲ့စည်းမှု](../../examples/container-app/microservices) - ထုတ်လုပ်ရေးအဆင်သင့် မျိုးစုံ ဝန်ဆောင်မှု ထုတ်ပေးရေး
  - အလျင်အမြန် စတင်ခြင်း၊ ထုတ်လုပ်ရေးနှင့် အဆင့်မြင့် ထုတ်ပေးမှု ပုံစံများ
  - စောင့်ကြည့်မှု၊ လုံခြုံရေး နှင့် ကုန်ကျစရိတ် သက်သာစေရေး အကြံပေးချက်

#### အပြင်မှ ဥပမာများ - ရိုးရှင်းသော အပလီကေးရှင်းများ (အခန်း 1-2)
**စတင်ရန် ဒီ Azure နမူနာ repositories များကို clone လုပ်ပါ:**
- [ရိုးရှင်းသော Web အက်ပ် - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - အခြေခံ ထုတ်ပေးမှု ပုံစံများ
- [တည်ငြိမ် ဝက်ဘ်ဆိုက် - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - တည်ငြိမ် အကြောင်းအရာ ထုတ်ပေးမှု
- [ကွန်တိန်နာ အက်ပ် - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API ထုတ်ပေးခြင်း

#### အပြင်မှ ဥပမာများ - ဒေတာဘေ့စ် ချိတ်ဆက်ခြင်း (အခန်း 3-4)  
- [ဒေတာဘေ့စ် အက်ပ် - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - ဒေတာဘေ့စ် ချိတ်ဆက်ပုံစံများ
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverless ဒေတာ လုပ်ငန်းစဉ်

#### အပြင်မှ ဥပမာများ - အဆင့်မြင့် ပုံစံများ (အခန်း 4-8)
- [Java မိုက်ခရိုဆာဗစ်များ](https://github.com/Azure-Samples/java-microservices-aca-lab) - မျိုးစုံ ဝန်ဆောင်မှု ဖွဲ့စည်းမှုများ
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - နောက်ခံ အလုပ် ပြုလုပ်ခြင်း  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - ထုတ်လုပ်ရေး အဆင်သင့် ML ပုံစံများ

### ပြင်ပ မော်ဒယ် စုဆောင်းမှုများ
- [**တရားဝင် AZD မော်ဒယ် စုစည်းမှု**](https://azure.github.io/awesome-azd/) - တရားဝင်နှင့် အသိုင်းအဝိုင်း မော်ဒယ်များကို သတ်မှတ် စုစည်းထားသည်
- [**Azure Developer CLI မော်ဒယ်များ**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn မော်ဒယ်စာရွက်စာတမ်းများ
- [**ဥပမာများ ဖိုလ်ဒါ**](examples/README.md) - ဒေသတွင်း သင်ယူရေး ဥပမာများနှင့် အသေးစိတ် ရှင်းလင်းချက်များ

---

## 📚 သင်ယူရေး အရင်းအမြစ်များ နှင့် အညွှန်း

### အမြန် အညွှန်းများ
- [**အမိန့် Cheat Sheet**](resources/cheat-sheet.md) - အခန်းအလိုက် စီစဉ်ထားသော အရေးကြီး azd အမိန့်များ
- [**အချက်ရင်း စကားလုံးရှင်းလင်းချက်များ**](resources/glossary.md) - Azure နှင့် azd အသုံးအနှုန်းများ  
- [**မကြာခဏ မေးမြန်းသော မေးခွန်းများ (FAQ)**](resources/faq.md) - သင်ယူရေး အခန်းအလိုက် စုစည်းထားသော ပုံမှန် မေးခွန်းများ
- [**လေ့လာရေး လမ်းညွှန်**](resources/study-guide.md) - ကျယ်ပြန့်သော လက်တွေ့ လေ့ကျင့်ခန်းများ

### လက်တွေ့ အလုပ်ရုံ သင်တန်းများ
- [**AI အလုပ်ရုံ စမ်းသပ်ခန်း**](docs/chapter-02-ai-development/ai-workshop-lab.md) - သင့် AI ဖြေရှင်းချက်များကို AZD ဖြင့် ထုတ်ပေးနိုင်အောင် ပြုလုပ်ပါ (2-3 နာရီ)
- [**တုံ့ပြန်နိုင်သော အလုပ်ရုံ သင်တန်း**](workshop/README.md) - MkDocs နှင့် GitHub Codespaces ဖြင့် 8-module လမ်းညွှန် လေ့ကျင့်ခန်းများ
  - အောက်ပါအတိုင်း လိုက်ပါ: မိတ်ဆက် → ရွေးချယ်ခြင်း → သက်မှတ်ခြင်း → ခွဲထုတ်ခြင်း → ဆက်တင် ပြုလုပ်ခြင်း → ကိုယ်ပိုင် ပြင်ဆင်ခြင်း → ဖျက်သိမ်းခြင်း → အနှုတ်ချုပ်

### ပြင်ပ သင်ယူရေး အရင်းအမြစ်များ
- [Azure Developer CLI စာရွက်စာတမ်းများ](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure စျေးနှုန်းတွက်ချက်ကိရိယာ](https://azure.microsoft.com/pricing/calculator/)
- [Azure အခြေအနေ](https://status.azure.com/)

### သင့် Editor အတွက် AI Agent ကျွမ်းကျင်မှုများ
- [**skills.sh ပေါ်ရှိ Microsoft Azure ကျွမ်းကျင်မှုများ**](https://skills.sh/microsoft/github-copilot-for-azure) - Azure AI, Foundry, ထုတ်ပေးမှု, ရောဂါရှာဖွေမှု (diagnostics), ကုန်ကျစရိတ် သက်သာရေးနှင့် အခြား အလုပ်များအတွက် စုပေါင်း 37 ခုသော open agent skills များ။ GitHub Copilot, Cursor, Claude Code သို့မဟုတ် မည်သည့် ထောက်ပံ့ထားသော agent တစ်ခုတွင်မဆို ထည့်သွင်းနိုင်ပါသည်:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 အမြန် ပြဿနာဖြေရှင်း လမ်းညွှန်

**စတင်သူများ ကြုံတွေ့ရသော ပုံမှန်ပြဿနာများနှင့် ချက်ချင်း ဖြေရှင်းနည်းများ:**

<details>
<summary><strong>❌ "azd: command ကို မတွေ့ပါ"</strong></summary>

```bash
# AZD ကို ပထမဦးဆုံး တပ်ဆင်ပါ
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# တပ်ဆင်မှုကို အတည်ပြုပါ
azd version
```
</details>

<details>
<summary><strong>❌ "Subscription မတွေ့ပါ" သို့မဟုတ် "Subscription မသတ်မှတ်ထားပါ"</strong></summary>

```bash
# အသုံးပြုနိုင်သည့် subscription များကို စာရင်းပြပါ
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
<summary><strong>❌ "InsufficientQuota" သို့မဟုတ် "Quota ကျော်လွန်နေသည်"</strong></summary>

```bash
# အခြား Azure ဒေသကို စမ်းကြည့်ပါ
azd env set AZURE_LOCATION "westus2"
azd up

# သို့မဟုတ် ဖွံ့ဖြိုးရေးတွင် အသေးငယ်သော SKU များကို အသုံးပြုပါ
# infra/main.parameters.json ဖိုင်ကို ပြင်ဆင်ပါ:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" အလယ်တွင် မအောင်မြင်ပါ</strong></summary>

```bash
# ရွေးချယ်ချက် 1: ရှင်းလင်းပြီး ထပ်မံကြိုးစားပါ
azd down --force --purge
azd up

# ရွေးချယ်ချက် 2: အခြေခံအဆောက်အအုံကိုသာ ပြင်ဆင်ပါ
azd provision

# ရွေးချယ်ချက် 3: အသေးစိတ် အခြေအနေကို စစ်ဆေးပါ
azd show

# ရွေးချယ်ချက် 4: Azure Monitor တွင် မှတ်တမ်းများကို စစ်ဆေးပါ
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Authentication မအောင်မြင်ပါ" သို့မဟုတ် "Token သက်တမ်းကုန်သွားပါပြီ"</strong></summary>

```bash
# AZD အတွက် ပြန်လည်အတည်ပြုပါ
azd auth logout
azd auth login

# ရွေးချယ်စရာ: az အမိန့်များကို အသုံးပြုနေပါက Azure CLI ကိုလည်း ပြန်လည်မွမ်းမံပါ
az logout
az login

# အတည်ပြုမှုကို သေချာစစ်ဆေးပါ
az account show
```
</details>

<details>
<summary><strong>❌ "Resource ရှိပြီးသား" သို့မဟုတ် "အမည် ဆန့်ကျင်မှုများ"</strong></summary>

```bash
# AZD သည် ထူးခြားသော အမည်များကို ဖန်တီးပေးသော်လည်း အမည်တူမှု ဖြစ်ပါက:
azd down --force --purge

# ထပ်မံ ကြိုးစားရန် သန့်ရှင်းသော ပတ်ဝန်းကျင်အသစ်ကို အသုံးပြုပါ
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ "Template ထည့်သွင်းခြင်း အချိန် ပိုကြာနေသည်"</strong></summary>

**ပုံမှန် စောင့်ဆိုင်းချိန်များ:**
- ရိုးရှင်းသော web app: 5-10 မိနစ်
- ဒေတာဘေ့စ်ပါသော အက်ပ်: 10-15 မိနစ်
- AI အက်ပ်များ: 15-25 မိနစ် (OpenAI provisioning နောက်ကျလေသည်)

```bash
# တိုးတက်မှုကို စစ်ဆေးပါ
azd show

# အကယ်၍ ၃၀ မိနစ်ထက်ပို ရပ်တန့်နေပါက Azure Portal ကို စစ်ဆေးပါ:
azd monitor --overview
# မအောင်မြင်သည့် ဖြန့်ချိမှုများကို ရှာပါ
```
</details>

<details>
<summary><strong>❌ "ခွင့်မရှိပါ" သို့မဟုတ် "တားမြစ်ထားသည်"</strong></summary>

```bash
# သင်၏ Azure အခန်းကဏ္ဍကို စစ်ဆေးပါ
az role assignment list --assignee $(az account show --query user.name -o tsv)

# သင်တွင် အနည်းဆုံး "Contributor" အခန်းကဏ္ဍ ရှိဖို့ လိုအပ်သည်
# သင့် Azure အက်မင်ထံ အောက်ပါအခွင့်များ ပေးရန် တောင်းပါ:
# - Contributor (အရင်းအမြစ်များအတွက်)
# - User Access Administrator (အခန်းကဏ္ဍ ခန့်အပ်မှုများအတွက်)
```
</details>

<details>
<summary><strong>❌ တင်ထားသည့် အက်ပ် လိပ်စာ (URL) ကို မတွေ့ပါ</strong></summary>

```bash
# ဝန်ဆောင်မှု endpoints အားလုံးကို ပြပါ
azd show

# သို့မဟုတ် Azure Portal ကို ဖွင့်ပါ
azd monitor

# တိကျသော ဝန်ဆောင်မှုကို စစ်ဆေးပါ
azd env get-values
# *_URL များကို ရှာပါ
```
</details>

### 📚 ပြဿနာဖြေရှင်းခြင်း အပြည့်အစုံ အရင်းအမြစ်များ

- **ပုံမှန် ပြဿနာများ လမ်းညွှန်:** [အသေးစိတ် ဖြေရှင်းချက်များ](docs/chapter-07-troubleshooting/common-issues.md)
- **AI ဆိုင်ရာ ပြဿနာများ:** [AI ပြဿနာဖြေရှင်းခြင်း](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Debugging လမ်းညွှန်:** [ခြေလှမ်းလိုက် Debugging](docs/chapter-07-troubleshooting/debugging.md)
- **အကူအညီ ရယူရန်:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 သင်တန်းပြီးမြောက်ခြင်းနှင့် လက်မှတ်

### တိုးတက်မှု လိုက်နာမှု
အခန်းတိုင်းအလိုက် သင်၏ သင်ယူမှု တိုးတက်မှုကို လိုက်နာပါ:

- [ ] **အခန်း 1**: အခြေခံနှင့် အလျင်အမြန် စတင်ခြင်း ✅
- [ ] **အခန်း 2**: AI-အခြေခံ ဖွံ့ဖြိုးရေး ✅  
- [ ] **အခန်း 3**: ဆက်တင်များနှင့် အတည်ပြုခြင်း ✅
- [ ] **အခန်း 4**: Infrastructure as Code & ထုတ်ပေးရေး ✅
- [ ] **အခန်း 5**: စုံလင်သော Agent များပါသော AI ဖြေရှင်းချက်များ ✅
- [ ] **အခန်း 6**: ထုတ်ပေးမှုမပြုမီ အတည်ပြုခြင်းနှင့် စီစဉ်ခြင်း ✅
- [ ] **အခန်း 7**: ပြဿနာဖြေရှင်းခြင်းနှင့် Debugging ✅
- [ ] **အခန်း 8**: ထုတ်လုပ်ရေးနှင့် ကုမ္ပဏီအဆင့် ပုံစံများ ✅

### သင်ယူမှု အတည်ပြုခြင်း
အခန်းတိုင်း ပြီးမြောက်ချိန်တိုင်း သင်၏ နားလည်မှုကို အတည်ပြုရန်:
1. **လက်တွေ့ လေ့ကျင့်ခန်း**: အခန်း၏ လက်တွေ့ ထုတ်ပေးမှုကို ပြီးမြောက်ပါ
2. **အသိပညာ စစ်ဆေးမှု**: သင့် အခန်းအတွက် FAQ အပိုင်းကို ပြန်လည်သုံးသပ်ပါ
3. **အသိုင်းအဝိုင်း ဆွေးနွေးချက်**: Azure Discord တွင် သင်၏ အတွေ့အကြုံ မျှဝေပေးပါ
4. **နောက်တစ်ခု အခန်း**: နောက်တိုး တက်ရောက်ရန်

### သင်တန်းပြီးမြောက်ခြင်း အကျိုးကျေးဇူးများ
အခန်းအားလုံး ပြီးမြောက်သည့်အခါ သင်သည် ရရှိမည်မှာ:
- **ထုတ်လုပ်မှု အတွေ့အကြုံ**: အမှန်တကယ် AI အက်ပ်များကို Azure သို့ တင်ထားပြီး ဖြစ်ပါမည်
- **ပရော်ဖက်ရှင်နယ် ကျွမ်းကျင်မှုများ**: ကုမ္ပဏီအဆင့် ထုတ်ပေးနိုင်စွမ်းများ
- **အသိုင်းအဝိုင်း မှာ အသိအမှတ်ပြုခြင်း**: Azure developer အသိုင်းအဝိုင်းတွင် လှုပ်ရှားစွာ ပါဝင်သူဖြစ်လာခြင်း
- **လုပ်ငန်း အဆင့်တက်မြှင့်ခြင်း**: လိုအပ်နေသော AZD နှင့် AI ထုတ်ပေးနိုင်စွမ်းများရရှိခြင်း

---

## 🤝 အသိုင်းအဝိုင်းနှင့် အထောက်အပံ့

### အကူအညီနှင့် ထောက်ပံ့မှု ရယူရန်
- **နည်းပညာဆိုင်ရာ ပြဿနာများ**: [အမှားများတင်ထားရန်နှင့် လုပ်ဆောင်ချက်တောင်းယူရန်](https://github.com/microsoft/azd-for-beginners/issues)
- **သင်ယူရေး ဆိုင်ရာ မေးခွန်းများ**: [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure) နှင့် [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI ဆိုင်ရာ အကူအညီ**: [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG) တွင် ပါဝင်ပါ
- **စာရွက်စာတမ်းများ**: [တရားဝင် Azure Developer CLI စာရွက်စာတမ်းများ](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Microsoft Foundry Discord မှ အသိုင်းအဝိုင်း အမြင်များ

**#Azure ချန်နယ်မှ နောက်ဆုံး စစ်တမ်း အဖြေများ:**
- **၄၅%** က developer များသည် AI လုပ်ငန်းအတွက် AZD ကို အသုံးပြုလိုကြသည်
- **အခက်အခဲ အထိပ်ဆုံးများ**: မျိုးစုံ ဝန်ဆောင်မှု ထုတ်ပေးခြင်းများ၊ credential စီမံခန့်ခွဲမှု၊ ထုတ်လုပ်ရေးအဆင်သင့် ဖြစ်မှု  
- **အများဆုံး တောင်းဆိုထားသည်များ**: AI-အထူး မော်ဒယ်များ၊ ပြဿနာဖြေရှင်း လမ်းညွှန်များ၊ အကောင်းဆုံး လုပ်ထုံးလုပ်နည်းများ

**ဒီ အသိုင်းအဝိုင်းတွင် ပါဝင်လိုက်ပါက:**
- AZD + AI အတွေ့အကြုံများကို မျှဝေရန်နှင့် အကူအညီရရန်
- AI မော်ဒယ်အသစ်များ၏ ကြိုမြင် ကြိုတင် ကြည့်ရှုခွင့် ရရန်
- AI ထုတ်ပေးမှု အကောင်းဆုံး လုပ်ထုံးလုပ်နည်းများတွင် ထောက်လှမ်းပါ
- အနာဂတ် AI + AZD လုပ်ဆောင်ချက် ဖွံ့ဖြိုးတိုးတက်ရေးကို သက်ရောက်စေပါ

### သင်တန်းတွင် အထောက်အကူ ပေးခြင်း
ကျွန်တော်တို့သည် အထောက်အကူများကို ကြိုဆိုပါသည်! အသေးစိတ်အချက်အလက်များအတွက် ကျေးဇူးပြု၍ [Contributing Guide](CONTRIBUTING.md) ကို ဖတ်ပါ:
- **အကြောင်းအရာ တိုးတက်ရေး**: ရှိပြီးသား အခန်းများနှင့် ဥပမာများကို တိုးတက်စေပါ
- **ဥပမာ အသစ်များ**: တကယ့်လောက ဇာတ်ကြောင်းများနှင့် မော်ဒယ်များ ထည့်သွင်းပါ  
- **ဘာသာပြန်ခြင်း**: ဘာသာစကား မျိုးစုံ ထောက်ပံ့မှုကို ထိန်းသိမ်းရာတွင် ကူညီပါ
- **အမှား တင်ပြမှုများ**: တိကျမှုနှင့် ဖော်ပြချက် သေချာမှု တိုးမြှင့်ပါ
- **အသိုင်းအဝိုင်း စံနစ်များ**: ကျွန်တော်တို့၏ ဖုံးလွှမ်းသော အသိုင်းအဝိုင်း လမ်းညွှန်ချက်များကို လိုက်နာပါ

---

## 📄 သင်တန်း အချက်အလက်

### လိုင်စင်
ဤ ပရောဂျက်ကို MIT License အောက်မှ လိုင်စင် ထားပါသည် - အသေးစိတ်အချက်အလက်များအတွက် [LICENSE](../../LICENSE) ဖိုင်ကို ကြည့်ပါ။

### ဆက်စပ် Microsoft သင်ယူရေး အရင်းအမြစ်များ

ကျွန်တော်တို့အဖွဲ့သည် အခြား ကျယ်ပြန့်သော သင်ယူရေး သင်တန်းများကို ထုတ်လုပ်ပါသည်:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j အစပိုင်းများ](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js အစပိုင်းများ](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain အစပိုင်းများ](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agents
[![AZD အစပိုင်းများ](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI အစပိုင်းများ](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP အစပိုင်းများ](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Agents အစပိုင်းများ](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Generative AI Series
[![Generative AI အစပိုင်းများ](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generative AI (.NET) အစပိုင်းများ](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generative AI (Java) အစပိုင်းများ](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![ဖန်တီးနိုင်သော AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### အဓိက သင်ယူမှု
[![စတင်လေ့လာသူများအတွက် ML](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![စတင်လေ့လာသူများအတွက် ဒေတာ သုတေသန](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![စတင်လေ့လာသူများအတွက် AI](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![စတင်လေ့လာသူများအတွက် စိုင်ဘာလုံခြုံရေး](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![စတင်လေ့လာသူများအတွက် ဝက်ဘ် ဖွံ့ဖြိုးရေး](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![စတင်လေ့လာသူများအတွက် IoT](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![စတင်လေ့လာသူများအတွက် XR ဖွံ့ဖြိုးရေး](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot စီးရီး
[![AI တွဲဖက် ပရိုဂရမ်ရေးရေးဆွဲမှုအတွက် Copilot](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![C#/.NET အတွက် Copilot](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot စွန့်စားခန်း](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ သင်ခန်းစာ လမ်းညွှန်

**🚀 သင်ယူရန် ပြင်ဆင်ပြီးပါသလား?**

**စတင်လေ့လာသူများ**: အစကို [အခန်း ၁: အခြေခံနှင့် အမြန် စတင်ခြင်း](#-chapter-1-foundation--quick-start)  
**AI ဖွံ့ဖြိုးသူများ**: တိုက်ရိုက်သို့ [အခန်း ၂: AI-ပထမဦးစွာ ဖွံ့ဖြိုးရေး](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**အတွေ့အကြုံရှိ ဖွံ့ဖြိုးရေးသူများ**: စတင်ပါ [အခန်း ၃: ပြင်ဆင်ခြင်းနှင့် အတည်ပြုခြင်း](#️-chapter-3-configuration--authentication)

**နောက်ဆက်တွဲ အဆင့်များ**: [အခန်း ၁ စတင်ပါ - AZD အခြေခံများ](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ပြောကြားချက်**
ဤစာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှန်ကန်မှုအတွက် ကြိုးပမ်းနေသော်လည်း၊ စက်ကိရိယာဘာသာပြန်ခြင်းများတွင် အမှားများ သို့မဟုတ် မှားယွင်းချက်များ ပါဝင်နိုင်ကြောင်း သတိပြုပါရန် လိုအပ်ပါသည်။ မူလစာတမ်းကို မူရင်းဘာသာဖြင့်သာ ယုံကြည်စိတ်ချရသော အချက်အလက်အဖြစ် သတ်မှတ်သင့်သည်။ အရေးကြီးသည့် သတင်းအချက်အလက်များအတွက် ပရော်ဖက်ရှင်နယ် လူသားဘာသာပြန်သူဝန်ဆောင်မှုကို အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော နားလည်မှုကွာခြားမှုများ သို့မဟုတ် မမှန်ကန်သော အသုံးပြုမှုများအတွက် ကျွန်ုပ်တို့ တာဝန်မခံပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->