# အခန်း 6: Deploy မလုပ်ခင် စီမံရေးဆွဲခြင်းနှင့် အတည်ပြုခြင်း

**📚 Course**: [AZD အခြေခံများ](../../README.md) | **⏱️ Duration**: 1 နာရီ | **⭐ Complexity**: အလယ်အလတ်

---

## အကျဉ်းချုပ်

ဤအခန်းတွင် သင့်အက်ပ်လီကေးရှင်းကို deploy မလုပ်ခင် လိုအပ်သော စီမံရေးဆွဲမှုများနှင့် အတည်ပြုမှုဆိုင်ရာ အဆင့်များကို ဖော်ပြပါသည်။ စွမ်းဆောင်ရည် စီမံချက်မှန်းချက်များ၊ SKU ရွေးချယ်မှုများနှင့် preflight စစ်ဆေးမှုများအား မှန်ကန်စွာကျင့်သုံးခြင်းဖြင့် စျေးကြီးကျတဲ့ အမှားများကို ရှောင်ရှားနိုင်ပါသည်။

## သင်ယူရမည့် ရည်မှန်းချက်များ

By completing this chapter, you will:
- Deploy မလုပ်ခင် preflight စစ်ဆေးမှုများကို ပြေးနိုင်ရန်
- စွမ်းရည် စီမံချက်များကို အစီအစဉ်ဆွဲ၍ အရင်းအမြစ် လိုအပ်ချက်များ ခန့်မှန်းနိုင်ရန်
- ကုန်ကျစရိတ်ကို အထိရောက်စေရန် သင့်တော်သော SKUs များကို ရွေးချယ်နိုင်ရန်
- စောင့်ကြည့်ရေးအတွက် Application Insights ကို ပြင်ဆင်နိုင်ရန်
- အဖွဲ့လိုက် ညှိနှိုင်းမှု ပုံစံများကို နားလည်နိုင်ရန်

---

## 📚 သင်ခန်းစာများ

| # | သင်ခန်းစာ | ဖော်ပြချက် | အချိန် |
|---|--------|-------------|------|
| 1 | [Preflight Checks](preflight-checks.md) | Deploy မလုပ်ခင် configuration များကို အတည်ပြုရန် | 15 မိနစ် |
| 2 | [Capacity Planning](capacity-planning.md) | အရင်းအမြစ် လိုအပ်ချက်များ ခန့်မှန်းရန် | 20 မိနစ် |
| 3 | [SKU Selection](sku-selection.md) | သင့်တော်သော စျေးနှုန်းအဆင့်များကို ရွေးချယ်ရန် | 15 မိနစ် |
| 4 | [Application Insights](application-insights.md) | စောင့်ကြည့်မှုကို ဖော်ပြရန် | 20 မိနစ် |
| 5 | [Coordination Patterns](coordination-patterns.md) | အဖွဲ့ deployment လုပ်ငန်းစဉ်များ | 15 မိနစ် |

---

## 🚀 လျင်မြန် စတင်ခြင်း

```bash
# Subscription များ၏ ကန့်သတ်ချက် (quota) များကို စစ်ဆေးပါ
az vm list-usage --location eastus --output table

# ဖြန့်ချိမှု ကြိုကြည့်ခြင်း (အရင်းအမြစ်များ မဖန်တီးပါ)
azd provision --preview

# Bicep စာလုံးပုံစံကို အတည်ပြုပါ
az bicep build --file infra/main.bicep

# ပတ်ဝန်းကျင် ဆက်တင်များကို စစ်ဆေးပါ
azd env get-values
```

---

## ☑️ Deploy မလုပ်မီ စစ်ဆေးရန် စာရင်း

### `azd provision` မပြုမီ

- [ ] ဧရိယာအတွက် Quota ကို အတည်ပြုထားသည်
- [ ] SKUs များကို သင့်တော်အောင် ရွေးချယ်ထားသည်
- [ ] ကုန်ကျစရိတ် ခန့်မှန်းချက်ကို ပြန်လည်သုံးသပ်ထားသည်
- [ ] နာမည်ပေးခြင်း စံနှုန်းကို အတူတကွ ထိန်းသိမ်းထားသည်
- [ ] လုံခြုံရေး/RBAC ကို ဖွဲ့စည်းထားသည်

### `azd deploy` မပြုမီ

- [ ] Environment variables များ သတ်မှတ်ထားသည်
- [ ] Key Vault တွင် Secrets များ တင်ထားသည်
- [ ] Connection strings များ အတည်ပြုထားသည်
- [ ] Health checks များ ဖွဲ့စည်းထားသည်

---

## 💰 SKU ရွေးချယ်ခြင်း လမ်းညွှန်

| Workload | Development | Production |
|----------|-------------|------------|
| Container Apps | Consumption | Dedicated D4 |
| App Service | B1/B2 | P1v3+ |
| Microsoft Foundry Models | Standard | Standard + PTU |
| AI Search | Basic | Standard S2+ |

---

## 🔗 လမ်းညွှန်

| Direction | Chapter |
|-----------|---------|
| **Previous** | [အခန်း 5: Multi-Agent](../chapter-05-multi-agent/README.md) |
| **Next** | [အခန်း 7: ပြဿနာဖြေရှင်းမှု](../chapter-07-troubleshooting/README.md) |

---

## 📖 ဆက်စပ် အရင်းအမြစ်များ

- [ဖွဲ့စည်းပုံ လမ်းညွှန်](../chapter-03-configuration/configuration.md)
- [Deployment လမ်းညွှန်](../chapter-04-infrastructure/deployment-guide.md)
- [ယေဘုယျ ပြဿနာများ](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ရှင်းလင်းချက်**:
ဤစာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ဖြင့် ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှုအတွက် ကြိုးပမ်းသော်လည်း အလိုအလျောက် ဘာသာပြန်ချက်များတွင် အမှားများ သို့မဟုတ် မမှန်ကန်မှုများ ပါဝင်နိုင်ကြောင်း ကျေးဇူးပြု၍ သတိပြုပါ။ မူလစာတမ်းကို မူလဘာသာဖြင့်သာ အာဏာပိုင် အရင်းမြစ်အဖြစ် ယူဆသင့်သည်။ အရေးကြီးသော အချက်အလက်များအတွက် ပရော်ဖက်ရှင်နယ် လူသားဘာသာပြန်ကို အသုံးပြုရန် အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုမှုကြောင့် ဖြစ်ပေါ်နိုင်သည့် နားလည်မှုချွတ်ယွင်းမှုများအတွက် ကျွန်ုပ်တို့ တာဝန်မယူပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->