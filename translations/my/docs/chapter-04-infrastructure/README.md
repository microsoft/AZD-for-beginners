# Chapter 4: အဆောက်အအုံကိုကုဒ်အဖြစ် (Infrastructure as Code) နှင့် တပ်ဆင်ခြင်း

**📚 Course**: [AZD စတင်သင်ကြားသူများအတွက်](../../README.md) | **⏱️ Duration**: 1-1.5 နာရီ | **⭐ Complexity**: အလယ်အလတ်

---

## အကျဉ်းချုပ်

ဒီအခန်းမှာ Bicep template များဖြင့် Infrastructure as Code (IaC) နမူနာများ၊ resource provisioning နှင့် Azure Developer CLI အသုံးပြု၍ တပ်ဆင်ခြင်း မဟာဗျူဟာများကို လေ့လာပါမည်။

## သင်ယူရမည့် ရည်ရွယ်ချက်များ

By completing this chapter, you will:
- Bicep template ဖွဲ့စည်းပုံနှင့် စာရိုက်ပုံကို နားလည်နိုင်ရန်
- Azure အရင်းအမြစ်များကို `azd provision` ဖြင့် တည်ဆောက်နိုင်ရန်
- အပလီကေးရှင်းများကို `azd deploy` ဖြင့် တပ်ဆင်နိုင်ရန်
- blue-green နှင့် rolling deployment မဟာဗျူဟာများကို အကောင်အထည်ဖော်နိုင်ရန်

---

## 📚 သင်ခန်းစာများ

| # | သင်ခန်းစာ | ဖော်ပြချက် | အချိန် |
|---|--------|-------------|------|
| 1 | [Provisioning Resources](provisioning.md) | AZD ဖြင့် Azure အရင်းအမြစ် မန်နေဂျ်မင့် | 45 မိနစ် |
| 2 | [Deployment Guide](deployment-guide.md) | အပလီကေးရှင်း တပ်ဆင်မှု မဟာဗျူဟာများ | 45 မိနစ် |

---

## 🚀 အမြန် စတင်ရန်

```bash
# ပုံစံမှ စတင်ပြုလုပ်ရန်
azd init --template azure-functions-python-v2-http

# ဖန်တီးမည့်အရာကို ကြိုကြည့်ရန်
azd provision --preview

# အဆောက်အအုံကိုသာ ပံ့ပိုးခြင်း
azd provision

# ကုဒ်ကိုသာ ဖြန့်ချိခြင်း
azd deploy

# သို့မဟုတ် နှစ်ခုလုံးကို တပြိုင်နက်
azd up
```

---

## 📁 AZD Project Structure

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

## 🔧 အရေးပါသော ကွန်မန်းများ

| Command | ဖော်ပြချက် |
|---------|-------------|
| `azd init` | ပရောဂျက် စတင်ခြင်း |
| `azd provision` | Azure အရင်းအမြစ်များ ဖန်တီးသည် |
| `azd deploy` | အပလီကေးရှင်း ကုဒ် တပ်ဆင်သည် |
| `azd up` | တည်ဆောက် + တပ်ဆင် |
| `azd down` | အားလုံး အရင်းအမြစ်များ ဖျက်ပစ်သည် |

---

## 🔗 သွားလာရန်လမ်းညွှန်

| ဦးတည်ချက် | အခန်း |
|-----------|---------|
| **ယခင်** | [Chapter 3: ဖွဲ့စည်းမှု](../chapter-03-configuration/README.md) |
| **နောက်တစ်ခု** | [Chapter 5: မျိုးစုံ အေးဂျင့် ဖြေရှင်းချက်များ](../chapter-05-multi-agent/README.md) |

---

## 📖 သက်ဆိုင်ရာ အရင်းအမြစ်များ

- [Pre-Deployment Checks](../chapter-06-pre-deployment/README.md)
- [Container App Examples](../../examples/container-app/README.md)
- [Database App Example](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
တာဝန်ပယ်ဆိုချက်:
ဒီစာရွက်စာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) အသုံးပြုပြီး ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် မှန်ကန်မှုအတွက် ကြိုးစားသော်လည်း အလိုအလျောက် ဘာသာပြန်ခြင်းများတွင် အမှားများ သို့မဟုတ် မမှန်ကန်မှုများ ပါဝင်နိုင်ကြောင်း သိရှိထားပါရန် ဤကို သတိပေးချင်ပါသည်။ မူရင်းစာရွက်စာတမ်းကို ထိုဘာသာစကားဖြင့်ရေးထားသည့် မူရင်းကို ယုံကြည်စိတ်ချရသော အရင်းအမြစ်အဖြစ် သတ်မှတ်စဉ်းစားသင့်သည်။ အရေးကြီးသော သတင်းအချက်အလက်များအတွက် လူ့ပညာရှင်များဆိုင်သော ပရော်ဖက်ရှင်နယ် ဘာသာပြန်မှုပေးသူအား ထိတွေ့ပြုရန် အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုမှုကြောင့် ဖြစ်ပျက်လာနိုင်သည့် ရိုက်ခတ်မှုများ သို့မဟုတ် မဖြစ်ချင်သော အဓိပ္ပာယ်အဆင်မပြေမှုများအတွက် ကျွန်ုပ်တို့သည် တာဝန်မရှိပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->