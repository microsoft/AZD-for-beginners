# AZD for AI Developers Workshop

> `azd 1.23.12` အတွက် 2026 မတ်တွင် စစ်ဆေးပြီး အတည်ပြုပြီးပါပြီ။

> [!IMPORTANT]  
> **ဤ ဝေါ့ခမ်းရှုပ် (workshop) သည် သင့် လက်ရှိ browser တွင် ကြိုမြင်ရှုကြည့်ရန် အလုပ်လုပ်နိုင်သော workshop လမ်းညွှန်ဖြင့် စီစဉ်ထားပါသည်။ စတင်ရန် GitHub Codespaces, dev container သို့မဟုတ် MkDocs ထည့်သွင်းထားသော local clone တွင် repo ကိုဖွင့်ပြီး—Active VS Code terminal ကိုမြင်သည်ထိ မျှော်လင့်ကြည့်ပြီး နောက်ထပ် ရိုက်ရမည့်အချက်မှာ:**  
> `mkdocs serve > /dev/null 2>&1 &`  
> **browser တစ်ခုတွင် preview စာမျက်နှာ ဖွင့်ရန် pop-up dialog တက်လာမည်ကို ပြသပါလိမ့်မည်။**

Azure Developer CLI (AZD) ကို AI application ဖျော်ဖြေရေး အာရုံစိုက်၍ လက်တွေ့ လေ့လာနိုင်ရန် သင်၏ လက်တွဲ လက်တွေ့ workshop တက်ရောက်ရန် ကြိုဆိုပါသည်။ ဤ workshop သည် AZD templates များကို အောက်ပါ 3 ချောင်းအတိုင်း လေ့လာရန် ကူညီပေးပါသည်။

1. **ရှာဖွေခြင်း (Discovery)** - သင့်အတွက် သင့်တော်သော template ကို ရှာဖွေပါ။
1. **တပ်ဆင်ခြင်း (Deployment)** - တပ်ဆင်ပြီး အလုပ်လုပ်မှုကို အတည်ျပုပါ။
1. **စိတ်ကြိုက်ပြင်ဆင်ခြင်း (Customization)** - ပြင်ဆင်ပြီး သင့်အတိုင်း ပြုလုပ်ပါ။

ဤ workshop အတွင်း သင်သည် core developer tools များနှင့် workflow များကိုလည်း မိတ်ဆက်ခံရပြီး အဆုံးမှအဆုံး အနေဖြင့် ဖွံ့ဖြိုးတိုးတက်ရေး ခရီးစဉ်ကို လျှင်မြန်စွာ ဆောင်ရွက်နိုင်ရန် ကူညီပေးပါမည်။

| | | 
|:---|:---|
| **📚 Course Home**| [AZD For Beginners](../README.md)|
| **📖 Documentation** | [Get started with AI templates](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️AI Templates** | [Microsoft Foundry Templates](https://ai.azure.com/templates) |
|**🚀 Next Steps** | [Take The Challenge](#workshop-challenge) |
| | |

## Workshop Overview

**ကြာချိန်:** 3-4 နာရီ  
**အဆင့်:** အစခံမှ အလယ်အလတ်အထိ  
**လိုအပ်သော ကြိုတင် အခြေခံความรู้:** Azure, AI concepts, VS Code နှင့် command-line tools အခြေခံကို သိရှိမှုရှိပါက အသင့်ဖြစ်ပါသည်။

ဤသည်မှာ လက်တွဲလုပ်ဆောင်၍ သင်ယူနိုင်သော workshop ဖြစ်သည်။ အလုပ်လေ့ကျင့်ခန်းများကို ပြီးမြောက်လိုက်ပါက AZD For Beginners အား ပြန်လည်ဆန်းစစ်၍ Security နှင့် Productivity အကောင်းဆုံး လုပ်ထုံးလုပ်နည်းများ သင်ယူဖြည့်စွက်ရန် အကြံပြုပါသည်။

| Time| Module  | Objective |
|:---|:---|:---|
| 15 mins | Introduction | အခြေခံ အတိုင်းအတာများ ပြင်ဆင်၊ ရည်မှန်းချက်များ သိရှိစေရန် |
| 30 mins | Select AI Template | ရွေးချယ်စရာများ စုံစမ်း၍ စတาร์တာ ကို ရွေးချယ်ရန် | 
| 30 mins | Validate AI Template | မူရင်း ဖြေရှင်းချက်ကို Azure သို့ တပ်ဆင်၍ အလုပ်လုပ်မှု အတည်ပြုရန် |
| 30 mins | Deconstruct AI Template | ဖျက်စီး ဖွဲ့စည်းပုံနှင့် ဖောင်ဖော်ကို လေ့လာရန် |
| 30 mins | Configure AI Template | လက်ရှိ feature များကို အသုံးပြုရန် ဖွင့်တင်ရန် |
| 30 mins | Customize AI Template | သင့်လိုအပ်ချက်များအတိုင်း template ကို ကိုက်ညီအောင် ပြင်ဆင်ရန် |
| 30 mins | Teardown Infrastructure | အကျဉ်းချုပ်ပြီး အရင်းအမြစ်များကို သန့်ရှင်းရန် |
| 15 mins | Wrap-Up & Next Steps | သင်ယူရမယ့် အရင်းအမြစ်များ၊ Workshop စိန်ခေါ်မှု |
| | |

## What You'll Learn

AZD Template ကို Microsoft Foundry ပေါ်တွင် အဆုံးမှ အဆုံး ဖွံ့ဖြိုးရေးလုပ်ငန်းများ အတွက် စမ်းသပ် လေ့လာနိုင်သော sandbox အဖြစ် တွေးကြည့်ပါ။ ဤ workshop ပြီးဆုံးချိန်တွင် သင်သည် ဒီပတ်ဝန်းကျင်ရှိ စွမ်းဆောင်ရည်များနှင့် အမျိုးမျိုးသော သင်တန်းကိရိယာများအတွက် တိုင်းထွာထိန်းသိမှတ်ရမည့် အတွေ့အကြုံ ရရှိထားလိမ့်မည်။

| Concept  | Objective |
|:---|:---|
| **Azure Developer CLI** | လုပ်ဆောင်ချက်များနှင့် workflow များကို နားလည်စေခြင်း|
| **AZD Templates**| project ဖွဲ့စည်းပုံနှင့် config ကို နားလည်စေခြင်း|
| **Azure AI Agent**| Microsoft Foundry project ကို provision နှင့် deploy ပြုလုပ်ခြင်း  |
| **Azure AI Search**| agents နှင့်အတူ context engineering ကို အလုပ်လုပ်စေခြင်း |
| **Observability**| tracing, monitoring နှင့် evaluations များကို စူးစမ်းလေ့လာခြင်း |
| **Red Teaming**| ဆန့်ကျင်ရေးစမ်းသပ်မှုများနှင့် ကာကွယ်ဆောင်ရွက်ချက်များကို စူးစမ်းလေ့လာခြင်း |
| | |

## Workshop Modules

စတင်ရန် ပြင်ဆင်ပြီးပါပြီလား? workshop modules များကို လမ်းညွှန်မှုအတိုင်း သွားပါ။

- [Module 1: AI Template ရွေးချယ်ခြင်း](instructions/1-Select-AI-Template.md)
- [Module 2: AI Template အတည်ပြုခြင်း](instructions/2-Validate-AI-Template.md) 
- [Module 3: AI Template ဖျက်စီးစိတ်ဖြာခြင်း](instructions/3-Deconstruct-AI-Template.md)
- [Module 4: AI Template ပြုစုပ်ခြင်း](instructions/4-Configure-AI-Template.md)
- [Module 5: AI Template ကို စိတ်ကြိုက်ပြင်ဆင်ခြင်း](instructions/5-Customize-AI-Template.md)
- [Module 6: အင်ဖရားစ्ट्रပ်ချာ ပယ်ဖျက်ခြင်း](instructions/6-Teardown-Infrastructure.md)
- [Module 7: စုစည်းခြင်းနှင့် နောက်တစ်ဆင့်များ](instructions/7-Wrap-up.md)

## Have feedback?

ဤ repo တွင် issue တစ်ခုတင်ပါ (tag it `Workshop`) သို့မဟုတ် [Discord](https://aka.ms/foundry/discord) တွင် ပါဝင်၍ ကျွန်ုပ်တို့၏ `#get-help` channel သို့ post ပေးပါ။

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
ဤစာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ဖြင့် ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှုအတွက် ကြိုးစားပါသည်၊ သို့သော် အလိုအလျောက် ဘာသာပြန်ချက်များတွင် အမှား သို့မဟုတ် မှန်ကန်မှုနည်းပါးမှုများ ရှိနိုင်သည်ကို သတိပြုပါ။ မူလစာတမ်းကို မူရင်းဘာသာဖြင့်သာ အာဏာပိုင်ရင်းမြစ်အဖြစ် ထည့်သတိထားသင့်သည်။ အရေးကြီးသော အချက်အလက်များအတွက် ပရော်ဖက်ရှင်နယ် လူသား ဘာသာပြန်ကို ပြန်လည်စစ်ဆေးရန် အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုမှုကြောင့် ဖြစ်ပေါ်နိုင်သည့် နားမလည်မှုများ သို့မဟုတ် မမှန်ကန်မှုများအတွက် ကျွန်ုပ်တို့သည် တာဝန်မယူပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->