# အခန်း 2: AI-ပထမ ဦးစားပေး ဖွံ့ဖြိုးရေး

**📚 သင်တန်း**: [AZD For Beginners](../../README.md) | **⏱️ ကြာမြင့်ချိန်**: 1-2 နာရီ | **⭐ ရှုပ်ထွေးမှု**: အလယ်အလတ်

---

## အကျဉ်းချုပ်

ဤအခန်းသည် Azure Developer CLI နှင့် Microsoft Foundry ဝန်ဆောင်မှုများကို အသုံးပြု၍ AI အင်အားပြင်းသော အက်ပလီကေးရှင်းများကို တပ်ဆင်နည်းများအပေါ် ဦးတည်ထားသည်။ ရိုးရှင်းသော AI စကားပြော အက်ပလီကေးရှင်းများမှ tools များပါရှိသည့် တရားရှင်း အေးဂျင့်များထိ ပါဝင်သည်။

> **အတည်ပြု မှတ်ချက် (2026-03-25):** ဤအခန်းရှိ command အလုပ်စဉ်နှင့် extension လမ်းညွှန်ချက်များကို `azd` `1.23.12` နှင့် လက်ရှိ preview AI agent extension release `azure.ai.agents` `0.1.18-preview` တို့နှင့် နှိုင်းယှဉ်စစ်ဆေးခဲ့ပါသည်။ သင်၏ AZD build သည် အဟောင်းဖြစ်ပါက အရင်ဆုံး update လုပ်ပြီးနောက် လေ့ကျင့်ခန်းများကို ဆက်လက်ဆောင်ရွက်ပါ။

## သင်ယူရမည့် ရည်မှန်းချက်များ

By completing this chapter, you will:
- တီထွင်ပြီးသား AZD နမူနာများကို အသုံးပြု၍ AI အက်ပလီကေးရှင်းများကို တပ်ဆင်နိုင်ရန်
- AZD နှင့် Microsoft Foundry ပေါင်းစည်းမှုကို နားလည်ရန်
- ကိရိယာများဖြင့် AI agent များကို အပြောင်းအလဲ ပြု၍ ဖွဲ့စည်းရန်
- RAG (Retrieval-Augmented Generation) အက်ပလီကေးရှင်းများကို တပ်ဆင်ရန်

---

## 📚 သင်ခန်းစာများ

| # | Lesson | Description | Time |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry Integration](microsoft-foundry-integration.md) | AZD ကို Foundry ဝန်ဆောင်မှုများနှင့် ချိတ်ဆက်ပါ | 30 မိနစ် |
| 2 | [AI Agents Guide](agents.md) | ကိရိယာများပါသော အနူးအမြှုပ် agent များကို တပ်ဆင်ပါ | 45 မိနစ် |
| 3 | [AI Model Deployment](ai-model-deployment.md) | AI မော်ဒယ်များကို တပ်ဆင်ပြီး ဖွဲ့စည်းပါ | 30 မိနစ် |
| 4 | [AI Workshop Lab](ai-workshop-lab.md) | လက်တွေ့ လေ့ကျင့်ခန်း: သင့် AI ဖြေရှင်းချက်ကို AZD အဆင်သင့် ပြုလုပ်ပါ | 60 မိနစ် |

---

## 🚀 အမြန် စတင်ခြင်း

```bash
# ရွေးချယ်မှု ၁: RAG စကားပြော အက်ပ်
azd init --template azure-search-openai-demo
azd up

# ရွေးချယ်မှု ၂: AI ကိုယ်စားလှယ်များ
azd init --template get-started-with-ai-agents
azd up

# ရွေးချယ်မှု ၃: အမြန် စကားပြော အက်ပ်
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 ဖော်ပြထားသော AI Templates

| Template | Description | Services |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ရင်းမြစ်ကို ဖော်ပြသည့် citation များပါသော RAG စကားဝိုင်း | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ကိရိယာများကို အသုံးပြုသည့် AI agent | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | အခြေခံ AI စကားဝိုင်း | OpenAI + Container Apps |

---

## 💰 ကုန်ကျစရိတ် သတိပေးချက်

| Environment | Estimated Monthly Cost |
|-------------|----------------------|
| Development | $80-150 |
| Staging | $150-300 |
| Production | $300-3,500+ |

**အကြံပြုချက်:** စမ်းသပ်ပြီးပါက ကုန်ကျစရိတ်များ ရှောင်ရန် `azd down` ကို လုပ်ဆောင်ပါ။

---

## 🔗 သွားရာလမ်းကြောင်း

| Direction | Chapter |
|-----------|---------|
| **ယခင်** | [Chapter 1: Foundation](../chapter-01-foundation/README.md) |
| **နောက်တစ်ခု** | [Chapter 3: Configuration](../chapter-03-configuration/README.md) |
| **ကျော်၍ သို့သွားရန်** | [Chapter 8: Production Patterns](../chapter-08-production/README.md) |

---

## 📖 ဆက်စပ် အရင်းအမြစ်များ

- [AI Troubleshooting](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Production AI Practices](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
ဒီစာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ဖြင့် ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှုအတွက် ကြိုးပမ်းလျက်ရှိသော်လည်း အလိုအလျောက် ဘာသာပြန်ချက်များတွင် အမှားများ သို့မဟုတ် မတိကျမှုများ ပါရှိနိုင်ကြောင်း သတိပြုပါ။ မူလဘာသာဖြင့် ရေးသားထားသော မူရင်းစာတမ်းကို ယုံကြည်ရသော အရင်းအမြစ်အဖြစ် ယူဆရမည်။ အရေးကြီးသော အချက်အလက်များအတွက် ပရော်ဖက်ရှင်နယ် လူ့ဘာသာပြန်ကို အသုံးပြုရန် အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုခြင်းကြောင့် ဖြစ်ပေါ်တတ်သည့် နားမလည်မှုများ သို့မဟုတ် မှားယွင်းဖော်ပြချက်များအတွက် ကျွန်ုပ်တို့ တာဝန်မယူပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->