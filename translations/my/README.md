# AZD အတွက် စတင်သူများ: တစည်းတခဲ သင်ယူရေး ခရီး

![AZD-အတွက် စတင်သူများ](../../translated_images/my/azdbeginners.5527441dd9f74068.webp) 

[![GitHub ကြည့်ရှုသူများ](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub Forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub ကြယ်များ](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### အလိုအလျောက် ဘာသာပြန်များ (မြဲတမ်း နောက်ဆုံးထား)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](./README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **ဒေသခံအနေဖြင့် Clone လုပ်ချင်ပါသလား?**
>
> ဒီ repository မှာ ဘာသာစကား 50+ ခုအထိ ဘာသာပြန်ထားလို့ ဒေါင်းလုပ်ဆိုဒ် ကြီးတက်ပါတယ်။ ဘာသာပြန်များမပါဘဲ clone လုပ်ချင်ရင် sparse checkout ကို အသုံးပြုပါ။
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
> ဒီနည်းလမ်းနဲ့ သင့်ရဲ့ သင်တန်းကို ပြီးစီးဖို့ လိုအပ်တဲ့ အရာတွေအားလုံးကို ပိုမြန်ပြီး ဒေါင်းလုဒ် လုပ်နိုင်ပါလိမ့်မယ်။
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🚀 Azure Developer CLI (azd) ဆိုတာဘာလဲ?

**Azure Developer CLI (azd)** သည် developer များအတွက် အသုံးပြုရ လွယ်ကူသော command-line ကိရိယာတစ်ခုဖြစ်ပြီး Azure သို့ အက်ပလီကေးရှင်းများကို အလွယ်တကူ ထုတ်ပေးနိုင်စေသည်။ Azure ရင်းမြစ်များ အတော်များများကို လက်ဖြင့် တည်းဖြတ် ဖန်တီး ချိတ်ဆက်ဖို့ အစား များစွာသော Azure ရင်းမြစ်များကို တစ်ချက်နဲ့ တစ်ပြိုင်နက် ထုတ်ပေးနိုင်သည်။

### `azd up` ရဲ့ အံ့အားသင့်စေသော အချက်

```bash
# ဤတစ်ကြိမ်ပြုလုပ်ရန်အမိန့်သည် အရာအားလုံးကိုလုပ်ဆောင်ပါသည်။
# ✅ Azure ရင်းမြစ်များအားလုံးကို ဖန်တီးသည်
# ✅ ကွန်ရက်နှင့်လုံခြုံရေးကို ပြင်ဆင်သည်
# ✅ သင့်အပလီကေးရှင်းကုဒ်ကို တည်ဆောက်သည်
# ✅ Azure သို့ တင်သွင်းသည်
# ✅ အလုပ်လုပ်နိုင်သော URL ချိတ်ဆက်ပေးသည်
azd up
```

**ဒါပဲ!** Azure Portal ကို နှိပ်စရာ မလိုတော့ဘူး၊ ARM template မကျွမ်းကျင်ဖို့ လိုအပ်မှု မရှိတော့ဘူး၊ လက်ရှိ configuration ကိုလည်း ကိုယ်တိုင် မပြင်ဆင်ဘဲ - အလုပ်လုပ်နေသော အက်ပလီကေးရှင်းတွေကို Azure အပေါ် တင်ထားပါတယ်။

---

## ❓ Azure Developer CLI နှင့် Azure CLI: ဘာကွာခြားသနည်း?

ဒီဟာက စတင်သူများ အများဆုံး မေးတဲ့ မေးခွန်းပါ။ ရိုးရှင်းတဲ့ အဖြေက အောက်ပါအတိုင်း ဖြစ်ပါတယ်။

| အင်္ဂါရပ် | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **ရည်ရွယ်ချက်** | တစ်ခုချင်း Azure ရင်းမြစ်များကို စီမံခန့်ခွဲရန် | အက်ပလီကေးရှင်းလုံးဝကို ထုတ်ပေးရန် |
| **စိတ်ထား** | အဆောက်အအုံ အထူးအလေးပေး | အက်ပလီကေးရှင်း အထူးအလေးပေး |
| **ဥပမာ** | `az webapp create --name myapp...` | `azd up` |
| **သင်ယူရန် အခက်အခဲ** | Azure ဝန်ဆောင်မှုတွေကို သိထားရမည် | သင့်အက်ပလီကေးရှင်းကိုသာ သိထားရမည် |
| **အတွက် အကောင်းဆုံး** | DevOps၊ အဆောက်အအုံ | Developer များ၊ ပရိုတိုတိုင်ပင် |

### ရိုးရှင်းသော နှိုင်းယှဉ်ချက်

- **Azure CLI** သည် အိမ်တစ်လုံး တည်ဆောက်ရန် အသုံးအများဆုံး ကိရိယာများကို တစ်စုလိုက်ပေးထားသလိုဖြစ်သည် - တက်များ၊ သံမြှောများ၊ သံချောင်းများ။ ဘာမှမပျော်နိုင်ပေမယ့် ဆောက်လုပ်မှုကို ပြုလုပ်နိုင်ဖို့ အတော်ကြာ ကျွမ်းကျင်မှုလိုအပ်သည်။
- **Azure Developer CLI** သည် သင့်အတွက် တာဝန်ယူဆောင်ရွက်ပေးသော contractor တစ်ဦးမျိုးဖြစ်သည် - သင်လိုချင်သလို ဖေါ်ပြမှသာ သူတို့ ဆောက်လုပ်ပေးပါလိမ့်မယ်။

### ဘယ်အချိန် ဘယ်ဟာကို အသုံးပြုမလဲ

| အခြေအနေ | အသုံးပြုရန် |
|----------|----------|
| "ကျွန်တော့် ဝက်ဘ်အက်ပလီကေးရှင်းကို အမြန် ထုတ်ပေးချင်တယ်" | `azd up` |
| "ကျွန်တော် storage account တစ်ခုသာ ဖန်တီးချင်တယ်" | `az storage account create` |
| "ကျွန်တော် အပြည့်အစုံ AI အက်ပလီကေးရှင်း တည်ဆောက်နေတယ်" | `azd init --template azure-search-openai-demo` |
| "တစ်ခုချင်း Azure resource တစ်ခုကို debug လုပ်ချင်တယ်" | `az resource show` |
| "မိနစ်ပိုင်းအတွင်း production-ready deployment လုပ်ချင်တယ်" | `azd up --environment production` |

### အတူတကွ အလုပ်လုပ်နိုင်သည်!

AZD သည် အတွင်းဘက်တွင် Azure CLI ကို အသုံးပြုသည်။ သင့်အနေဖြင့် နှစ်ခုလုံးကို အသုံးပြုနိုင်ပါသည်:
```bash
# သင့်အက်ပ်ကို AZD သုံးပြီး တပ်ဆင်ပါ
azd up

# ထို့နောက် Azure CLI နဲ့ သတ်မှတ်ထားသော အရင်းအမြစ်များကို ကိုယ်တိုင်ချိန်ညှိပါ
az webapp config set --name myapp --always-on true
```

---

## 🌟 Awesome AZD တွင် အပုံစံများ ရှာပါ

အစကနေစတင်မလုပ်ပါနဲ့! **Awesome AZD** သည် တိုက်ရိုက် ထုတ်ပေးနိုင်သော အပုံစံများကို လူထုက စုစည်းထားသည့် စာကြည့်တိုက်တစ်ခုဖြစ်သည်။

| ရင်းမြစ် | ဖော်ပြချက် |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | တစ်ချက်နှိပ်ရာမှ 200+ အပုံစံများကို ကြည့်ရှုနိုင်ပြီး တိုက်ရိုက် ထုတ်ပေးနိုင်သည် |
| 🔗 [**Submit a Template**](https://github.com/Azure/awesome-azd/issues) | သင့်၏ template ကို လူထုသို့ တင်ပြရန် |
| 🔗 [**GitHub Repository**](https://github.com/Azure/awesome-azd) | ကြယ်ပေးပြီး အရင်းအမြစ်ကို စူးစမ်းရန် |

### Awesome AZD မှ ထင်ရှားသော AI အပုံစံများ

```bash
# Azure OpenAI + AI ရှာဖွေရေးနှင့် RAG စကားပြောခြင်း
azd init --template azure-search-openai-demo

# အမြန် AI စကားပြော အပလီကေးရှင်း
azd init --template openai-chat-app-quickstart

# Foundry Agents နှင့် AI အိမ်ရှင်များ
azd init --template get-started-with-ai-agents
```

---

## 🎯 ၃ ခြေလှမ်းဖြင့် စတင်ထားခြင်း

### ခြေလှမ်း ၁: AZD ထည့်သွင်းပါ (၂ မိနစ်)

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

### ခြေလှမ်း ၂: Azure သို့ လော့ဂ်အင် ဝင်ပါ

```bash
azd auth login
```

### ခြေလှမ်း ၃: သင့် ပထမဆုံး အက်ပလီကေးရှင်းကို ထုတ်ပေးပါ

```bash
# ပုံစံမှ စတင်တည်ဆောက်ခြင်း
azd init --template todo-nodejs-mongo

# Azure သို့ တပ်ဆင်ခြင်း (အားလုံးကို ဖန်တီးပေးသည်!)
azd up
```

**🎉 ပြီးသွားပါပြီ!** သင့်အက်ပလီကေးရှင်းကို ယခု Azure ပေါ်တွင် တင်ထားပြီး ဖြစ်ပါပြီ။

### ရှင်းလင်းဖျက်သိမ်းခြင်း (မမေ့ပါနဲ့!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 ဒီသင်တန်းကို မည်သို့ အသုံးပြုမည်

ဒီသင်တန်းကို **တိုးတက်၍ သင်ယူရန်** အတွက် ဖန်ဆင်းထားသည် - သင် အဆင်ပြေရာနေရာကနေ စတင်ပြီး အဆင့်မြင့်သို့ သွားပါ:

| သင့် အတွေ့အကြုံ | စတင်ရန် |
|-----------------|------------|
| **Azure ကို အသစ် စတင်သူ** | [Chapter 1: Foundation](../..) |
| **Azure ကို သိပြီး AZD သစ်ဖြစ်သူ** | [Chapter 1: Foundation](../..) |
| **AI အက်ပလီကေးရှင်း ထုတ်ပေးချင်သူများ** | [Chapter 2: AI-First Development](../..) |
| **လက်တွေ့ လေ့ကျင့်ချင်သူများ** | [🎓 Interactive Workshop](workshop/README.md) - 3-4 နာရီ လမ်းညွှန် လက်တွေ့လုပ်ငန်း |
| **Production ပုံစံများ လိုအပ်သူများ** | [Chapter 8: Production & Enterprise](../..) |

### အမြန်ဆုံး စတင်ရန်

1. **ဒီ Repository ကို Fork လုပ်ပါ**: [![GitHub Forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Clone လုပ်ပါ**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **ကူညီမှု ရယူပါ**: [Azure Discord Community](https://discord.com/invite/ByRwuEEgH4)

> **ဒေသခံအဖြစ် Clone လုပ်ချင်ပါသလား?**
>
> ဒီ repository မှာ ဘာသာစကား 50+ ခုအထိ ဘာသာပြန်ထားလို့ ဒေါင်းလုပ်ဆိုဒ် ကြီးတက်ပါတယ်။ ဘာသာပြန်များမပါဘဲ clone လုပ်ချင်ရင် sparse checkout ကို အသုံးပြုပါ။
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> ဒီနည်းလမ်းနဲ့ သင့်အား သင်တန်းကို ပြီးစီးဖို့ လိုအပ်တဲ့ အရာအားလုံးကို ပေးပြီး ဒေါင်းလုဒ်ကို ပိုမိုလျင်မြန်စေပါလိမ့်မယ်။


## သင်တန်း အနှစ်ချုံး

Azure Developer CLI (azd) ကို အဆင့်လိုက် အခန်းများအားဖြင့် ကျွမ်းကျင်စွာ သင်ယူပါ။ **Microsoft Foundry ပေါင်းစည်းမှုနှင့် AI အက်ပလီကေးရှင်း ထုတ်ပေးခြင်း ပေါ်တွင် အထူး အာရုံစိုက်ထားသည်။**

### ဒီသင်တန်းက ခေတ်မီ developer များအတွက် အရေးကြီးတဲ့ အကြောင်းရင်း

Microsoft Foundry Discord လူထုမှ အကျိုးသက်ရောက်မှုများအရ၊ **developer 45% မှ AZD ကို AI workload များအတွက် အသုံးချချင်ကြပါသည်** သို့သော် အောက်ပါ ပြဿနာများနှင့် ကြုံရသည် -
- စုံလင်သော multi-service AI ပုံဆောင်အင်ဖရာစည်းလုံးမှုများ ခက်ခဲခြင်း
- Production AI ထုတ်ပေးမှု သာသနာဝင် ဝိတိဇ်များ
- Azure AI ဝန်ဆောင်မှုများ ပေါင်းစည်းခြင်းနှင့် ပြင်ဆင်ခြင်း
- AI workload များအတွက် ကုန်ကျစရိတ် တောင်းဆိုမှုအပြင် သက်သာစေခြင်း
- AI အထူး deployment ပြဿနာများကို ဖြေရှင်းခြင်း

### သင်ယူရန် ရည်မှန်းချက်များ

ဒီ တစည်းတခဲ သင်တန်းကို ပြီးမြောက်ပါက သင်သည် -
- **AZD အခြေခံ အတတ်ပညာများ ကျွမ်းကျင်မည်**: အဓိက အယူအဆများ၊ ထည့်သွင်းခြင်း၊ ပြင်ဆင်ခြင်း
- **AI အက်ပလီကေးရှင်းများ ထုတ်ပေးနိုင်မည်**: AZD ကို Microsoft Foundry ဝန်ဆောင်မှုများနှင့် အသုံးချခြင်း
- **Infrastructure as Code ကို အကောင်အထည်ဖော်နည်းများ**: Bicep template များဖြင့် Azure ရင်းမြစ်များကို စီမံခန့်ခွဲခြင်း
- **Deployment များကို ပြဿနာရှာဖွေ ဖြေရှင်းနိုင်ခွင့်**: ရိုးရှင်းသည့် ပြဿနာများကို ဖြေရှင်းခြင်းနှင့် debug နည်းများ
- **Production အတွက် ထိရောက်စွာ အကောင်အထည်ဖော်နိုင်ခြင်း**: လုံခြုံရေး၊ scale ပြုခြင်း၊ monitoring၊ ကုန်ကျစရိတ် စီမံခန့်ခွဲမှု
- **Multi-Agent ဖြေရှင်းချက်များ တည်ဆောက်ခြင်း**: စုံလင်သော AI အင်ဖရာစည်းလုံးမှုများ ထုတ်ပေးနိုင်ခြင်း

## 🗺️ သင်တန်း မြေပုံ: အခန်းအလိုက် အမြန်လမ်းညွှန်

ချုပ်ခန်းတိုင်းမှာ သီးသန့် README တစ်ခု ရှိပြီး သင်ယူရန် ရည်မှန်းချက်များ၊ အမြန်စတင်နည်းများနှင့် လေ့ကျင့်ခန်းများ ပါဝင်သည်။

| ခapters | ခေါင်းစဉ် | သင်ခန်းစာများ | ကြာမြင့်ချိန် | ရှုပ်ထွေးမှု |
|---------|-------|---------|----------|------------|
| **[Ch 1: Foundation](docs/chapter-01-foundation/README.md)** | စတင်ခြင်း | [AZD Basics](docs/chapter-01-foundation/azd-basics.md) &#124; [Installation](docs/chapter-01-foundation/installation.md) &#124; [First Project](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Ch 2: AI Development](docs/chapter-02-ai-development/README.md)** | AI-ပထမ အက်ပလီကေးရှင်းများ | [Foundry Integration](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI Agents](docs/chapter-02-ai-development/agents.md) &#124; [Model Deployment](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Workshop](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 hrs | ⭐⭐ |
| **[Ch 3: Configuration](docs/chapter-03-configuration/README.md)** | အတည်ပြုခြင်း နှင့် လုံခြုံရေး | [Configuration](docs/chapter-03-configuration/configuration.md) &#124; [Auth & Security](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[အခန်း 4: အခြေခံအဆောက်အဦး](docs/chapter-04-infrastructure/README.md)** | IaC နှင့် ဖြန့်ချိခြင်း | [ဖြန့်ချိခြင်းလမ်းညွှန်](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [အရင်းအမြစ် သတ်မှတ်ခြင်း](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 နာရီ | ⭐⭐⭐ |
| **[အခန်း 5: မျိုးစုံအေးဂျင့်](docs/chapter-05-multi-agent/README.md)** | AI အေးဂျင့် ဖြေရှင်းချက်များ | [လက်လီ စီးပွားရေး အခြေအနေ](examples/retail-scenario.md) &#124; [ညှိနှိုင်းမှု ပုံစံများ](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 နာရီ | ⭐⭐⭐⭐ |
| **[အခန်း 6: ကြိုတင် တင်သွင်းမီ စစ်ဆေးခြင်း](docs/chapter-06-pre-deployment/README.md)** | စီမံချက်နှင့် အတည်ပြုခြင်း | [Preflight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 နာရီ | ⭐⭐ |
| **[အခန်း 7: ပြဿနာရှာဖွေခြင်း](docs/chapter-07-troubleshooting/README.md)** | ဒိုင်ယာဂ်နှင့် ဖြေရှင်းချက် | [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Debugging](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI Issues](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 နာရီ | ⭐⭐ |
| **[အခန်း 8: ထုတ်လုပ်မှုပတ်ဝန်းကျင်](docs/chapter-08-production/README.md)** | စီးပွားရေး အဖွဲ့အစည်း ပုံစံများ | [Production Practices](docs/chapter-08-production/production-ai-practices.md) | 2-3 နာရီ | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | လက်တွေ့လေ့ကျင့်ခန်း | [Introduction](workshop/docs/instructions/0-Introduction.md) &#124; [Selection](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validation](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Deconstruction](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Configuration](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Customization](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Teardown](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Wrap-up](workshop/docs/instructions/7-Wrap-up.md) | 3-4 နာရီ | ⭐⭐ |

**စုစုပေါင်း သင်တန်း ကြာချိန်:** ~10-14 နာရီ | **ကျွမ်းကျင်မှုပုံစံ တိုးတက်မှု:** စတင်သူ → ထုတ်လုပ်ရေး အသင့်

---

## 📚 သင်ယူရမည့် အခန်းများ

*သင်၏ အတွေ့အကြုံနှင့် ရည်ရွယ်ချက်အပေါ် မူတည်၍ သင်ယူမည့် မျဉ်းကြောင်းကို ရွေးချယ်ပါ*

### 🚀 အခန်း 1: အခြေခံနှင့် အလျင်အမြန် စတင်ခြင်း
**လိုအပ်ချက်များ**: Azure subscription, ကွန်မန်းလိုင်း အခြေခံ သိရှိမှု  
**ကြာချိန်**: 30-45 မိနစ်  
**ရှုပ်ထွေးမှု**: ⭐

#### သင်จะသင်ယူမည့် အရာများ
- Azure Developer CLI အခြေခံကို နားလည်ခြင်း
- သင့် ပလက်ဖောင်းပေါ်တွင် AZD ကို ထည့်သွင်းခြင်း
- သင်၏ ပထမဆုံး အောင်မြင်စွာ ဖြန့်ချိခြင်း

#### သင်ယူရန် အရင်းအမြစ်များ
- **🎯 စတင်ရန်**: [Azure Developer CLI ဆိုတာဘာလဲ?](../..)
- **📖 သီအိုရီ**: [AZD အခြေခံများ](docs/chapter-01-foundation/azd-basics.md) - အဓိက သဘောတရားများနှင့် ထိုးထွင်းချက်များ
- **⚙️ ပြင်ဆင်မှု**: [Installation & Setup](docs/chapter-01-foundation/installation.md) - ပလက်ဖောင်းအလိုက် လမ်းညွှန်များ
- **🛠️ လက်တွေ့လုပ်ငန်း**: [Your First Project](docs/chapter-01-foundation/first-project.md) - အဆင့်လိုက် လမ်းညွှန်
- **📋 အမြန်ညွှန်ကြားချက်**: [Command Cheat Sheet](resources/cheat-sheet.md)

#### လက်တွေ့လက်ခံ အလေ့အကျင့်များ
```bash
# တပ်ဆင်မှုကို အမြန်စစ်ဆေးခြင်း
azd version

# သင့် ပထမဆုံး အပလီကေးရှင်းကို ဖြန့်ချိပါ
azd init --template todo-nodejs-mongo
azd up
```

**💡 အခန်း အဆုံးသတ် မျှော်မှန်းချက်**: AZD ကို အသုံးပြုပြီး Azure သို့ ရိုးရှင်းသော ဝက်ဘ်လျှပ်စစ်မှုကို အောင်မြင်စွာ ဖြန့်ချိခြင်း

**✅ အောင်မြင်မှု အတည်ပြုချက်:**
```bash
# အခန်း ၁ ကို ပြီးမြောက်ပြီးနောက် သင်ရနိုင်သည့်အရာများ:
azd version              # တပ်ဆင်ထားသော ဗားရှင်းကို ပြသသည်
azd init --template todo-nodejs-mongo  # ပရောဂျက်ကို စတင်ဖွဲ့စည်းသည်
azd up                  # Azure သို့ တင်ပို့သည်
azd show                # လည်ပတ်နေသော အက်ပ်၏ URL ကို ပြသသည်
# အက်ပလီကေးရှင်းကို ဘရောက်ဇာတွင် ဖွင့်၍ အလုပ်လုပ်သည်
azd down --force --purge  # အရင်းအမြစ်များကို ရှင်းလင်းသည်
```

**📊 အချိန် စရိတ်:** 30-45 မိနစ်  
**📈 သင်ယူပြီးနောက် ကျွမ်းကျင်မှု အဆင့်:** မူလ အက်ပလီကေးရှင်း များကို ပုဂ္ဂိုလ်ရေးအလိုက် သီးခြား ဖြန့်ချိနိုင်ခြင်း

**✅ အောင်မြင်မှု အတည်ပြုချက်:**
```bash
# အခန်း ၁ ကိုပြီးမြောက်သည့်အချိန်တွင် သင်သည် အောက်ပါအရာများကို ပြုလုပ်နိုင်ရမည်:
azd version              # တပ်ဆင်ထားသော ဗားရှင်းကို ပြသည်
azd init --template todo-nodejs-mongo  # ပရောဂျက်ကို အစပြုသတ်မှတ်သည်
azd up                  # Azure သို့ ဖြန့်ချိသည်
azd show                # လည်ပတ်နေသော အက်ပ်၏ URL ကို ပြသည်
# အက်ပ်ကို ဘရောက်ဇာတွင် ဖွင့်၍ လည်ပတ်သည်
azd down --force --purge  # အရင်းအမြစ်များကို ရှင်းလင်းသည်
```

**📊 အချိန် စရိတ်:** 30-45 မိနစ်  
**📈 သင်ယူပြီးနောက် ကျွမ်းကျင်မှု အဆင့်:** မူလ အက်ပလီကေးရှင်း များကို ပုဂ္ဂိုလ်ရေးအလိုက် သီးခြား ဖြန့်ချိနိုင်ခြင်း

---

### 🤖 အခန်း 2: AI-ပထမ ဦး ဆောင် တီထွင်မှု (AI ဖန်တီးသူများအတွက် အကြံပြု)
**လိုအပ်ချက်များ**: အခန်း 1 ပြီးစီးထားလျှင်  
**ကြာချိန်**: 1-2 နာရီ  
**ရှုပ်ထွေးမှု**: ⭐⭐

#### သင်จะသင်ယူမည့် အရာများ
- Microsoft Foundry ကို AZD နှင့် ပေါင်းစည်းခြင်း
- AI ပါ၀င်သည့် အက်ပလီကေးရှင်းများ ဖြန့်ချိခြင်း
- AI ဝန်ဆောင်မှုပုံစံများ ခွဲခြမ်း သဘောပေါက်ခြင်း

#### သင်ယူရန် အရင်းအမြစ်များ
- **🎯 စတင်ရန်**: [Microsoft Foundry Integration](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI Agents**: [AI Agents Guide](docs/chapter-02-ai-development/agents.md) - AZD ဖြင့် တုံ့ပြန်နိုင်သော အေးဂျင့်များ ဖြန့်ချိခြင်း
- **📖 ပုံစံများ**: [AI Model Deployment](docs/chapter-02-ai-development/ai-model-deployment.md) - AI မော်ဒယ်များ ဖြန့်ချိနှင့် စီမံခန့်ခွဲခြင်း
- **🛠️ အလုပ်ရုံသင်တန်း**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - သင့် AI ဖြေရှင်းချက်များကို AZD အသင့်အဖြစ် ပြင်ဆင်ခြင်း
- **🎥 အပြန်အလှန် လမ်းညွှန်**: [Workshop Materials](workshop/README.md) - MkDocs * DevContainer ပတ်ဝန်းကျင်နှင့် Browser အခြေခံ သင်ယူမှု
- **📋 နမူနာများ**: [Microsoft Foundry Templates](../..)
- **📝 ဥပမာများ**: [AZD Deployment Examples](examples/README.md)

#### လက်တွေ့လက်ခံ အလေ့အကျင့်များ
```bash
# သင့် ပထမဆုံး AI အက်ပလီကေးရှင်းကို ဖြန့်ချိပါ
azd init --template azure-search-openai-demo
azd up

# နောက်ထပ် AI နမူနာများကို စမ်းကြည့်ပါ
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 အခန်း အဆုံးသတ် မျှော်မှန်းချက်**: RAG တက်နိုင်စွမ်းပါရှိသည့် AI ချက် အက်ပလီကေးရှင်း တစ်ခုကို ဖြန့်ချိပြီး ဖော်ပြရန်

**✅ အောင်မြင်မှု အတည်ပြုချက်:**
```bash
# အခန်း ၂ ပြီးနောက် သင် အောက်ပါများကို ပြုလုပ်နိုင်သင့်သည်
azd init --template azure-search-openai-demo
azd up
# AI စကားဝိုင်း အင်တာဖေ့စ်ကို စမ်းသပ်နိုင်သည်
# မေးခွန်းများ မေးပြီး အရင်းအမြစ်များပါသော AI ဖြေကြားချက်များကို ရရှိနိုင်သည်
# ရှာဖွေရေး ပေါင်းစည်းမှု အလုပ်လုပ်နေကြောင်း အတည်ပြုနိုင်သည်
azd monitor  # Application Insights တွင် telemetry အချက်အလက်များ ပြသနေသည်ကို စစ်ဆေးနိုင်သည်
azd down --force --purge
```

**📊 အချိန် စရိတ်:** 1-2 နာရီ  
**📈 သင်ယူပြီးနောက် ကျွမ်းကျင်မှု အဆင့်:** ထုတ်လုပ်ရေး အသင့် AI အက်ပလီကေးရှင်းများကို ဖြန့်ချိနှင့် ဖွဲ့စည်းနိုင်ခြင်း  
**💰 ကုန်ကျစရိတ် သိရှိမှု:** dev ကာလတွင် $80-150/တစ်လ၊ ထုတ်လုပ်ရေးတွင် $300-3500/တစ်လ အထိ ဖြစ်နိုင်ကြောင်း နားလည်ထားရန်

#### 💰 AI ဖြန့်ချိမှုများအတွက် ကုန်ကျစရိတ် အကောင့်လက်ခံချက်များ

**ဖွံ့ဖြိုးရေးပတ်ဝန်းကျင် (ခန့်မှန်း $80-150/တစ်လ):**
- Azure OpenAI (Pay-as-you-go): $0-50/တစ်လ (token အသုံးပြုမှုအပေါ် မူတည်)
- AI Search (Basic tier): $75/တစ်လ
- Container Apps (Consumption): $0-20/တစ်လ
- Storage (Standard): $1-5/တစ်လ

**ထုတ်လုပ်ရေးပတ်ဝန်းကျင် (ခန့်မှန်း $300-3,500+/တစ်လ):**
- Azure OpenAI (PTU အတွက် အမြဲတမ်း အဖွဲ့တစ်ခု): $3,000+/တစ်လ OR အရမ်းများတဲ့ အလှမ်းအတိုင်း Pay-as-go
- AI Search (Standard tier): $250/တစ်လ
- Container Apps (Dedicated): $50-100/တစ်လ
- Application Insights: $5-50/တစ်လ
- Storage (Premium): $10-50/တစ်လ

**💡 ကုန်ကျစရိတ် ထိန်းချုပ်ရေး အကြံပေးချက်များ:**
- သင်ယူရန်အတွက် **Free Tier** Azure OpenAI ကို အသုံးပြုပါ (လစဉ် 50,000 tokens ပါဝင်သည်)
- ဖွံ့ဖြိုးရေး မလုပ်သည့်အခါ resource များကို ပိတ်ရန် `azd down` ကို အကောင်အထည်ဖော်ပါ
- ကြာရှည်လုပ်ရန် PTU သို့သာ အဆင့်မြှင့်ပါ၊ စတင်ချိန်တွင် consumption-based billing ကို အသုံးပြုပါ
- ဖြန့်ချိရန် မတိုင်မီ ကုန်ကျစရိတ် ခန့်မှန်းရန် `azd provision --preview` ကို အသုံးပြုပါ
- auto-scaling ကို ဖွင့်ပါ: သုံးစွဲမှုနှင့် ကိုက်ညီသလို ပေးချေပါ

**ကုန်ကျစရိတ် မျှော်လင့်ချက် ကြည့်ရန်:**
```bash
# ခန့်မှန်းထားသော လစဉ်ကုန်ကျစရိတ်ကို စစ်ဆေးပါ
azd provision --preview

# Azure Portal တွင် အမှန်တကယ် ကုန်ကျစရိတ်များကို စောင့်ကြည့်ပါ
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ အခန်း 3: ဖော်ပြမှု & အမှတ်တံဆိပ်ပြုခြင်း
**လိုအပ်ချက်များ**: အခန်း 1 ပြီးစီးထားလျှင်  
**ကြာချိန်**: 45-60 မိနစ်  
**ရှုပ်ထွေးမှု**: ⭐⭐

#### သင်จะသင်ယူမည့် အရာများ
- ပတ်ဝန်းကျင် ဖော်ပြမှုနှင့် စီမံခန့်ခွဲမှု
- အမှတ်တံဆိပ်ပြုခြင်း နှင့် ဘေးကင်းရေး အကောင်းဆုံး လက်တွေ့များ
- resource အမည်ပေးခြင်းနှင့် အဖွဲ့အစည်း ပြုပြင်ခြင်း

#### သင်ယူရန် အရင်းအမြစ်များ
- **📖 ဖော်ပြမှု**: [Configuration Guide](docs/chapter-03-configuration/configuration.md) - ပတ်ဝန်းကျင် ပြင်ဆင်ခြင်း
- **🔐 ဘေးကင်းရေး**: [Authentication patterns and managed identity](docs/chapter-03-configuration/authsecurity.md) - အထိမ်းအမှတ်နှင့် authentication ပုံစံများ
- **📝 ဥပမာများ**: [Database App Example](examples/database-app/README.md) - AZD Database နမူနာများ

#### လက်တွေ့လက် قبول အလေ့အကျင့်များ
- မတူညီသော ပတ်ဝန်းကျင်များ (dev, staging, prod) ကို ဖော်ပြပါ
- managed identity authentication ကို တပ်ဆင်ပါ
- ပတ်ဝန်းကျင်အလိုက် ဖော်ပြချက်များကို အကောင်အထည်ဖော်ပါ

**💡 အခန်း အဆုံးသတ် မျှော်မှန်းချက်**: သင့်အား သင့်ရဲ့ ပတ်ဝန်းကျင်များကို သတ်မှတ်ထားသည့် authentication နှင့် ဘေးကင်းရေးဖြင့် စီမံနိုင်ခြင်း

---

### 🏗️ အခန်း 4: Infrastructure as Code & ဖြန့်ချိခြင်း
**လိုအပ်ချက်များ**: အခန်း 1-3 ပြီးစီးထားလျှင်  
**ကြာချိန်**: 1-1.5 နာရီ  
**ရှုပ်ထွေးမှု**: ⭐⭐⭐

#### သင်จะသင်ယူမည့် အရာများ
- အဆင့်မြင့် ဖြန့်ချိမှု ပုံစံများ
- Bicep ဖြင့် Infrastructure as Code
- resource သတ်မှတ်ပေးခြင်း နည်းဗျူဟာများ

#### သင်ယူရန် အရင်းအမြစ်များ
- **📖 ဖြန့်ချိခြင်း**: [Deployment Guide](docs/chapter-04-infrastructure/deployment-guide.md) - အပြည့်အစုံ workflow များ
- **🏗️ အရင်းအမြစ် သတ်မှတ်ခြင်း**: [Provisioning Resources](docs/chapter-04-infrastructure/provisioning.md) - Azure resource စီမံခန့်ခွဲခြင်း
- **📝 ဥပမာများ**: [Container App Example](../../examples/container-app) - ကွန်တိနာ အခြေခံ ဖြန့်ချိမှုများ

#### လက်တွေ့လက်ခံ အလေ့အကျင့်များ
- ကိုယ့်တိုင် Bicep template များ ဖန်တီးပါ
- ဝန်ဆောင်မှု အများ အတွက် multi-service applications များ ဖြန့်ချိပါ
- blue-green deployment များ အကောင်အထည်ဖော်ပါ

**💡 အခန်း အဆုံးသတ် မျှော်မှန်းချက်**: ကိုယ့်တိုင် ဖန်တီးထားသော infrastructure template များကို အသုံးပြု၍ ရှုပ်ထွေးသော multi-service applications များကို ဖြန့်ချိနိုင်ခြင်း

---

### 🎯 အခန်း 5: မျိုးစုံ အေးဂျင့် AI ဖြေရှင်းချက်များ (အဆင့်မြင့်)
**လိုအပ်ချက်များ**: အခန်း 1-2 ပြီးစီးထားလျှင်  
**ကြာချိန်**: 2-3 နာရီ  
**ရှုပ်ထွေးမှု**: ⭐⭐⭐⭐

#### သင်จะသင်ယူမည့် အရာများ
- မျိုးစုံအေးဂျင့် စနစ် ပုံစံများ
- အေးဂျင့် အဖွဲ့ သင်္ချာနှင့် ညှိနှိုင်းမှု
- ထုတ်လုပ်ရေးအသင့် AI ဖြန့်ချိမှုများ

#### သင်ယူရန် အရင်းအမြစ်များ
- **🤖 ထူးခြားသော ပရိုဂျက်**: [Retail Multi-Agent Solution](examples/retail-scenario.md) - အပြည့်အဝ အကောင်အထည်ဖော်ထားခြင်း
- **🛠️ ARM Templates**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - တစ်နှိပ်ဖြင့် ဖြန့်ချိနိုင်သည်
- **📖 အာကာသပုံစံ**: [Multi-agent coordination patterns](docs/chapter-06-pre-deployment/coordination-patterns.md) - ပုံစံများ

#### လက်တွေ့လက်ခံ အလေ့အကျင့်များ
```bash
# စုံလင်သော လက်လီ မျိုးစုံ အေးဂျင့် ဖြေရှင်းချက်ကို တပ်ဆင်ပါ
cd examples/retail-multiagent-arm-template
./deploy.sh

# အေးဂျင့် ဖွဲ့စည်းမှုများကို လေ့လာပါ
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 အခန်း အဆုံးသတ် မျှော်မှန်းချက်**: Customer နှင့် Inventory အေးဂျင့်များပါသော ထုတ်လုပ်ရေးအသင့် multi-agent AI ဖြေရှင်းချက် တစ်ခုကို ဖြန့်ချိနှင့် စီမံနိုင်ခြင်း

---

### 🔍 အခန်း 6: ကြိုတင် ဖြန့်ချိမှု စစ်ဆေးခြင်း နှင့် စီမံကိန်း ပြုစုပျိုးထောင်ခြင်း
**လိုအပ်ချက်များ**: အခန်း 4 ပြီးစီးထားလျှင်  
**ကြာချိန်**: 1 နာရီ  
**ရှုပ်ထွေးမှု**: ⭐⭐

#### သင်จะသင်ယူမည့် အရာများ
- စွမ်းဆောင်ရည် စီမံချက်နှင့် resource အတည်ပြုခြင်း
- SKU ရွေးချယ်မှု နည်းဗျူဟာများ
- Pre-flight စစ်ဆေးမှုများနှင့် အလိုအလျောက်ဆောင်ရွက်ချက်များ

#### သင်ယူရန် အရင်းအမြစ်များ
- **📊 စီမံချက်**: [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) - resource အတည်ပြုခြင်း
- **💰 ရွေးချယ်မှု**: [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) - ကုန်ကျစရိတ်ထိန်းသိမ်း စိတ်ကြိုက် ရွေးချယ်မှု
- **✅ အတည်ပြုချက်**: [Pre-flight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) - အလိုအလျောက် script များ

#### လက်တွေ့လက်ခံ အလေ့အကျင့်များ
- capacity အတည်ပြု script များ chạy လုပ်ပါ
- ကုန်ကျစရိတ်အတွက် SKU ရွေးချယ်မှုများကို optimization ပြုလုပ်ပါ
- ကြိုတင် ဖြန့်ချိမှု စစ်ဆေးမှုများကို အလိုအလျောက် အကောင်အထည်ဖော်ပါ

**💡 အခန်း အဆုံးသတ် မျှော်မှန်းချက်**: ဖြန့်ချိမီ အချိန် မတိုင်မီ deployment များကို အတည်ပြုပြီး အကောင်းဆုံးအခြေအနေနှင့် တင်သွင်းနိုင်ခြင်း

---

### 🚨 အခန်း 7: ပြဿနာရှာဖွေခြင်း & ဒီးဘတ်
**လိုအပ်ချက်များ**: မည်သည့် ဖြန့်ချိမှု အခန်းမှမဆို ပြီးစီးထားလျှင်  
**ကြာချိန်**: 1-1.5 နာရီ  
**ရှုပ်ထွေးမှု**: ⭐⭐

#### သင်จะသင်ယူမည့် အရာများ
- စနစ်တကျ ဒီးဘာဂ် ရှာဖွေရေးနည်းလမ်းများ
- ပုံမှန် ဖြစ်ပေါ်နိုင်သော ပြဿနာများနှင့် ဖြေရှင်းနည်းများ
- AI-သက်ဆိုင်ရာ ပြဿနာရှာဖွေခြင်း

#### သင်ယူရန် အရင်းအမြစ်များ
- **🔧 ပုံမှန် ပြဿနာများ**: [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) - မေးခွန်းများနှင့် ဖြေရှင်းချက်များ
- **🕵️ ဒီးဘတ်**: [Debugging Guide](docs/chapter-07-troubleshooting/debugging.md) - အဆင့်လိုက် နည်းလမ်းများ
- **🤖 AI ပြဿနာများ**: [AI-Specific Troubleshooting](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AI ဝန်ဆောင်မှုဆိုင်ရာ ပြဿနာများ

#### လက်တွေ့လက်ခံ အလေ့အကျင့်များ
- ဖြန့်ချိမှု မအောင်မြင်မှုများကို ရှာဖွေပါ
- authentication ပြဿနာများကို ဖြေရှင်းပါ
- AI ဝန်ဆောင်မှု ချိတ်ဆက်မှုကို ဒီးဘတ် ပြုလုပ်ပါ

**💡 အခန်း အဆုံးသတ် မျှော်မှန်းချက်**: ပုံမှန်ဖြစ်ပေါ်နိုင်သော ဖြန့်ချိမှု ပြဿနာများကို သီးခြား ရှာဖွေရေးနှင့် ဖြေရှင်းနိုင်ခြင်း

---

### 🏢 အခန်း 8: ထုတ်လုပ်ရေး & စီးပွားရေး ပုံစံများ
**လိုအပ်ချက်များ**: အခန်း 1-4 ပြီးစီးထားလျှင်  
**ကြာချိန်**: 2-3 နာရီ  
**ရှုပ်ထွေးမှု**: ⭐⭐⭐⭐

#### သင်จะသင်ယူမည့် အရာများ
- ထုတ်လုပ်ရေး ဖြန့်ချိမှု နည်းဗျူဟာများ
- စီးပွားရေး ဘေးကင်းရေး ပုံစံများ
- မော်နီတာနှင့် ကုန်ကျစရိတ် ထိန်းချုပ်မှု

#### သင်ယူရန် အရင်းအမြစ်များ
- **🏭 ထုတ်လုပ်ရေး**: [Production AI Best Practices](docs/chapter-08-production/production-ai-practices.md) - စီးပွားရေးပုံစံများ
- **📝 ဥပမာများ**: [Microservices Example](../../examples/microservices) - ရှုပ်ထွေးသော အင်ဂျင်နီယာပုံစံများ
- **📊 မော်နီတာ**: [Application Insights integration](docs/chapter-06-pre-deployment/application-insights.md) - မော်နီတာခြင်း

#### လက်တွေ့လက်ခံ အလေ့အကျင့်များ
- စီးပွားရေး ဘေးကင်းရေး ပုံစံများကို အကောင်အထည်ဖော်ပါ
- အပြည့်လုံခြုံသော မော်နီတာစနစ် တပ်ဆင်ပါ
- အကောင်းဆုံး အုပ်ချုပ်မှုဖြင့် ထုတ်လုပ်ရေး သို့ ဖြန့်ချိပါ

**💡 အခန်း အဆုံးသတ် မျှော်မှန်းချက်**: ထုတ်လုပ်ရေး အသင့် အက်ပလီကေးရှင်းများကို အပြည့်အစုံနဲ့ governance နှင့်အတူ ဖြန့်ချိနိုင်ခြင်း

---

## 🎓 Workshop အကျဉ်းချုပ်: လက်တွေ့ သင်ယူမှု အတွေ့အကြုံ

> **⚠️ WORKSHOP STATUS: Active Development**
> အလုပ်ရုံ သင်ကြားပစ္စည်းများကို လက်ရှိတွင် ဖန်တီးပြင်ဆင်နေပြီးဖြစ်သည်။ အခြေခံမော်ဂျူးများသည် လုပ်ဆောင်နိုင်သော်လည်း ကြီးပြင်းတိုးတက်သော အပိုင်းအချို့မှာ မပြီးစီးသေးပါ။ ကျနော်တို့သည် အကြောင်းအရာအားလုံးကို ပြီးစီးအောင် လက်ရှိတွင် တင်မြှောက် လုပ်ဆောင်နေပါသည်။ [တိုးတက်မှုကို ကြည့်ရန် →](workshop/README.md)

### အပြန်အလှန် အလုပ်ရုံ သင်ကြားပစ္စည်းများ
**ဘရောက်ဇာအခြေခံကိရိယာများနှင့် လမ်းပြ လေ့ကျင့်ခန်းများဖြင့် ပြည့်စုံသည့် လက်တွေ့ သင်ယူမှု**

ကျွန်တော်တို့၏ အလုပ်ရုံ ပစ္စည်းများသည် အခန်းအလိုက် သင်ကြားမှုကို ဖြည့်စည်းပေးသော ဖွဲ့စည်းထားပြီး အပြန်အလှန် လေ့ကျင့်နိုင်သည့် သင်ယူမှု အတွေ့အကြုံကို ပေးပါသည်။ အလုပ်ရုံကို ကိုယ်တိုင် လေ့လာနိုင်ရန်နှင့် သင်ကြားပေးသူနှင့် အတူ လက်လှမ်းမီ အစီအစဉ်များအတွက် ဒီဇိုင်းပြုထားပါသည်။

#### 🛠️ အလုပ်ရုံ အင်္ဂါရပ်များ
- **Browser-Based Interface**: MkDocs ဖြင့် အပြည့်အစုံ အလုပ်ရုံ၊ ရှာဖွေရန်၊ ကူးယူရန်နှင့် အတွဲအခါ မှုပုံစံများပါရှိ
- **GitHub Codespaces Integration**: တစ်ချက်နှိပ်၍ ဖွင့်နိုင်သည့် ဖွံ့ဖြိုးရေး ပတ်၀န်းကျင် သတ်မှတ်မှု
- **Structured Learning Path**: 8 မော်ဂျူး ဦးတည်ပေးသည့် လေ့ကျင့်ခန်းများ (စုစုပေါင်း 3-4 နာရီ)
- **Progressive Methodology**: မိတ်ဆက် → ရွေးချယ်ခြင်း → စစ်ဆေးခြင်း → ဖွဲ့စည်းမှု ခွဲခြမ်းခြင်း → ဖွဲ့စည်းမှု သတ်မှတ်ခြင်း → ပုံစံပြင်ဆင်ခြင်း → ဖျက်သိမ်းခြင်း → အနှိပ်ချုပ်
- **Interactive DevContainer Environment**: ကြိုတင်ဖွဲ့စည်းထားသော ကိရိယာများနှင့် အပ်ဒင်းများပါဝင်သော ပတ်ဝန်းကျင်

#### 📚 အလုပ်ရုံ မော်ဂျူး ဖွဲ့စည်းပုံ
အလုပ်ရုံသည် သင်ကို လေ့လာမှုပြုခြင်းမှ ထုတ်လုပ်ရေးထိ ဦးတည်မှုပေးသည့် **8 မော်ဂျူး ဆက်လက်လေ့လာမှု** အတိုင်း လိုက်နာပါသည်။

| Module | Topic | What You'll Do | Duration |
|--------|-------|----------------|----------|
| **0. Introduction** | Workshop Overview | သင်ယူမှု အကျယ်အဝန်း၊ ကြိုတင်လိုအပ်ချက်များနှင့် အလုပ်ရုံ ဖွဲ့စည်းပုံကို နားလည်ပါ | 15 မိနစ် |
| **1. Selection** | Template Discovery | AZD ပုံစံများကို စူးစမ်းပြီး သင့်အခြေအနေအတွက် သင့်တော်သည့် AI ပုံစံကို ရွေးချယ်ပါ | 20 မိနစ် |
| **2. Validation** | Deploy & Verify | `azd up` ဖြင့် ပုံစံအား တပ်ဆင်ပြီး အင်ဖရာစဒေါင်း စနစ် အလုပ်လုပ်မှုကို စစ်ဆေးပါ | 30 မိနစ် |
| **3. Deconstruction** | Understand Structure | GitHub Copilot အသုံးပြု၍ ပုံစံ အင်ဗျဆာဆာ၊ Bicep ဖိုင်များနှင့် ကုဒ် စနစ်ကို စူးစမ်းလေ့လာပါ | 30 မိနစ် |
| **4. Configuration** | azure.yaml Deep Dive | `azure.yaml` ဆက်တင်များ၊ lifecycle hooks နှင့် environment variables များကို ကျွမ်းကျင်ပါ | 30 မိနစ် |
| **5. Customization** | Make It Yours | AI Search, tracing, evaluation ကို ဖွင့်၍ သင့်အခြေအနေအလိုက် အံ့သြဖွယ် အစီအစဉ်များကို ပြင်ဆင်ပါ | 45 မိနစ် |
| **6. Teardown** | Clean Up | `azd down --purge` ဖြင့် ရင်းနှီးမြှပ်နှံထားသည့် အရင်းအမြစ်များကို ဘေးကင်းစွာ ဖယ်ရှားပါ | 15 မိနစ် |
| **7. Wrap-up** | Next Steps | အောင်မြင်စွာ ပြီးစီးခဲ့သည့် အရာများ၊ အဓိက အယူအဆများကို ပြန်လည်ဆန်းစစ်ပြီး မျှော်မှန်းသည့် နောက်တစ်ဆင့်များကို ဆက်လက်လုပ်ဆောင်ပါ | 15 မိနစ် |

**Workshop Flow:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 အလုပ်ရုံနှင့် စတင်ခြင်း
```bash
# ရွေးချယ်စရာ ၁: GitHub Codespaces (အကြံပြု)
# repository ထဲတွင် 'Code' ကိုနှိပ်ပြီး → 'Create codespace on main' ကိုရွေးပါ

# ရွေးချယ်စရာ ၂: ကွန်ပျူတာပေါ်တွင် ဖွံ့ဖြိုးရေး
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# workshop/README.md တွင်ရှိသော ပြင်ဆင်မှု ညွှန်ကြားချက်များကို လိုက်နာပါ
```

#### 🎯 အလုပ်ရုံ သင်ယူမှု ရလဒ်များ
အလုပ်ရုံကို ပြီးစီးခြင်းဖြင့် ပါဝင်သူများသည် -
- **ထုတ်လုပ်ရေးအဆင့် AI လျှောက်လွှာများကို တပ်ဆင်နိုင်ရန်**: AZD ကို Microsoft Foundry ဝန်ဆောင်မှုများနှင့် သုံးပါ
- **Multi-Agent ဖွဲ့စည်းပုံများ၌ ကျွမ်းကျင်နိုင်ရန်**: ညှိနှိုင်းအလုပ်လုပ်နိုင်သော AI အေးဂျင့် ဖြေရှင်းချက်များကို ဆောင်ရွက်ပါ
- **လုံခြုံရေး အကောင်းဆုံး လက်တွေ့များကို အကောင်အထည်ဖော်နိုင်ရန်**: အသုံးပြုသူ အတည်ပြုခြင်းနှင့် ထိန်းချုပ်ခွင့် စနစ်များကို သတ်မှတ်ပါ
- **အရွယ်တိုးလာနိုင်စွမ်းအတွက် ထိရောက်အောင် ပြင်ဆင်နိုင်ရန်**: ကုန်ကျစရိတ်သက်သာမှုနှင့် စွမ်းဆောင်ရည် တိုးတက်စေရန် ဒီဇိုင်းဆွဲပါ
- **တပ်ဆင်မှုများတွင် ဖြစ်ပေါ်သည့် ပြဿနာများကို ဖြေရှင်းနိုင်ရန်**: ပုံမှန် ပြဿနာများကို ကိုယ်တိုင် ဖြေရှင်းနိုင်ပါ

#### 📖 အလုပ်ရုံ ရင်းမြစ်များ
- **🎥 အပြန်အလှန် လမ်းပြ**: [Workshop Materials](workshop/README.md) - ဘရောက်ဇာအခြေခံ သင်ယူရေး ပတ်ဝန်းကျင်
- **📋 မော်ဂျူးအလိုက် လမ်းညွှန်ချက်များ**:
  - [0. Introduction](workshop/docs/instructions/0-Introduction.md) - အလုပ်ရုံ အကျဉ်းချုပ်နှင့် ရည်ရွယ်ချက်များ
  - [1. Selection](workshop/docs/instructions/1-Select-AI-Template.md) - AI ပုံစံများ ရှာဖွေပြီး ရွေးချယ်ခြင်း
  - [2. Validation](workshop/docs/instructions/2-Validate-AI-Template.md) - ပုံစံများကို တပ်ဆင်၍ စစ်ဆေးခြင်း
  - [3. Deconstruction](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - ပုံစံ အင်ဂျင်နီယာ ဖွဲ့စည်းမှုများကို လေ့လာခြင်း
  - [4. Configuration](workshop/docs/instructions/4-Configure-AI-Template.md) - `azure.yaml` ကို ကျွမ်းကျင်စွာ သုံးရန်
  - [5. Customization](workshop/docs/instructions/5-Customize-AI-Template.md) - သင့်အခြေအနေအလိုက် ပုံစံကို စိတ်ကြိုက်ပြင်ဆင်ခြင်း
  - [6. Teardown](workshop/docs/instructions/6-Teardown-Infrastructure.md) - အရင်းအမြစ်များကို စနစ်တကျ ရှင်းလင်းခြင်း
  - [7. Wrap-up](workshop/docs/instructions/7-Wrap-up.md) - ပြန်လည်ဆန်းစစ်ခြင်းနှင့် နောက်တစ်ဆင့်များ
- **🛠️ AI Workshop Lab**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI အာရုံစူးစမ်းလေ့ကျင့်ခန်းများ
- **💡 Quick Start**: [Workshop Setup Guide](workshop/README.md#quick-start) - ပတ်ဝန်းကျင် ဆက်တင်ခြင်း

**သင့်အတွက် အသင့်တော်သည်**: ကော်ပိုရေးရှင်း သင်တန်းများ၊ တက္ကသိုလ် သင်တန်းများ၊ ကိုယ့်စိတ်ကြိုက် လေ့လာမှုများနှင့် developer bootcamps များ။

---

## 📖 နက်ရှိုင်းစွာ ဆန်းစစ်ခြင်း: AZD ၏ တတ်နိုင်မှုများ

အခြေခံအရာများနောက်ပိုင်းတွင် AZD သည် ထုတ်လုပ်ရေး တပ်ဆင်ရေးအတွက် အင်အားကောင်းသော အင်္ဂါရပ်များကို ပေးစွမ်းပါသည် -

- **ပုံစံအခြေခံ တပ်ဆင်မှုများ** - ယေဘုပုံစံများအတွက် ကြိုတင်တည်ဆောက်ထားသော ပုံစံများကို အသုံးပြုပါ
- **Infrastructure as Code** - Azure ရင်းမြစ်များကို Bicep သို့မဟုတ် Terraform ဖြင့် စီမံပါ  
- **ပေါင်းစည်းထားသော အလုပ်စဉ်များ** - အလွယ်တကူ provision, deploy, နှင့် application များကို မော်နီတာလုပ်နိုင်စေရန်
- **Developer-friendly** - developer ထုတ်လုပ်နိုင်မှုနှင့် အသုံးချမှု အတွက် အရမ်းအဆင်ပြေစေသည်

### **AZD + Microsoft Foundry: AI တပ်ဆင်ရေးအတွက် အထူးသင့်တော်သည်**

**AZD ကို AI ဖြေရှင်းချက်များအတွက် ဘာကြောင့် သုံးသင့်သနည်း?** AZD သည် AI ဖွံ့ဖြိုးရေးသူများ ကြုံရသည့် အဓိက စိန်ခေါ်မှုများကို ကိုင်တွယ်ဖြေရှင်းပေးပါသည်။

- **AI-ပြင်ဆင်ထားသော ပုံစံများ** - Azure OpenAI, Cognitive Services နှင့် ML အလုပ်တွေအတွက် ကြိုတင်ပြင်ဆင်ထားသော ပုံစံများ
- **လုံခြုံစိတ်ချရသော AI တပ်ဆင်မှုများ** - AI ဝန်ဆောင်မှုများ၊ API key များနှင့် model endpoint များအတွက် အတွင်းတည်ထားသည့် လုံခြုံရေး ပုံစံများ  
- **ထုတ်လုပ်ရေး AI နမူနာများ** - အရွယ်တင်၍ ကုန်ကျစရိတ် ထိရောက်စေသည့် ပုံစံများနှင့် အကောင်းဆုံး လက်တွေ့များ
- **အစမှ ဆောင်ရွက်ရေးအထိ AI အလုပ်စဉ်များ** - မော်ဒယ်ဖွံ့ဖြိုးရေးမှ ထုတ်လုပ်ရေးထိ နှင့် သက်ဆိုင်ရာ မော်နီတာလည်း ပါဝင်
- **ကုန်ကျစရိတ် ညှိနှိုင်းရေး** - AI အလုပ်များအတွက် ရင်းမြစ် ချိန်ခွင့်နှင့် အတိုင်းအတာချိန်ညှိရေး များ
- **Microsoft Foundry သို့ ပေါင်းစည်းမှု** - Microsoft Foundry model ကတ်တလော့နှင့် endpoint များနှင့် အဆက်အသွယ် ရရှိစေသည်

---

## 🎯 ပုံစံများနှင့် ဥပမာစာကြည့်တိုက်

### အထူးပရိုမိုးရှင်း: Microsoft Foundry ပုံစံများ
**AI လျှောက်လွှာများ တပ်ဆင်နေပါက ဤနေရာမှ စတင်ပါ!**

> **မှတ်ချက်:** ဤပုံစံများသည် မတူကွဲပြားသော AI ပုံစံများကို တင်ပြသည်။ အချို့သည် Azure Samples မှ ဖြစ်ပြီး၊ အချို့ကို ဒီ repository အတွင်းတွင် တည်ရှိပါသည်။

| Template | Chapter | Complexity | Services | Type |
|----------|---------|------------|----------|------|
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | အခန်း 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | ပြင်ပ |
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | အခန်း 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| ပြင်ပ |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | အခန်း 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | ပြင်ပ |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | အခန်း 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | ပြင်ပ |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | အခန်း 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | ပြင်ပ |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | အခန်း 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | ပြင်ပ |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | အခန်း 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **ဒေသတွင်း** |

### အထူးပရိုမိုးရှင်း: အပြည့်အစုံ သင်ယူရေး အခြေအနေများ
**ထုတ်လုပ်ရေးအဆင့် လျှောက်လွှာ ပုံစံများကို သင်ခန်းစာနှင့် ထပ်တူ မျှဝေထားပါသည်**

| Template | Learning Chapter | Complexity | Key Learning |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | အခန်း 2 | ⭐ | အခြေခံ AI တပ်ဆင်မှု ပုံစံများ |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | အခန်း 2 | ⭐⭐ | Azure AI Search ဖြင့် RAG အကောင်အထည်ဖော်ခြင်း |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | အခန်း 4 | ⭐⭐ | Document Intelligence ပေါင်းစည်းမှု |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | အခန်း 5 | ⭐⭐⭐ | Agent ဖရိမ်းဝေါ့ခ်နှင့် function calling |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | အခန်း 8 | ⭐⭐⭐ | စီးပွားရေးအဆင့် AI စီမံခန့်ခွဲမှု |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | အခန်း 5 | ⭐⭐⭐⭐ | Customer နှင့် Inventory agent များပါဝင်သည့် Multi-agent ဖွဲ့စည်းပုံ |

### ဥပမာအမျိုးအစားနှင့် လေ့လာခြင်း

> **📌 ဒေသတွင်း vs ပြင်ပ ဥပမာများ:**  
> **ဒေသတွင်း ဥပမာများ** (ဤ repository အတွင်း) = လက်ရှိအချိန်တွင် အသုံးပြုနိုင်ပါပြီ  
> **ပြင်ပ ဥပမာများ** (Azure Samples) = အဆိုပါ repository များမှ clone ယူရန်

#### ဒေသတွင်း ဥပမာများ (အသုံးပြုရန် အသင့်)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - ARM ပုံစံများနှင့် အပြည့်အစုံ ထုတ်လုပ်ရေး מוכ-ready အကောင်အထည်ဖော်ခြင်း
  - Customer + Inventory agents ပါဝင်သည့် Multi-agent ဖွဲ့စည်းပုံ
  - အပြည့်အစုံ မော်နီတာရေးနှင့် အကဲဖြတ်ခြင်း
  - ARM ပုံစံဖြင့် တစ်ချက်နှိပ် တပ်ဆင်နိုင်မှု

#### ဒေသတွင်း ဥပမာများ - Container Applications (အခန်း 2-5)
**ဤ repository တွင် ရှိသည့် container တပ်ဆင်မှုများ အလုံးစုံ ဥပမာများ:**
- [**Container App Examples**](examples/container-app/README.md) - container အခြေခံ တပ်ဆင်မှုများအတွက် လမ်းညွှန်ချက် အပြည့်အစုံ
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - scale-to-zero ပါသော အခြေခံ REST API
  - [Microservices Architecture](../../examples/container-app/microservices) - ထုတ်လုပ်ရေးအဆင့် မိုက်ခရို-ဝန်ဆောင်မှုများ ဖွဲ့စည်းပုံ
  - Quick Start, ထုတ်လုပ်ရေးနှင့် အဆင့်မြင့် တပ်ဆင်မှု ပုံစံများ
  - မော်နီတာရေး၊ လုံခြုံရေးနှင့် ကုန်ကျစရိတ် ထိရောက်စေရေး လမ်းညွှန်ချက်များ

#### ပြင်ပ ဥပမာများ - ရိုးရှင်းသော လျှောက်လွှာများ (အခန်း 1-2)
**စတင်ရန် ဤ Azure Samples repository များကို clone ယူပါ:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - အခြေခံ တပ်ဆင်မှု ပုံစံများ
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Static အကြောင်းအရာ တပ်ဆင်မှု
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API တပ်ဆင်မှု

#### ပြင်ပ ဥပမာများ - ဒေတာဘေ့စ် ပေါင်းစည်းမှု (အခန်း 3-4)  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - ဒေတာဘေ့စ် ချိတ်ဆက်မှု ပုံစံများ
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverless ဒေတာ လည်ပတ်မှုစနစ်

#### ပြင်ပ ဥပမာများ - အဆင့်မြင့် ပုံစံများ (အခန်း 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - မိုက်ခရို-ဝန်ဆောင်မှု အမျိုးမျိုးဖွဲ့စည်းပုံများ
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - နောက်ခံ သတ်မှတ် အလုပ်များ  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - ထုတ်လုပ်ရေးဆိုင်ရာ ML ပုံစံများ

### ပြင်ပ ပုံစံ စုစည်းချက်များ
- [**Official AZD Template Gallery**](https://azure.github.io/awesome-azd/) - အတည်ပြုထားသော နှင့် community ပုံစံများ၏ စုစည်းချက်
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn သင်ကြားချက် အသေးစိတ်
- [**Examples Directory**](examples/README.md) - ဒေသတွင်း သင်ယူရန် ဥပမာများနှင့် အသေးစိတ်ရှင်းလင်းချက်များ

---

## 📚 သင်ယူရန် အရင်းအမြစ်များနှင့် ကိုးကားချက်များ

### အမြန်ညွှန်ပြချက်များ
- [**Command Cheat Sheet**](resources/cheat-sheet.md) - အခန်းအလိုက် စီစဉ်ထားသော အရေးကြီး azd မှာ command များ
- [**Glossary**](resources/glossary.md) - Azure နှင့် azd ဆိုင်ရာ အဓိပ္ပာယ် ရှင်းလင်းချက်များ  
- [**FAQ**](resources/faq.md) - သင်ယူမှု အခန်းအလိုက် စုစည်းထားသော မေးခွန်းများ
- [**Study Guide**](resources/study-guide.md) - လေ့ကျင့်ခန်း များအပြည့်အစုံ

### လက်တွေ့ အလုပ်ရုံများ
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - သင့် AI ဖြေရှင်းချက်များကို AZD ဖြင့် တပ်ဆင်နိုင်အောင် ပြင်ဆင်ခြင်း (2-3 နာရီ)
- [**Interactive Workshop**](workshop/README.md) - MkDocs နှင့် GitHub Codespaces အသုံးပြု၍ 8 မော်ဂျူး ဦးတည် လေ့ကျင့်ခန်းများ
  - မိတ်ဆက် → ရွေးချယ်ခြင်း → စစ်ဆေးခြင်း → ဖွဲ့စည်းမှု ခွဲခြမ်းခြင်း → သတ်မှတ်ခြင်း → ပုံစံပြင်ဆင်ခြင်း → ဖျက်သိမ်းခြင်း → အနှိပ်ချုပ်

### ပြင်ပ သင်ယူရေး အရင်းအမြစ်များ
- Azure Developer CLI Documentation: https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/
- Azure Architecture Center: https://learn.microsoft.com/en-us/azure/architecture/
- Azure Pricing Calculator: https://azure.microsoft.com/pricing/calculator/
- Azure Status: https://status.azure.com/

---

## 🔧 အမြန် ပြဿနာဖြေရှင်း အချက်ပြ

**အခြေခံ အမှားများနှင့် ချက်ချင်း ဖြေရှင်းနည်းများ**

<details>
<summary><strong>❌ "azd: command not found"</strong></summary>

```bash
# AZD ကို ပထမဦးစွာ တပ်ဆင်ပါ
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# တပ်ဆင်မှုကို စစ်ဆေးပါ
azd version
```
</details>

<details>
<summary><strong>❌ "No subscription found" or "Subscription not set"</strong></summary>

```bash
# အသုံးနိုင်သော စာရင်းသွင်းမှုများကို ပြပါ
az account list --output table

# ပုံမှန် စာရင်းသွင်းမှုကို သတ်မှတ်ပါ
az account set --subscription "<subscription-id-or-name>"

# AZD ပတ်ဝန်းကျင်အတွက် သတ်မှတ်ပါ
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# စစ်ဆေးပါ
az account show
```
</details>
<details>
<summary><strong>❌ "InsufficientQuota" သို့မဟုတ် "Quota exceeded"</strong></summary>

```bash
# တခြား Azure တိုင်းဒေသများကို စမ်းကြည့်ပါ
azd env set AZURE_LOCATION "westus2"
azd up

# သို့မဟုတ် ဖွံ့ဖြိုးရေးအတွက် ပိုသေးငယ်သော SKU များကို အသုံးပြုပါ
# infra/main.parameters.json ကို ပြင်ဆင်ပါ:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" အလယ်ပိုင်းမှာ မအောင်မြင်ပါ</strong></summary>

```bash
# ရွေးချယ်မှု 1: သန့်ရှင်းပြီး ထပ်မံကြိုးစားပါ
azd down --force --purge
azd up

# ရွေးချယ်မှု 2: အခြေခံအဆောက်အအုံကိုသာ ပြင်ဆင်ပါ
azd provision

# ရွေးချယ်မှု 3: အသေးစိတ် အခြေအနေကို စစ်ဆေးပါ
azd show

# ရွေးချယ်မှု 4: Azure Monitor တွင် မှတ်တမ်းများကို စစ်ဆေးပါ
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Authentication failed" သို့မဟုတ် "Token expired"</strong></summary>

```bash
# ပြန်လည် အတည်ပြုရန်
az logout
az login

azd auth logout
azd auth login

# အတည်ပြုခြင်းကို စစ်ဆေးပါ
az account show
```
</details>

<details>
<summary><strong>❌ "Resource already exists" သို့မဟုတ် နာမည် ပဋိပက္ခများ</strong></summary>

```bash
# AZD သည် မတူညီသော အမည်များကို ဖန်တီးသော်လည်း အမည်တိုက်ဆိုင်မှု ဖြစ်ပါက:
azd down --force --purge

# ထို့နောက် အသစ်သော ပတ်ဝန်းကျင်ဖြင့် ထပ်မံ ကြိုးစားပါ
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ ပုံစံ ဖြန့်ချိမှု အချိန်ပို ကြာနေသည်</strong></summary>

**ပျမ်းမျှ စောင့်ဆိုင်းချိန်များ:**
- ရိုးရိုး ဝက်ဘ် အက်ပ်: 5-10 မိနစ်
- ဒေတာဘေ့စ် ပါဝင်သော အက်ပ်: 10-15 မိနစ်
- AI အက်ပလီကေးရှင်းများ: 15-25 မိနစ် (OpenAI provisioning နှေးသည်)

```bash
# တိုးတက်မှုကို စစ်ဆေးပါ
azd show

# အတားအဆီးဖြစ်ပြီး ၃၀ မိနစ်ကျော်နေရင် Azure Portal ကို စစ်ဆေးပါ:
azd monitor
# မအောင်မြင်သော deployment များကို ရှာဖွေပါ
```
</details>

<details>
<summary><strong>❌ "Permission denied" သို့မဟုတ် "Forbidden"</strong></summary>

```bash
# သင့် Azure အခန်းကဏ္ဍကို စစ်ဆေးပါ
az role assignment list --assignee $(az account show --query user.name -o tsv)

# အနည်းဆုံး "Contributor" အခန်းကဏ္ဍလိုအပ်သည်
# သင့် Azure အက်မင်ထံ အောက်ပါခွင့်များပေးရန် တောင်းဆိုပါ:
# - Contributor (အရင်းအမြစ်များအတွက်)
# - User Access Administrator (အခန်းကဏ္ဍ သတ်မှတ်မှုများအတွက်)
```
</details>

<details>
<summary><strong>❌ ဖြန့်ချိပြီးသော အက်ပလီကေးရှင်း၏ URL ကို တွေ့မရပါ</strong></summary>

```bash
# ဝန်ဆောင်မှု endpoint အားလုံးကို ပြပါ
azd show

# သို့မဟုတ် Azure Portal ကို ဖွင့်ပါ
azd monitor

# သတ်မှတ်ထားသော ဝန်ဆောင်မှုကို စစ်ဆေးပါ
azd env get-values
# *_URL variables များကို ရှာပါ
```
</details>

### 📚 ပြဿနာဖြေရှင်းရေး အပြည်ပြည်ဆိုင်ရာ အရင်းအမြစ်များ

- **ပုံမှန် ပြဿနာများ လမ်းညွှန်:** [အသေးစိတ် ဖြေရှင်းချက်များ](docs/chapter-07-troubleshooting/common-issues.md)
- **AI-ဆိုင်ရာ ပြဿနာများ:** [AI ပြဿနာ ဖြေရှင်းခြင်း](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **အမှားရှာဖွေခြင်း လမ်းညွှန်:** [အဆင့်လိုက် အမှားရှာဖွေခြင်း](docs/chapter-07-troubleshooting/debugging.md)
- **ကူညီမှု ရယူရန်:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 သင်တန်း ပြီးမြောက်ခြင်းနှင့် လက်မှတ်ပြုခြင်း

### တိုးတက်မှု စောင့်ကြည့်ခြင်း
အခန်းတိုင်းအလိုက် သင်ယူမှု တိုးတက်မှုကို စောင့်ကြည့်ပါ။

- [ ] **အခန်း 1**: အခြေခံနှင့် အမြန်စတင်ခြင်း ✅
- [ ] **အခန်း 2**: AI-ဦးစားပေး ဖွံ့ဖြိုးရေး ✅  
- [ ] **အခန်း 3**: ချိန်ညှိခြင်း နှင့် အတည်ပြုခြင်း ✅
- [ ] **အခန်း 4**: အဆောက်အဦအဖြစ် ကုဒ် (IaC) နှင့် ဖြန့်ချီခြင်း ✅
- [ ] **အခန်း 5**: မူလ သုံးကောင် အေးဂျင့် AI ဖြေရှင်းချက်များ ✅
- [ ] **အခန်း 6**: ဖြန့်ချိမီ စစ်ဆေးခြင်း နှင့် စီမံကိန်း ✅
- [ ] **အခန်း 7**: ပြဿနာဖြေရှင်းခြင်း နှင့် အမှားရှာဖွေခြင်း ✅
- [ ] **အခန်း 8**: ထုတ်လုပ်မှု နှင့် စီးပွားရေး စံနည်းများ ✅

### သင်ယူမှု အတည်ပြုခြင်း
အခန်းတိုင်း ပြီးစီးပြီးပါက သင်၏ အသိပညာကို အတည်ပြုရန် -
1. **လက်တွေ့ လေ့ကျင့်ခန်း**: အခန်း၏ လက်တွေ့ ဖြန့်ချိမှုကို ပြီးမြောက်ပါ
2. **အသိပညာ စစ်ဆေးမှု**: သင့် အခန်းအတွက် FAQ အပိုင်းကို ပြန်လည်လေ့လာပါ
3. **အသိုင်းအဝိုင်း ဆွေးနွေးချက်**: သင့် အတွေ့အကြုံအား Azure Discord တွင် မျှဝေပါ
4. **နောက်ထပ် အခန်း**: နောက်တက်အဆင့်သို့ ရွှေ့ပါ

### သင်တန်း ပြီးမြောက်ခြင်း အကျိုးကျေးဇူးများ
ပြီးမြောက်သည့်အခါ သင်သည် ရရှိမည်များမှာ -
- **ထုတ်လုပ်မှု အတွေ့အကြုံ**: AI အက်ပလီကေးရှင်းများကို အမှန်တကယ် Azure သို့ ဖြန့်ချီထားသည်
- **ပရော်ဖက်ရှင်နယ် ကျွမ်းကျင်မှုများ**: စီးပွားရေးအသင့် ဖြန့်ချိခြင်း အတတ်ပညာများ  
- **အသိုင်းအဝိုင်း မှတ်သားမှု**: Azure developer community ၏ လှုပ်ရှားသော အဖွဲ့ဝင်
- **အလုပ်အကိုင် တိုးတက်ခြင်း**: တောင်းဆိုမှုများရှိသည့် AZD နှင့် AI ဖြန့်ချိခြင်း ကျွမ်းကျင်မှုများ

---

## 🤝 အသိုင်းအဝိုင်းနှင့် ထောက်ခံမှု

### ကူညီမှုနှင့် ထောက်ခံမှု ရယူရန်
- **နည်းပညာဆိုင်ရာ ပြဿနာများ**: [ဘတ်စ်များကို အစီရင်ခံပြီး လုပ်ဆောင်ချက်များ တောင်းဆိုရန်](https://github.com/microsoft/azd-for-beginners/issues)
- **သင်ယူရေး မေးခွန်းများ**: [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure) နှင့် [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI-ဆိုင်ရာ ကူညီမှု**: Join the [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **စာရွက်စာတမ်းများ**: [Official Azure Developer CLI documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Microsoft Foundry Discord မှ အသိုင်းအဝိုင်း အမြင်များ

**#Azure ချန်နယ်မှ နောက်ဆုံး စစ်တမ်း ရလဒ်များ:**
- **45%** ဖွံ့ဖြိုးရေးသူများသည် AI လုပ်ငန်းအတွက် AZD ကို အသုံးပြုချင်ကြသည်
- **ထိပ်ဆုံး စိန်ခေါ်မှုများ**: ဝန်ဆောင်မှု အများ ဖြန့်ချိခြင်း, ချရေးဒင်ရှယ် စီမံခန့်ခွဲမှု, ထုတ်လုပ်မှု အသင့်ရှိမှု  
- **အများဆုံး တောင်းဆိုထားသည့် အရာများ**: AI-ဆိုင်ရာ ပုံစံများ, ပြဿနာဖြေရှင်း လမ်းညွှန်များ, အကောင်းဆုံး လက်တွေ့ကျင့်သုံးချက်များ

**ကျွန်ုပ်တို့၏ အသိုင်းအဝိုင်းတွင် ပါဝင်ရန်:**
- သင့် AZD + AI အတွေ့အကြုံများ မျှဝေကာ ကူညီမှု ရယူပါ
- AI ပုံစံ အသစ်များ၏ ကြိုကြည့်မှုများကို ရယူပါ
- AI ဖြန့်ချိခြင်း အကောင်းဆုံး လက်တွေ့များတွင် ပါဝင်ဆောင်ရွက်ပါ
- အနာဂတ် AI + AZD လက္ခဏာ ဖွံ့ဖြိုးတိုးတက်ရေးကို သက်ရောက်စေပါ

### သင်တန်းသို့ အထောက်အပံ့ ပေးခြင်း
ကျွန်ုပ်တို့သည် အထောက်အပံ့များကို ကြိုဆိုပါသည်! အသေးစိတ်အချက်အလက်များအတွက် ကျေးဇူးပြု၍ [Contributing Guide](CONTRIBUTING.md) ကို ဖတ်ပါ -
- **အကြောင်းအရာ တိုးတက်စေခြင်း**: ရှိပြီးသား အခန်းများနှင့် ဥပမာများအား မြှင့်တင်ခြင်း
- **ဥပမာ အသစ်များ**: တကယ့်ကမ္ဘာ အခြေအနေများနှင့် ပုံစံများ ထည့်သွင်းခြင်း  
- **ဘာသာပြန်ခြင်း**: ဘာသာစကား မျိုးစုံ ထောက်ပံ့မှု ထိန်းသိမ်းရန် ကူညီခြင်း
- **အမှား အစီရင်ခံစာများ**: မှန်ကန်မှုနှင့် ဖော်ပြချက်ကို တိုးတက်စေခြင်း
- **အသိုင်းအဝိုင်း စံနှုန်းများ**: ကျွန်ုပ်တို့၏ ဖက်ဖက်ကောင်းမှု အသိုင်းအဝိုင်း လမ်းညွှန်ချက်များကို လိုက်နာခြင်း

---

## 📄 သင်တန်း အချက်အလက်

### လိုင်စင်
ဤ ပရောဂျက်သည် MIT License အောက်တွင် လိုင်စင်ပြုထားပါသည် - အသေးစိတ်အချက်အလက်များအတွက် [LICENSE](../../LICENSE) ဖိုင်ကို ကြည့်ပါ။

### Microsoft သင်ယူရေး အရင်းအမြစ်များ (ဆက်စပ်)

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j အတွက် စတင်လေ့လာသူများ](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js အတွက် စတင်လေ့လာသူများ](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain အတွက် စတင်လေ့လာသူများ](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agents
[![AZD အတွက် စတင်လေ့လာသူများ](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI အတွက် စတင်လေ့လာသူများ](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP အတွက် စတင်လေ့လာသူများ](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Agents အတွက် စတင်လေ့လာသူများ](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Generative AI Series
[![Generative AI အတွက် စတင်လေ့လာသူများ](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generative AI (.NET) အတွက် စတင်လေ့လာသူများ](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generative AI (Java) အတွက် စတင်လေ့လာသူများ](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generative AI (JavaScript) အတွက် စတင်လေ့လာသူများ](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Core Learning
[![ML အတွက် စတင်လေ့လာသူများ](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science အတွက် စတင်လေ့လာသူများ](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI အတွက် စတင်လေ့လာသူများ](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersecurity အတွက် စတင်လေ့လာသူများ](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web Dev အတွက် စတင်လေ့လာသူများ](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT အတွက် စတင်လေ့လာသူများ](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR Development အတွက် စတင်လေ့လာသူများ](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot Series
[![Copilot for AI Paired Programming အတွက် စတင်လေ့လာသူများ](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot for C#/.NET အတွက် စတင်လေ့လာသူများ](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Adventure အတွက် စတင်လေ့လာသူများ](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ သင်တန်း လမ်းညွှန်

**🚀 သင်ယူစတင်ရန် အဆင်သင့်ပါသလား?**

**စတင်လေ့လာသူများ**: [အခန်း ၁: အခြေခံနှင့် အမြန်စတင်ခြင်း](../..) မှ စတင်ပါ  
**AI ဖွံ့ဖြိုးရေးသူများ**: [အခန်း ၂: AI-ပထမ ဦးစားပေး ဖွံ့ဖြိုးရေး](../..) သို့ သွားပါ  
**အတွေ့အကြုံရှိ ဖွံ့ဖြိုးရေးသူများ**: [အခန်း ၃: ဆက်တင်နှင့် အတည်ပြုမှု](../..) မှ စတင်ပါ

**နောက်ထပ် အဆင့်များ**: [အခန်း ၁ စတင်ပါ - AZD အခြေခံများ](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
သတိပေးချက်:
ဤစာရွက်ကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ဖြင့် ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှန်ကန်မှုအတွက် ကြိုးစားပါသော်လည်း အလိုအလျောက် ဘာသာပြန်ချက်များတွင် အမှားများ သို့မဟုတ် မမှန်ကန်မှုများ ပါဝင်နိုင်သည်ကို သတိပြုပါ။ မူလစာရွက်ကို မူလဘာသာဖြင့်ရှိသော အာဏာပိုင်ရင်းမြစ်အဖြစ် သတ်မှတ်သင့်ပါသည်။ အရေးကြီးသော အချက်အလက်များအတွက် ပရော်ဖက်ရှင်နယ် လူသားဘာသာပြန်သူမှ ဘာသာပြန်ပေးရန် အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုခြင်းကြောင့် ဖြစ်ပေါ်နိုင်သည့် နားလည်မှုချင်း မကျေမနပ်မှုများ သို့မဟုတ် မှားယွင်းသော ဖော်ပြချက်များအတွက် ကျွန်ုပ်တို့သည် တာဝန်မယူပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->