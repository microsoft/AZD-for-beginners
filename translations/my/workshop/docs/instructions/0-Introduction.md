<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "e3a6c07efed58baba33b43c69174aef8",
  "translation_date": "2025-09-25T02:19:36+00:00",
  "source_file": "workshop/docs/instructions/0-Introduction.md",
  "language_code": "my"
}
-->
# AZD အတွက် AI Developer များ

!!! info "ဒီ Workshop ရဲ့ ရည်ရွယ်ထားတဲ့သူများ"
   
    ဒီ Workshop က Azure AI Foundry ပေါ်မှာ အကောင်းဆုံး tools နဲ့ workflows တွေကို အသုံးပြုပြီး AI Agentic အက်ပလီကေးရှင်းတွေ တည်ဆောက်ချင်သူတိုင်းအတွက် ဖြစ်ပါတယ်။ Azure, AI အကြောင်းအရာတွေ နဲ့ Python code အပေါ် အတွေ့အကြုံရှိသူများအတွက် သင့်တော်ပြီး၊ အခြေခံကနေ စတင်သူများအတွက်လည်း သင့်တော်ပါတယ်။ စတင်မလုပ်ခင် Pre-requisites တွေကို စစ်ဆေးပါ။

    **ကြာမြင့်ချိန်:** 3-4 နာရီ  
    **အဆင့်:** အခြေခံမှ အလယ်အလတ်  

---

## Pre-Requisites

- ကိုယ်ပိုင် GitHub အကောင့် → [အခမဲ့ ဖန်တီးပါ](https://github.com/signup)
- အသက်ဝင်နေတဲ့ Azure အကောင့် → [အခမဲ့ ဖန်တီးပါ](https://aka.ms/free)
- AI အကြောင်းအရာများ၊ Python development၊ Command-line tools အပေါ် ရင်းနှီးမှု
- VS Code နဲ့ GitHub tools နဲ့ workflows အပေါ် အတွေ့အကြုံရှိမှု

---

## သင်ယူရမည့် ရည်မှန်းချက်များ

ဒီ Workshop ပြီးဆုံးချိန်မှာ သင်သည် အောက်ပါအရာများကို သိရှိနိုင်ပါမည်-

- [X] **Azure Developer CLI ကို အသုံးပြုခြင်း** → Azure resources တွေကို provision, deploy, နဲ့ manage လုပ်ရန်
- [X] **AI App Templates အသုံးပြုခြင်း** → Azure AI Foundry ပေါ်မှာ AI Agent project တွေကို စတင်ရန်
- [X] **Templates တွေကို Configure လုပ်ခြင်း** → Red Teaming, Evaluations, Tracing & Monitoring စတဲ့ features တွေအတွက်
- [X] **AZD templates နဲ့ workflows တွေကို GitHub Copilot အသုံးပြုပြီး ခွဲခြမ်းစိတ်ဖြာခြင်း**
- [X] **AI Agent starter template ကို Customize နဲ့ Redeploy လုပ်ခြင်း** → ကိုယ်ပိုင်လိုအပ်ချက်များနှင့်အတူ

---

## Workshop အကြောင်းအရာ

ဒီ Workshop ကို module အနေနဲ့ ဖွဲ့စည်းထားပြီး၊ module တစ်ခုစီမှာ လက်တွေ့ lab exercise တစ်ခုပါဝင်ပါတယ်-

1. **Introduction** - AZD templates တွေက ဘာလဲ၊ ဘယ်လိုအလုပ်လုပ်လဲဆိုတာကို နားလည်ပါ
1. **Selection** - ကိုယ့်ရဲ့ AI project အတွက် "starter" template မှန်ကန်တဲ့အရာကို ရှာဖွေပါ
1. **Validation** - Template ကို deploy လုပ်ပြီး advertised အတိုင်း အလုပ်လုပ်မလုပ် စစ်ဆေးပါ
1. **Deconstruction** - Template ကို ခွဲခြမ်းစိတ်ဖြာပြီး အစိတ်အပိုင်းတွေ နဲ့ configuration တွေကို နားလည်ပါ
1. **Configuration** - Azure AI Foundry ရဲ့ features များကို အသုံးပြုဖို့ လေ့လာပါ
1. **Customization** - ကိုယ့်ရဲ့ data နဲ့လိုအပ်ချက်များအတိုင်း application ကို ပြန်တည်ဆောက်ပါ
1. **Teardown** - Infrastructure ကို deprovision လုပ်ပြီး soft-deleted resources တွေကို ပြန်ရယူပါ

---

## အကြံပြုချက်များ & ပြဿနာများ

အခြေခံကနေ စတင်သူများအတွက် အကောင်းဆုံး သင်ယူမှုအတွေ့အကြုံကို ပေးနိုင်ဖို့ curricula ကို အမြဲ update လုပ်နေပါတယ်။ သင့်ရဲ့ အကြံပြုချက်ကို ကျေးဇူးတင်ပါတယ်။

1. ဒီ repo မှာ issue တစ်ခု post လုပ်ပါ - `Workshop` ဆိုတဲ့ tag ကို အသုံးပြုပါ။
1. Azure AI Foundry Discord ကို join လုပ်ပါ - peer learners တွေနဲ့ ချိတ်ဆက်ပါ!

---

