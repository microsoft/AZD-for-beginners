# 1. Template တစ်ခု ရွေးချယ်ပါ

!!! tip "ဤမော်ジュူး အဆုံးတွင် သင် လုပ်နိုင်မည့်အရာများ"

    - [ ] AZD ပုံစံများ ဆိုတာဘာလဲ ဆိုတာ ဖော်ပြနိုင်မည်
    - [ ] AI အတွက် AZD ပုံစံများကို ရှာဖွေ အသုံးပြုနိုင်မည်
    - [ ] AI Agents ပုံစံနှင့် စတင် လေ့လာနိုင်မည်
    - [ ] **Lab 1:** Codespaces သို့မဟုတ် dev container တွင် AZD Quickstart

---

## 1. ဆောက်လုပ်သူနှင့် နှိုင်းယှဉ်ချက်

စဉ်ဆက်မပြတ် အနောက်ဧရိယာ အသစ်တည်ဆောက်ရန်လိုအပ်သည့် မော်ဒန် စီးပွားရေး အသင့် AI အက်ပလီကေးရှင်းကို _အစမှ စတင်_ မှာတည်ဆောက်ဖို့ အခြေအနေသည် အတော်ခက်ခဲနိုင်သည်။ ဒါဟာ ကိုယ့်အိမ်ကို ကိုယ့်ဘက်က ဘရစ်ရေ့း ညီမျှတစွာ တည်ဆောက်နေသလို ဖြစ်နိုင်ပါတယ်။ ဟုတ်ပါတယ်၊ ပြုလုပ်လို့ ရပါတယ်။ သို့သော် လိုချင်တဲ့ အပြီးရလဒ်ရဖို့ အထိရောက်ဆုံးနည်းလမ်း မဟုတ်ပါဘူး။

မဟုတ်ရင်၊ ကျွန်တော်တို့ အများအားဖြင့် ရှိပြီးသား _ဒီဇိုင်း အကွက်ပြကျမ်း_ တစ်ခုနဲ့ စတင်ပြီး အောက်စီတက္ဘ်နောက်တွေကို ကိုယ့်လိုအပ်ချက်အရ ပြင်ဆင်ရန် ကြံဆလိုက်တယ်။ အဲဒါကို ဆောက်လှရေး အင်ဂျင်နီယာနဲ့ ပြင်ဆင်သလိုပင် အချက်အလက်ပိုင်ဆိုင်မှုအဖြစ် လုပ်ဆောင်ရပါတယ်။ ဉပမာအားဖြင့် ဉာဏ်ရည်ပြည့်ဝသော ထုတ်ကုန်များ တည်ဆောက်လိုတဲ့အခါ၌လည်း အဲဒီနည်းလမ်းကို သုံးပါ။ အရင်ဆုံး သင့်ပြဿနာဧရိယာနှင့် ကိုက်ညီတဲ့ ดีဇိုင်းစနစ်ကို ရှာပါ။ ထို့နောက် ဖြေရှင်းချက် အင်ဂျင်နီယာနှင့် တွေ့ဆုံပြီး သင့်အခြေအနေအတွက် အထူးပြင်ဆင်ပါ။

ဒါပေမယ့် ဒီဒီဇိုင်းပြဇပုံများကို ဘယ်မှာ ရှာမလဲ? ပြင်ဆင်နည်းလမ်းတွေကို သင်ကိုယ်တိုင် သင်ကြားပေးနိုင်မယ့် အင်ဂျင်နီယာကို ဘယ်လိုရှာမလဲ? ဤ workshop တွင် အောက်ပါ နည်းပညာသုံးခုကို မိတ်ဆက်ပြီး အဖြေတွေကို ပေးမှာ ဖြစ်ပါတယ်။

1. [Azure Developer CLI](https://aka.ms/azd) - လော့ခ်စ်-အော့ပင်စွဲ ရိုးရှင်းတဲ့ အရာတစ်ခုဖြစ်ပြီး local ဖန်တီးမှု (build) မှ cloud သို့ တင်ပို့ခြင်း (ship) အထိ developer အတွက် လမ်းကြောင်းကို မြန်ဆန်စေသည်။
1. [Microsoft Foundry Templates](https://ai.azure.com/templates) - sample ကုဒ်၊ လုပ်ငန်းအင်ဖြာစထရတ်ချာနှင့် ဖိုင်များပါဝင်ပြီး AI ဖြေရှင်းချက် စီမံခန့်ခွဲမှု အတွက် စံနမူနာ open-source repository များ။
1. [GitHub Copilot Agent Mode](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode) - Azure ဗဟုသုတနှင့် အခြေခံထားသော ကုဒ်ရေးခြင်း အိပ်များကို ဦးဆောင်ပေးနိုင်သည့် coding agent တစ်ခုဖြစ်ပြီး codebase ကို လမ်းပြပေးခြင်း၊ ပြင်ဆင်မှုများ ပြုလုပ်ရာတွင် သဘာဝဘာသာဖြင့် ညွှန်ကြားနိုင်သည်။

ဤကိရိယာများနှင့်အတူ အမှန်တကယ် သင့်လိုအပ်သည့် template ကို _ရှာဖွေ_၊ အလုပ်လုပ်မှုကို _deploy_ လုပ်ပြီး စစ်ဆေး၊ ထို့နောက် သင့် အခြေအနေများအတွက် _ပြင်ဆင်_ လုပ်နိုင်ပါပြီ။ အခုတော့ ယင်းတို့ ဘယ်လို လုပ်ဆောင်ကြောင်း သင်ယူကြမယ်။

---

## 2. Azure Developer CLI

The [Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) (or `azd`) သည် open-source command-line ကိရိယာတစ်ခုဖြစ်ပြီး IDE (development) နှင့် CI/CD (devops) ပတ်ဝန်းကျင်များတွင် တစ်ခုတည်းတည်းလုပ်ဆောင်နိုင်သည့် developer-friendly command များဖြင့် သင့် code-to-cloud ခရီးကို မြန်ဆန်စေနိုင်သည်။

`azd` ဖြင့် သင့် deployment ခရီးကို အလွယ်တကူ အောက်ပါအတိုင်း ပြုလုပ်နိုင်ပါသည်။

- `azd init` - ရှိပြီးသား AZD ပုံစံမှ AI ပရိုက်ဂျက်အသစ်ကို စတင်ဖန်တီးသည်။
- `azd up` - အဆောက်အအုံ ကို provision လုပ်၍ သင့် application ကို တစ်ချက်တည်း နဲ့ deploy လုပ်ပေးသည်။
- `azd monitor` - သင့် deployed application အတွက် အချိန်နဲ့တပြေးညီ စောင့်ကြည့်မှုနှင့် ဗဟိုပြု ပြသာနာရှာဖွေမှုကို ရယူရန်။
- `azd pipeline config` - Azure သို့ လွယ်ကူစွာ အလိုအလျောက် တင်ပို့ရန် CI/CD pipeline များကို သတ်မှတ်ရန်။

**🎯 | EXERCISE**: <br/> လက်ရှိ workshop ပတ်ဝန်းကျင်တွင် `azd` command-line ကိရိယာကို ရှာဖွေ လေ့လာပါ။ ၎င်းသည် GitHub Codespaces, dev container သို့မဟုတ် prerequisite များတပ်ဆင်ထားသော local clone တစ်ခု ဖြစ်နိုင်သည်။ ကိရိယာ၏ လုပ်ဆောင်ချက်များကို ကြည့်ရှုရန် အောက်ပါ command ကို ရိုက်ထည့်ပါ။

```bash title="" linenums="0"
azd help
```

![စီးဆင်းမှု](../../../../../translated_images/my/azd-flow.19ea67c2f81eaa66.webp)

---

## 3. AZD ပုံစံ

`azd` သည် မည်သည့် infrastructure ကို provision လုပ်မည်၊ မည်သည့် configuration ကို သတ်မှတ်မည်နှင့် မည်သည့် application ကို deploy လုပ်မည်ဆိုတာကို သိရှိရမည်။ ဤနေရာတွင် [AZD templates](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates?tabs=csharp) များ ပါဝင်သည်။

AZD ပုံစံများသည် sample ကုဒ်များနှင့် deployment အင်ဖရာစထရတ္ချာနှင့် configuration ဖိုင်များကို ပေါင်းစည်းထားသည့် open-source repository များဖြစ်သည်။
_Infrastructure-as-Code_ (IaC) နည်းလမ်းကို အသုံးပြုခြင်းအားဖြင့် template resource သတ်မှတ်ချက်များနှင့် configuration ဆက်တင်များကို မူရင်း app source code ကဲ့သို့ version-control အောက်တွင် ထိန်းသိမ်းနိုင်ခြင်းဖြင့် ထပ်မံအသုံးပြုနိုင်၍ အသုံးပြုသူများအကြား တိကျပြီး တူညီသော workflow များကို ဖန်တီးပေးသည်။

သင့်၏ အခြေအနေအတွက် AZD ပုံစံတစ်ခုကို ဖန်တီးရန် သို့မဟုတ် ပြန်အသုံးပြုရန် အပြီးတွင် အောက်ပါ မေးခွန်းများကို စဉ်းစားပါ။

1. မင်းဘာကို တည်ဆောက်နေတယ်လဲ? → အဲဒီအခြေအနေအတွက် starter ကုဒ်ပါဝင်သည့် ပုံစံ ရှိပါသလား?
1. မင်းရဲ့ ဖြေရှင်းချက်ကို ဘယ်လိုဒီဇိုင်းထားထားလဲ? → လိုအပ်သည့် resource များပါဝင်သည့် ပုံစံ ရှိပါသလား?
1. မင်းရဲ့ ဖြေရှင်းချက်ကို ဘယ်လို deploy လုပ်မလဲ? → pre/post-processing hooks များနှင့်အတူ `azd deploy` အကြောင်းကို စဉ်းစားပါ!
1. နောက်ထပ် ဘာတွေကောင်းမြင်အောင် အဆင်ပြေစေမလဲ? → built-in monitoring နှင့် automation pipeline များကို စဉ်းစားပါ!

**🎯 | EXERCISE**: <br/> 
[Awesome AZD](https://azure.github.io/awesome-azd/) ဂိတ်လီရီကို သွားရောက်ပြီး filter များကို အသုံးပြု၍ လက်ရှိ များစွာရှိသည့် 250+ template များကို ရှာဖွေကြည့်ပါ။ သင့် အခြေအနေလိုအပ်ချက်နှင့် ကိုက်ညီသောတစ်ခု ရနိုင်မရှိ စစ်ဆေးပါ။

![ကုဒ်](../../../../../translated_images/my/azd-code-to-cloud.2d9503d69d3400da.webp)

---

## 4. AI အက်ပ်ပလီကေးရှင်း ပုံစံများ

AI လက်ဆောင်ထားသော applications များအတွက် Microsoft သည် **Microsoft Foundry** နှင့် **Foundry Agents** ပါဝင်သည့် အထူးပြု template များကို ကမ်းလှမ်းပေးသည်။ ဤပုံစံများက သင့်အား အသိမမောင်း၍ အသုံးချနိုင်သည့်၊ ထုတ်လုပ်ရန် အသင့်ရှိသော အက်ပလီကေးရှင်းများ တည်ဆောက်ရန် လမ်းကြောင်းကို မြန်ဆန်စေပါသည်။

### Microsoft Foundry & Foundry Agents Templates

အောက်ပါ ပုံစံများထဲမှ တစ်ခုကို ရွေးချယ်၍ deploy လုပ်နိုင်သည်။ တစ်ခုချင်းစီကို [Awesome AZD](https://azure.github.io/awesome-azd/) တွင် ရနိုင်ပြီး တစ်ချက်ဆင့် `azd init` command ဖြင့် သင်၏ပရိုက်ဂျက်ကို initialize လုပ်နိုင်သည်။

| Template | Description | Deploy Command |
|----------|-------------|----------------|
| **[AI Chat with RAG](https://azure.github.io/awesome-azd/?tags=ai&tags=rag)** | Microsoft Foundry ကို အသုံးပြုပြီး Retrieval Augmented Generation ဖြင့် စကားပြော အက်ပလီကေးရှင်း | `azd init -t azure-samples/azure-search-openai-demo` |
| **[Foundry Agent Service Starter](https://azure.github.io/awesome-azd/?tags=ai&tags=agents)** | Foundry Agents ဖြင့် အလိုအလျောက် လုပ်ငန်းများ အတွက် AI agents တည်ဆောက်ရန် စတาร์တာပုံစံ | `azd init -t azure-samples/foundry-agent-service-starter` |
| **[Multi-Agent Orchestration](https://azure.github.io/awesome-azd/?tags=ai&tags=agents)** | ရှုပ်ထွေးသော workflow များအတွက် မျိုးစုံ Foundry Agents များကို လုပ်ကိုင်စည်းလုံးစေခြင်း | `azd init -t azure-samples/multi-agent-orchestration` |
| **[AI Document Intelligence](https://azure.github.io/awesome-azd/?tags=ai&tags=document)** | Microsoft Foundry မော်ဒယ်များနှင့် စာရွက်စာတမ်းများကို ထုတ်ယူ စစ်တမ်းခွဲခြင်း | `azd init -t azure-samples/ai-document-processing` |
| **[Conversational AI Bot](https://azure.github.io/awesome-azd/?tags=ai&tags=bot)** | Microsoft Foundry ပေါင်းစည်းထားသည့် အဖြေပြောစရာ chatbot များ တည်ဆောက်ရန် | `azd init -t azure-samples/ai-chat-protocol` |
| **[AI Image Generation](https://azure.github.io/awesome-azd/?tags=ai&tags=dalle)** | Microsoft Foundry မှ DALL-E ကို အသုံးပြုပြီး ပုံများ ဖန်တီးခြင်း | `azd init -t azure-samples/ai-image-generation` |
| **[Semantic Kernel Agent](https://azure.github.io/awesome-azd/?tags=ai&tags=semantic-kernel)** | Foundry Agents နှင့် ပေါင်းစပ်သည့် Semantic Kernel အသုံးပြုသော AI agents များ | `azd init -t azure-samples/semantic-kernel-agent` |
| **[AutoGen Multi-Agent](https://azure.github.io/awesome-azd/?tags=ai&tags=autogen)** | AutoGen framework ကို အသုံးပြုသော မျိုးစုံ agent စနစ်များ | `azd init -t azure-samples/autogen-multi-agent` |

### အမြန်စတင်

1. **ပုံစံများကို ကြည့်ရှုပါ**: [https://azure.github.io/awesome-azd/](https://azure.github.io/awesome-azd/) ကို သွားရောက်၍ `AI`, `Agents`, သို့မဟုတ် `Microsoft Foundry` ဖြင့် filter ထားပါ
2. **သင့်ပုံစံကို ရွေးချယ်ပါ**: သင့် အမှုအတွက် ကိုက်ညီသည့် တစ်ခုကို ရွေးပါ
3. **Initialize လုပ်ပါ**: ရွေးချယ်ထားသော ပုံစံအတွက် `azd init` command ကို အလုပ်ပေးပါ
4. **Deploy လုပ်ပါ**: provision လုပ်၍ deploy အောင် `azd up` ကို 실행 အုပ်ပါ

**🎯 | EXERCISE**: <br/>
အထက် ဖော်ပြထားသော ပုံစံများထဲမှ သင့် အခြေအနေအရ တစ်ခုကို ရွေးချယ်ပါ။

- **chatbot တည်ဆောက်မလား?** → **AI Chat with RAG** သို့မဟုတ် **Conversational AI Bot** ဖြင့် စတင်ပါ
- **အလိုအလျောက် agents လိုအပ်ပါသလား?** → **Foundry Agent Service Starter** သို့မဟုတ် **Multi-Agent Orchestration** ကို စမ်းကြည့်ပါ
- **စာရွက်စာတမ်းများကို ကောက်ယူ ဆန်းစစ်လိုပါသလား?** → **AI Document Intelligence** ကို အသုံးပြုပါ
- **AI ကုဒ်ရေးရာ အကူအညီ လိုချင်ပါသလား?** → **Semantic Kernel Agent** သို့မဟုတ် **AutoGen Multi-Agent** ကို စူးစမ်းပါ

```bash title="Example: Deploy the AI Chat with RAG template" linenums="0"
azd init -t azure-samples/azure-search-openai-demo
azd up
```

!!! info "နမူနာများကို ပိုမိုရှာဖွေပါ"
    The [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) contains 250+ templates. Use the filters to find templates matching your specific requirements for language, framework, and Azure services.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**တာဝန်ပယ်ချခြင်း**:
ဤစာရွက်စာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ဖြင့် ဘာသာပြန်ထားခြင်း ဖြစ်ပါသည်။ ကျွန်တော်တို့သည် တိကျမှန်ကန်မှုအပေါ် မျိုးမြင်သမျှ ကြိုးစားနေသော်လည်း၊ အလိုအလျောက် ဘာသာပြန်ခြင်းများတွင် အမှားများ သို့မဟုတ် မှားယွင်းချက်များ ပါဝင်နိုင်ကြောင်း သိရှိထားရန် လိုအပ်ပါသည်။ မူရင်းစာတမ်းကို ထိုဘာသာစကားဖြင့် မူရင်းအတိုင်း အတည်ပြု အရင်းအမြစ်အဖြစ် တွက်ချက်သင့်ပါသည်။ အရေးပါသော အချက်အလက်များအတွက် သက်ဆိုင်ရာ ပရော်ဖက်ရှင်နယ် လူသားဘာသာပြန် အကူအညီကို အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုထားမှ ဖြစ်ပေါ်လာသည့် နားမလည်မှုများ သို့မဟုတ် မှားလွဲဖော်ပြချက်များအပေါ် ကျွန်တော်တို့ သာမန် တာဝန်မခံပါကြောင်း အကြောင်းကြားပါသည်။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->