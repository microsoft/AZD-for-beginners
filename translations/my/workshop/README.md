<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "390da1a5d0feb705fa0eb9940f6f3b27",
  "translation_date": "2025-10-16T16:17:42+00:00",
  "source_file": "workshop/README.md",
  "language_code": "my"
}
-->
<div align="center">
  <div style="background: linear-gradient(135deg, #ff6b35, #f7931e); border-radius: 10px; padding: 20px; margin: 20px 0; box-shadow: 0 4px 15px rgba(255, 107, 53, 0.3); border: 2px solid #e55a2b;">
    <h2 style="color: white; margin: 0; font-size: 24px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      🚧 Workshop အဆောက်အအုံ ဆောက်လုပ်နေဆဲ 🚧
    </h2>
    <p style="color: white; margin: 10px 0 0 0; font-size: 16px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      <strong>ဒီ Workshop ကို လက်ရှိ ဖွံ့ဖြိုးတိုးတက်မှုအဆင့်တွင် ရှိနေပါသည်။</strong><br>
      အကြောင်းအရာများ မပြည့်စုံသို့မဟုတ် ပြောင်းလဲမှုများ ရှိနိုင်ပါသည်။ အပ်ဒိတ်များအတွက် မကြာမီ ပြန်လည်ကြည့်ပါ!
    </p>
    <div style="margin-top: 15px;">
      <span style="background: rgba(255,255,255,0.2); padding: 5px 10px; border-radius: 15px; color: white; font-size: 14px;">
        📅 နောက်ဆုံး အပ်ဒိတ်: အောက်တိုဘာ 2025
      </span>
    </div>
  </div>
</div>

# AZD for AI Developers Workshop

Azure Developer CLI (AZD) ကို အသုံးပြု၍ AI application များကို deploy လုပ်ခြင်းကို သင်ယူရန်အတွက် လက်တွေ့ Workshop သို့ ကြိုဆိုပါသည်။ ဒီ Workshop သည် AZD templates ကို နားလည်ရန် အောက်ပါ ၃ ချက်ဖြင့် ကူညီပေးပါသည်-

1. **ရှာဖွေခြင်း** - သင့်အတွက် သင့်လျော်သော template ကို ရှာဖွေပါ။
1. **Deploy လုပ်ခြင်း** - deploy လုပ်ပြီး အလုပ်လုပ်မှုကို အတည်ပြုပါ။
1. **အပြောင်းအလဲလုပ်ခြင်း** - သင့်လိုအပ်ချက်အတိုင်း ပြင်ဆင်ပါ။

ဒီ Workshop အတွင်း Developer tools များနှင့် workflows များကိုလည်း မိတ်ဆက်ပေးမည်ဖြစ်ပြီး သင့် Development ခရီးစဉ်ကို ပိုမိုလွယ်ကူစေမည့် နည်းလမ်းများကို သင်ယူနိုင်ပါမည်။

<br/>

## Browser-Based Guide

Workshop သင်ခန်းစာများကို Markdown ဖြင့် ရေးသားထားပါသည်။ GitHub တွင် တိုက်ရိုက် navigation လုပ်နိုင်သလို - အောက်ပါ screenshot တွင် ပြထားသည့်အတိုင်း browser-based preview ကိုလည်း ဖွင့်နိုင်ပါသည်။

![Workshop](../../../translated_images/my/workshop.75906f133e6f8ba0.png)

ဒီ option ကို အသုံးပြုရန် - repository ကို သင့် profile သို့ fork လုပ်ပြီး GitHub Codespaces ကို ဖွင့်ပါ။ VS Code terminal အလုပ်လုပ်နေသောအခါ အောက်ပါ command ကို ရိုက်ထည့်ပါ-

```bash title="" linenums="0"
mkdocs serve > /dev/null 2>&1 &
```

အချို့စက္ကန့်အတွင်း pop-up dialog တစ်ခုကို တွေ့ပါမည်။ `Open in browser` ကို ရွေးချယ်ပါ။ Web-based guide သည် browser tab အသစ်တွင် ဖွင့်ပါမည်။ ဒီ preview ၏ အကျိုးကျေးဇူးများမှာ-

1. **Built-in search** - keyword များ သို့မဟုတ် သင်ခန်းစာများကို အလွယ်တကူ ရှာဖွေပါ။
1. **Copy icon** - codeblocks အပေါ်တွင် hover လုပ်ပြီး ဒီ option ကို ရှာပါ။
1. **Theme toggle** - အနက်ရောင်နှင့် အဖြူရောင် themes အကြား ပြောင်းပါ။
1. **အကူအညီရယူရန်** - footer တွင် Discord icon ကို နှိပ်ပြီး ပူးပေါင်းပါ။

<br/>

## Workshop Overview

**ကြာမြင့်ချိန်:** ၃-၄ နာရီ  
**အဆင့်:** Beginner မှ Intermediate  
**လိုအပ်ချက်များ:** Azure, AI concepts, VS Code နှင့် command-line tools အပေါ် ရင်းနှီးမှု။

ဒီ Workshop သည် လက်တွေ့လုပ်ဆောင်ခြင်းမှတစ်ဆင့် သင်ယူရန် ရည်ရွယ်ထားသည်။ လေ့ကျင့်ခန်းများ ပြီးဆုံးပြီးပါက AZD For Beginners curriculum ကို ပြန်လည်သုံးသပ်ရန် အကြံပြုပါသည်။ Security နှင့် Productivity အကောင်းဆုံး လေ့ကျင့်မှုများကို ဆက်လက်လေ့လာနိုင်ပါသည်။

| အချိန်| Module  | ရည်ရွယ်ချက် |
|:---|:---|:---|
| ၁၅ မိနစ် | [Introduction](docs/instructions/0-Introduction.md) | ရည်ရွယ်ချက်များကို နားလည်ရန် |
| ၃၀ မိနစ် | [Select AI Template](docs/instructions/1-Select-AI-Template.md) | ရွေးချယ်မှုများကို ရှာဖွေပြီး စတင်ရန် | 
| ၃၀ မိနစ် | [Validate AI Template](docs/instructions/2-Validate-AI-Template.md) | Azure တွင် default solution ကို deploy လုပ်ရန် |
| ၃၀ မိနစ် | [Deconstruct AI Template](docs/instructions/3-Deconstruct-AI-Template.md) | ဖွဲ့စည်းမှုနှင့် configuration ကို ရှာဖွေရန် |
| ၃၀ မိနစ် | [Configure AI Template](docs/instructions/4-Configure-AI-Template.md) | ရရှိနိုင်သော features များကို စမ်းသပ်ရန် |
| ၃၀ မိနစ် | [Customize AI Template](docs/instructions/5-Customize-AI-Template.md) | Template ကို သင့်လိုအပ်ချက်အတိုင်း ပြင်ဆင်ရန် |
| ၃၀ မိနစ် | [Teardown Infrastructure](docs/instructions/6-Teardown-Infrastructure.md) | Resources များကို ရှင်းလင်းပြီး ပြန်လွှတ်ရန် |
| ၁၅ မိနစ် | [Wrap-Up & Next Steps](docs/instructions/7-Wrap-up.md) | သင်ခန်းစာများ၊ Workshop challenge |

<br/>

## သင်လေ့လာနိုင်မည့်အရာများ

AZD Template ကို Azure AI Foundry တွင် end-to-end development အတွက် အမျိုးမျိုးသော tool များနှင့် အခွင့်အာဏာများကို ရှာဖွေဖို့ learning sandbox အဖြစ် သတ်မှတ်ပါ။ Workshop ပြီးဆုံးသည့်အခါ သင့်အနေဖြင့် ဒီ context တွင် tool များနှင့် concepts များကို intuitive sense ရရှိထားမည်ဖြစ်သည်။

| Concept  | ရည်ရွယ်ချက် |
|:---|:---|
| **Azure Developer CLI** | Tool commands နှင့် workflows ကို နားလည်ရန် |
| **AZD Templates**| Project ဖွဲ့စည်းမှုနှင့် config ကို နားလည်ရန် |
| **Azure AI Agent**| Azure AI Foundry project ကို provision & deploy လုပ်ရန် |
| **Azure AI Search**| Agent များနှင့် context engineering ကို enable လုပ်ရန် |
| **Observability**| Tracing, monitoring နှင့် evaluations ကို ရှာဖွေရန် |
| **Red Teaming**| Adversarial testing နှင့် mitigations ကို ရှာဖွေရန် |

<br/>

## Workshop Structure

ဒီ Workshop သည် template ရှာဖွေမှုမှ စတင်ပြီး deployment, deconstruction, customization အထိ ခရီးစဉ်တစ်ခုအဖြစ် ဖွဲ့စည်းထားသည်။ [Getting Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) starter template ကို အခြေခံထားသည်။

### [Module 1: Select AI Template](docs/instructions/1-Select-AI-Template.md) (၃၀ မိနစ်)

- AI Templates ဆိုတာဘာလဲ?
- AI Templates ကို ဘယ်မှာ ရှာနိုင်မလဲ?
- AI Agents ကို ဘယ်လို စတင်တည်ဆောက်နိုင်မလဲ?
- **Lab**: GitHub Codespaces ဖြင့် Quickstart

### [Module 2: Validate AI Template](docs/instructions/2-Validate-AI-Template.md) (၃၀ မိနစ်)

- AI Template Architecture ဆိုတာဘာလဲ?
- AZD Development Workflow ဆိုတာဘာလဲ?
- AZD Development အတွက် အကူအညီကို ဘယ်လိုရယူနိုင်မလဲ?
- **Lab**: AI Agents template ကို Deploy & Validate

### [Module 3: Deconstruct AI Template](docs/instructions/3-Deconstruct-AI-Template.md) (၃၀ မိနစ်)

- `.azure/` တွင် သင့် environment ကို ရှာဖွေပါ။
- `infra/` တွင် သင့် resource setup ကို ရှာဖွေပါ။
- `azure.yaml` တွင် AZD configuration ကို ရှာဖွေပါ။
- **Lab**: Environment Variables ကို ပြင်ဆင်ပြီး Redeploy လုပ်ပါ။

### [Module 4: Configure AI Template](docs/instructions/4-Configure-AI-Template.md) (၃၀ မိနစ်)
- ရှာဖွေပါ: Retrieval Augmented Generation
- ရှာဖွေပါ: Agent Evaluation & Red Teaming
- ရှာဖွေပါ: Tracing & Monitoring
- **Lab**: AI Agent + Observability ကို ရှာဖွေပါ 

### [Module 5: Customize AI Template](docs/instructions/5-Customize-AI-Template.md) (၃၀ မိနစ်)
- PRD ကို Scenario Requirements ဖြင့် သတ်မှတ်ပါ။
- AZD အတွက် Environment Variables ကို Configure လုပ်ပါ။
- Lifecycle Hooks ကို ထည့်သွင်းပြီး အပို tasks များကို Implement လုပ်ပါ။
- **Lab**: Template ကို သင့် scenario အတွက် Customize လုပ်ပါ။

### [Module 6: Teardown Infrastructure](docs/instructions/6-Teardown-Infrastructure.md) (၃၀ မိနစ်)
- AZD Templates ဆိုတာဘာလဲဆိုတာ ပြန်လည်သုံးသပ်ပါ။
- Azure Developer CLI ကို ဘာကြောင့် အသုံးပြုသင့်လဲဆိုတာ ပြန်လည်သုံးသပ်ပါ။
- နောက်တစ်ခု template ကို စမ်းသပ်ပါ!
- **Lab**: Infrastructure ကို Deprovision လုပ်ပြီး Cleanup လုပ်ပါ။

<br/>

## Workshop Challenge

ပိုမိုစိန်ခေါ်မှုများကို လုပ်ဆောင်လိုပါသလား? အောက်ပါ project အကြံပြုချက်များကို ကြည့်ပါ - သို့မဟုတ် သင့်အကြံများကို ကျွန်ုပ်တို့နှင့် မျှဝေပါ!!

| Project | ဖော်ပြချက် |
|:---|:---|
|1. **Deconstruct A Complex AI Template** | ကျွန်ုပ်တို့ ဖော်ပြထားသော workflow နှင့် tools ကို အသုံးပြု၍ အခြား AI solution template ကို deploy, validate, customize လုပ်နိုင်မလား စမ်းသပ်ပါ။ _သင်ဘာတွေ သင်ယူနိုင်ခဲ့သလဲ?_|
|2. **Customize With Your Scenario**  | အခြား scenario အတွက် PRD (Product Requirements Document) တစ်ခုရေးရန် ကြိုးစားပါ။ ထို့နောက် GitHub Copilot ကို သင့် template repo တွင် Agent Model ဖြင့် အသုံးပြုပြီး customization workflow ကို generate လုပ်ရန် တောင်းဆိုပါ။ _သင်ဘာတွေ သင်ယူနိုင်ခဲ့သလဲ? ဒီအကြံများကို ဘယ်လိုတိုးတက်အောင်လုပ်နိုင်မလဲ?_|
| | |

## အကြံပြုချက်ရှိပါသလား?

1. ဒီ repo တွင် issue တစ်ခု post လုပ်ပါ - `Workshop` ဟု tag လုပ်ပါ။
1. Azure AI Foundry Discord ကို join လုပ်ပါ - သင့်အတူတူသူများနှင့် ချိတ်ဆက်ပါ။

| | | 
|:---|:---|
| **📚 Course Home**| [AZD For Beginners](../README.md)|
| **📖 Documentation** | [Get started with AI templates](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️AI Templates** | [Azure AI Foundry Templates](https://ai.azure.com/templates) |
|**🚀 Next Steps** | [Take The Challenge](../../../workshop) |
| | |

<br/>

---

**အရင်:** [AI Troubleshooting Guide](../docs/troubleshooting/ai-troubleshooting.md) | **နောက်တစ်ခု:** [Lab 1: AZD Basics](../../../workshop/lab-1-azd-basics)

**AZD ဖြင့် AI applications တည်ဆောက်ရန် အသင့်ဖြစ်ပါပြီလား?**

[Begin Lab 1: AZD Foundations →](./lab-1-azd-basics/README.md)

---

**အကြောင်းကြားချက်**:  
ဤစာရွက်စာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ကို အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှုအတွက် ကြိုးစားနေသော်လည်း အလိုအလျောက် ဘာသာပြန်မှုများတွင် အမှားများ သို့မဟုတ် မမှန်ကန်မှုများ ပါဝင်နိုင်သည်ကို သတိပြုပါ။ မူရင်းဘာသာစကားဖြင့် ရေးသားထားသော စာရွက်စာတမ်းကို အာဏာတရားရှိသော အရင်းအမြစ်အဖြစ် သတ်မှတ်သင့်ပါသည်။ အရေးကြီးသော အချက်အလက်များအတွက် လူက ဘာသာပြန်မှုကို အကြံပြုပါသည်။ ဤဘာသာပြန်မှုကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော အလွဲအမှားများ သို့မဟုတ် အနားလွဲမှုများအတွက် ကျွန်ုပ်တို့သည် တာဝန်မယူပါ။