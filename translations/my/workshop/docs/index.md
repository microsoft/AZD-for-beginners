<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "1a87eaee8309cd74837981fdc6834dd9",
  "translation_date": "2025-09-25T01:57:37+00:00",
  "source_file": "workshop/docs/index.md",
  "language_code": "my"
}
-->
# AZD for AI Developers Workshop

> [!IMPORTANT]  
> **ဒီ workshop တွင် သင်၏ local browser တွင် preview လုပ်နိုင်သော workshop guide ပါဝင်သည်။ စတင်ရန်အတွက် GitHub Codespaces ကို repo တွင် launch လုပ်ပြီး active VS Code terminal ကိုမြင်ရသည်အထိစောင့်ပါ—ထို့နောက် command ကိုရိုက်ပါ:**  
> `mkdocs serve > /dev/null 2>&1 &`  
> **Browser တွင် preview page ကိုဖွင့်ရန် pop-up dialog ကိုမြင်ရပါမည်။**

Azure Developer CLI (AZD) ကို AI application deployment အာရုံစိုက်ပြီး လေ့လာရန်အတွက် လက်တွေ့ workshop မှကြိုဆိုပါသည်။ AZD templates ကို ၃ ချက်တည်းဖြင့် လေ့လာနိုင်ရန် workshop သည် အောက်ပါအတိုင်း အကူအညီပေးပါသည်-

1. **ရှာဖွေခြင်း** - သင့်အတွက်သင့်တော်သော template ကိုရှာပါ။
1. **Deploy လုပ်ခြင်း** - Deploy လုပ်ပြီး အလုပ်လုပ်မှုကိုအတည်ပြုပါ။
1. **အပြောင်းအလဲလုပ်ခြင်း** - Template ကိုသင့်လိုအပ်ချက်နှင့်အညီပြင်ဆင်ပါ။

ဒီ workshop အတွင်းမှာ သင်၏ end-to-end development ခရီးစဉ်ကို streamline လုပ်ရန် core developer tools နှင့် workflows များကိုလည်း မိတ်ဆက်ပေးပါမည်။

| | | 
|:---|:---|
| **📚 Course Home**| [AZD For Beginners](../README.md)|
| **📖 Documentation** | [Get started with AI templates](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️AI Templates** | [Azure AI Foundry Templates](https://ai.azure.com/templates) |
|**🚀 Next Steps** | [Take The Challenge](../../../../workshop/docs) |
| | |

## Workshop Overview

**ကြာမြင့်ချိန်:** ၃-၄ နာရီ  
**အဆင့်:** Beginner မှ Intermediate  
**လိုအပ်ချက်များ:** Azure, AI concepts, VS Code နှင့် command-line tools အပေါ်ကျွမ်းကျင်မှု။

ဒီ workshop သည် လက်တွေ့လုပ်ဆောင်ခြင်းမှတစ်ဆင့် သင်ယူရန်အတွက်ဖြစ်သည်။ လေ့ကျင့်မှုများကိုပြီးစီးပြီးနောက် Security နှင့် Productivity အကောင်းဆုံးအလေ့အကျင့်များကိုဆက်လက်လေ့လာရန် AZD For Beginners curriculum ကိုပြန်လည်သုံးသပ်ရန်အကြံပြုပါသည်။

| အချိန်| Module  | ရည်ရွယ်ချက် |
|:---|:---|:---|
| ၁၅ မိနစ် | Introduction | ရည်ရွယ်ချက်များကိုနားလည်ရန် |
| ၃၀ မိနစ် | Select AI Template | ရွေးချယ်ရန်အခွင့်အလမ်းများကိုလေ့လာရန် | 
| ၃၀ မိနစ် | Validate AI Template | Azure တွင် default solution ကို deploy လုပ်ရန် |
| ၃၀ မိနစ် | Deconstruct AI Template | Template ၏ဖွဲ့စည်းမှုနှင့် configuration ကိုလေ့လာရန် |
| ၃၀ မိနစ် | Configure AI Template | ရရှိနိုင်သော features များကို activate လုပ်ပြီးစမ်းသပ်ရန် |
| ၃၀ မိနစ် | Customize AI Template | Template ကိုသင့်လိုအပ်ချက်နှင့်အညီပြင်ဆင်ရန် |
| ၃၀ မိနစ် | Teardown Infrastructure | Resources များကိုရှင်းလင်းပြီးလွှတ်ရန် |
| ၁၅ မိနစ် | Wrap-Up & Next Steps | သင်ယူရန် resources, Workshop challenge |
| | |

## What You'll Learn

AZD Template ကို Azure AI Foundry တွင် end-to-end development အတွက် အမျိုးမျိုးသောစွမ်းရည်များနှင့် tools များကိုလေ့လာရန် sandbox အဖြစ်ယူဆပါ။ Workshop ပြီးဆုံးချိန်တွင် ဒီ context အတွင်း tools နှင့် concepts များအပေါ် intuitive sense ရရှိထားမည်ဖြစ်သည်။

| Concept  | ရည်ရွယ်ချက် |
|:---|:---|
| **Azure Developer CLI** | Tool commands နှင့် workflows ကိုနားလည်ရန် |
| **AZD Templates**| Project structure နှင့် config ကိုနားလည်ရန် |
| **Azure AI Agent**| Azure AI Foundry project ကို provision နှင့် deploy လုပ်ရန် |
| **Azure AI Search**| Agents နှင့် context engineering ကို enable လုပ်ရန် |
| **Observability**| Tracing, monitoring နှင့် evaluations ကိုလေ့လာရန် |
| **Red Teaming**| Adversarial testing နှင့် mitigations ကိုလေ့လာရန် |
| | |

## Workshop Modules

စတင်ရန်အဆင်သင့်ဖြစ်ပါပြီလား? Workshop modules များကို navigate လုပ်ပါ-

- [Module 1: Select AI Template](instructions/1-Select-AI-Template.md)
- [Module 2: Validate AI Template](instructions/2-Validate-AI-Template.md) 
- [Module 3: Deconstruct AI Template](instructions/3-Deconstruct-AI-Template.md)
- [Module 4: Configure AI Template](instructions/4-Configure-AI-Template.md)
- [Module 5: Customize AI Template](instructions/5-Customize-AI-Template.md)
- [Module 6: Teardown Infrastructure](instructions/6-Teardown-Infrastructure.md)
- [Module 7: Wrap-up & Next Steps](instructions/7-Wrap-up.md)

## Have feedback?

ဒီ repo တွင် issue တင်ပါ (tag ကို `Workshop` သတ်မှတ်ပါ) သို့မဟုတ် [Discord](https://aka.ms/foundry/discord) တွင် `#get-help` channel ကိုအသုံးပြု၍ မေးမြန်းပါ။

---

