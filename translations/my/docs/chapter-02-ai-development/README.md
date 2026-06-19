# အခန်း ၂: AI-First ဖွံ့ဖြိုးရေး

**📚 Course**: [AZD For Beginners](../../README.md) | **⏱️ Duration**: 1-2 hours | **⭐ Complexity**: အလယ်အလတ်

---

## အကျဉ်းချုပ်

ဤအခန်းသည် Azure Developer CLI နှင့် Microsoft Foundry ဝန်ဆောင်မှုများကို အသုံးပြု၍ AI အင်အားပြင်းသော အပလီကေးရှင်းများကို တပ်ဆင်ခြင်းအပေါ် ဦးတည်ထားသည်။ ရိုးရှင်းသော AI စကားပြောအက်ပ်များမှ ကိရိယာများပါရှိသည့် ဉာဏ်ရည်ရှိ အေးဂျင့်များထိ အရာအားလုံးကို ဖော်ပြထားသည်။

> **စစ်ဆေးမှတ်ချက် (2026-06-15):** ဤအခန်းတွင်ပါတဲ့ command စီးကြောင်းနှင့် extension လမ်းညွှန်ချက်များကို `azd` `1.25.6` နှင့် လက်ရှိ preview AI agent extension release `azure.ai.agents` `0.1.40-preview` တို့နှင့် နှိုင်းယှဉ်၍ စစ်ဆေးထားပါသည်။ သင့်တွင် အဟောင်း AZD build ရှိပါက အရင်ဆုံး update ပြုလုပ်ပြီးနောက် လေ့ကျင့်ခန်းများကို ဆက်လုပ်ဆောင်ပါ။

## သင်ယူရမည့် ရည်မှန်းချက်များ

- Pre-built AZD templates များကို အသုံးပြု၍ AI အပလီကေးရှင်းများကို တပ်ဆင်ပါ။
- AZD နှင့် Microsoft Foundry ပေါင်းစည်းမှုကို နားလည်ပါ။
- ကိရိယာများဖြင့် AI agents များကို ဖော်ဆောင်၊ တပ်ဆင်နှင့် စိတ်ကြိုက်ပြုပြင်နိုင်ရန် စီစဉ်ပါ။
- RAG (Retrieval-Augmented Generation) အပလီကေးရှင်းများကို တပ်ဆင်ပါ။

---

## 📚 သင်ခန်းစာများ

| # | သင်ခန်းစာ | ဖော်ပြချက် | အချိန် |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry Integration](microsoft-foundry-integration.md) | AZD ကို Foundry ဝန်ဆောင်မှုများနှင့် ချိတ်ဆက်ပါ | 30 min |
| 2 | [AI Agents Guide](agents.md) | ကိရိယာများဖြင့် ဉာဏ်ရည်မြင့် agent များ တပ်ဆင်ပါ | 45 min |
| 3 | [AI Model Deployment](ai-model-deployment.md) | AI မော်ဒယ်များကို တပ်ဆင်ပြီး ဆက်တင်ပြုလုပ်ပါ | 30 min |
| 4 | [AI Workshop Lab](ai-workshop-lab.md) | လက်တွေ့အလုပ်: သင့် AI ဖြေရှင်းချက်ကို AZD အတွက် ပြင်ဆင်ပါ | 60 min |

---

## 🚀 လျင်မြန်စတင်ခြင်း

```bash
# ရွေးချယ်စရာ ၁: RAG စကားပြော အက်ပလီကေးရှင်း
azd init --template azure-search-openai-demo
azd up

# ရွေးချယ်စရာ ၂: AI ကိုယ်စားလှယ်များ
azd init --template get-started-with-ai-agents
azd up

# ရွေးချယ်စရာ ၃: အမြန် စကားပြော အက်ပ်
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 ထင်ရှားသော AI နမူနာများ

| နမူနာ | ဖော်ပြချက် | ဝန်ဆောင်မှုများ |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ကိုးကားချက်များပါသည့် RAG စကားဝိုင်း | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ကိရိယာများပါရှိသော AI agent | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | အခြေခံ AI စကားပြော | OpenAI + Container Apps |

---

## 💰 ကုန်ကျစရိတ် သတိပြုချက်

| ပတ်ဝန်းကျင် | ခန့်မှန်း လစဉ်ကုန်ကျစရိတ် |
|-------------|----------------------|
| ဖွံ့ဖြိုးရေး | $80-150 |
| စမ်းသပ်ပတ်ဝန်းကျင် | $150-300 |
| ထုတ်လုပ်မှု | $300-3,500+ |

**အကြံပြုချက်:** စမ်းသပ်ပြီးပါက ကျသင့်ငွေများကို ရှောင်ရှားရန် `azd down` ကို လုပ်ဆောင်ပါ။

---

## 🔗 လမ်းညွှန်

| သွားရာလမ်း | အခန်း |
|-----------|---------|
| **Previous** | [အခန်း ၁: အခြေခံ](../chapter-01-foundation/README.md) |
| **Next** | [အခန်း ၃: ဖွဲ့စည်းတပ်ဆင်ခြင်း](../chapter-03-configuration/README.md) |
| **Skip to** | [အခန်း ၈: ထုတ်လုပ်မှု ပုံစံများ](../chapter-08-production/README.md) |

---

## 📖 ဆက်စပ် အရင်းအမြစ်များ

- [AI Troubleshooting](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Production AI Practices](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ပြောကြားချက်**
ဤစာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှန်ကန်မှုအတွက် ကြိုးပမ်းနေသော်လည်း၊ စက်ကိရိယာဘာသာပြန်ခြင်းများတွင် အမှားများ သို့မဟုတ် မှားယွင်းချက်များ ပါဝင်နိုင်ကြောင်း သတိပြုပါရန် လိုအပ်ပါသည်။ မူလစာတမ်းကို မူရင်းဘာသာဖြင့်သာ ယုံကြည်စိတ်ချရသော အချက်အလက်အဖြစ် သတ်မှတ်သင့်သည်။ အရေးကြီးသည့် သတင်းအချက်အလက်များအတွက် ပရော်ဖက်ရှင်နယ် လူသားဘာသာပြန်သူဝန်ဆောင်မှုကို အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော နားလည်မှုကွာခြားမှုများ သို့မဟုတ် မမှန်ကန်သော အသုံးပြုမှုများအတွက် ကျွန်ုပ်တို့ တာဝန်မခံပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->