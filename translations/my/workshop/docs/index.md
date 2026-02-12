# AZD for AI Developers Workshop

> [!IMPORTANT]  
> **ဤလုပ်ငန်းရုံအတန်းသည် သင့်ဒေသခံဘရောက်ဇာတွင် ကြိုကြည့်နိုင်သော ကွင်းဆင်းလမ်းညွှန်နှင့် တပ်ဆင်ထားပါသည်။ စတင်ရန်အတွက် repo ပေါ်တွင် GitHub Codespaces ကို စတင်ဖွင့်ရမည် — ထို့နောက် Active VS Code terminal ကို တွေ့သည်အထိ စောင့်ပါ၊ ထို့နောက် အောက်ပါ command ကို ရိုက်ထည့်ပါ။:**  
> `mkdocs serve > /dev/null 2>&1 &`  
> **ဤအခါ browser တစ်ခုတွင် preview စာမျက်နှာကို ဖွင့်ရန် pop-up dialog ကို မြင်ရမည်ဖြစ်သည်။**

Azure Developer CLI (AZD) ကို AI application များ Deploy ပြုလုပ်ခြင်းအထူးအာရုံနှင့်အတူ လေ့လာရန် ဒီလက်တွေ့လုပ်ငန်းရုံသို့ ကြိုဆိုပါသည်။ ဤလုပ်ငန်းရုံသည် AZD templates ကို အလက်တင်သုံးသပ်သိမြင်ရန် အောက်ပါ ၃ қစ်ဆင့်အတိုင်း အကောင်အထည်ဖော်နိုင်စေပါသည် -

1. **ရှာဖွေခြင်း (Discovery)** - သင့်အတွက် သင့်တော်သော template ကို ရှာဖွေပါ။
1. **Deploy ပြုလုပ်ခြင်း (Deployment)** - Deploy ပြီး အလုပ်လုပ်နေကြောင်း အတည်ပြုပါ။
1. **စိတ်ကြိုက်ပြင်ဆင်ခြင်း (Customization)** - အပြင်အဆင်ပြုပြင်၍ သင့်အလိုက် ပြင်ဆင်ပါ!

ဤလုပ်ငန်းရုံတစ်လျှောက်လုံးတွင် core developer tools နှင့် workflows များကိုလည်း မိတ်ဆက်ပေးမည်ဖြစ်ပြီး၊ သင့်၏ end-to-end ဖွံ့ဖြိုးရေးခရီးကို ထိရောက်စေသည်။

| | | 
|:---|:---|
| **📚 Course Home**| [AZD For Beginners](../README.md)|
| **📖 Documentation** | [Get started with AI templates](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️AI Templates** | [Microsoft Foundry Templates](https://ai.azure.com/templates) |
|**🚀 Next Steps** | [Take The Challenge](../../../../workshop/docs) |
| | |

## Workshop Overview

**ကြာချိန်:** 3-4 နာရီ  
**အဆင့်:** အစပြုသူမှ အလယ်အလတ်အထိ  
**မလိုအပ်မီ မျှော်မှန်းချက်များ:** Azure, AI အကြောင်းအရာများ၊ VS Code နှင့် command-line ကိရိယာများအား သိရှိ familiarity ရှိခြင်း။

ဒါက လက်တွေ့လုပ်ငန်းရုံတစ်ခုဖြစ်ပြီး လက်တွေ့လက်တွေ့လုပ်ဆောင်ခြင်းအားဖြင့် သင်ယူရပါမည်။ အလေ့အကျင့်များကို ပြီးမြောက်ချိန်တွင် AZD For Beginners လေ့ကျင့်ခန်းအစီအစဉ်ကို ပြန်လည်သုံးသပ်ရန် အကြံပြုပါသည်၊ ဤကိစ္စများသည် Security နှင့် Productivity အကောင်းဆုံး လေ့လာရေးလမ်းစဉ်များသို့ သင်၏သင်ယူရေးခရီးကို ဆက်လက်မြှင့်တင်ရန် ကူညီပါလိမ့်မည်။

| Time| Module  | Objective |
|:---|:---|:---|
| 15 mins | Introduction | Set the stage, understand the goals |
| 30 mins | Select AI Template | Explore options and pick starter | 
| 30 mins | Validate AI Template | Deploy default solution to Azure |
| 30 mins | Deconstruct AI Template | Explore structure and configuration |
| 30 mins | Configure AI Template | Activate and try available features |
| 30 mins | Customize AI Template | Adapt the template to your needs |
| 30 mins | Teardown Infrastructure | Cleanup and release resources |
| 15 mins | Wrap-Up & Next Steps | Learning resources, Workshop challenge |
| | |

## What You'll Learn

AZD Template ကို Microsoft Foundry ပေါ်တွင် end-to-end ဖွံ့ဖြိုးရေးအတွက် အမျိုးမျိုးသော လုပ်ဆောင်ချက်များနှင့် ကိရိယာများကို စမ်းသပ်လေ့လာရန် ရင်းနှီးမြှုပ်နှံသည့် sandbox အနေဖြင့် စဉ်းစားပါ။ ဤလုပ်ငန်းရုံကုန်ဆုံးစဉ်တွင် သင်သည် ဤနယ်ပယ်အတွင်းရှိ ကိရိယာများနှင့် အယူအဆများအား အတွေးအမြင်တိတိဖြင့် ထဲသိမြင်လာပြီး ရင်းနှီးနိုင်မည်ဖြစ်သည်။

| Concept  | Objective |
|:---|:---|
| **Azure Developer CLI** | Understand tool commands and workflows|
| **AZD Templates**| Understand project structure and config|
| **Azure AI Agent**| Provision & deploy Microsoft Foundry project  |
| **Azure AI Search**| Enable context engineering with agents |
| **Observability**| Explore tracing, monitoring and evaluations |
| **Red Teaming**| Explore adversarial testing and mitigations |
| | |

## Workshop Modules

စတင်လိုပါသလား? လက်တွေ့လုပ်ငန်းရုံ modules များအား သွားကြည့်ပါ -

- [Module 1: Select AI Template](instructions/1-Select-AI-Template.md)
- [Module 2: Validate AI Template](instructions/2-Validate-AI-Template.md) 
- [Module 3: Deconstruct AI Template](instructions/3-Deconstruct-AI-Template.md)
- [Module 4: Configure AI Template](instructions/4-Configure-AI-Template.md)
- [Module 5: Customize AI Template](instructions/5-Customize-AI-Template.md)
- [Module 6: Teardown Infrastructure](instructions/6-Teardown-Infrastructure.md)
- [Module 7: Wrap-up & Next Steps](instructions/7-Wrap-up.md)

## Have feedback?

ဤ repo တွင် issue တင်ပါ (tag ကို `Workshop` ဟု သတ်မှတ်ပါ) သို့မဟုတ် ကျွန်တော်တို့နှင့် [Discord](https://aka.ms/foundry/discord) တွင် ပါဝင်ပြီး `#get-help` channel တွင် မေးမြန်းပါ။

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
အသိပေးချက်။
ဒီစာရွက်စာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator] အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှန်ကန်စေရန် ကြိုးပေမယ့် အလိုအလျောက်ဘာသာပြန်ချက်များတွင် အမှားများ သို့မဟုတ် မှားယွင်းချက်များ ပါဝင်နိုင်ကြောင်း ဦးစားပေး အသိပေးအပ်ပါသည်။ မူရင်းစာရွက်စာတမ်းကို မူလဘာသာဖြင့် ရှိသည့် အတည်ပြု အရင်းအမြစ်အဖြစ် သတ်မှတ်သင့်သည်။ အရေးကြီးသော အချက်အလက်များအတွက် သက်ဆိုင်ရာ ပရော်ဖက်ရှင်နယ် လူဘာသာပြန်ကို အသုံးပြုရန် အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုခြင်းကြောင့် ဖြစ်ပေါ်နိုင်သော နားမလည်မှုများ သို့မဟုတ် မှားယွင်းဖော်ပြချက်များအတွက် ကျွန်ုပ်တို့သည် တာဝန်ယူမည်မဟုတ်ပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->