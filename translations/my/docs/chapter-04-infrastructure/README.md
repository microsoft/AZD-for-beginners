# အခန်း ၄: အဆောက်အအုံကို ကုဒ်အဖြစ် (Infrastructure as Code) နှင့် ဖြန့်ချိခြင်း

**📚 သင်တန်း**: [AZD စတင်သူများအတွက်](../../README.md) | **⏱️ ကြာချိန်**: 1-1.5 နာရီ | **⭐ အဆင့်**: အလယ်အလတ်

---

## အကျဉ်းချုပ်

ဤအခန်းတွင် Bicep templates ဖြင့် Infrastructure as Code (IaC) ပုံစံများ၊ resource provisioning နှင့် Azure Developer CLI သုံး၍ deployment များကို ဖေါ်ပြထားသည်။

> ဒီဟာကို `azd 1.23.12` နဲ့ ၂၀၂၆ မတ်လတွင် စစ်ဆေးပြီး သက်သေပြထားသည်။

## သင်ယူရမည့် ရည်ရွယ်ချက်များ

By completing this chapter, you will:
- Bicep template ၏ ဖွဲ့စည်းပုံနှင့် syntax ကို နားလည်ရန်
- `azd provision` ဖြင့် Azure အရင်းအမြစ်များကို ဖန်တီးရန်
- `azd deploy` ဖြင့် application များကို ဖြန့်ချိရန်
- blue-green နှင့် rolling deployment များကို အကောင်အထည်ဖော်ရန်

---

## 📚 သင်ခန်းစာများ

| # | သင်ခန်းစာ | ဖော်ပြချက် | အချိန် |
|---|--------|-------------|------|
| 1 | [Provisioning Resources](provisioning.md) | AZD ဖြင့် Azure အရင်းအမြစ် စီမံခန့်ခွဲခြင်း | 45 မိနစ် |
| 2 | [Deployment Guide](deployment-guide.md) | အက်ပလီကေးရှင်း ဖြန့်ချိခြင်း နည်းဗျုဟာများ | 45 မိနစ် |

---

## 🚀 အမြန် စတင်ရန်

```bash
# နမူနာမှ စတင်လုပ်ဆောင်သည်
azd init --template azure-functions-python-v2-http

# ဖန်တီးမည့် အရာကို ကြိုကြည့်ရှုပါ
azd provision --preview

# အောက်ခံအဆောက်အအုံကိုသာ ပံ့ပိုးတင်သွင်းမည်
azd provision

# ကုဒ်ကိုသာ ဖြန့်ချိမည်
azd deploy

# သို့မဟုတ် နှစ်ခုလုံးကို အတူတကွ
azd up
```

---

## 📁 AZD စီမံကိန်း ဖွဲ့စည်းပုံ

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

## 🔧 အဓိက ကွန်မန့်များ

| ကွန်မန့် | ဖော်ပြချက် |
|---------|-------------|
| `azd init` | ပရောဂျက်ကို စတင်သတ်မှတ်ရန် |
| `azd provision` | Azure အရင်းအမြစ်များကို ဖန်တီးရန် |
| `azd deploy` | application ကုဒ်ကို ဖြန့်ချိရန် |
| `azd up` | provision + deploy |
| `azd down` | အရင်းအမြစ်အားလုံးကို ဖျက်ရန် |

---

## 🔗 ဦးတည်ချက်

| ဦးတည်ချက် | အခန်း |
|-----------|---------|
| **ယခင်** | [အခန်း ၃: ဖွဲ့စည်းမှု](../chapter-03-configuration/README.md) |
| **နောက်တစ်ခု** | [အခန်း ၅: မူလတီ-အေးဂျင့် ဖြေရှင်းချက်များ](../chapter-05-multi-agent/README.md) |

---

## 📖 ဆက်စပ် အရင်းအမြစ်များ

- [ဖြန့်ချိမှု မပြုမီ စစ်ဆေးချက်များ](../chapter-06-pre-deployment/README.md)
- [Container App ဥပမာများ](../../examples/container-app/README.md)
- [Database App ဥပမာ](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
ဤစာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် မှန်ကန်မှုပေးရန် ကြိုးစားသော်လည်း၊ အလိုအလျောက် ဘာသာပြန်ချက်များတွင် အမှားများ သို့မဟုတ် မှန်ကန်မှုမရှိမှုများ ပါဝင်နိုင်သည်ကို ကျေးဇူးပြု၍ သတိပြုပါ။ မူလစာတမ်းကို မိခင်ဘာသာဖြင့် အတည်ပြုသော အရေးပါသော ရင်းမြစ်အဖြစ် သတ်မှတ်စဉ်းစားသင့်ပါသည်။ အရေးကြီးသော အချက်အလက်များအတွက် ကျွမ်းကျင်သော လူ့ဘာသာပြန်ဝန်ဆောင်မှုကို အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုမှုကြောင့် ဖြစ်ပေါ်လာနိုင်သည့် နားမလည်မှုများ သို့မဟုတ် မမှန်သော ဖော်ပြချက်များအတွက် ကျွန်ုပ်တို့ တာဝန်မယူပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->