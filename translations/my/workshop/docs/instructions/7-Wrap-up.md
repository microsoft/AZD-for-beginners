# 7. အကျဉ်းချုပ်နှင့် နောက်လှုပ်ရှားချက်များ

!!! tip "အဓိက ယူဆရမည့် အချက်များ"

    - [ ] AZD templates accelerate AI application development from days to hours
    - [ ] The Discovery → Deployment → Customization methodology provides a structured learning path
    - [ ] GitHub Copilot with MCP servers enables natural language exploration of complex codebases
    - [ ] Microsoft Foundry provides built-in observability, evaluation, and security testing

---

## 1. သင် အောင်မြင်ခဲ့သည်များ

ဂုဏ်ပြုပါသည်! ဤ workshop တွင် သင် အောင်မြင်စွာ ပြီးမြောက်ခဲ့သည်များမှာ -

| Module | Accomplishment |
|:---|:---|
| **Module 1** | Azure Developer CLI ကို ရှာဖွေတွေ့ရှိပြီး AI template တစ်ခုကို ရွေးချယ်ခဲ့သည် |
| **Module 2** | တစ်ထောင်ပြည့်စုံသော AI agents ဖြေရှင်းချက်ကို တပ်ဆင်ပြီး အတည်ပြုခဲ့သည် |
| **Module 3** | တမ်းပလိတ်ကို ခွဲခြမ်းစိတ်ဖြာ၍ ၎င်း၏ ဖွဲ့စည်းပုံကို နားလည်ခဲ့သည် |
| **Module 4** | `azure.yaml` ဖိုင်၏ ဆက်တင်များနှင့် lifecycle hooks များကို ရှာဖွေစူးစမ်းခဲ့သည် |
| **Module 5** | သင်၏ အခြေအနေအတွက် တမ်းပလိတ်ကို ကိုက်ညီအောင် အပြုအမူ ပြင်ဆင်ခဲ့သည် |
| **Module 6** | အခြေခံအဆောက်အအုံများကို လုံခြုံစွာ ချေဖျက်၍ အရင်းအမြစ်များကို စီမံခန့်ခွဲခဲ့သည် |

---

## 2. သင် ကျွမ်းကျင်ခဲ့သော အဓိက အယူအဆများ

### Azure Developer CLI (azd)
- `azd init` - တမ်းပလိတ်များမှ စီမံကိန်းများကို စတင်ဖန်တီးသည်
- `azd up` - Provision နှင့် deploy ကို တစ်ချက်တည်းတွင် ဆောင်ရွက်သည်
- `azd env` - ပတ်ဝန်းကျင်ဆက်တင်များ (environment variables) ကို စီမံခန့်ခွဲသည်
- `azd down` - အရင်းအမြစ်များကို လုံခြုံစွာ ဖျက်ပစ်၍ ရှင်းလင်းသည်

### AZD Template Structure
- `azure.yaml` - ဆက်တင်များနှင့် တပ်ဆင်မှု hooks များ
- `infra/` - Bicep ဖြင့် infrastructure-as-code
- `src/` - အက်ပလီကေးရှင်း မူရင်း ကုဒ်
- `scripts/` - အလိုအလျောက်လုပ်ဆောင်ခြင်းနှင့် တပ်ဆင်ခြင်း စကရစ်ပ်များ

### Microsoft Foundry Capabilities
- ဉာဏ်ရည်ရှိသော အကူအညီများ (intelligent assistants) အတွက် AI Agent Service
- အသိပညာ ရှာဖွေရန် File Search နှင့် Azure AI Search
- အတွင်းသို့ ထည့်သွင်းထားသည့် tracing, monitoring နှင့် အကဲဖြတ်မှုများ
- AI လုံခြုံရေး အတည်ပြုရန် Red teaming

---

## 3. သင်၏ သင်ယူရေး ခရီးကို ဆက်လုပ်ပါ

### အကြံပြုသော နောက်ထပ် လှုပ်ရှားရန် အဆင့်များ

| Path | Resource | Time |
|:---|:---|:---|
| **Complete Course** | [AZD for Beginners Curriculum](../../README.md) | 8-12 hours |
| **Try Another Template** | [Microsoft Foundry Templates](https://ai.azure.com/templates) | 1-2 hours |
| **Deep Dive** | [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/) | Ongoing |
| **Community** | [Azure Discord](https://aka.ms/foundry/discord) | Join today! |

### Suggested Templates to Try Next

1. **[Get Started with AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat)** - သင့်ဒေတာဖြင့် အခြေခံ စကားပြော
2. **[Azure Search OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** - တိုးတက်သော RAG ပုံစံများ
3. **[Contoso Chat](https://github.com/Azure-Samples/contoso-chat)** - စီးပွားရေး လက်လီ အခြေအနေများ

---

## 4. Workshop စိန်ခေါ်မှု

သင့်ကျွမ်းကျင်မှုကို စမ်းသပ်ရန် အသင့်ပါပြီလား? ဤ စိန်ခေါ်မှုများကို ကြိုးစားကြည့်ပါ။

| Challenge | Description | Difficulty |
|:---|:---|:---|
| **1. Multi-Agent Scenario** | မတူညီသော စက်မှုလုပ်ငန်းအတွက် (ဥပမာ - ကျန်းမာရေး၊ ငွေကြေး) တပ်ဆင်ပြီး သင့်လိုအပ်ချက်အတိုင်း ပြင်ဆင်ပါ | ⭐⭐ |
| **2. Custom Knowledge Base** | သင့်ကိုယ်ပိုင် ဒေတာဖိုင်များ ထည့်သွင်းပြီး ကိုယ်ပိုင် ရှာဖွေရေး အညွှန်းစာရင်း တည်ဆောက်ပါ | ⭐⭐⭐ |
| **3. Production Deployment** | `azd pipeline config` ကို အသုံးပြုပြီး GitHub Actions ဖြင့် CI/CD ကို တပ်ဆင်ပါ | ⭐⭐⭐⭐ |

---

## 5. သင့် သုံးသပ်ချက် မျှဝေပါ

သင့်တုံ့ပြန်ချက်များက ဤ workshop ကို တိုးတက်အောင် ကူညီပေးပါသည်။

- **GitHub Issues**: [Post feedback](https://github.com/microsoft/azd-for-beginners/issues) - `Workshop` အဖြစ် tag ထည့်ပါ
- **Discord**: ဝင်ရောက်ပါ [Microsoft Foundry Discord](https://aka.ms/foundry/discord) - `#get-help` တွင် post ပေးပါ
- **Contributions**: Pull requests တင်၍ သင်တန်းကို တိုးတက်အောင် ကူညီပါ!

---

## ကျေးဇူးတင်ပါတယ်! 🎉

AZD for AI Developers Workshop ကို ပြီးမြောက်စွာ ပြုလုပ်ပေးချိန်အတွက် ကျေးဇူးတင်ပါသည်။ ဤ အတွေ့အကြုံသည် Azure ပေါ်တွင် AI အက်ပလီကေးရှင်းများကို တည်ဆောက်ခြင်းနှင့် တပ်ဆင်ခြင်းအတွက် လိုအပ်သော ကျွမ်းကျင်မှုနှင့် ယုံကြည်မှု ပေးပို့နိုင်ခဲ့သည်ဟု မျှော်လင့်မိပါသည်။

**ဆက်လက်တည်ဆောက်ပါ၊ ဆက်လက်လေ့လာပါ၊ Azure AI developer အသိုင်းအဝိုင်းသို့ မင်္ဂလာပါ!**

---

| | |
|:---|:---|
| **📚 သင်တန်း မူလစာမျက်နှာ** | [AZD For Beginners](../../README.md) |
| **📖 စာတမ်းများ** | [Azure Developer CLI Docs](https://learn.microsoft.com/azure/developer/azure-developer-cli/) |
| **🛠️ AI တမ်းပလိတ်များ** | [Microsoft Foundry Templates](https://ai.azure.com/templates) |
| **💬 အဖွဲ့အစည်း** | [Azure Discord](https://aka.ms/foundry/discord) |

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
အသိပေးချက်:

ဤစာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှုဖြစ်သည့် [Co-op Translator](https://github.com/Azure/co-op-translator) ကို အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်တော်/ကျွန်မတို့သည် တိကျမှန်ကန်ရေးအတွက် ကြိုးစားပေမယ့် အလိုအလျောက် ဘာသာပြန်ချက်များတွင် အမှားများ သို့မဟုတ် မမှန်ကန်သည့် အချက်အလက်များ ပါဝင်နိုင်ကြောင်း သတိပြုပါ။ မူလစာတမ်းကို မူလဘာသာဖြင့် ရရှိသော အာဏာပိုင် ရင်းမြစ်အဖြစ် ယူဆသင့်သည်။ အရေးကြီးသော အချက်အလက်များအတွက် ပရော်ဖက်ရှင်နယ် လူ့ဘာသာပြန်သူမှ ဘာသာပြန်ခြင်းကို အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုမှုကြောင့် ဖြစ်ပေါ်လာသည့် နားမလည်မှုများ သို့မဟုတ် မှားယွင်းဖော်ပြချက်များအတွက် ကျွန်တော်/ကျွန်မတို့ တာဝန်မယူပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->