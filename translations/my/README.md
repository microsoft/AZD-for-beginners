# AZD စတင်သင်ကြားလိုသူများအတွက် - ဖွဲ့စည်းထားသော သင်ယူမှု ခရီးစဉ်

![AZD-for-beginners](../../translated_images/my/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### အလိုအလျောက် ဘာသာပြန်ဆိုမှုများ (အမြဲအသစ်တိုးတက်နေ)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](./README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Khmer](../km/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **ဒေသတွင်းကလုံးမှ ကလုန်းချင်ပါသလား?**
>
> ဤ repository တွင် ဘာသာစကား ၅၀ ကျော် ပါ၀င်ရာ အရွယ်အစား ကြီးတတ်ပါသည်။ ဘာသာပြန်အချက်အလက် မပါဘဲ ကလုန်းရန် sparse checkout ကို အသုံးပြုပါ:
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
> သင်အတန်းသင်ယူရန် လိုအပ်သမျှ အရာအားလုံးကို ပိုမိုလျင်မြန်သော ဒေါင်းလုပ်ဖြင့် ရရှိစေပါသည်။
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 azd တွင် ဒီနေ့ ဘာအသစ်များရှိသနည်း

> 📌 ဤ သင်တန်းသည် **`azd 1.27.1`** (ဇူလိုင် 2026) ဖြင့် အတည်ပြုထားသည်။ သင့်တည်ဆောက်မှုကို စစ်ဆေးရန် `azd version` ကို ပတ်သတ်ဖော်ဆောင်ပါ၊ နောက်ဆုံးထုတ်ယူရန် `azd upgrade` ကို အသုံးပြုပါ။

Azure Developer CLI သည် ယခုအခါ ရိုးရာ ဝဘ်ဆိုဒ်များနှင့် API များမဟုတ်ဘဲ ယူဆောင်သည့် ဒီဇိုင်းအတိုင်း EXPAND လုပ်ပြီး အသုံးပြုခွင့်ရရှိပါသည်။ ယနေ့တွင် azd သည် Azure သို့ **မည်သည့်** အပလီကေးရှင်းမျှ ပို့ဆောင်နိုင်ရန် တစ်ဦးတည်းသောကိရိယာ ဖြစ်လာပါသည် - AI-အခြေပြု အပလီကေးရှင်းများနှင့် အသိပညာဖက် ပြုလုပ်ချက်တွေ ပါဝင်သည်။

၎င်းသည် သင့်အတွက် အဓိပ္ပာယ်ရသည်မှာ အောက်ပါမျိုးဖြစ်ပါသည် -

- **AI agent များသည် ယခု azd တွင် ပထမတန်းစား Workload များဖြစ်ကြသည်။** သင်သည် မသိမှုမရှိပေမယ့် `azd init` → `azd up` လေ့လာခဲ့သော Workflow နဲ့ AI agent Project များကို စတင်၊ တင်ခြင်းနှင့် စီမံခန့်ခွဲခြင်း ပြုနိုင်ပါသည်။
- **CLI မှာ Agent ကာလတလျှောက် ပြည့်စုံသော သက်တမ်းတစ်ခု။** `azure.ai.agents` extension သည် လမ်းခရီးအပြည့်အဝ ဖုံးလွှမ်းထားပါသည် - `azd ai agent init` ဖြင့် scaffold, `azd ai agent invoke` ဖြင့် စမ်းသပ်ခြင်း (တုံ့ပြန်ချိန်ထုတ်လွှင့်ချက်နှင့် အတူ), `azd ai agent eval generate` နှင့် `azd ai agent optimize` ဖြင့် အရည်အသွေး တိုင်းတာ၊ တိုးတက်အောင် ဆောင်ရွက်ခြင်း၊ `azd ai agent delete` ဖြင့် ဆောင်ရွက်ခြင်း။
- **AI အဆောက်အအုံပိုင်းများ ပိုမိုများပြားလာခြင်း။** အသစ်သော preview extension များ - `azure.ai.skills` နှင့် `azure.ai.connections` - သင်ကိုယ်တိုင် reusable agent skill များနှင့် Foundry connection များကို azd နဲ့တိုက်ရိုက် စီမံခန့်ခွဲခွင့်ပြုသည်။
- **Microsoft Foundry ပေါင်းစည်းမှု** သည် ဒီဇိုင်းတစ်ခုတည်းဖြင့် မော်ဒယ်တင်သွင်းခြင်း၊ Agent ဟိုက်စတင်းနှင့် AI ဝန်ဆောင်မှု ပြင်ဆင်မှုကို azd Template Ecosystem ထဲသို့တင်ထားသည်။
- **နေ့စဉ်အခြေခံအသားပေးအရာများ ပိုမိုပြေလည်စေရန်။** နောက်ဆုံးထွက်မှုများကြောင့် `azd init` ကို idempotent (ပြန်လုပ်ဆောင်ရန်လုံခြုံ) ဖြစ်စေခဲ့ပြီး၊ `azd auth login` သည် အဟောင်း token များကို အလိုအလျောက် ရှင်းလင်းပေးသည်၊ `azd tool` သည် ပထမဆုံးrun setup prompt ကို ချဉ်းကပ်မှုမြန်ဆန်စွာထည့်သွင်းသည်။
- **Main Workflow မပြောင်းလဲပါ။** သင်သည် Todo app တစ်ခု၊ Microservice သို့မဟုတ် multi-agent AI ဖြေရှင်းချက်တစ်ခု တင်သွင်းခြင်း ဖြစ်စေ၊ ညွှန်ကြားချက်များက တူညီပါသည်။

> **Aspire အသုံးပြုသူများအတွက် အရေးကြီး မှတ်ချက်:** Microsoft သည် ယခုမှ ထုတ်ကုန်ကို အထူးသဖြင့် **Aspire** ဟုခေါ်ဆိုသည် (ယခင် ".NET Aspire")။ azd ၏ Aspire ထောက်ပံ့မှုမှာ မပြောင်းလဲသေးပါ—နာမည်သာ ပြောင်းလဲထားသည်။

azd ကို ယခင်က အသုံးပြုခဲ့သူများအတွက် AI ထောက်ပံ့မှုသည် သဘာဝအတိုင်း ချဲ့ထွင်မှုအခန်းကဏ္ဍ ဖြစ်ပြီး ကိရိယာအသစ် သို့ advanced လမ်းကြောင်း မဟုတ်ပါ။ သင်စတင်သောသူဖြစ်ပါက အရာအားလုံးအတွက် အလုပ်လုပ်သော Workflow တစ်ခုကို သင်ယူရမှာ ဖြစ်ပါသည်။

---

## 🚀 Azure Developer CLI (azd) ဆိုတာဘာလဲ?

**Azure Developer CLI (azd)** သည် တိုးတက်သောအိုင်ဒီယာရှင် Developers များအတွက် command-line ကိရိယာ တစ်ခုဖြစ်ပြီး Azure တွင် အလွယ်တကူ အပလီကေးရှင်းများ တင်သွင်းနိုင်သည်။ Azure resource များကို လက်ဖြင့် တစ်ခုချင်းစီ ဖန်တီးပြီးချိတ်ဆက်ရတာ မလိုအပ်ပဲ command တစ်ခုဖြင့် အပလီကေးရှင်း အပြည့်အစုံတင်သွင်းနိုင်ပါသည်။

### `azd up` ၏ မာကျောကတိ

```bash
# ဒီတစ်ခုတည်းသော command က အကုန်လုံးကို လုပ်ဆောင်ပေးတယ်။
# ✅ Azure ရင်းမြစ်အားလုံးကို ဖန်တီးသည်
# ✅ ကွန်ယက်နှင့် လုံခြုံရေးကို ပြင်ဆင်သည်
# ✅ သင့် application ကုဒ်ကို တည်ဆောက်သည်
# ✅ Azure သို့ တင်ပေးသည်
# ✅ လုပ်ဆောင်နိုင်သော URL ကို ပေးသည်
azd up
```

**ဒါဆို လုပ်နိုင်ပြီးပါပြီ!** Azure Portal မှ ကလစ်လုပ်ရန်၊ ဖော်ပြချက် ARM templates တက်ကြွစွာ သိရန်မလို၊ လက်ဖြင့် စီမံမှု မလိုဘဲ အလုပ်လုပ်သော Azure ပေါ်ရှိ အပလီကေးရှင်းများ ရရှိပါပြီ။

---

## ❓ Azure Developer CLI နှင့် Azure CLI: ကွာခြားချက်ဘာလဲ?

အသစ်စတင်သုံးသူများ သိလိုက်ကြသော မေးခွန်းအများဆုံးဖြစ်သည်။ ရိုးရှင်းသော တုံ့ပြန်ချက်ကတော့ -

| လက္ခဏာ | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **ရည်ရွယ်ချက်** | Azure resources အသီးသီး စီမံခန့်ခွဲ | အပလီကေးရှင်း အပြည့်အစုံ တင်သွင်းရန် |
| **စိတ်ထား** | အင်ဖရာစတပ်ချာ အမှီ | အပလီကေးရှင်း အမှီ |
| **ဥပမာ** | `az webapp create --name myapp...` | `azd up` |
| **သင်ယူမှု အဆင့်** | Azure ဝန်ဆောင်မှုများ သိထားရမည် | သင်၏ အက်ပ်ကိုသာ သိထားရမည် |
| **သင့်တော်ရာအသုံးပြုသူ** | DevOps, Infrastructure | Developer များ၊ Prototype ပြုလုပ်သူများ |

### ရိုးရှင်းသော ဥပမာ

- **Azure CLI** သည် အိမ်တစ်လုံး ဆောက်ရန် လိုအပ်သော ကိရိယာများ (တူးထိုးကိရိယာ၊ သဲညှပ်၊ တင်းရိုး) ကို လက်တွဲထားထားသည်ကဲ့သို့ ဖြစ်ပြီး၊ ဘာမှ ဆောက်နိုင်သော်လည်း ဆောက်လုပ်ရေး ကျွမ်းကျင်မှု လိုအပ်သည်။
- **Azure Developer CLI** ကို စီမံအပ်နှံသူ တစ်ဦး များထားသည့် ကဲ့သို့ ဖြစ်ပြီး၊ သင် သတိထားလိုသည့် ပစ္စည်းကိုဖော်ပြရုံဖြင့် ဆောက်လုပ်မှုကို သူတစ်ပါးကတာဝန်ယူသည်။

### မည်သည့်အခါသုံးသင့်သနည်း

| ရှာဖွေမှု | သုံးရန် |
|----------|----------|
| "ကျွန်ုပ်သည် web app ကို လျင်မြန်စွာ တင်သွင်းချင်သည်" | `azd up` |
| "ငါ storage account တစ်ခုသာ ဖန်တီးချင်သည်" | `az storage account create` |
| "ကျွန်ုပ်သည် အပြည့်အစုံ AI အပလီကေးရှင်း တည်ဆောက်နေပါသည်" | `azd init --template azure-search-openai-demo` |
| "တိကျသော Azure resource ကို Debug လုပ်ချင်သည်" | `az resource show` |
| "ကိုယ်ပိုင်ထုတ်လုပ်မှုအဆင့်ပြည့်စုံရေး တင်သွင်းချင်သည်" | `azd up --environment production` |

### ၎င်းတို့သည် အတူတကွ လုပ်ဆောင်ကြသည်!

AZD သည် Azure CLI ကို နက်လိမ့်အောက်ကနေ အသုံးပြုသည်။ သင်နှစ်ခုလုံးကိုသုံးနိုင်သည်။
```bash
# AZD ဖြင့် သင့်အက်ပ်ကို တပ်ဆင်ပါ
azd up

# ပြီးမှ Azure CLI ဖြင့် အထူးအသုံးပြု ရင်းမြစ်များကို တိကျစွာ ပြင်ဆင်ပါ
az webapp config set --name myapp --always-on true
```

---

## 🌟 Awesome AZD မှ Templates ရှာဖွေပါ

မူရင်းမှ စတင်မလုပ်ပါနဲ့! **Awesome AZD** သည် အသုံးပြုရန် ဆင်သင့်သော Template များကို အလွန် ဂရုတစိုက် စုဆောင်းထားသော Community စုစည်းမှုဖြစ်သည်။

| အရင်းအမြစ် | ဖော်ပြချက် |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | တစ်ချက်နှိပ်ခြင်းဖြင့် 200+ Template များကို လှည့်စားပါ |
| 🔗 [**Submit a Template**](https://github.com/Azure/awesome-azd/issues) | သင့်ကိုယ်ပိုင် Template ကို Community နှင့် ဝေမျှပါ |
| 🔗 [**GitHub Repository**](https://github.com/Azure/awesome-azd) | Star နှင့် Source ကို မျှဝေရှာဖွေပါ |

### Awesome AZD မှ လူကြိုက်များသော AI Templates များ

```bash
# Microsoft Foundry မော်ဒယ်များနှင့် AI ရှာဖွေမှုဖြင့် RAG စကားပြောချက်
azd init --template azure-search-openai-demo

# လျင်မြန်သော AI စကားပြော အပလီကေးရှင်း
azd init --template openai-chat-app-quickstart

# Foundry Agent များနှင့် AI Agent များ
azd init --template get-started-with-ai-agents
```

---

## 🎯 ၃ခြေလှမ်းနှင့် စတင်ခြင်း

စတင်ရန်မတိုင်မီ၊ သင်တင်သွင်းလိုသော Template အတွက် သင့်စက်က စိတ်ကြိုက်ပြင်ဆင်ထားပါကောင်းစစ်ဆေးပါ။

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

လိုအပ်သော စစ်ဆေးမှု တစ်ခုမှမအောင်မြင်ပါက အရင်ဆုံး ပြင်ဆင်ပြီး ဂျုံတင်ကပ်၍ ဆက်လုပ်ပါ။

### ခြေလှမ်း ၁: AZD ကို တပ်ဆင်ခြင်း (၂ မိနစ်)

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

### ခြေလှမ်း ၂: AZD အတွက် မှတ်ပုံတင်ခြင်း

```bash
# ဒီသင်တန်းမှာ Azure CLI ကွန်မန်းများကိုတိုက်ရိုက်အသုံးပြုရန်စီစဉ်ထားပါက ရွေးချယ်နိုင်သည်
az login

# AZD workflow များအတွက် လိုအပ်ပါသည်
azd auth login
```

သင်လိုအပ်ချင်သည့်အရာကို မသေချာပါက [Installation & Setup](docs/chapter-01-foundation/installation.md#authentication-setup) တွင် စုံစမ်းစစ်ဆေး အပြည့်အစုံ လမ်းညွန်ချက်ကို လိုက်နာပါ။

### ခြေလှမ်း ၃: ပထမဆုံး App ကို တင်သွင်းပါ

```bash
# စံပုံတစ်ခုမှ စတင်ပြုလုပ်သည်
azd init --template todo-nodejs-mongo

# Azure သို့ တင်သွင်းသည် (အားလုံးကို တည်ဆောက်ပါသည်!)
azd up
```

**🎉 ထိုပင်ဖြစ်သည်!** သင်၏ App သည် ယခု Azure ပေါ်တွင် အသက်ဝင်နေပါပြီ။

### ရှင်းလင်းမှု (မမေ့ပါနှင့်!)

```bash
# စမ်းသပ်မှုပြီးပါက အရင်းအမြစ်များအားလုံးကို ဖျက်ပစ်ပါ။
azd down --force --purge
```

---

## 📚 ဤသင်တန်းကို မည်သို့ အသုံးပြုမည်နည်း

ဤသင်တန်းကို **တိုးတက်မှုအဆင့်လိုက် သင်ယူမှု** အတွက် ဒီဇိုင်းရေးဆွဲထားသည် - သင်ကိုယ့်အဆင်ပြေရာကနေ စပြီး တိုးတက်အောင် လေ့လာနိုင်ပါသည်

| သင့် အတွေ့အကြုံ | ခုနေရာက စတင်ပါ |
|-----------------|------------|
| **Azure အတွက် အသစ်စ Completely** | [Chapter 1: Foundation](#-chapter-1-foundation--quick-start) |
| **Azure ကိုသိပြီး AZD အသစ်ဖြစ်သူ** | [Chapter 1: Foundation](#-chapter-1-foundation--quick-start) |
| **AI app များတင်သွင်းချင်သူ** | [Chapter 2: AI-First Development](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **လက်တွေ့လေ့ကျင့်လိုသူ** | [🎓 Interactive Workshop](workshop/README.md) - ၃-၄ နာရီ အထောက်အကူပြု လေ့ကျင့်မှု |
| **ထုတ်လုပ်မှုပုံစံလိုသူ** | [Chapter 8: Production & Enterprise](#-chapter-8-production--enterprise-patterns) |

### အလျင်အမြန် စတင်ခြင်း

၁။ **ဤ Repository ကို Forkလုပ်ပါ**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
၂။ **Clone လုပ်ပါ**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
၃။ **အကူအညီ ရယူပါ**: [Azure Discord Community](https://discord.com/invite/ByRwuEEgH4)

> **ဒေသတွင်းကလုံးမှ ကလုန်းချင်ပါသလား?**

> ဤ repository တွင် ဘာသာစကား ၅၀ ကျော် ပါ၀င်ရာ အရွယ်အစား ကြီးတတ်ပါသည်။ ဘာသာပြန်အချက်အလက် မပါဘဲ ကလုန်းရန် sparse checkout ကို အသုံးပြုပါ:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> သင်အတန်းသင်ယူရန် လိုအပ်သမျှ အရာအားလုံးကို ပိုမိုလျင်မြန်သော ဒေါင်းလုပ်ဖြင့် ရရှိစေပါသည်။


## သင်တန်းအကျဉ်းချုပ်

အဆင့်လိုက် သင်ယူမှုအတွက် ဖွဲ့စည်းထားသော အခန်းများမှတဆင့် Azure Developer CLI (azd) ကို ကျွမ်းကျင်အောင် သင်ကြားပါ။ **Microsoft Foundry ပေါင်းစည်းမှုနှင့်အတူ AI အပလီကေးရှင်း တင်သွင်းမှုအပေါ် အထူးအာရုံစိုက်မှု**


### မော်ဒန် Developer တွေအတွက် ဒီသင်တန်း အရေးကြီးသည့်အကြောင်း

Microsoft Foundry Discord လူမှုအသိုင်းအဝိုင်း၏ အမြင်အပေါ် အခြေခံ၍ **Developer ၄၅% သည် AI ရာထူးများအတွက် AZD ကို သုံးလိုကြသော်လည်း အခက်အခဲများ အကြုံတွေ့ကြသည်။**
- ရှုပ်ထွေးသော multi-service AI စက်မှုဖွဲ့စည်းပုံများ
- ထုတ်လုပ်ရေး AI အပ်ဒိတ်ဖြန့်ဝေပုံ最佳လက်တွေ့ကျဆုံးမှု  
- Azure AI စနစ်ပေါင်းစည်းခြင်းနှင့် ပြင်ဆင်ခြင်း
- AI ရာထူးများအတွက် စျေးနှုန်းချိန်ညှိခြင်း
- AI အတွက် ထုတ်လုပ်ရေး အပ်ဒိတ်ဖြန့်ဖြူးမှု တည်ဆဲပြဿနာများ ဖြေရှင်းခြင်း

### သင်ယူရမည့်ရည်မှန်းချက်များ

ဒီစနစ်တကျ သင်တန်းပြီးမြောက်ခြင်းဖြင့် သင်မှာ:
- **AZD အခြေခံများကို ကိုင်တွယ်ကျွမ်းကျင်ပါမည်**: အဓိကအယူအဆများ၊ installation နှင့် configuration
- **AI Application များ ဖြန့်ဖြူးခြင်း**: Microsoft Foundry ဝန်ဆောင်မှုများနှင့် AZD အသုံးပြုခြင်း
- **Infrastructure as Code ကို အသုံးပြုခြင်း**: Azure အရင်းအမြစ်များကို Bicep template များဖြင့် စီမံခန့်ခွဲရန်
- **App ဖြန့်ဖြူးမှု ပြဿနာများ ဖြေရှင်းခြင်း**: အဆင်မပြေတာများကို ဖြေရှင်းနည်းများနှင့် Debug ပြုလုပ်ခြင်း
- **ထုတ်လုပ်မှုအတွက် တိုးတက်စေခြင်း**: လုံခြုံရေး၊ တိုးမြှင့်ခြင်း၊ စောင့်ကြည့်ခြင်းနှင့် စရိတ်စီမံခန့်ခွဲမှု
- **Multi-Agent လုပ်ဆောင်ချက်များ တည်ဆောက်ခြင်း**: ရှုပ်ထွေးသော AI စက်မှုမျိုးစုံဖြန့်ဖြူးခြင်း

## စတင်မတိုင်မှီ: အကောင့်များ၊ ဝင်ရောက်ခွင့်များနှင့် ယခင်အခြေအနေများ

အခန်း ၁ စတင်မတိုင်မီ အောက်ပါအချက်များရှိမှဖြစ်ရမည်။ အဆိုပါ အသုံးပြုမှုလမ်းညွှန်ထဲရှိ installation လမ်းညွှန်သည် ဒီအခြေခံမှုများ ကိုပြင်ဆင်ပြီးကြောင်း သဘောတူထားသည်။

- **Azure subscription များ**: အလုပ်နေရာမှ ရှိပြီးသား subscription သို့ မိမိအကောင့်မှ လည်းကောင်း၊ [အခမဲ့ စမ်းသပ်ရန်](https://aka.ms/azurefreetrial) အသစ်ဖန်တီးရန်လည်းကောင်း၊ ကူညီအသုံးပြုနိုင်သည်။
- **Azure အရင်းအမြစ် ဖန်တီးခွင့်**: လေ့ကျင့်ခန်းအများစုအတွက် မိမိအသုံးပြုမည့် subscription သို့ resource group တွင် အနည်းဆုံး Contributor လုပ်ခွင့် ရရှိထားသင့်သည်။ အခန်းအချို့တွင် resource group များ၊ managed identities နှင့် RBAC အနက်သတ်မှတ်ချက်များ ဖန်တီးနိုင်ရမည်ဟုထင်ထားသည်။
- [**Github အကောင့်**](https://github.com): repository ကို fork လုပ်ရန်၊ ကိုယ်ပိုင်ပြင်ဆင်မှုများကို စောင့်ကြည့်ရန်နှင့် GitHub Codespaces ကို Workshop အတွက်အသုံးပြုရန် အထောက်အကူဖြစ်သည်။
- **Template runtime ပစ္စည်းများ**: template အချို့တွင် Node.js, Python, Java, သို့မဟုတ် Docker ကဲ့သို့သော local tools များ လိုအပ်ပါသည်။ စတင်မတိုင်မှီ setup validator ကို run ပြီး လိုအပ်သည့် tools များ ရှိ/မရှိကို စစ်ဆေးပါ။
- **Terminal အခြေခံအသိပညာ**: ကျွမ်းကျင်သူ မဖြစ်စေသော်လည်း `git clone`, `azd auth login`, `azd up` ကဲ့သို့ cmd များကို သုံးနိုင်ရန် သင့်တော်သည်။

> **လုပ်ငန်းအဖွဲ့ subscription အတွက် အလုပ်လုပ်နေပါသလား?**
> အကယ်၍ မိမိ Azure ပတ်ဝန်းကျင်ကို administrator က စီမံခန့်ခွဲလျှင်၊ ဤ subscription သို့ resource group တွင် resource များ ဖြန့်ဖြူးခွင့် ရှိကြောင်း ယခင်က စစ်ဆေးပါ။ မရှိပါက sandbox subscription သို့ Contributor လုပ်ခွင့်ကို စတင်မတိုင်မှီ တောင်းဆိုပါ။

> **Azure အသစ်စတင်လေ့လာနေသူများအတွက်**
> https://aka.ms/azurefreetrial အတွက် မိမိ၏ Azure trial သို့ ပေးဆောင်ကျသင့်သော subscription ကို အသုံးပြု၍ ဆန့်ကျင်ခံတဲ့ tenant-level အတည်ပြုချက်များ မစောင့်ဘဲ လေ့ကျင့်မှုများကို အဆုံးသတ်နိုင်ပါသည်။

## 🗺️ သင်တန်းမြေပုံ: အခန်းအလိုက် လျင်မြန်စွာ ရှာဖွေခြင်း

အခန်းတိုင်းတွင် သင်ယူရမည့်ရည်မှန်းချက်များ၊ လျင်မြန်စွာ စတင်ခြင်းနှင့် လေ့ကျင့်ခန်းများ ပါရှိသည့် README ကို ပါဝင်သည်။

| အခန်း | ခေါင်းစဉ် | သင်ခန်းစာများ | ကြာမြင့်ချိန် | ခက်ခဲမှု |
|---------|-------|---------|----------|------------|
| **[အခန်း ၁: အခြေခံ](docs/chapter-01-foundation/README.md)** | စတင်ခြင်း | [AZD အခြေခံများ](docs/chapter-01-foundation/azd-basics.md) &#124; [Installation](docs/chapter-01-foundation/installation.md) &#124; [ပထမဆုံး Project](docs/chapter-01-foundation/first-project.md) | ၃၀-၄၅ မိနစ် | ⭐ |
| **[အခန်း ၂: AI ဖွံ့ဖြိုးတိုးတက်မှု](docs/chapter-02-ai-development/README.md)** | AI ပထမဆုံး Apps | [Foundry ပေါင်းစည်းမှု](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI Agent များ](docs/chapter-02-ai-development/agents.md) &#124; [Model Deployment](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Workshop](docs/chapter-02-ai-development/ai-workshop-lab.md) | ၁-၂ နာရီ | ⭐⭐ |
| **[အခန်း ၃: ပုံမှန်ပြင်ဆင်ခြင်း](docs/chapter-03-configuration/README.md)** | အတည်ပြုခြင်းနှင့် လုံခြုံရေး | [ပုံမှန်ပြင်ဆင်ခြင်း](docs/chapter-03-configuration/configuration.md) &#124; [အတည်ပြုခြင်းနှင့် လုံခြုံရေး](docs/chapter-03-configuration/authsecurity.md) | ၄၅-၆၀ မိနစ် | ⭐⭐ |
| **[အခန်း ၄: အင်ဖရာစထ်ရွတ်ချာ](docs/chapter-04-infrastructure/README.md)** | IaC နှင့် Deployment | [Deployment လမ်းညွှန်](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisioning](docs/chapter-04-infrastructure/provisioning.md) | ၁-၁.၅ နာရီ | ⭐⭐⭐ |
| **[အခန်း ၅: Multi-Agent](docs/chapter-05-multi-agent/README.md)** | AI Agent ဖြေရှင်းချက်များ | [Retail ကိစ္စရပ်](examples/retail-scenario.md) &#124; [အမွှာအတန်းပုံစံများ](docs/chapter-06-pre-deployment/coordination-patterns.md) | ၂-၃ နာရီ | ⭐⭐⭐⭐ |
| **[အခန်း ၆: အပ်ဒိတ်မတိုင်မှီ](docs/chapter-06-pre-deployment/README.md)** | စီမံချက်နှင့် အတည်ပြုခြင်း | [Preflight အစစ်အမှန်စစ်ဆေးချက်များ](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [စွမ်းဆောင်ရည် စီမံချက်](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU ရွေးချယ်မှု](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | ၁ နာရီ | ⭐⭐ |
| **[အခန်း ၇: ပြဿနာဖြေရှင်းခြင်း](docs/chapter-07-troubleshooting/README.md)** | Debug နှင့် ပြင်ဆင်ခြင်း | [ယုံကြည်စိတ်ချရသော ပြဿနာများ](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Debugging](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI ပြဿနာများ](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | ၁-၁.၅ နာရီ | ⭐⭐ |
| **[အခန်း ၈: ထုတ်လုပ်မှု](docs/chapter-08-production/README.md)** | စက်မှုလုပ်ငန်းပုံစံများ | [ထုတ်လုပ်ရေး ဆောင်ရွက်ခြင်း](docs/chapter-08-production/production-ai-practices.md) | ၂-၃ နာရီ | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | လက်တွေ့လေ့ကျင့်ခန်း | [နိဒါန်း](workshop/docs/instructions/0-Introduction.md) &#124; [ရွေးချယ်မှု](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [အတည်ပြုခြင်း](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [ခွဲခြမ်းပြန်ကြားခြင်း](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [စိတ်ကြိုက်ပြင်ဆင်ခြင်း](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [စိတ်ကြိုက်ပြောင်းလဲခြင်း](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [အ၍ရှင်းခြင်း](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [ပြီးစီးခြင်း](workshop/docs/instructions/7-Wrap-up.md) | ၃-၄ နာရီ | ⭐⭐ |

**စုစုပေါင်း သင်တန်းကြာမြင့်ချိန်:** ~၁၀-၁၄ နာရီ | **ကျွမ်းကျင်မှု တိုးတက်မှု:** တစ်ဆင့်ပြောင်း → ထုတ်လုပ်မှုအဆင့်

---

## 📚 သင်ယူမှုအခန်းများ

*သင့် ပညာအဆင့်နှင့် ရည်မှန်းချက်များ အပေါ်မူတည်၍ သင်ယူမည့်လမ်းကြောင်း ရွေးချယ်ပါ*

### 🚀 အခန်း ၁: အခြေခံ & လျင်မြန်စတင်မှု
**လိုအပ်ချက်များ**: Azure subscription, အခြေခံ command line ပညာ  
**ကြာမြင့်ချိန်**: ၃၀-၄၅ မိနစ်  
**ခက်ခဲမှု**: ⭐

#### သင်ယူရမည့်အရာများ
- Azure Developer CLI အခြေခံ အယူအဆ နားလည်ခြင်း
- ကိုယ်ပိုင်ပလက်ဖောင်းပေါ်တွင် AZD ကို ထည့်သွင်းခြင်း
- ပထမဆုံး အောင်မြင်စွာ ဖြန့်ဖြူးမှု

#### သင်ယူမှု အရင်းအမြစ်များ
- **🎯 ဒီနေရာမှ စတင်ပါ**: [Azure Developer CLI ဆိုတာဘာလဲ?](#what-is-azure-developer-cli)
- **📖 သီအိုရီ**: [AZD အခြေခံများ](docs/chapter-01-foundation/azd-basics.md) - အဓိကအယူအဆများနှင့် ဝေါဟာရ
- **⚙️ ထည့်သွင်းခြင်း**: [Installation နှင့် Setup](docs/chapter-01-foundation/installation.md) - ပလက်ဖောင်းအလိုက် လမ်းညွှန်ချက်များ
- **🛠️ လက်တွေ့လေ့ကျင့်ခန်း**: [သင်၏ ပထမဆုံး Project](docs/chapter-01-foundation/first-project.md) - အဆင့်လိုက် သင်ခန်းစာ
- **📋 အမြန်ဖတ်ရှုရန်**: [Command Cheat Sheet](resources/cheat-sheet.md)

#### လက်တွေ့လေ့ကျင့်ခန်းများ
```bash
# အမြန်ဆုံး ထည့်သွင်းမှု စစ်ဆေးခြင်း
azd version

# သင့်ပထမဆုံး အပ်ပလီကေးရှင်းကို တပ်ဆင်ပါ
azd init --template todo-nodejs-mongo
azd up
```

**💡 အခန်းရလဒ်**: AZD အသုံးပြု၍ အလွယ်တကူ ဝက်ဘ်အက်ပ်တစ်ခုကို Azure သို့ ဖြန့်ဖြူးနိုင်ခြင်း

**✅ အောင်မြင်မှုအတည်ပြုချက်:**
```bash
# အခန်း ၁ ပြီးဆုံးလျှင် သင်သည် အောက်ပါအရာများကို တတ်မြောက်နိုင်မည်။
azd version              # ထည့်သွင်းထားသော ဗားရှင်းကို ပြသသည်။
azd init --template todo-nodejs-mongo  # ပရောဂျက်ကို စတင်ဆောင်ရွက်သည်။
azd up                  # Azure သို့ တင်သွင်းသည်။
azd show                # လည်ပတ်နေသော အက်ပ်၏ URL ကို ပြသသည်။
# အက်ပ်သည် ဘရောက်ဇာတွင် ဖွင့်ပြီး လုပ်ဆောင်နိုင်သည်။
azd down --force --purge  # ရင်းမြစ်များကို သန့်စင်သည်။
```

**📊 ကြာမြင့်ချိန်:** ၃၀-၄၅ မိနစ်  
**📈 သင်၏ ကျွမ်းကျင်မှု:** အခြေခံ အက်ပ်များကို တစ်ဦးတည်း ဖြန့်ဖြူးနိုင်သည်
**📈 သင်၏ ကျွမ်းကျင်မှု:** အခြေခံ အက်ပ်များကို တစ်ဦးတည်း ဖြန့်ဖြူးနိုင်သည်

---

### 🤖 အခန်း ၂: AI ပထမဆုံး ဖွံ့ဖြိုးတိုးတက်မှု (AI Developer များအတွက် အကြံပြု)
**လိုအပ်ချက်များ**: အခန်း ၁ ပြီးမြောက်ပြီးသား  
**ကြာမြင့်ချိန်**: ၁-၂ နာရီ  
**ခက်ခဲမှု**: ⭐⭐

#### သင်ယူရမည့်အရာများ
- Microsoft Foundry နှင့် AZD ပေါင်းစည်းခြင်း
- AI အား အင်အားပြုသော application များ ဖြန့်ဖြူးခြင်း
- AI ဝန်ဆောင်မှုများ ဂေါ်ရမှုနားလည်ခြင်း

#### သင်ယူမှု အရင်းအမြစ်များ
- **🎯 ဒီနေရာမှ စတင်ပါ**: [Microsoft Foundry ပေါင်းစည်းခြင်း](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI Agent များ**: [AI Agent လမ်းညွှန်](docs/chapter-02-ai-development/agents.md) - AZD ဖြင့် စွမ်းရည်ထက်မြက်သော agent များ ဖြန့်ဖြူးခြင်း
- **📖 ပုံစံများ**: [AI မော်ဒယ် ဖြန့်ဖြူးခြင်း](docs/chapter-02-ai-development/ai-model-deployment.md) - AI မော်ဒယ်များကို ဖြန့်ဖြူးခြင်းနှင့် စီမံခြင်း
- **🛠️ Workshop**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - သင့် AI ဖြေရွေးချက်များကို AZD အသုံးပြုရန်အရေးပါ
- **🎥 အပြန်အလှန်လမ်းညွှန်ချက်**: [Workshop ပစ္စည်းများ](workshop/README.md) - MkDocs * DevContainer ပတ်ဝန်းကျင်ဖြင့် Browser အခြေခံ သင်ကြားမှု
- **📋 Template များ**: [Microsoft Foundry Template များ](#ပို့ချမှုပြုလုပ်ခန်း-အရင်းအမြစ်များ)
- **📝 နမူနာများ**: [AZD Deployment နမူနာများ](examples/README.md)

#### လက်တွေ့လေ့ကျင့်ခန်းများ
```bash
# သင်၏ ပထမဆုံး AI အပ်ပလီကေးရှင်းကို တပ်ဆင်ပါ
azd init --template azure-search-openai-demo
azd up

# အပို AI စာအုပ်များကို စမ်းသပ်ပါ
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 အခန်းရလဒ်**: RAG အင်အားများပါသော AI အခြေခံ chat application တစ်ခုကို ဖြန့်ဖြူးခြင်းနှင့် ပြင်ဆင်နိုင်ခြင်း

**✅ အောင်မြင်မှုအတည်ပြုချက်:**
```bash
# အခန်း ၂ ပြီးနောက်၊ သင်သည် အောက်ပါအရာများကို စွမ်းဆောင်နိုင်သင့်သည်။
azd init --template azure-search-openai-demo
azd up
# AI စကားပြော အင်တာဖေ့စ်ကို စမ်းသပ်ပါ
# မေးခွန်းများမေးပြီး အရင်းအမြစ်များပါရှိသော AI ပါဝင်သော ပြန်လည်ဖြေကြားချက်များကို ရယူပါ
# ရှာဖွေရေးပေါင်းစပ်မှု လည်ပတ်မှုကို အတည်ပြုပါ
azd monitor  # Application Insights တွင် သတင်းအချက်အလက်များ ပြထားသည်ကို စစ်ဆေးပါ
azd down --force --purge
```

**📊 ကြာမြင့်ချိန်:** ၁-၂ နာရီ  
**📈 သင်၏ ကျွမ်းကျင်မှု:** ထုတ်လုပ်မှုအဆင့် AI application များကို ဖြန့်ဖြူး ပြင်ဆင်နိုင်သည်  
**💰 ကုန်ကျစရိတ် သဘောတူချက်များ:** $80-150/လ တန်းဖိုး dev ကုန်ကျစရိတ်နှင့် $300-3500/လ ထုတ်လုပ်မှု ကုန်ကျစရိတ်နားလည်ခြင်း

#### 💰 AI ဖြန့်ဖြူးမှုအတွက် ကုန်ကျစရိတ် စဉ်းစားချက်များ

**ဖွံ့ဖြိုးတိုးတက်မှု ပတ်ဝန်းကျင် (ခန့်မှန်း $80-150/လ):**
- Microsoft Foundry Models (pay-as-you-go): $0-50/လ (token အသုံးပြုမှု အခြေခံ)
- AI Search (အခြေခံ အဆင့်): $75/လ
- Container Apps (အသုံးပြုမှုအပေါ်မူတည်): $0-20/လ
- Storage (စံနမူနာ): $1-5/လ

**ထုတ်လုပ်မှု ပတ်ဝန်းကျင် (ခန့်မှန်း $300-3500+/လ):**
- Microsoft Foundry Models (PTU တက်မြောက်သော မှန်ကန်သော စွမ်းဆောင်ရည်အတွက်): $3000+/လ OR အများပြားအသုံးပြုမှုဖြင့် Pay-as-go
- AI Search (စံနမူနာ အဆင့်): $250/လ
- Container Apps (သီးသန့်): $50-100/လ
- Application Insights: $5-50/လ
- Storage (Premium): $10-50/လ

**💡 ကုန်ကျစရိတ် သက်သာစေမှုအကြံပြုချက်များ:**
- သင်ယူရန်အတွက် **Free Tier** Microsoft Foundry Models ကို အသုံးပြုပါ (Azure OpenAI 50,000 token/လ ရှိသည်)
- ဖွံ့ဖြိုးတိုးတက်မှု မလုပ်ဆောင်ချိန်တွင် `azd down` ကို run ပြီး resource များ ပိတ်ပင်ထားပါ
- pay-as-you-go billing ဖြင့် စတင်၍ ထုတ်လုပ်မှုအတွက်သာ PTU ပြောင်းလဲပါ
- ဖြန့်ဖြူးမည့်အရင် `azd provision --preview` ဖြင့် ကုန်ကျစရိတ် ခန့်မှန်းပါ
- auto-scaling ကို ဖွင့်ထားပါ: အသုံးပြုမှုအပေါ်မူတည်၍ ဈေးတန်သည့် ပေးချေမှု

**ကုန်ကျစရိတ် စောင့်ကြည့်ခြင်း:**
```bash
# ခန့်မှန်းထားသော လစဉ်ကုန်ကျစရိတ်များကို စစ်ဆေးပါ
azd provision --preview

# Azure Portal တွင် အမှန်တကယ် ဖြစ်ပေါ်နေသော ကုန်ကျစရိတ်များကို ထိန်းကြပ်ပါ
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ အခန်း ၃: ပုံမှန်ပြင်ဆင်ခြင်း နှင့် အတည်ပြုခြင်း
**လိုအပ်ချက်များ**: အခန်း ၁ ပြီးမြောက်ပြီးသား  
**ကြာမြင့်ချိန်**: ၄၅-၆၀ မိနစ်  
**ခက်ခဲမှု**: ⭐⭐

#### သင်ယူရမည့်အရာများ
- ပတ်ဝန်းကျင် configuración နှင့် စီမံခန့်ခွဲမှု
- အတည်ပြုခြင်းနှင့် လုံခြုံရေး လိုက်နာရေး စံနမူနာများ
- အရင်းအမြစ် နာမည်ဒဏ်နှင့် စည်းမျဉ်းသတ်မှတ်ခြင်း

#### သင်ယူမှု အရင်းအမြစ်များ
- **📖 ပုံမှန်ပြင်ဆင်ခြင်း**: [configuration လမ်းညွှန်](docs/chapter-03-configuration/configuration.md) - ပတ်ဝန်းကျင် စီမံခြင်း
- **🔐 လုံခြုံရေး**: [အတည်ပြုခြင်း စနစ်များနှင့် managed identity](docs/chapter-03-configuration/authsecurity.md) - authentication ပုံစံများ
- **📝 နမူနာများ**: [ဒေတာဘေ့(စ်) အက်ပ် နမူနာ](examples/database-app/README.md) - AZD ဒေတာဘေ့(စ်) နမူနာများ

#### လက်တွေ့လေ့ကျင့်ခန်းများ
- အများစု environments (dev, staging, prod) များတွင် ပုံမှန်ပြင်ဆင်ခြင်း
- managed identity authentication ပြုလုပ်ခြင်း
- environment အလိုက် ညှိနှိုင်းထားသော configuration များ အသုံးပြုခြင်း

**💡 အခန်းရလဒ်**: environment များစွာကို တိကျစွာစီမံခန့်ခွဲပြီး တူညီသော authentication နှင့် လုံခြုံရေးထားရှိနိုင်ခြင်း

---

### 🏗️ အခန်း ၄: Infrastructure as Code နှင့် Deployment
**လိုအပ်ချက်များ**: အခန်း ၁-၃ ပြီးမြောက်ပြီးသား  
**ကြာမြင့်ချိန်**: ၁-၁.၅ နာရီ  
**ခက်ခဲမှု**: ⭐⭐⭐

#### သင်ယူရမည့်အရာများ
- မြင့်မားသော deployment ပုံစံများ
- Bicep ဖြင့် Infrastructure as Code အသုံးပြုခြင်း
- Resource provisioning မဟာဗျူဟာများ

#### သင်ယူမှု အရင်းအမြစ်များ
- **📖 Deployment**: [Deployment လမ်းညွှန်](docs/chapter-04-infrastructure/deployment-guide.md) - လုပ်ငန်းစဉ်အပြည့်အစုံ
- **🏗️ Provisioning**: [Provisioning Resources](docs/chapter-04-infrastructure/provisioning.md) - Azure resource စီမံခြင်း
- **📝 နမူနာများ**: [Container App နမူနာ](../../examples/container-app) - container လုပ်ဆောင်ချက် ဖြန့်ဖြူးမှုများ

#### လက်တွေ့လေ့ကျင့်ခန်းများ
- ကိုယ်ပိုင် Bicep template များ ဖန်တီးခြင်း
- Multi-service application များ ဖြန့်ဖြူးခြင်း
- blue-green deployment မဟာဗျူဟာများ ဆောင်ရွက်ခြင်း

**💡 အခန်းရလဒ်**: စိတ်ရှည်ညှိနှိုင်းထားသော multi-service application များကို ကိုယ်ပိုင် infrastructure template များဖြင့် ဖြန့်ဖြူးနိုင်ခြင်း

---


### 🎯 အခန်း ၅: အများ agents AI ဖြေရှင်းချက်များ (အဆင့်မြင့်)
**လိုအပ်ချက်များ**: အခန်း ၁-၂ ပြီးမြောက်ထားပြီး  
**ကြာမြင့်ချိန်**: ၂-၃ နာရီ  
**ခက်ခဲမှု**: ⭐⭐⭐⭐

#### သင်ယူရမည့်အကြောင်းအရာများ
- အများ agents ဖွဲ့စည်းပုံ ပုံစံများ
- Agent များကို စုပေါင်းညှိနှိုင်းခြင်း
- ထုတ်လုပ်မှုအဆင့် AI ထည့်သွင်းရေးဆွဲခြင်း

#### သင်ယူရေးအရင်းအမြစ်များ
- **🤖 အထူးပရောဂျက်**: [Retail Multi-Agent Solution](examples/retail-scenario.md) - အပြည့်အစုံအကောင်အထည်ဖော်ခြင်း
- **🛠️ ARM Templates**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - တစ်ချက်နှိပ်ပြီး ထည့်သွင်းခြင်း
- **📖 ဖွဲ့စည်းပုံ**: [Multi-agent coordination patterns](docs/chapter-06-pre-deployment/coordination-patterns.md) - ပုံစံများ

#### လက်တွေ့လေ့ကျင့်မှုများ
```bash
# စုံလင်တဲ့ လက်လီ ပြောင်းလဲမှု အေးဂျင့်ဖြေရှင်းချက်ကို တပ်ဆင်ပါ
cd examples/retail-multiagent-arm-template
./deploy.sh

# အေးဂျင့် ဖွဲ့စည်းမှုများကို လေ့လာပါ
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 အခန်းရလဒ်**: Customer နှင့် Inventory agent များပါရှိသော ထုတ်လုပ်မှုအဆင့် multi-agent AI ဖြေရှင်းချက်တစ်ခု ထည့်သွင်းပြီး စီမံခန့်ခွဲပါ

---

### 🔍 အခန်း ၆: ထည့်သွင်းမှုမတိုင်မီ စစ်ဆေးခြင်းနှင့်အစီအစဉ် ဆွဲခြင်း
**လိုအပ်ချက်များ**: အခန်း ၄ ပြီးမြောက်ထားပြီး  
**ကြာမြင့်ချိန်**: ၁ နာရီ  
**ခက်ခဲမှု**: ⭐⭐

#### သင်ယူရမည့်အကြောင်းအရာများ
- စွမ်းဆောင်ရည်အစီအစဉ်ဆွဲခြင်းနှင့် ရင်းမြစ် စစ်ဆေးခြင်း
- SKU ရွေးချယ်မှု မဟာဗျူဟာများ
- မတိုင်ခင်စစ်ဆေးမှုများနှင့် အလိုအလျောက်လုပ်ဆောင်မှုများ

#### သင်ယူရေးအရင်းအမြစ်များ
- **📊 အစီအစဉ်ဆွဲခြင်း**: [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) - ရင်းမြစ် စစ်ဆေးခြင်း
- **💰 ရွေးချယ်မှု**: [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) - ကုန်ကျစရိတ်ထိရောက်စွာ ရွေးချယ်ခြင်း
- **✅ စစ်ဆေးခြင်း**: [Pre-flight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) - အလိုအလျောက် စာသားများ

#### လက်တွေ့လေ့ကျင့်မှုများ
- စွမ်းဆောင်ရည် စစ်ဆေးမှုများ ပြေးဆွဲပါ
- ကုန်ကျစရိတ်ထိရောက်ရန် SKU ရွေးချယ်မှုများ တိုးတက်အောင်လုပ်ပါ
- အလိုအလျောက် မတိုင်ခင် စစ်ဆေးမှုများ အကောင်အထည်ဖော်ပါ

**💡 အခန်းရလဒ်**: ထည့်သွင်းမှုမတိုင်မှီ စစ်ဆေးပြီး တိုးတက်အောင်လုပ်ဆောင်ပါ

---

### 🚨 အခန်း ၇: ပြဿနာဖြေရှင်းခြင်းနှင့် အမှားတည်ပြင်ခြင်း
**လိုအပ်ချက်များ**: မည်သည့် ထည့်သွင်းမှု အခန်းမှ မဖြတ်ထားခြင်းကို မလိုအပ်ပါ  
**ကြာမြင့်ချိန်**: ၁-၁.၅ နာရီ  
**ခက်ခဲမှု**: ⭐⭐

#### သင်ယူရမည့်အကြောင်းအရာများ
- စနစ်တကျ အမှားတည်ဖြေရှင်းနည်းများ
- ရှားရောက်လေ့ရှိသော ပြဿနာများနှင့် ဖြေရှင်းနည်းများ
- AI ဆိုင်ရာ အထူးပြဿနာများ ဖြေရှင်းခြင်း

#### သင်ယူရေးအရင်းအမြစ်များ
- **🔧 ရှားပါး ပြဿနာများ**: [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) - အကြိမ်ကြိမ် မေးမြန်းသောမေးခွန်းများနှင့် ဖြေရှင်းချက်များ
- **🕵️ အမှားပြင်ခြင်း**: [Debugging Guide](docs/chapter-07-troubleshooting/debugging.md) - အဆင့်ဆင့် ဝေါဟာရများ
- **🤖 AI ပြဿနာများ**: [AI-Specific Troubleshooting](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AI ဝန်ဆောင်မှု ပြဿနာများ

#### လက်တွေ့လေ့ကျင့်မှုများ
- ထည့်သွင်းမှု မအောင်မြင်မှုများ ရှာဖွေသတ်မှတ်ပါ
- စိစစ်ရေး စာရင်းများ ပြင်ဆင်ရေး ပြဿနာများ ဖြေရှင်းပါ
- AI ဝန်ဆောင်မှု ချိတ်ဆက်မှု အမှားပြင်ခြင်း လုပ်ဆောင်ပါ

**💡 အခန်းရလဒ်**: မရှိမဖြစ် သိရှိသူအဖြစ် တစ်ကိုယ်တော် ပြဿနာများ ရှာဖွေ ဖြေရှင်းနိုင်ရေး

---

### 🏢 အခန်း ၈: ထုတ်လုပ်မှုနှင့် စီးပွားရေး ပုံစံများ
**လိုအပ်ချက်များ**: အခန်း ၁-၄ ပြီးမြောက်ထားပြီး  
**ကြာမြင့်ချိန်**: ၂-၃ နာရီ  
**ခက်ခဲမှု**: ⭐⭐⭐⭐

#### သင်ယူရမည့်အကြောင်းအရာများ
- ထုတ်လုပ်မှု ထည့်သွင်းရေး မဟာဗျူဟာများ
- စီးပွားရေး လုံခြုံရေး ပုံစံများ
- စောင့်ကြည့်ခြင်းနှင့် ကုန်ကျစရိတ် တိုးတက်အောင်လုပ်ခြင်း

#### သင်ယူရေးအရင်းအမြစ်များ
- **🏭 ထုတ်လုပ်မှု**: [Production AI Best Practices](docs/chapter-08-production/production-ai-practices.md) - စီးပွားရေးပုံစံများ
- **📝 ဥပမာများ**: [Microservices Example](../../examples/microservices) - ချောင်တက်ဖွဲ့စည်းပုံများ
- **📊 စောင့်ကြည့်မှု**: [Application Insights integration](docs/chapter-06-pre-deployment/application-insights.md) - စောင့်ကြည့်ခြင်း

#### လက်တွေ့လေ့ကျင့်မှုများ
- စီးပွားရေး လုံခြုံရေး ပုံစံများ အကောင်အထည်ဖော်ပါ
- စုံလင်စွာ စောင့်ကြည့်မှု စနစ် တပ်ဆင်ပါ
- မှန်ကန်သော အုပ်ချုပ်မှုဖြင့် ထုတ်လုပ်မှု စီမံချက်၌ ထည့်သွင်းပါ

**💡 အခန်းရလဒ်**: စီးပွားရေး မှန်ကန်စွာ အသုံးပြုနိုင်သော အက်ပ်လီကေးရှင်းများ ထုတ်လုပ်မှုအဆင့်တွင် ထည့်သွင်းနိုင်သည်

---

## 🎓 ပို့ချမှုပြုလုပ်ခန်း နှင့် လက်တွေ့လာကျင့်ခန်းများ အနှစ်ချုပ်

> **⚠️ ပို့ချမှုပြုလုပ်ခန်း အခြေအနေ: တိုးတက်မှုဆက်လက်ဖြစ်ပေါ်နေသည်**  
> ပို့ချပစ္စည်းများကို လက်ရှိ ဖန်တီးဆန်းစစ် အဆင့်တွင် ရှိပြီး အခြေခံ module များ လုပ်ဆောင်နိုင်သော်လည်း အဆင့်မြင့် အပိုင်းများ အချို့ မပြီးပြည့်စုံသေးပါ။ စီမံကိန်းကို ပြီးစီးရန် ကြိုးပမ်း ဆောင်ရွက်နေပါသည်။ [အဆင့်ရှိတိုးတက်မှု →](workshop/README.md)

### အပြန်အလှန် လေ့လာနိုင်သော ပို့ချမှုပစ္စည်းများ
**ဘရောက်ဇာ အခြေပြု ကိရိယာများနှင့် လမ်းညွှန် လေ့ကျင့်ခန်းဖြင့် စုံလင်သော လက်တွေ့သင်ယူမှု**

ယခု ပို့ချမှုပစ္စည်းများသည် အထက်ဖော်ပြထားသော အခန်းအစီအစဉ်နှင့် ကိုက်ညီသော စနစ်တကျဖြင့် လေ့လာနိုင်မယ့် အတွေ့အကြုံကို ပံ့ပိုးပေးပါသည်။ ပို့ချမှုပြုလုပ်ခန်းသည် ကိုယ်တိုင် သင်ယူမှု နှင့် ဆရာမှကြီးမှ လမ်းညွှန်မှု နှစ်မျိုးစလုံးအတွက် ဒီဇိုင်းထုတ်ထားသည်။

#### 🛠️ ပို့ချမှုပုဂ္ဂိုလ်ဆိုင်ရာ လက္ခဏာများ
- **ဘရောက်ဇာ အခြေပြု မျက်နှာပြင်**: MkDocs ဖြင့် ဖန်တီးထားပြီး ရှာဖွေ၊ ကူးယူနှင့် အပြင်အဆင်များပါဝင်သော ကုန်ကျစရိတ်
- **GitHub Codespaces ပေါင်းစည်းခြင်း**: တစ်ချက်နှိပ်ထားခြင်းဖြင့် ဖွံ့ဖြိုးရေးပတ်ဝန်းကျင် တပ်ဆင်ခြင်း
- **စနစ်တကျ သင်ယူမှုလမ်းကြောင်း**: ၈ module မှ လမ်းညွှန်ချက်များ (စုစုပေါင်း ၃-၄ နာရီ)
- **တိုးတက်မှုဆက်တိုက်နည်းလမ်း**: မိတ်ဆက်ခြင်း → ရွေးချယ်ခြင်း → အတည်ပြုခြင်း → ဖျက်ထုတ်ခြင်း → ပြုပြင်ဆင်ခြင်း → ကိုယ်ပိုင်ပြင်ဆင်ခြင်း → ရပ်တန့်ခြင်း → အဆုံးသတ်
- **အပြန်အလှန် DevContainer ပတ်ဝန်းကျင်**: ကြိုတင်တပ်ဆင်ထားသော ကိရိယာများနှင့် လိုအပ်ချက်များ

#### 📚 ပို့ချမှုပုဂ္ဂိုလ် ပုံစံဖွဲ့စည်းမှု
ပို့ချမှုပုဂ္ဂိုလ်သည် **၈-module တိုးတက်မှုဆက်တိုက်နည်းလမ်း** ဖြင့် သင်ယူသူကို ရှာဖွေမှ ထည့်သွင်းခြင်း အထိ ခရီးဆက်ရမည့် နည်းလမ်းဖြစ်သည်။

| Module | ခေါင်းစဉ် | သင်လုပ်ဆောင်မယ့် အရာ | ကြာမြင့်ချိန် |
|--------|-------|----------------|----------|
| **0. မိတ်ဆက်ခြင်း** | ပို့ချမှုပြုလုပ်ခန်း အနှစ်ချုပ် | သင်ယူရန် ရည်ရွယ်ချက်များ၊ လိုအပ်ချက်များနှင့် ပို့ချမှုပုဂ္ဂိုလ် ဖွဲ့စည်းမှုကို နားလည်ရန် | 15 မိနစ် |
| **1. ရွေးချယ်ခြင်း** | ရည်ညွှန်းပုံစံ ရှာဖွေခြင်း | AZD ရဲ့ template များကို လေ့လာပြီး သင့်ကိစ္စအတွက် ကောင်းမွန်သော AI template ကို ရွေးချယ်ပါ | 20 မိနစ် |
| **2. အတည်ပြုခြင်း** | ထည့်သွင်းပြီး အတည်ပြုခြင်း | `azd up` ဖြင့် template ကို ထည့်သွင်းပြီး အခြေခံပတ္တပိုးများ လည်ပတ်ကြောင်း အတည်ပြုပါ | 30 မိနစ် |
| **3. ဖျက်ထုတ်ခြင်း** | ဖွဲ့စည်းပုံနားလည်မှု | GitHub Copilot ကို အသုံးပြု၍ template ဖွဲ့စည်းပုံ၊ Bicep ဖိုင်များ နဲ့ ကုဒ် စုပုံဖော်ပြမှုကို ရှာဖွေပါ | 30 မိနစ် |
| **4. ပြုပြင်ချိန်ညှိခြင်း** | azure.yaml မှနက်ရှိုင်းစိစစ်ခြင်း | `azure.yaml` ထဲရှိ ကိရိယာများ၊ lifecycle hooks နှင့် ပတ်ဝန်းကျင် မတည့် မတက်အတွက် ထိန်းချုပ်မှုများ ကျွမ်းကျင်ပါ | 30 မိနစ် |
| **5. ကိုယ်ပိုင်ပြင်ဆင်ခြင်း** | မိတ်ဆက်အားဖြင့် တိုးတက်စေခြင်း | AI ရှာဖွေမှု၊ လမ်းကြောင်းခြေရေး၊ သုံးသပ်ခြင်း တွေကို ဖွင့်လှစ်ပြီး သင့်ကိစ္စအလိုက် ပြင်ဆင်ပါ | 45 မိနစ် |
| **6. ရပ်တန့်ခြင်း** | သန့်ရှင်းခြင်း | `azd down --purge` အသုံးပြုပြီး ရင်းမြစ်များကို လုံခြုံစွာ ဖယ်ရှားပါ | 15 မိနစ် |
| **7. အဆုံးသတ်** | နောက်တစ်ဆင့်များ | အောင်မြင်မှုများ၊ အဓိက သဘောထားများကို ပြန်လည်ဆန်းစစ်ပြီး သင့်လေ့လာမှု ခရီးတစ်လျှောက် ဆက်လက်လုပ်ဆောင်ပါ | 15 မိနစ် |

**ပို့ချမှုပေါ်လစီ ဖလားအFlow:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 ပို့ချမှုပြုလုပ်ခန်း စတင်ခြင်း
```bash
# ရွေးချယ်မှု ၁: GitHub Codespaces (အကြံပြု)
# repository တွင် "Code" → "Create codespace on main" ကိုနှိပ်ပါ

# ရွေးချယ်မှု ၂: ဒေသခံ ဖွံ့ဖြိုးတိုးတက်ရေး
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# workshop/README.md ထဲရှိ ဆက်တင်များအား လိုက်နာပါ။
```

#### 🎯 ပို့ချမှုပြုလုပ်ခန်း သင်ယူရလဒ်များ
ပို့ချမှုပြုလုပ်ချိန် သာမန်ရယူသူများသည်:
- **ထုတ်လုပ်မှုပုံစံ AI အက်ပလီကေးရှင်းများ ထည့်သွင်းရန်**: Microsoft Foundry ဝန်ဆောင်မှုများနှင့် AZD အသုံးပြုပါ
- **အများ agents ဖွဲ့စည်းမှုများ ကျွမ်းကျင်ရန်**: ညှိနှိုင်းပြီး AI agent ဖြေရှင်းချက်များ အကောင်အထည်ဖော်ပါ
- **လုံခြုံရေး သဘောတရားများ အကောင်အထည်ဖော်ရန်**: အတည်ပြုရေးနှင့် အက်ဆက်ကန့်သတ်မှု ထိန်းချုပ်ချက်များ ပြုလုပ်ပါ
- **အရွယ်အစား တိုးတက်စေရန်**: ကုန်ကျစရိတ်ထိရောက်ပြီး မြန်ဆန်ခြင်းများဆောင်ရွက်ပါ
- **ထည့်သွင်းမှု ပြဿနာများကို ဖြေရှင်းပေးရန်**: သာမန် ပြဿနာများကို အလိုအလျောက်ဖြေရှင်းပါ

#### 📖 ပို့ချမှုပြုလုပ်ခန်း အရင်းအမြစ်များ
- **🎥 အပြန်အလှန် လမ်းညွှန်**: [Workshop Materials](workshop/README.md) - ဘရောက်ဇာအခြေပြု သင်ယူမှု ပတ်ဝန်းကျင်
- **📋 မော်ဂျူးအလိုက် လမ်းညွှန်ချက်များ**:
  - [0. မိတ်ဆက်ခြင်း](workshop/docs/instructions/0-Introduction.md) - ပို့ချမှုပြုလုပ်ခန်း အနှစ်ချုပ်နှင့် ရည်ရွယ်ချက်များ
  - [1. ရွေးချယ်ခြင်း](workshop/docs/instructions/1-Select-AI-Template.md) - AI template များရှာဖွေခြင်းနှင့် ရွေးချယ်ခြင်း
  - [2. အတည်ပြုခြင်း](workshop/docs/instructions/2-Validate-AI-Template.md) - Template ထည့်သွင်းပြီး အတည်ပြုခြင်း
  - [3. ဖျက်ထုတ်ခြင်း](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Template ဖွဲ့စည်းမှု ရှာဖွေခြင်း
  - [4. ပြုပြင်ချိန်ညှိခြင်း](workshop/docs/instructions/4-Configure-AI-Template.md) - azure.yaml ကျွမ်းကျင်မှု
  - [5. ကိုယ်ပိုင်ပြင်ဆင်ခြင်း](workshop/docs/instructions/5-Customize-AI-Template.md) - သင့်ကိစ္စအတွက် ပြင်ဆင်ခြင်း
  - [6. ရပ်တန့်ခြင်း](workshop/docs/instructions/6-Teardown-Infrastructure.md) - ရင်းမြစ်များ သန့်ရှင်းခြင်း
  - [7. အဆုံးသတ်](workshop/docs/instructions/7-Wrap-up.md) - ပြန်လည်သုံးသပ်ခြင်းနှင့် နောက်တစ်ဆင့်များ
- **🛠️ AI ပို့ချပွဲစာကြည့်တိုက်**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI အခြေပြု လေ့ကျင့်ခန်းများ
- **💡 အလျင်အမြန် စတင်ရန်**: [Workshop Setup Guide](workshop/README.md#quick-start) - ပတ်ဝန်းကျင်တပ်ဆင်ခြင်း

**သင့်တော်သည်**: ကော်ပိုရေးရှင်း လေ့ကျင့်မှုများ၊ တက္ကသိုလ်သင်တန်းများ၊ ကိုယ်တိုင် သင်ယူမှု နှင့် ဖွံ့ဖြိုးရေးသူ bootcamps များ။

---

## 📖 နက်ရှိုင်းသော လေ့လာမှု: AZD အင်အားများ

အခြေခံမှ ကျော်လွန်၍ AZD သည် ထုတ်လုပ်မှု ထည့်သွင်းချက်များအတွက် အင်အားပြင်းသော အထူးအင်အားများ ပေးသည်။

- **Template အခြေပြု ထည့်သွင်းမှုများ** - ပုံမှန် application ပုံစံများအတွက် ကြိုတင်ပြင်ဆင်ထားသော template များ အသုံးပြုခြင်း
- **Infrastructure as Code** - Bicep သို့မဟုတ် Terraform အသုံးပြုပြီး Azure ရင်းမြစ်များ စီမံခန့်ခွဲခြင်း  
- **ပေါင်းစည်းထားသော လုပ်ငန်းစဉ်များ** - အက်ပလီကေးရှင်းများကို ချောမွေ့စွာ ပြုလုပ်၊ ထည့်သွင်းနှင့် စောင့်ကြည့်ခြင်း
- **Developer-friendly** - ဖွံ့ဖြိုးသူ အကျိုးတူရပ်တည်မှုနှင့် အတွေ့အကြုံအတွက် အကောင်းမြင့်ဆုံး ပုံစံ

### **AZD + Microsoft Foundry: AI ထည့်သွင်းရေးအတွက် အကောင်းဆုံး လမ်းညွှန်**

**အတွက် AZD ရွေးချယ်ရခြင်း?** AZD သည် AI ဖွံ့ဖြိုးသူများ ကြုံတွေ့ရသော အဓိက စိန်ခေါ်မှုများကို ဖြေရှင်းပေးသည်။

- **AI အသင့် Template များ** - Microsoft Foundry Models, Azure AI ဝန်ဆောင်မှုများနှင့် ML အလုပ်များအတွက် ကြိုတင်ပြင်ဆင်ထားသော template များ
- **လုံခြုံသော AI ထည့်သွင်းမှုများ** - AI ဝန်ဆောင်မှုများအတွက် ထိန်းချုပ်မှု ပုံစံများ၊ API key များ နှင့် မော်ဒယ် endpoint များပါရှိသည့် security pattern များ  
- **ထုတ်လုပ်မှု AI pattern များ** - ကျယ်ပြန့်စွာ မျှဝေသက်သာစေသော AI application ထည့်သွင်းရေး အကောင်းဆုံးအတွေ့အကြုံများ
- **မွမ်းမံအပြီး AI လုပ်ငန်းစဉ်များ** - မော်ဒယ်ဖွံ့ဖြိုးမှုမှ ထုတ်လုပ်မှုထိ စောင့်ကြည့်မှုနှင့်အတူ စနစ်တကျ လုပ်ဆောင်ခြင်း
- **ကုန်ကျစရိတ် ထိရောက်မှု** - AI အလုပ်များအတွက် စမတ်သော ရင်းမြစ် ခွဲဝေပေးမှုနှင့် ဆွဲယူမှု မဟာဗျူဟာများ
- **Microsoft Foundry ပေါင်းစည်းမှု** - Microsoft Foundry မော်ဒယ် ကတ်လော့ဂ်လုပ်ရာ နှင့် endpoint များသို့ ချိတ်ဆက်မှု ချောမွေ့စွာ ဆောင်ရွက်ခြင်း

---

## 🎯 Template များနှင့် ဥပမာစာကြည့်တိုက်

### အထူးပြု: Microsoft Foundry Template များ
**AI application များ ထည့်သွင်းမည့်သူများအတွက် ဤနေရာမှ စတင်ပါ။**

> **မှတ်ချက်:** ဤ template များတွင် AI ပုံစံအမျိုးမျိုးကို ပြသထားပါသည်။ တချို့သည် ပြင်ပ Azure Samples ဖြစ်ပြီး၊ တချို့ကတော့ ဒေသတွင်း အကောင်အထည်ဖော်မှုများဖြစ်သည်။

| Template | အခန်း | ခက်ခဲမှု | ဝန်ဆောင်မှုများ | အမျိုးအစား |
|----------|---------|------------|----------|------|
| [**AI စကားပြော စတင်အသုံးပြုခြင်း**](https://github.com/Azure-Samples/get-started-with-ai-chat) | အခန်း ၂ | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | ပြင်ပ |
| [**AI agent များစတင်အသုံးပြုခြင်း**](https://github.com/Azure-Samples/get-started-with-ai-agents) | အခန်း ၂ | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| ပြင်ပ |
| [**Azure Search + OpenAI ပြသချက်**](https://github.com/Azure-Samples/azure-search-openai-demo) | အခန်း ၂ | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | ပြင်ပ |
| [**OpenAI Chat အက်ပ်စတင်ဖို့လမ်းညွှန်**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | အခန်း ၂ | ⭐ | AzureOpenAI + Container Apps + Application Insights | ပြင်ပ |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | အခန်း ၅ | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | ပြင်ပ |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | အခန်း ၈ | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | ပြင်ပ |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | အခန်း ၅ | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **ဒေသတွင်း** |

### အထူးပြု: သင်ယူမှု အပြည့်အစုံ ဖြစ်စဉ်များ
**ထုတ်လုပ်မှုအဆင့် application template များကို သင်ယူခန်းများနှင့် ချုပ်ဆိုထားသည်**

| Template | သင်ယူခန်း | ခက်ခဲမှု | အဓိက သင်ယူချက် |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | အခန်း ၂ | ⭐ | အခြေခံ AI ထည့်သွင်းရေး ပုံစံများ |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | အခန်း ၂ | ⭐⭐ | Azure AI Search ဖြင့် RAG အကောင်အထည်ဖော်ခြင်း |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | အခန်း ၄ | ⭐⭐ | စာရွက်စာတမ်း အတတ်ပညာ ပေါင်းစည်းမှု |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | အခန်း ၅ | ⭐⭐⭐ | Agent structure နှင့် function call များ |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | အခန်း ၈ | ⭐⭐⭐ | စီးပွားရေး AI ညှိနှိုင်းမှု |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | အခန်း ၅ | ⭐⭐⭐⭐ | Customer နှင့် Inventory agent များပါ၀င်သော Multi-agent ဖွဲ့စည်းမှု |

### ကျယ်ပြန့်သော ဥပမာအမျိုးအစားအလိုက် သင်ယူခြင်း

> **📌 ဒေသတွင်း နှင့် ပြင်ပ ဥပမာများ:**  
> **ဒေသတွင်း ဥပမာများ** (ဤ repository ထဲတွင်) = ချက်ချက်အသုံးပြုနိုင်သည်  
> **ပြင်ပ ဥပမာများ** (Azure Samples) = ရထား repositories မှ ကလုန်လုပ်ရမည်

#### ဒေသတွင်း ဥပမာများ (ချက်ချင်းအသုံးပြုနိုင်သည်)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - ထုတ်လုပ်မှုအဆင့် ပြည့်စုံသော အကောင်အထည်ဖော်မှုနှင့် ARM template များပါဝင်သည်
  - Multi-agent ဖွဲ့စည်းမှု (Customer + Inventory agent များ)
  - စုံလင်သော စောင့်ကြည့်ခြင်း နှင့် သုံးသပ်ခြင်း
  - ARM template ဖြင့် တစ်ချက်နှိပ်ပြီး ထည့်သွင်းနိုင်မှု

#### ဒေသတွင်း ဥပမာများ - Container Applications (အခန်း ၂-၅)
**ဤ repository တွင် စုံလင်သော container ထည့်သွင်းရေး ဥပမာများရှိသည်။**

- [**Container App Examples**](examples/container-app/README.md) - containerized deployments အတွက် ပြည့်စုံသော လမ်းညွှန်ချက်
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - အခြေခံ REST API နှင့် scale-to-zero ဖြင့်
  - [Microservices Architecture](../../examples/container-app/microservices) - ထုတ်လုပ်ရန် အသင့် multi-service deployment
  - ရိုးရှင်းစွာ စတင်ခြင်း၊ ထုတ်လုပ်ခြင်း၊ နှင့် ကျွမ်းကျင်သော deployment များအတွက် ပုံစံများ
  - စောင့်ကြည့်ခြင်း၊ လုံခြုံရေး၊ နှင့် ကုန်ကျစရိတ် တိုးတက်မှု လမ်းညွှန်ချက်များ

#### အပြင်အဆင် ဥပမာများ - ရိုးရှင်းသော အပလီကေးရှင်းများ (အခန်း ၁-၂)
**စိတ်လှုပ်ရှားဖန်တီးရန် ဒီ Azure Samples repositories များကို ကလုံလုပ်ပါ:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - အခြေခံ deployment ပုံစံများ
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Static content deployment
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API deployment

#### အပြင်အဆင် ဥပမာများ - ဒေတာဘေ့စ် ပေါင်းစပ်မှု (အခန်း ၃-၄)  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - ဒေတာဘေ့စ် ဆက်သွယ်မှု ပုံစံများ
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverless data workflow

#### အပြင်အဆင် ဥပမာများ - ကြွယ်ဝသောပုံစံများ (အခန်း ၄-၈)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - Multi-service architectures
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - နောက်ခံ ပြုလုပ်မှု  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - ထုတ်လုပ်ရန် အသင့် ML ပုံစံများ

### အပြင်အဆင် တမ်းပလိတ် စုစည်းမှုများ
- [**အတည်ပြု AZD Template Gallery**](https://azure.github.io/awesome-azd/) - အတည်ပြု နှင့် အသိုင်းအဝိုင်းတမ်းပလိတ်များ စုစည်းမှု
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft သင်ကြားမှုတမ်းပလိတ် စာတမ်း
- [**Examples Directory**](examples/README.md) - အသေချာ ရှင်းလင်းချက်များဖြင့် ဒေသဆိုင်ရာ သင်ယူမှု ဥပမာများ

---

## 📚 သင်ယူမှု အရင်းအမြစ်များနှင့် ကိုးကားခေါင်းစဉ်များ

### ရိုးရှင်းသော ကိုးကားချက်များ
- [**Command Cheat Sheet**](resources/cheat-sheet.md) - အရေးကြီးသော azd command များကို အခန်းများအလိုက် စီစဉ်ထားသည်
- [**Glossary**](resources/glossary.md) - Azure နှင့် azd အသုံးအနှုန်း
- [**FAQ**](resources/faq.md) - သင်ယူရေး အခန်းများအလိုက် မေးခွန်းများ
- [**Study Guide**](resources/study-guide.md) - ကျယ်ပြန့်သော လေ့ကျင့်ခန်းများ

### လက်တွေ့ အလုပ်ရုံဆွေးနွေးပွဲများ
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - သင်၏ AI ဖြေရှင်းချက်များကို AZD deploy လုပ်နိုင်စေရန် (၂-၃ နာရီ)
- [**Interactive Workshop**](workshop/README.md) - MkDocs နှင့် GitHub Codespaces ဖြင့် ၈ နေရာတည် ဦးတည် ကိန်းဂဏန်းများ
  - လိုက်နာသည် - မိတ်ဆက် → ရွေးချယ်ခြင်း → အတည်ပြုခြင်း → ခွဲခြမ်းစိတ်ဖြာခြင်း → ဖွဲ့စည်းမှု → စိတ်ကြိုက်ပြုပြင်ခြင်း → ပိတ်သိမ်းခြင်း → အနှိပ်ချုပ်

### အပြင် အလုပ်ရုံဆွေးနွေးပွဲများ
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

### သင့်စာရေးစက်အတွက် AI Agent ကျွမ်းကျင်မှုများ
- [**Microsoft Azure Skills on skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - Azure AI, Foundry, deployment, diagnostics, ကုန်ကျစရိတ် တိုးတက်မှု စသည့် အတွက် ၃၇ ခွင့်ပြု agent ကျွမ်းကျင်မှုများ။ GitHub Copilot, Cursor, Claude Code သို့မဟုတ် ထောက်ခံထားသော agent များတွင် ထည့်သွင်းပါ။
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 လျင်မြန်စွာ ပြဿနာဖြေရှင်းခြင်း လမ်းညွှန်

**အစအချို့သော အခြေခံ ပြဿနာများနှင့် ချက်ချင်း ဖြေရှင်းနည်းများ:**

<details>
<summary><strong>❌ "azd: command not found"</strong></summary>

```bash
# ပထမဦးစွာ AZD ကို ထည့်သွင်းပါ
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
# ရရှိနိုင်သော စာရင်းသွင်းချက်များကို စာရင်းပြုစုပါ
az account list --output table

# ပုံမှန် စာရင်းသွင်းချက်ကို သတ်မှတ်ပါ
az account set --subscription "<subscription-id-or-name>"

# AZD ပတ်ဝန်းကျင်အတွက် သတ်မှတ်ပါ
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# စစ်ဆေးပါ
az account show
```
</details>

<details>
<summary><strong>❌ "InsufficientQuota" or "Quota exceeded"</strong></summary>

```bash
# ကွဲပြားသော Azure ဒေသကို စမ်းသပ်ကြည့်ပါ
azd env set AZURE_LOCATION "westus2"
azd up

# သို့မဟုတ် ဖွံ့ဖြိုးတိုးတက်မှုတွင် ပိုသေးငယ်သော SKU များကို အသုံးပြုပါ
# infra/main.parameters.json ကို ပြင်ဆင်ပါ:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" fails halfway through</strong></summary>

```bash
# ရွေးချယ်မှု ၁: သန့်ရှင်းပြီး ပြန်လည်ကြိုးစားပါ
azd down --force --purge
azd up

# ရွေးချယ်မှု ၂: အင်ဖရာစနစ်ကိုသာ ပြင်ဆင်ပါ
azd provision

# ရွေးချယ်မှု ၃: အသေးစိတ်အခြေအနေကို စစ်ဆေးပါ
azd show

# ရွေးချယ်မှု ၄: Azure Monitor တွင် မှတ်တမ်းများကို စစ်ဆေးပါ
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Authentication failed" or "Token expired"</strong></summary>

```bash
# AZD အတွက် ပြန်လည်အတည်ပြုပါ
azd auth logout
azd auth login

# ရွေးချယ်စရာ: az အမိန့်များ အသုံးပြုလျှင် Azure CLI ကိုလည်း ပြန်လည်အသစ်ဖြစ်အောင်လုပ်ပါ
az logout
az login

# အတည်ပြုခြင်းကို စစ်ဆေးပါ
az account show
```
</details>

<details>
<summary><strong>❌ "Resource already exists" or naming conflicts</strong></summary>

```bash
# AZD သည် ထူးခြားသောအမည်များကို ထုတ်ထားပေးသော်လည်း၊ ရင်ဆိုင်မှုဖြစ်ပါက။
azd down --force --purge

# ထို့နောက် အသစ်သော ပတ်ဝန်းကျင်ဖြင့် ထပ်မံကြိုးစားပါ။
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Template deployment taking too long</strong></summary>

**ပုံမှန် စောင့်ဆိုင်းချိန်များ:**
- ရိုးရှင်းသော ဝက်ဘ် အက်ပ်: ၅-၁၀ မိနစ်
- ဒေတာဘေ့စ်ပါ အက်ပ်: ၁၀-၁၅ မိနစ်
- AI အပလီကေးရှင်းများ: ၁၅-၂၅ မိနစ် (OpenAI provisioning အနည်းငယ် နှေးကွေးသည်)

```bash
# တိုးတက်မှုကို စစ်ဆေးပါ
azd show

# ၃၀ မိနစ်ထက်ပိုကြာပြီး ရပ်ဆိုပါက Azure Portal ကို စစ်ဆေးပါ
azd monitor --overview
# မအောင်မြင်သော တပ်ဆင်မှုများကို ရှာဖွေပါ
```
</details>

<details>
<summary><strong>❌ "Permission denied" or "Forbidden"</strong></summary>

```bash
# သင့် Azure အခန်းကဏ္ဍကို စစ်ဆေးပါ
az role assignment list --assignee $(az account show --query user.name -o tsv)

# အနည်းဆုံး "Contributor" အခန်းကဏ္ဍ လိုအပ်ပါသည်
# သင့် Azure အုပ်ချုပ်သူထံ တွေ့ဆုံပြီး ခွင့်ပြုခွင့်များ မေတ္တာရပ်ခံပါ
# - Contributor (အရင်းအမြစ်များအတွက်)
# - User Access Administrator (အခန်းကဏ္ဍ ခန့်အပ်မှုများအတွက်)
```
</details>

<details>
<summary><strong>❌ Can't find deployed application URL</strong></summary>

```bash
# ဝန်ဆောင်မှုအချက်အလက်အားလုံးကို ပြပါ
azd show

# ဒါမှမဟုတ် Azure Portal ကို ဖွင့်ပါ
azd monitor

# အထူးဝန်ဆောင်မှုကို စစ်ဆေးပါ
azd env get-values
# *_URL များကို ရှာဖွေပါ
```
</details>

### 📚 ပြည့်စုံသော ပြဿနာဖြေရှင်း အရင်းအမြစ်များ

- **ရိုးရှင်းသော ပြဿနာလမ်းညွှန်:** [အသေးစိတ် ဖြေရှင်းချက်များ](docs/chapter-07-troubleshooting/common-issues.md)
- **AI အထူး ပြဿနာများ:** [AI ပြဿနာဖြေရှင်းခြင်း](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Debugging လမ်းညွှန်:** [နည်းလမ်းဆက်တိုက် အဆင့်ဆင့် Debugging](docs/chapter-07-troubleshooting/debugging.md)
- **အကူအညီ ရယူရန်:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 သင်တန်းပြီးမြောက်ခြင်းနှင့် အတည်ပြုလက်မှတ်

### ရောနှောမှု တိုင်းတာခြင်း
သင်ယူရေးရာအတွက် အခန်းတိုင်း အတိုးအကျယ် ကို ကြည့်ရန်:

- [ ] **အခန်း ၁**: အခြေခံအဆောက်အအုံနှင့် အသက်သာစတင်ခြင်း ✅
- [ ] **အခန်း ၂**: AI-ဥပမာ ရေးသားမှု ✅  
- [ ] **အခန်း ၃**: ဖွဲ့စည်းမှုနှင့် မှတ်ပုံတင်ခြင်း ✅
- [ ] **အခန်း ၄**: Infrastructure as Code & Deployment ✅
- [ ] **အခန်း ၅**: Multi-Agent AI ဖြေရှင်းချက်များ ✅
- [ ] **အခန်း ၆**: Pre-Deployment စစ်ဆေးခြင်းနှင့် စီမံကိန်း ✅
- [ ] **အခန်း ၇**: ပြဿနာဖြေရှင်းခြင်းနှင့် Debugging ✅
- [ ] **အခန်း ၈**: ထုတ်လုပ်ရေးနှင့် စီးပွားရေးပုံစံများ ✅

### သင်ယူမှု အတည်ပြုခြင်း
အခန်းတစ်ခုစီပြီးပါက သင်၏ သိမြင်မှုကို အတည်ပြုပါ:
1. **လက်တွေ့လေ့ကျင့်ခန်း**: အခန်း၏ လက်တွေ့ deployment ကိုပြီးစီးသည်
2. **အသိပညာ စစ်ဆေးခြင်း**: အခန်းအတွက် FAQ အပိုင်းကို ပြန်လည်သုံးသပ်သည်
3. **အသိုင်းအဝိုင်း ဆွေးနွေးမှု**: Azure Discord တွင် သင်၏ အတွေ့အကြုံ မျှဝေပါ
4. **နောက်တစ်ခုသော အခန်း**: နောက်တစ်ခြားပြင်းထန်သော အဆင့်သို့ ရွှေ့ပါ

### သင်တန်းပြီးမြောက်ခြင်း၏ အကျိုးအမြတ်များ
အခန်းအားလုံးကိုပြီးမြောက်၏အခါ:
- **ထုတ်လုပ်ရေး အတွေ့အကြုံ**: Azure သို့ အမှန်တကယ် AI အပလီကေးရှင်းများ deploy ပြုလုပ်ထားခြင်း
- **ဝန်ထမ်း ကျွမ်းကျင်မှုများ**: စီးပွားရေးအဆင့် deployment အရည်အချင်းများ  
- **အသိုင်းအဝိုင်း အသိအမှတ်ပြုခြင်း**: Azure developer အသိုင်းအဝိုင်း၏ တက်ကြွသော အဖွဲ့ဝင်
- **အလုပ်အကိုင် တိုးတက်မှု**: တောင်းဆိုထားသော AZD နှင့် AI deployment ကျွမ်းကျင်မှုများ

---

## 🤝 အသိုင်းအဝိုင်းနှင့် အထောက်အပံ့

### အကူအညီ ရယူခြင်းနှင့် အထောက်အပံ့
- **နည်းပညာ ပြဿနာများ**: [အမှားများတင်ပြရန်နှင့် လိုအပ်ချက်များတောင်းဆိုရန်](https://github.com/microsoft/azd-for-beginners/issues)
- **သင်ယူရေး မေးခွန်းများ**: [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure) နှင့် [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI အထူး ကူညီမှု**: [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG) တွင် ပါဝင်ရန်
- **စာတမ်းများ**: [အတည်ပြု Azure Developer CLI စာတမ်း](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Microsoft Foundry Discord မှ အသိုင်းအဝိုင်း အမြင်များ

**#Azure ချန်နယ်မှ မကြာသေးမီက စစ်တမ်း ရလဒ်များ:**
- **၄၅%** က developer များသည် AI လုပ်ငန်းအတွက် AZD ကို အသုံးပြုလိုကြသည်
- **အဓိက အခက်အခဲများ**: multi-service deployments, credential management, ထုတ်လုပ်ရေး ပြင်ဆင်မှု  
- **အများဆုံး တောင်းဆိုချက်များ**: AI အထူး templates, ပြဿနာဖြေရှင်း လမ်းညွှန်များ, အကောင်းဆုံးနည်းလမ်းများ

**အဖွဲ့ဝင်များအနေဖြင့် ဘာများလုပ်ဆောင်နိုင်သနည်း:**
- သင့် AZD + AI အတွေ့အကြုံများကို မျှဝေရန် နှင့် ကူညီမေးမြန်းရန်
- AI templates များ၏ မကြာသေးမီ ကြိုတင်ကြည့်ရှုခွင့်ရယူရန်
- AI deployment အကောင်းဆုံးနည်းလမ်းများတွင် ပါဝင်ရန်
- နောင်တစ်ကြိမ် AI + AZD ဖွံ့ဖြိုးတိုးတက်မှုများသို့ အကျိုးသက်ရောက်မှု ရှိရန်

### သင်တန်းတွင် ပါဝင်ဆောင်ရွက်ခြင်း
နှစ်သက်မှုရှိပါက ပါဝင်ဆောင်ရွက်ရန်ကြိုဆိုပါသည်! အသေးစိတ်အတွက် ကျေးဇူးပြု၍ ကျွန်ုပ်တို့၏ [Contributing Guide](CONTRIBUTING.md) ကို ဖတ်ပါ။
- **အကြောင်းအရာ တိုးတက်မှု**: ရှိပြီးသား အခန်းများနှင့် ဥပမာများ တိုးမြှင့်ရန်
- **အကြောင်းအရာ အသစ်များ**: လက်တွေ့ကမ္ဘာက အခြေအနေများနှင့် templates ထည့်ရန်  
- **ဘာသာပြန်ခြင်း**: ဘာသာစကားစနစ် များကို ထိန်းသိမ်းရန် ကူညီရန်
- **အမှားအစီရင်ခံချက်များ**: တိကျမှန်ကန်မှုနှင့် ရှင်းလင်းမှု မွမ်းမံရန်
- **အသိုင်းအဝိုင်း စံချိန်များ**: ကျွန်ုပ်တို့၏ ပါဝင်ဆောင်ရွက်မှု စည်းကမ်းများကို လိုက်နာရန်

---

## 📄 သင်တန်းအချက်အလက်များ

### မူပိုင်ခွင့်
ဒီပရောဂျက်ကို MIT မူပိုင်ခွင့်ဖြင့်လိုင်စင်ပြုထားသည် - အသေးစိတ်အချက်အလက်များအတွက် [LICENSE](../../LICENSE) ဖိုင်ကို ကြည့်ပါ။

### Microsoft သင်ယူရေး အရင်းအမြစ်များနှင့် ဆက်နွယ်မှု

ကျွန်ုပ်တို့အသင်းက ကျယ်ပြန့်သော သင်တန်းများကို ထုတ်လုပ်သည်။

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
 
### အဓိက သင်ယူရန်
[![ML for Beginners](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science for Beginners](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI for Beginners](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersecurity for Beginners](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web Dev for Beginners](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT for Beginners](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR Development for Beginners](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot စီးရီးများ
[![Copilot for AI Paired Programming](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot for C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ သင်တန်းလမ်းညွှန်

**🚀 သင်ယူမှု စတင်ဖို့ ပြင်ဆင်ထားပါပြီလား?**

**အသစ်စတင်သူများ**: [အခန်း ၁: အခြေခံနှင့် မြန်ဆန်စတင်ခြင်း](#-chapter-1-foundation--quick-start)မှ စတင်ပါ  
**AI ဖွံ့ဖြိုးသူများ**: [အခန်း ၂: AI ပထမဦးဆုံး ဖွံ့ဖြိုးတိုးတက်မှု](#-chapter-2-ai-first-development-recommended-for-ai-developers)သို့ တက်ပါ  
**အတွေ့အကြုံရှိ ဖွံ့ဖြိုးသူများ**: [အခန်း ၃: ပြုပြင်တပ်ဆင်ခြင်းနှင့် မှတ်ပုံတင်ခြင်း](#️-chapter-3-configuration--authentication)မှ စတင်ပါ

**နောက်တစ်ဆင့်များ**: [အခြေခံ AZD အကြောင်း အခန်း ၁ စတင်ပါ](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ပြောကြားချက်**
ဤစာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှန်ကန်မှုအတွက် ကြိုးပမ်းနေသော်လည်း၊ စက်ကိရိယာဘာသာပြန်ခြင်းများတွင် အမှားများ သို့မဟုတ် မှားယွင်းချက်များ ပါဝင်နိုင်ကြောင်း သတိပြုပါရန် လိုအပ်ပါသည်။ မူလစာတမ်းကို မူရင်းဘာသာဖြင့်သာ ယုံကြည်စိတ်ချရသော အချက်အလက်အဖြစ် သတ်မှတ်သင့်သည်။ အရေးကြီးသည့် သတင်းအချက်အလက်များအတွက် ပရော်ဖက်ရှင်နယ် လူသားဘာသာပြန်သူဝန်ဆောင်မှုကို အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော နားလည်မှုကွာခြားမှုများ သို့မဟုတ် မမှန်ကန်သော အသုံးပြုမှုများအတွက် ကျွန်ုပ်တို့ တာဝန်မခံပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->