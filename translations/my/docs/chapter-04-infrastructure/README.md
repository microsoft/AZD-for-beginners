# အခန်း ၄: Infrastructure as Code နှင့် တပ်ဆင်ခြင်း

**📚 သင်တန်း**: [AZD For Beginners](../../README.md) | **⏱️ ကြာချိန်**: ၂-၃ နာရီစာဖတ်ရန်; တပ်ဆင်မှုလေ့ကျင့်ခန်းများအတွက် အပိုအချိန် ခွင့်ပြုပါ | **⭐ ပြင်းထန်မှု**: အလယ်အလတ်

---

## အနှစ်ချုပ်

ဤအခန်းတွင် Infrastructure as Code (IaC) ပုံစံများကို Bicep template များဖြင့် ပုံဖော်ခြင်း၊ ရင်းမြစ်များ ဖန်တီးခြင်းနှင့် Azure Developer CLI ကို အသုံးပြု၍ တပ်ဆင်ခြင်း မဟာဗျူဟာများကို တွေ့ရှိနိုင်မည်ဖြစ်သည်။

> အမိန့်နှင့် ဖွဲ့စည်းမှု ပြန်လည်သုံးသပ်မှု၏ အာရုံစိုက်ချက်: `azd 1.37.2` (နိုဝင်ဘာ ၂၀၂၆)။ ပြန်လည်သုံးသပ်မှုတွင် လက်တွေ့ Azure provisioning မပြုလုပ်ခဲ့ပါ။

## သင်ယူရရှိစေလိုသည့် အချက်များ

ဤအခန်းကိုပြီးမြောက်ခြင်းဖြင့် သင်သည်:
- Bicep template ဖွဲ့စည်းမှုနှင့် စာလုံးပုံစံကို နားလည်နိုင်မည်
- `azd provision` ဖြင့် Azure ရင်းမြစ်များ ဖန်တီးနိုင်မည်
- `azd deploy` ဖြင့် လျှောက်လွှာများ တပ်ဆင်နိုင်မည်
- blue-green နှင့် rolling တပ်ဆင်မှု မဟာဗျူဟာများကို အကောင်အထည်ဖော်နိုင်မည်

---

## 📚 အတန်းများ

| # | သင်ခန်းစာ | ဖော်ပြချက် | ကြာချိန် |
|---|--------|-------------|------|
| 1 | [ရင်းမြစ်များ ဖန်တီးခြင်း](provisioning.md) | AZD ဖြင့် Azure resource များ စီမံခန့်ခွဲခြင်း | ၄၅ မိနစ် |
| 2 | [တပ်ဆင်ခြင်း လမ်းညွှန်](deployment-guide.md) | လျှာကာလျှောက်လွှာ တပ်ဆင်မှု မဟာဗျူဟာများ | ၄၅ မိနစ် |
| 3 | [သင့်ကိုယ်ပိုင် Template ဖန်တီးခြင်း](custom-templates.md) | ထပ်မံအသုံးပြုနိုင်သော azd template များ တည်ဆောက်၍ ထုတ်ဝေခြင်း | ၃၀ မိနစ် |

---

## 🚀 အမြန်စတင်ခြင်း

```bash
# Initialize from template
mkdir infrastructure-practice
cd infrastructure-practice
azd init --template todo-nodejs-mongo .
azd auth login

# Preview what will be created
azd provision --preview

# Provision infrastructure only
azd provision

# Deploy code only
azd deploy

# Or both together
azd up
```

---

## 📁 AZD စီမံကိန်း ဖွဲ့စည်းမှု

```
my-project/
├── azure.yaml            # ← Project definition
├── infra/                # ← Infrastructure as Code
│   ├── main.bicep        # Entry point
│   ├── main.parameters.json
│   └── modules/          # Reusable components
│       ├── web.bicep
│       └── database.bicep
└── src/                  # Application code
    └── api/
```

---

## 🔧 အရေးကြီးသော အမိန့်များ

| အမိန့် | ဖော်ပြချက် |
|---------|-------------|
| `azd init` | စီမံကိန်း စတင်ခြင်း |
| `azd provision` | Azure ရင်းမြစ်များ ဖန်တီးခြင်း |
| `azd deploy` | လျှောက်လွှာကုဒ် တပ်ဆင်ခြင်း |
| `azd up` | ရင်းမြစ်ဖန်တီး + တပ်ဆင်ခြင်း |
| `azd down` | ရင်းမြစ်အားလုံး ဖျက်သိမ်းခြင်း |

---

## 🔗 လမ်းညွှန်ခြင်း

| လမ်းညွှန်မှု | အခန်း |
|-----------|---------|
| **ရှေ့ဆက်** | [အခန်း ၃: ဖွဲ့စည်းမှု](../chapter-03-configuration/README.md) |
| **နောက်တစ်ခု** | [အခန်း ၅: မျိုးစုံအေးဂျင့်ဖြေရှင်းချက်များ](../chapter-05-multi-agent/README.md) |

---

## 📖 ဆက်စပ် ရင်းမြစ်များ

- [တပ်ဆင်မှုမပြုမီ စစ်ဆေးမှုများ](../chapter-06-pre-deployment/README.md)
- [Container App ဥပမာများ](../../examples/container-app/README.md)
- [Database App ဥပမာ](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ပြောကြားချက်**
ဤစာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှန်ကန်မှုအတွက် ကြိုးပမ်းနေသော်လည်း၊ စက်ကိရိယာဘာသာပြန်ခြင်းများတွင် အမှားများ သို့မဟုတ် မှားယွင်းချက်များ ပါဝင်နိုင်ကြောင်း သတိပြုပါရန် လိုအပ်ပါသည်။ မူလစာတမ်းကို မူရင်းဘာသာဖြင့်သာ ယုံကြည်စိတ်ချရသော အချက်အလက်အဖြစ် သတ်မှတ်သင့်သည်။ အရေးကြီးသည့် သတင်းအချက်အလက်များအတွက် ပရော်ဖက်ရှင်နယ် လူသားဘာသာပြန်သူဝန်ဆောင်မှုကို အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော နားလည်မှုကွာခြားမှုများ သို့မဟုတ် မမှန်ကန်သော အသုံးပြုမှုများအတွက် ကျွန်ုပ်တို့ တာဝန်မခံပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->