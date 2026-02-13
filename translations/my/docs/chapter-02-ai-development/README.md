# အခန်း 2: AI-First Development

**📚 Course**: [AZD စတင်လေ့လာသူများ](../../README.md) | **⏱️ Duration**: 1-2 နာရီ | **⭐ Complexity**: အလယ်အလတ်

---

## အကျဉ်းချုပ်

ဤအခန်းသည် Azure Developer CLI နှင့် Microsoft Foundry ဝန်ဆောင်မှုများကို အသုံးပြု၍ AI အင်အားမြှင့်ထားသော အက်ပလီကေးရှင်းများကို တပ်ဆင်ခြင်းအပေါ် အာရုံစိုက်သည်။ ရိုးရှင်းသော AI စကားပြောအက်ပ်များမှ ကိရိယာများပါသည့် တောက်ပသော အေးဂျင့်များအထိ။

## သင်ယူရမည့် ရည်ရွယ်ချက်များ

By completing this chapter, you will:
- အသင့်ပြင်ထားသော AZD template များကို အသုံးပြု၍ AI အက်ပလီကေးရှင်းများ တပ်ဆင်ခြင်း
- Microsoft Foundry သည် AZD နှင့် မည်သို့ ပေါင်းစည်းမှု ရှိသည်ကို နားလည်ခြင်း
- ကိရိယာများပါရှိသည့် AI agent များကို ဖွဲ့စည်း၊ စိတ်ကြိုက် ပြင်ဆင်ခြင်း
- RAG (Retrieval-Augmented Generation) အက်ပလီကေးရှင်းများ တပ်ဆင်ခြင်း

---

## 📚 သင်ခန်းစာများ

| # | သင်ခန်းစာ | ဖော်ပြချက် | အချိန် |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry ပေါင်းစည်းခြင်း](microsoft-foundry-integration.md) | AZD ကို Foundry ဝန်ဆောင်မှုများနှင့် ချိတ်ဆက်သည် | 30 မိနစ် |
| 2 | [AI Agents လမ်းညွှန်](agents.md) | ကိရိယာများပါသော ကျွမ်းကျင် AI agent များ တပ်ဆင်ခြင်း | 45 မိနစ် |
| 3 | [AI မော်ဒယ် တပ်ဆင်ခြင်း](ai-model-deployment.md) | AI မော်ဒယ်များကို တပ်ဆင်နှင့် ဖွဲ့စည်းပုံချိန်ညှိခြင်း | 30 မိနစ် |
| 4 | [AI လက်တွေ့ လေ့ကျင့်ခန်း](ai-workshop-lab.md) | လက်တွေ့ကျသင်: သင့် AI ဖြေရှင်းချက်ကို AZD အသင့်ပြင်ဆင်ခြင်း | 60 မိနစ် |

---

## 🚀 မြန်စတင်ခြင်း

```bash
# ရွေးချယ်မှု 1: RAG စကားပြော အက်ပလီကေးရှင်း
azd init --template azure-search-openai-demo
azd up

# ရွေးချယ်မှု 2: AI ကိုယ်စားလှယ်များ
azd init --template get-started-with-ai-agents
azd up

# ရွေးချယ်မှု 3: အမြန် စကားပြော အက်ပလီကေးရှင်း
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 ဖော်ပြထားသော AI ပုံစံများ

| Template | ဖော်ပြချက် | ဝန်ဆောင်မှုများ |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ထောက်ခံချက်များပါသော RAG စကားဝိုင်း | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ကိရိယာများပါသော AI agent | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | အခြေခံ AI စကားပြော | OpenAI + Container Apps |

---

## 💰 ကုန်ကျစရိတ် သတိပြုရန်

| ပတ်ဝန်းကျင် | လစဉ် ခန့်မှန်း ကုန်ကျစရိတ် |
|-------------|----------------------|
| ဖွံ့ဖြိုးရေး | $80-150 |
| Staging | $150-300 |
| ထုတ်လုပ်ရေး | $300-3,500+ |

**အကြံပြုချက်:** စမ်းသပ်ပြီးပါက ကုန်ကျစရိတ် မပေးရရန် `azd down` ကို လည်ပတ်ပါ။

---

## 🔗 လမ်းညွှန်

| ဦးတည်ချက် | အခန်း |
|-----------|---------|
| **ယခင်** | [အခန်း 1: အခြေခံ](../chapter-01-foundation/README.md) |
| **နောက်တစ်ခု** | [အခန်း 3: ပြင်ဆင်မှု](../chapter-03-configuration/README.md) |
| **ခုန်၍ သွားရန်** | [အခန်း 8: Production Patterns](../chapter-08-production/README.md) |

---

## 📖 ဆက်စပ် အရင်းအမြစ်များ

- [AI Troubleshooting](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Production AI Practices](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
သတိပေးချက်:
ဤစာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှုဖြစ်သော Co-op Translator (https://github.com/Azure/co-op-translator) ဖြင့် ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှန်ကန်စေရန် ကြိုးစားသော်လည်း၊ အလိုအလျောက် ဘာသာပြန်ချက်များတွင် အမှားများ သို့မဟုတ် မွားယွင်းချက်များ ပါဝင်နိုင်ကြောင်း သိရှိထားပါ။ မူလစာတမ်းကို မူလဘာသာဖြင့် ရရှိနိုင်သည့် မူရင်းစာတမ်းကို အာမခံရသော အရင်းအမြစ် အဖြစ် ယူဆသင့်ပါသည်။ အရေးကြီးသော အချက်အလက်များအတွက် ကျွမ်းကျင်သော လူ့ဘာသာပြန်မှုပုံစံကို အသုံးပြုရန် အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာနိုင်သည့် နားလည်မှုပြီးမမှန်ခြင်းများအတွက် ကျွန်ုပ်တို့သည် တာဝန်မယူပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->