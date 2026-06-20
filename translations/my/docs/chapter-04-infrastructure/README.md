# အခန်း ၄: အင်ဖရားစထရပ်ချာကို ကုဒ်အဖြစ် (Infrastructure as Code) နှင့် တပ်ဆင်ခြင်း

**📚 Course**: [AZD စတင်လေ့လာသူများ](../../README.md) | **⏱️ Duration**: ၁–၁.၅ နာရီ | **⭐ Complexity**: အလယ်အလတ်

---

## အကျဉ်းချုံး

ဤအခန်းတွင် Bicep templates ဖြင့် Infrastructure as Code (IaC) ပုံစံများ၊ အရင်းအမြစ် provision လုပ်ခြင်းနှင့် Azure Developer CLI အသုံးပြုပြီး deployment နည်းလမ်းများကို ဖော်ပြထားသည်။

> Validated against `azd 1.25.6` in June 2026.

## သင်ယူရမည့် ရည်မှန်းချက်များ

By completing this chapter, you will:
- Bicep template ၏ ဖွဲ့စည်းပုံနှင့် သဒ္ဒါ (syntax) ကို နားလည်ပါ
- `azd provision` ဖြင့် Azure အရင်းအမြစ်များကို provision လုပ်ပါ
- `azd deploy` ဖြင့် အက်ပလီကေးရှင်းများကို တပ်ဆင်ပါ
- blue-green နှင့် rolling deployment များကို အကောင်အထည်ဖော်ပါ

---

## 📚 သင်ခန်းစာများ

| # | Lesson | Description | Time |
|---|--------|-------------|------|
| 1 | [အရင်းအမြစ်များ ဖန်တီးခြင်း](provisioning.md) | AZD ဖြင့် Azure အရင်းအမြစ် စီမံခန့်ခွဲခြင်း | 45 မိနစ် |
| 2 | [တပ်ဆင်လမ်းညွှန်](deployment-guide.md) | အက်ပလီကေးရှင်း တပ်ဆင်မှု မျိုးစနစ်များ | 45 မိနစ် |
| 3 | [သင့်ကိုယ်ပိုင် Template ရေးသားခြင်း](custom-templates.md) | အသုံးပြုနိုင်သော azd template များ တည်ဆောက်ပြီး ထုတ်ဝေခြင်း | 30 မိနစ် |

---

## 🚀 အစပြုလျင်မြန်စွာ စတင်ခြင်း

```bash
# ပုံစံမှ စတင်သည်
azd init --template azure-functions-python-v2-http

# ဖန်တီးမည့် အရာများကို ကြိုတင်ကြည့်ရှုပါ
azd provision --preview

# အောက်ခံအဆောက်အအုံကိုသာ ဖွဲ့ပေးသည်
azd provision

# ကုဒ်ကိုသာ တင်ပို့သည်
azd deploy

# သို့မဟုတ် နှစ်ခုလုံးကို အတူတကွ
azd up
```

---

## 📁 AZD ပရောဂျက် ဖွဲ့စည်းပုံ

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

## 🔧 အရေးပါတဲ့ အမိန့်များ

| Command | Description |
|---------|-------------|
| `azd init` | ပရောဂျက် ကို စတင် ပြုလုပ်သည် |
| `azd provision` | Azure အရင်းအမြစ်များ ဖန်တီးသည် |
| `azd deploy` | အက်ပလီကေးရှင်း ကုဒ် ကို တပ်ဆင်သည် |
| `azd up` | provision + deploy |
| `azd down` | အရင်းအမြစ်များအားလုံး ဖျက်ပါ |

---

## 🔗 လမ်းညွှန်

| Direction | Chapter |
|-----------|---------|
| **Previous** | [အခန်း ၃: Configuration](../chapter-03-configuration/README.md) |
| **Next** | [အခန်း ၅: မျိုးစုံ အေဂျင့် ဖြေရှင်းချက်များ](../chapter-05-multi-agent/README.md) |

---

## 📖 ဆက်စပ် အရင်းအမြစ်များ

- [တပ်ဆင်မှုမတိုင်ခင် စစ်ဆေးချက်များ](../chapter-06-pre-deployment/README.md)
- [Container App ဥပမာများ](../../examples/container-app/README.md)
- [ဒေတာဘေ့စ် အက်ပလီကေးရှင်း ဥပမာ](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ပြောကြားချက်**
ဤစာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှန်ကန်မှုအတွက် ကြိုးပမ်းနေသော်လည်း၊ စက်ကိရိယာဘာသာပြန်ခြင်းများတွင် အမှားများ သို့မဟုတ် မှားယွင်းချက်များ ပါဝင်နိုင်ကြောင်း သတိပြုပါရန် လိုအပ်ပါသည်။ မူလစာတမ်းကို မူရင်းဘာသာဖြင့်သာ ယုံကြည်စိတ်ချရသော အချက်အလက်အဖြစ် သတ်မှတ်သင့်သည်။ အရေးကြီးသည့် သတင်းအချက်အလက်များအတွက် ပရော်ဖက်ရှင်နယ် လူသားဘာသာပြန်သူဝန်ဆောင်မှုကို အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော နားလည်မှုကွာခြားမှုများ သို့မဟုတ် မမှန်ကန်သော အသုံးပြုမှုများအတွက် ကျွန်ုပ်တို့ တာဝန်မခံပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->