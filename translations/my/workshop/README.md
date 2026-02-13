<div align="center">
  <div style="background: linear-gradient(135deg, #0078d4, #106ebe); border-radius: 10px; padding: 20px; margin: 20px 0; box-shadow: 0 4px 15px rgba(0, 120, 212, 0.3); border: 2px solid #005a9e;">
    <h2 style="color: white; margin: 0; font-size: 24px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      🎯 AZD သုံးသော AI ဖန်တီးသူများအတွက် လက်တွေ့ အလုပ်ရုံ
    </h2>
    <p style="color: white; margin: 10px 0 0 0; font-size: 16px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      <strong>Azure Developer CLI ဖြင့် AI လျှောက်လွှာများ တည်ဆောက်ရန် အတွက် လက်တွေ့ လေ့ကျင့်ခန်း။</strong><br>
      AZD template များနှင့် AI တပ်ဆင်ရေး workflow များကို ကျွမ်းကျင်စွာ သင်ယူနိုင်ရန် မော်ဂျူး 7 ခု ပြီးစီးပါ။
    </p>
    <div style="margin-top: 15px;">
      <span style="background: rgba(255,255,255,0.2); padding: 5px 10px; border-radius: 15px; color: white; font-size: 14px;">
        📅 နောက်ဆုံး အပ်ဒိတ်: ဖေဖော်ဝါရီ 2026
      </span>
    </div>
  </div>
</div>

# AZD သုံးသော AI ဖန်တီးသူများအတွက် လက်တွေ့ အလုပ်ရုံ

AZD (Azure Developer CLI) ကို AI အပလီကေးရှင်းများ တပ်ဆင်ရာတွင် အထူး အလေးပေးပြီး လက်တွင်လုပ် လေ့ကျင့်နိုင်သော အလုပ်ရုံသို့ ကြိုဆိုပါသည်။ ဤအလုပ်ရုံသည် AZD template များကို သုံးလေ့လာရန် အောက်ပါ 3 ချန်အားဖြင့် ကူညီပေးပါသည်။

1. **ရှာဖွေခြင်း (Discovery)** - သင့်အတွက် ကိုက်ညီသော template ကို ရှာပါ။
1. **တပ်ဆင်ခြင်း (Deployment)** - တပ်ဆင်ပြီး အလုပ်လုပ်ကြောင်း စစ်ဆေးပါ။
1. **စိတ်ကြိုက်ပြင်ဆင်ခြင်း (Customization)** - ပြင်ဆင်၍ သင့်အတိုင်း ပြုလုပ်ပါ!

ဤအလုပ်ရုံတစ်လျှောက်တွင် core developer tools နှင့် workflow များကိုလည်း မိတ်ဆက်ပေးမည်ဖြစ်ပြီး သင်၏ end-to-end ဖန်တီးမှု ခရီးကို ပိုမိုလျှော့ချနိုင်စေရန် ကူညီပေးပါသည်။

<br/>

## Browser-Based Guide

အလုပ်ရုံသင်ခန်းစာများကို Markdown ဖိုင်များအနေနှင့် ထည့်သွင်းထားသည်။ GitHub မှတိုက်ရိုက် သွားရောက်ဖတ်ရှုနိုင်ပြီး - သို့မဟုတ် အောက်ပါ screenshot တုန်ပြအတိုင်း browser-based preview ကို ဖွင့်နိုင်သည်။

![အလုပ်ရုံ](../../../translated_images/my/workshop.75906f133e6f8ba0.webp)

ဤရွေးချယ်မှုကို အသုံးပြုရန် - သိုလှောင်တိုက် (repository) ကို သင့် profile သို့ fork ပြုလုပ်ပြီး GitHub Codespaces ကို ဖွင့်ပါ။ VS Code terminal လှတ်မိလျှင် အောက်ပါ command ကို ရိုက်ထည့်ပါ။

```bash title="" linenums="0"
mkdocs serve > /dev/null 2>&1 &
```

အချိန်အနည်းငယ်အတွင်း pop-up dialog တစ်ခု ပြရန် တွေ့ရမည်။ `Open in browser` ရွေးချယ်မှုကို ရွေးပါ။ ဝဘ်အခြေခံလမ်းညွှန်ကို ယင်းနောက် သစ်သစ် browser tab ဖြင့် ဖွင့်မည်။ ထို preview ၏ အကျိုးကျေးဇူးများအနက် အချို့မှာ -

1. **Built-in search** - keyword များ သို့ သင်ခန်းစာများကို အလျင်အမြန် ရှာဖွေရန်။
1. **Copy icon** - codeblock များပေါ်တွင် ကိုးစိပ်၍ ဤရွေးချယ်မှုကို မြင်ရမည်။
1. **Theme toggle** - အမှောင်နှင့် ပျော့ပြောင် အပြာရောင် ပုံစံများ ပြောင်းလဲနိုင်မှု။
1. **Get help** - footer တွင် ရှိသော Discord အိုင်ကွန်ကို နှိပ်၍ ဝင်ရောက်ကူညီမှုယူနိုင်သည်။

<br/>

## အလုပ်ရုံ အနှစ်ချုပ်

**ကြာချိန်:** 3-4 နာရီ  
**အဆင့်:** မစကန့်မှ အလယ်အလတ်အထိ  
**လိုအပ်ချက်များ:** Azure, AI အလိုအလာများ၊ VS Code နှင့် command-line ကိရိယာများနှင့် သင်တတ်မှုရှိထားရန်။

ဤသည်မှာ လက်တွေ့လုပ်ဆောင်ကာ သင်ယူသည့် အလုပ်ရုံဖြစ်သည်။ လေ့ကျင့်မှုများကို ပြီးမြောက်သည့်အခါ AZD For Beginners သင်ရိုးအစီအစဉ်ကို ပြန်လည်ဆန်းစစ်ရန် အကြံပြုပါသည်၊ သို့မဟုတ် Security နှင့် Productivity အကောင်းဆုံးလက်ကျင့်စနစ်များကို လေ့လာလျက် ဆက်လက်တိုးတက်နိုင်မည်ဖြစ်သည်။

| Time| Module  | Objective |
|:---|:---|:---|
| 15 မိနစ် | [နိဒါန်း](docs/instructions/0-Introduction.md) | နိဒါန်း ပေး၍ ရည်မှန်းချက်များကို နားလည်စေခြင်း |
| 30 မိနစ် | [AI Template ရွေးချယ်ခြင်း](docs/instructions/1-Select-AI-Template.md) | ရွေးချယ်စရာများကို စူးစမ်းပြီး စတင်ရန် template ရွေးခြင်း | 
| 30 မိနစ် | [AI Template စစ်ဆေးခြင်း](docs/instructions/2-Validate-AI-Template.md) | ပုံမှန် ဖြေရှင်းချက်ကို Azure သို့ တပ်ဆင်ခြင်း |
| 30 မိနစ် | [AI Template ဖယ်ရှင်းခွဲခြင်း](docs/instructions/3-Deconstruct-AI-Template.md) | ဖွဲ့စည်းပုံနှင့် ဖွဲ့စည်းထိန်းသိမ်းမှုကို စူးစမ်းခြင်း |
| 30 မိနစ် | [AI Template ဖော်ဆောင်မှုများ ပြုပြင်ခြင်း](docs/instructions/4-Configure-AI-Template.md) | ရရှိနိုင်သော လက္ခဏာများကို ဖွင့်လှစ်၍ စမ်းသပ်ခြင်း |
| 30 မိနစ် | [AI Template ကို ရိုးမပြောင်း ပြုပြင်ခြင်း](docs/instructions/5-Customize-AI-Template.md) | သင့်လိုအပ်ချက်အတိုင်း template ကို ကိုက်ညီစေရန် ပြုပြင်ခြင်း |
| 30 မိနစ် | [ဘလော့ကျင်း အဆောက်အဦး ဖျက်ပစ်ခြင်း](docs/instructions/6-Teardown-Infrastructure.md) | အရင်းအမြစ်များကို ရှင်းလင်း၍ လွှတ်ပေးခြင်း |
| 15 မိနစ် | [အနှစ်ချုပ် & နောက်တစ်ဆင့်များ](docs/instructions/7-Wrap-up.md) | သင်ယူရေး အရင်းအမြစ်များ၊ အလုပ်ရုံ စိန်ခေါ်မှု |

<br/>

## သင်ဘာတွေ သင်ယူနိုင်မလဲ

AZD Template ကို Microsoft Foundry ပေါ်တွင် end-to-end ဖန်တီးမှုများအတွက် စူးစမ်းလေ့လာရန် တက်ကြွသော စမ်းသပ်ရန်ကွင်း (learning sandbox) အဖြစ် ထည့်သတ်ပါ။ ဤအလုပ်ရုံ အဆုံးတွင် သင်သည် ဤသက်ဆိုင်ရာ ကိရိယာများနှင့် အယူအဆများအပေါ် သဘောကို သိရှိထားနိုင်မည်။

| Concept  | Objective |
|:---|:---|
| **Azure Developer CLI** | ကိရိယာ အမိန့်များနှင့် workflow များကို နားလည်ခြင်း |
| **AZD Templates**| ပရောဂျက် ဖွဲ့စည်းပုံနှင့် ဖော်ပြချက်များကို နားလည်ခြင်း |
| **Azure AI Agent**| Microsoft Foundry ပရောဂျက်ကို provision နှင့် တပ်ဆင်ခြင်း  |
| **Azure AI Search**| agents များဖြင့် context engineering ကို ဖွင့်လှစ်ခြင်း |
| **Observability**| tracing၊ monitoring နှင့် အကဲဖြတ်မှုများကို စူးစမ်းခြင်း |
| **Red Teaming**| ရန်သူအတိုက်အခိုက် စမ်းသပ်ခြင်းများနှင့် ထိန်းချုပ်နည်းများကို စူးစမ်းခြင်း |

<br/>

## အလုပ်ရုံ ဖွဲ့စည်းပုံ

ဤအလုပ်ရုံကို template ရှာဖွေခြင်းမှ စတင်ကာ တပ်ဆင်ခြင်း၊ ဖယ်ရှင်းခွဲခြင်းနှင့် စိတ်ကြိုက် ပြုပြင်ခြင်းများအား သင်ခန်းစာအဆင့်လိုက်ဖြင့် ခရီးအဖြစ် ဖွဲ့ထားသည် - အခြေခံ အစရှိသည့် template အနေဖြင့် တရားဝင် [Getting Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) starter template ကို အသုံးပြုထားသည်။

### [Module 1: AI Template ရွေးချယ်ခြင်း](docs/instructions/1-Select-AI-Template.md) (30 မိနစ်)

- AI Templates ဆိုတာ ဘာလဲ?
- AI Templates များကို ဘယ်မှာ ရှာတွေ့နိုင်မလဲ?
- AI Agents ဖန်တီးခြင်းကို ဘယ်လို စတင်လဲ?
- **ဓါတ်ပုံ အထောက်အကူညီ (Lab)**: GitHub Codespaces ဖြင့် Quickstart

### [Module 2: AI Template စစ်ဆေးခြင်း](docs/instructions/2-Validate-AI-Template.md) (30 မိနစ်)

- AI Template အင်ဂျင်နီယာ ဖွဲ့စည်းပုံ ဆိုင်ရာ မည်သည်ကို ရှင်းပြပါ?
- AZD Development Workflow ဆိုတာ ဘာလဲ?
- AZD Development အတွက် အကူအညီကို ဘယ်လို ရယူနိုင်မလဲ?
- **ဓါတ်ပုံ အထောက်အကူညီ (Lab)**: AI Agents template ကို တပ်ဆင်၍ စစ်ဆေးခြင်း

### [Module 3: AI Template ဖယ်ရှင်းခွဲခြင်း](docs/instructions/3-Deconstruct-AI-Template.md) (30 မိနစ်)

- သင့်ပတ်ဝန်းကျင်ကို `.azure/` ထဲတွင် စူးစမ်းပါ 
- သင့် resource စီမံထားမှုကို `infra/` တွင် စူးစမ်းပါ 
- သင့် AZD ဖော်ပြချက်ကို `azure.yaml`s တွင် စူးစမ်းပါ
- **ဓါတ်ပုံ အထောက်အကူညီ (Lab)**: Environment Variables များကို ပြင်ဆင်ပြီး ပြန်တပ်ဆင်ခြင်း

### [Module 4: AI Template ဖော်ဆောင်မှုများ ပြုပြင်ခြင်း](docs/instructions/4-Configure-AI-Template.md) (30 မိနစ်)
- စူးစမ်းပါ: Retrieval Augmented Generation
- စူးစမ်းပါ: Agent အကဲဖြတ်ခြင်း နှင့် Red Teaming
- စူးစမ်းပါ: Tracing နှင့် Monitoring
- **ဓါတ်ပုံ အထောက်အကူညီ (Lab)**: AI Agent + Observability ကို စူးစမ်းခြင်း

### [Module 5: AI Template ကို စိတ်ကြိုက် ပြုပြင်ခြင်း](docs/instructions/5-Customize-AI-Template.md) (30 မိနစ်)
- သတ်မှတ်ပါ: Scenario လိုအပ်ချက်များနှင့် PRD
- ဖော်ပြပါ: AZD အတွက် Environment Variables များကို ပြင်ဆင်ခြင်း
- အကောင်အထည်ဖော်ပါ: lifecycle hooks များဖြင့် လုပ်ငန်းများ ထည့်သွင်းခြင်း
- **ဓါတ်ပုံ အထောက်အကူညီ (Lab)**: သင့်လေ့လာချက်အတွက် template ကို စိတ်ကြိုက် ပြင်ဆင်ခြင်း

### [Module 6: အဆောက်အဦး ဖျက်ပစ်ရေး](docs/instructions/6-Teardown-Infrastructure.md) (30 မိနစ်)
- ပြန်လည်သတိပေးပါ: AZD Templates များ คือ ဘာလဲ?
- ပြန်လည်သတိပေးပါ: Azure Developer CLI ကို ဘာကြောင့် သုံးသင့်သလဲ?
- နောက်တစ်ဆင့်များ: မတူညီသော template တစ်ခုကို စမ်းသပ်ပါ!
- **ဓါတ်ပုံ အထောက်အကူညီ (Lab)**: အဆောက်အဦးများကို deprovision နှင့် ရှင်းလင်းခြင်း

<br/>

## အလုပ်ရုံ စိန်ခေါ်မှု

အပိုဆောင်း စိန်ခေါ်မှုများ လျှောက်ထားရန် စိတ်ဝင်စားပါသလား? ဤနေရာတွင် project အကြံပေးချက်များရှိသည် - သို့မဟုတ် သင့်စိတ်ကူးများကို ငါတို့နှင့် မျှဝေပါ!!

| Project | Description |
|:---|:---|
|1. **ရှုပ်ထွေးသော AI Template တစ်ခု ဖယ်ရှင်းခွဲခြင်း** | ကျွန်ုပ်တို့ ဖော်ပြထားသည့် workflow နှင့် ကိရိယာများကို အသုံးပြုပြီး မည်သည့် အခြား AI solution template ကိုမဆို တပ်ဆင်၊ စစ်ဆေးနှင့် စိတ်ကြိုက်ပြုပြင်နိုင်ပါသလား စမ်းသပ်ပါ။ _ဘာတွေ သင်ယူရသလဲ?_|
|2. **သင့် စာရင်းအင်း Scenario ဖြင့် စိတ်ကြိုက် ပြုပြင်ခြင်း**  | မတူညီသော scenario အတွက် PRD (Product Requirements Document) ရေးကြည့်ပါ။ ထို့နောက် Agent Model ထဲရှိ template repo တွင် GitHub Copilot ကို အသုံးပြု၍ customization workflow တစ်ခု တောင်းဆိုပါ။ _ဘာတွေ သင်ယူရသလဲ? ဤအကြံအစည်များကို ဘယ်လို တိုးတက်စေနိုင်မလဲ?_|
| | |

## တုံ့ပြန်ချက်ရှိပါသလား?

1. ဤ repo သို့ issue တင်ပါ - အကူအညီအဆင်ပြေစေရန် `Workshop` ဟူသော tag ဖြင့် စတင်သတ်မှတ်ပါ။
1. Microsoft Foundry Discord သို့ ဝင်ပါ - သင့်အသိုင်းအဝိုင်းနှင့် ဆက်သွယ်ဆုံပါ။

| | | 
|:---|:---|
| **📚 သင်တန်း မူလစာမျက်နှာ**| [AZD For Beginners](../README.md)|
| **📖 စာတမ်းများ** | [Get started with AI templates](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️ AI Templates** | [Microsoft Foundry Templates](https://ai.azure.com/templates) |
|**🚀 နောက်တစ်ဆင့်များ** | [အလုပ်ရုံ စတင်ရန်](../../../workshop) |
| | |

<br/>

---

**Navigation:** [หลักสูตรหลัก](../README.md) | [နိဒါန်း](docs/instructions/0-Introduction.md) | [Module 1: AI Template ရွေးချယ်ခြင်း](docs/instructions/1-Select-AI-Template.md)

**AZD ဖြင့် AI လျှောက်လွှာများ တည်ဆောက်ရန် စတင်ရန် အသင့်ပါသလား?**

[အလုပ်ရုံ စတင်ပါ: နိဒါန်း →](docs/instructions/0-Introduction.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
အသိပေးချက်:
ဒီစာတမ်းကို AI ဘာသာပြန်စနစ်ဖြစ်သည့် [Co-op Translator](https://github.com/Azure/co-op-translator) ဖြင့် ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှန်ကန်စေရန် ကြိုးပမ်းပါသဖြင့် သို့သော် အလိုအလျောက်ဘာသာပြန်ချက်များတွင် အမှားများ သို့မဟုတ် တိကျမှားယွင်းမှုများ ရှိနိုင်ကြောင်း ကျေးဇူးပြု၍ သတိပြုပါ။ မူလဘာသာဖြင့် ရရှိထားသော မူရင်းစာတမ်းကို အမှန်တကယ်ကိုယ်စားပြုသော အရင်းအမြစ်အဖြစ် သတ်မှတ်သင့်ပါသည်။ အရေးကြီးသော အချက်အလက်များအတွက် လူ့ပရော်ဖက်ရှင်နယ် ဘာသာပြန်သူမှ ဘာသာပြန်ပေးခြင်းကို အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုခြင်းကြောင့် ဖြစ်ပေါ်လာသည့် နားလည်မှုပျက်ကွက်ခြင်းများ သို့မဟုတ် မမှန်ကန်သော အဓိပ္ပာယ်ဖော်ပြချက်များအပေါ် ကျွန်ုပ်တို့သည် တာဝန်ယူမည်မဟုတ်ပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->