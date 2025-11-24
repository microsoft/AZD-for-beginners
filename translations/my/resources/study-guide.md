<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "02c0d6833f050997d358015c9d6b71d9",
  "translation_date": "2025-11-23T22:36:56+00:00",
  "source_file": "resources/study-guide.md",
  "language_code": "my"
}
-->
# သင်ကြားမှုလမ်းညွှန် - အပြည့်အစုံသင်ယူရမည့်ရည်မှန်းချက်များ

**သင်ကြားမှုလမ်းကြောင်းအကြောင်းအရာများ**
- **📚 သင်တန်းပင်မစာမျက်နှာ**: [AZD For Beginners](../README.md)
- **📖 သင်ကြားမှုစတင်ရန်**: [အခန်း ၁: အခြေခံနှင့် အမြန်စတင်ခြင်း](../README.md#-chapter-1-foundation--quick-start)
- **🎯 တိုးတက်မှုစစ်ဆေးမှု**: [သင်တန်းပြီးစီးမှု](../README.md#-course-completion--certification)

## နိဒါန်း

ဒီအပြည့်အစုံသင်ကြားမှုလမ်းညွှန်သည် Azure Developer CLI (azd) ကိုကျွမ်းကျင်စွာသင်ယူနိုင်ရန်အတွက် စနစ်တကျရည်မှန်းချက်များ၊ အဓိကအကြောင်းအရာများ၊ လက်တွေ့လေ့ကျင့်မှုများနှင့် စမ်းသပ်မှုပစ္စည်းများကို ပံ့ပိုးပေးပါသည်။ သင်၏တိုးတက်မှုကိုစစ်ဆေးရန်နှင့် အရေးကြီးသောအကြောင်းအရာများအားလုံးကိုဖုံးလွှမ်းထားကြောင်းသေချာစေရန် ဒီလမ်းညွှန်ကိုအသုံးပြုပါ။

## သင်ယူရမည့်ရည်မှန်းချက်များ

ဒီလမ်းညွှန်ကိုပြီးစီးခြင်းဖြင့် သင်သည်:
- Azure Developer CLI ၏ အခြေခံနှင့် အဆင့်မြင့်အကြောင်းအရာများအားလုံးကို ကျွမ်းကျင်စွာသိရှိမည်
- Azure အပလီကေးရှင်းများကို တင်သွင်းခြင်းနှင့် စီမံခန့်ခွဲခြင်းတွင် လက်တွေ့ကျွမ်းကျင်မှုရရှိမည်
- တင်သွင်းမှုများကို ပြဿနာဖြေရှင်းခြင်းနှင့် အကောင်းဆုံးအခြေအနေသို့ရောက်အောင်လုပ်နိုင်မည်
- ထုတ်လုပ်မှုအဆင့်သင့်တင်သွင်းမှုနည်းလမ်းများနှင့် လုံခြုံရေးစဉ်းစားချက်များကို နားလည်မည်

## သင်ယူမှုရလဒ်များ

ဒီလမ်းညွှန်ရှိ အခန်းအားလုံးကိုပြီးစီးပြီးနောက် သင်သည်:
- azd ကိုအသုံးပြု၍ အပြည့်အစုံသော အပလီကေးရှင်းအဆောက်အအုံများကို ဒီဇိုင်းဆွဲ၊ တင်သွင်းနှင့် စီမံခန့်ခွဲနိုင်မည်
- စုံလင်သော စောင့်ကြည့်မှု၊ လုံခြုံရေးနှင့် ကုန်ကျစရိတ်အကောင်းဆုံးဖြေရှင်းနည်းများကို အကောင်အထည်ဖော်နိုင်မည်
- ရှုပ်ထွေးသော တင်သွင်းမှုပြဿနာများကို ကိုယ်တိုင်ဖြေရှင်းနိုင်မည်
- ကိုယ်ပိုင်အချုပ်အခြေခံပုံစံများကို ဖန်တီးပြီး azd အသိုင်းအဝိုင်းတွင် ပါဝင်ဆောင်ရွက်နိုင်မည်

## ၈-အခန်း သင်ယူမှုဖွဲ့စည်းမှု

### အခန်း ၁: အခြေခံနှင့် အမြန်စတင်ခြင်း (ပထမအပတ်)
**ကြာချိန်**: ၃၀-၄၅ မိနစ် | **အဆင့်ခက်မှု**: ⭐

#### သင်ယူရမည့်ရည်မှန်းချက်များ
- Azure Developer CLI ၏ အဓိကအကြောင်းအရာများနှင့် အသုံးအနှုန်းများကို နားလည်ပါ
- သင်၏ ဖွံ့ဖြိုးရေးပလက်ဖောင်းတွင် AZD ကို အောင်မြင်စွာတပ်ဆင်ပြီး ပြင်ဆင်ပါ
- ရှိပြီးသားပုံစံတစ်ခုကို အသုံးပြု၍ သင်၏ ပထမဆုံးအပလီကေးရှင်းကို တင်သွင်းပါ
- AZD command-line interface ကို ထိရောက်စွာအသုံးပြုနိုင်ပါ

#### ကျွမ်းကျင်ရမည့် အဓိကအကြောင်းအရာများ
- AZD ပရောဂျက်ဖွဲ့စည်းမှုနှင့် အစိတ်အပိုင်းများ (azure.yaml, infra/, src/)
- ပုံစံအခြေခံတင်သွင်းမှုလုပ်ငန်းစဉ်များ
- ပတ်ဝန်းကျင်ဖွဲ့စည်းမှုအခြေခံများ
- အရင်းအမြစ်အုပ်စုနှင့် subscription စီမံခန့်ခွဲမှု

#### လက်တွေ့လေ့ကျင့်မှုများ
1. **တပ်ဆင်မှုစစ်ဆေးမှု**: AZD ကိုတပ်ဆင်ပြီး `azd version` ဖြင့်စစ်ဆေးပါ
2. **ပထမဆုံးတင်သွင်းမှု**: todo-nodejs-mongo ပုံစံကို အောင်မြင်စွာတင်သွင်းပါ
3. **ပတ်ဝန်းကျင်ပြင်ဆင်မှု**: သင်၏ ပထမဆုံးပတ်ဝန်းကျင် variable များကို ပြင်ဆင်ပါ
4. **အရင်းအမြစ်စူးစမ်းမှု**: Azure Portal တွင် တင်သွင်းထားသော အရင်းအမြစ်များကို စူးစမ်းပါ

#### စမ်းသပ်မေးခွန်းများ
- AZD ပရောဂျက်၏ အဓိကအစိတ်အပိုင်းများက ဘာတွေလဲ?
- ပုံစံတစ်ခုမှ ပရောဂျက်အသစ်တစ်ခုကို ဘယ်လိုစတင်မလဲ?
- `azd up` နှင့် `azd deploy` တို့အကြားကွာခြားချက်ကဘာလဲ?
- AZD ဖြင့် ပတ်ဝန်းကျင်များစွာကို ဘယ်လိုစီမံမလဲ?

---

### အခန်း ၂: AI-အခြေခံ ဖွံ့ဖြိုးမှု (ဒုတိယအပတ်)
**ကြာချိန်**: ၁-၂ နာရီ | **အဆင့်ခက်မှု**: ⭐⭐

#### သင်ယူရမည့်ရည်မှန်းချက်များ
- Microsoft Foundry ဝန်ဆောင်မှုများကို AZD လုပ်ငန်းစဉ်များနှင့် ပေါင်းစပ်ပါ
- AI-အခြေခံ အပလီကေးရှင်းများကို တင်သွင်းပြီး ပြင်ဆင်ပါ
- RAG (Retrieval-Augmented Generation) အကောင်အထည်ဖော်မှုပုံစံများကို နားလည်ပါ
- AI မော်ဒယ်တင်သွင်းမှုများနှင့် အရွယ်အစားချိန်ညှိမှုကို စီမံပါ

#### ကျွမ်းကျင်ရမည့် အဓိကအကြောင်းအရာများ
- Azure OpenAI ဝန်ဆောင်မှုပေါင်းစပ်မှုနှင့် API စီမံခန့်ခွဲမှု
- AI ရှာဖွေမှုဖွဲ့စည်းမှုနှင့် ဗက်တာအညွှန်း
- မော်ဒယ်တင်သွင်းမှုနည်းလမ်းများနှင့် စွမ်းဆောင်ရည်စီမံခန့်ခွဲမှု
- AI အပလီကေးရှင်းများအတွက် စောင့်ကြည့်မှုနှင့် စွမ်းဆောင်ရည်အကောင်းဆုံးဖြေရှင်းနည်း

#### လက်တွေ့လေ့ကျင့်မှုများ
1. **AI စကားဝိုင်းတင်သွင်းမှု**: azure-search-openai-demo ပုံစံကို တင်သွင်းပါ
2. **RAG အကောင်အထည်ဖော်မှု**: စာရွက်စာတမ်းအညွှန်းနှင့် ရှာဖွေမှုကို ပြင်ဆင်ပါ
3. **မော်ဒယ်ဖွဲ့စည်းမှု**: အမျိုးမျိုးသောရည်ရွယ်ချက်များအတွက် မော်ဒယ်များစွာကို ပြင်ဆင်ပါ
4. **AI စောင့်ကြည့်မှု**: AI workload များအတွက် Application Insights ကို အကောင်အထည်ဖော်ပါ

#### စမ်းသပ်မေးခွန်းများ
- AZD ပုံစံတစ်ခုတွင် Azure OpenAI ဝန်ဆောင်မှုများကို ဘယ်လိုပြင်ဆင်မလဲ?
- RAG ဖွဲ့စည်းမှု၏ အဓိကအစိတ်အပိုင်းများကဘာလဲ?
- AI မော်ဒယ်စွမ်းဆောင်ရည်နှင့် အရွယ်အစားကို ဘယ်လိုစီမံမလဲ?
- AI အပလီကေးရှင်းများအတွက် အရေးကြီးသော စောင့်ကြည့်မှုအချက်အလက်များကဘာလဲ?

---

### အခန်း ၃: ဖွဲ့စည်းမှုနှင့် အတည်ပြုမှု (တတိယအပတ်)
**ကြာချိန်**: ၄၅-၆၀ မိနစ် | **အဆင့်ခက်မှု**: ⭐⭐

#### သင်ယူရမည့်ရည်မှန်းချက်များ
- ပတ်ဝန်းကျင်ဖွဲ့စည်းမှုနှင့် စီမံခန့်ခွဲမှုနည်းလမ်းများကို ကျွမ်းကျင်ပါ
- လုံခြုံသော အတည်ပြုမှုပုံစံများနှင့် စီမံခန့်ခွဲမှုကို အကောင်အထည်ဖော်ပါ
- အရင်းအမြစ်များကို သင့်တော်သောအမည်ပုံစံများဖြင့် စီမံပါ
- ပတ်ဝန်းကျင်များစွာ (ဖွံ့ဖြိုးရေး၊ စမ်းသပ်မှု၊ ထုတ်လုပ်မှု) ကို ဖွဲ့စည်းပါ

#### ကျွမ်းကျင်ရမည့် အဓိကအကြောင်းအရာများ
- ပတ်ဝန်းကျင်အဆင့်ဆင့်နှင့် ဖွဲ့စည်းမှုဦးစားပေးမှု
- စီမံခန့်ခွဲမှုအတည်ပြုမှုနှင့် ဝန်ဆောင်မှုအဓိက
- Key Vault ဖြင့် လျှို့ဝှက်ချက်စီမံခန့်ခွဲမှု
- ပတ်ဝန်းကျင်အလိုက် parameter စီမံခန့်ခွဲမှု

#### လက်တွေ့လေ့ကျင့်မှုများ
1. **ပတ်ဝန်းကျင်များစွာဖွဲ့စည်းမှု**: ဖွံ့ဖြိုးရေး၊ စမ်းသပ်မှုနှင့် ထုတ်လုပ်မှု ပတ်ဝန်းကျင်များကို ဖွဲ့စည်းပါ
2. **လုံခြုံရေးဖွဲ့စည်းမှု**: စီမံခန့်ခွဲမှုအတည်ပြုမှုကို အကောင်အထည်ဖော်ပါ
3. **လျှို့ဝှက်ချက်စီမံခန့်ခွဲမှု**: Azure Key Vault ကို ပေါင်းစပ်ပါ
4. **Parameter စီမံခန့်ခွဲမှု**: ပတ်ဝန်းကျင်အလိုက် ဖွဲ့စည်းမှုများကို ဖန်တီးပါ

#### စမ်းသပ်မေးခွန်းများ
- AZD ဖြင့် ပတ်ဝန်းကျင်များကို ဘယ်လိုဖွဲ့စည်းမလဲ?
- စီမံခန့်ခွဲမှုအတည်ပြုမှုကို ဝန်ဆောင်မှုအဓိကထက် သုံးခြင်း၏ အကျိုးကျေးဇူးများကဘာလဲ?
- အပလီကေးရှင်းလျှို့ဝှက်ချက်များကို ဘယ်လိုစီမံမလဲ?
- AZD ၏ ဖွဲ့စည်းမှုအဆင့်ဆင့်ကဘာလဲ?

---

### အခန်း ၄: Infrastructure as Code & Deployment (အပတ် ၄-၅)
**ကြာချိန်**: ၁-၁.၅ နာရီ | **အဆင့်ခက်မှု**: ⭐⭐⭐

#### သင်ယူရမည့်ရည်မှန်းချက်များ
- Bicep infrastructure ပုံစံများကို ဖန်တီးပြီး ပြင်ဆင်ပါ
- အဆင့်မြင့်တင်သွင်းမှုပုံစံများနှင့် လုပ်ငန်းစဉ်များကို အကောင်အထည်ဖော်ပါ
- အရင်းအမြစ်များကို စီမံခန့်ခွဲမှုနည်းလမ်းများကို နားလည်ပါ
- အဆင့်မြင့် multi-service ဖွဲ့စည်းမှုများကို ဒီဇိုင်းဆွဲပါ

#### ကျွမ်းကျင်ရမည့် အဓိကအကြောင်းအရာများ
- Bicep ပုံစံဖွဲ့စည်းမှုနှင့် အကောင်းဆုံးလေ့ကျင့်မှုများ
- အရင်းအမြစ်အချင်းချင်းပေါ်မူတည်မှုများနှင့် တင်သွင်းမှုအဆင့်စဉ်
- Parameter ဖိုင်များနှင့် ပုံစံ modularity
- Custom hooks နှင့် တင်သွင်းမှုအလိုအလျောက်လုပ်ငန်းစဉ်
- Container app တင်သွင်းမှုပုံစံများ (အမြန်စတင်မှု၊ ထုတ်လုပ်မှု၊ microservices)

#### လက်တွေ့လေ့ကျင့်မှုများ
1. **ပုံစံဖန်တီးမှု**: Multi-service အပလီကေးရှင်းပုံစံတစ်ခုကို ဖန်တီးပါ
2. **Bicep ကျွမ်းကျင်မှု**: Modular, reusable infrastructure components များကို ဖန်တီးပါ
3. **တင်သွင်းမှုအလိုအလျောက်လုပ်ငန်းစဉ်**: Pre/post deployment hooks များကို အကောင်အထည်ဖော်ပါ
4. **ဖွဲ့စည်းမှုဒီဇိုင်း**: ရှုပ်ထွေးသော microservices ဖွဲ့စည်းမှုကို တင်သွင်းပါ
5. **Container App တင်သွင်းမှု**: [Simple Flask API](../../../examples/container-app/simple-flask-api) နှင့် [Microservices Architecture](../../../examples/container-app/microservices) ကို AZD ဖြင့် တင်သွင်းပါ

#### စမ်းသပ်မေးခွန်းများ
- AZD အတွက် Bicep ပုံစံများကို ဘယ်လိုဖန်တီးမလဲ?
- Infrastructure code ကို စီမံခန့်ခွဲရာတွင် အကောင်းဆုံးလေ့ကျင့်မှုများကဘာလဲ?
- ပုံစံများတွင် အရင်းအမြစ်အချင်းချင်းပေါ်မူတည်မှုများကို ဘယ်လိုကိုင်တွယ်မလဲ?
- Zero-downtime updates များကို ပံ့ပိုးပေးသော တင်သွင်းမှုပုံစံများကဘာလဲ?

---

(အခြားအခန်းများကို ဆက်လက်ဘာသာပြန်ရန်လိုပါက ပြောပါ)
၅။ မျိုးစုံဒေသများတွင် တပ်ဆင်မှုအတွက် စဉ်းစားရန်အချက်များကဘာတွေလဲ။

### Module 4: Pre-Deployment Validation (Week 5)

#### သင်ယူရမည့်ရည်ရွယ်ချက်များ
- တိကျသော Pre-deployment စစ်ဆေးမှုများကို အကောင်အထည်ဖော်နိုင်ရန်
- စွမ်းဆောင်ရည်စီမံခန့်ခွဲမှုနှင့် အရင်းအမြစ်စစ်ဆေးမှုကို ကျွမ်းကျင်စွာ လုပ်ဆောင်နိုင်ရန်
- SKU ရွေးချယ်မှုနှင့် ကုန်ကျစရိတ်အခွင့်အရေးများကို နားလည်နိုင်ရန်
- အလိုအလျောက်စစ်ဆေးမှုလိုင်းများ တည်ဆောက်နိုင်ရန်

#### ကျွမ်းကျင်ရမည့် အဓိကအကြောင်းအရာများ
- Azure အရင်းအမြစ် Quotas နှင့် အကန့်အသတ်များ
- SKU ရွေးချယ်မှုအခြေခံချက်များနှင့် ကုန်ကျစရိတ်ဆက်စပ်မှုများ
- အလိုအလျောက်စစ်ဆေးမှု Scripts နှင့် Tools
- စွမ်းဆောင်ရည်စီမံခန့်ခွဲမှုနည်းလမ်းများ
- စွမ်းဆောင်ရည်စမ်းသပ်မှုနှင့် အကောင်းဆုံးလုပ်ဆောင်မှု

#### လက်တွေ့လေ့ကျင့်မှုများ

**Exercise 4.1: စွမ်းဆောင်ရည်စီမံခန့်ခွဲမှု**
```bash
# စွမ်းရည်အတည်ပြုမှုကို အကောင်အထည်ဖော်ပါ:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**Exercise 4.2: Pre-flight Validation**
```powershell
# အပြည့်အစုံသော အတည်ပြုမှုပိုက်လိုင်းကို တည်ဆောက်ပါ:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```

**Exercise 4.3: SKU Optimization**
```bash
# ဝန်ဆောင်မှုဖွဲ့စည်းမှုများကို အကောင်းဆုံးဖြစ်အောင်လုပ်ပါ:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```

#### ကိုယ်တိုင်အကဲဖြတ်မေးခွန်းများ
1. SKU ရွေးချယ်မှုဆုံးဖြတ်ချက်များကို သက်ရောက်စေသည့်အချက်များကဘာတွေလဲ။
2. တပ်ဆင်မှုမတိုင်မီ Azure အရင်းအမြစ်ရရှိနိုင်မှုကို ဘယ်လိုစစ်ဆေးမလဲ။
3. Pre-flight စစ်ဆေးမှုစနစ်၏ အဓိကအစိတ်အပိုင်းများကဘာတွေလဲ။
4. တပ်ဆင်မှုကုန်ကျစရိတ်ကို ဘယ်လိုခန့်မှန်းပြီး ထိန်းချုပ်မလဲ။
5. စွမ်းဆောင်ရည်စီမံခန့်ခွဲမှုအတွက် မရှိမဖြစ်လိုအပ်သော စောင့်ကြည့်မှုများကဘာတွေလဲ။

### Module 5: Troubleshooting and Debugging (Week 6)

#### သင်ယူရမည့်ရည်ရွယ်ချက်များ
- စနစ်တကျ Troubleshooting နည်းလမ်းများကို ကျွမ်းကျင်စွာ လုပ်ဆောင်နိုင်ရန်
- တပ်ဆင်မှုအခက်အခဲများကို Debugging လုပ်နိုင်ရန် ကျွမ်းကျင်မှုရရှိရန်
- စုံလင်သော စောင့်ကြည့်မှုနှင့် အချက်ပေးစနစ်များကို အကောင်အထည်ဖော်နိုင်ရန်
- အရေးပေါ်တုံ့ပြန်မှုနှင့် ပြန်လည်ထူထောင်မှုလုပ်ငန်းစဉ်များ တည်ဆောက်နိုင်ရန်

#### ကျွမ်းကျင်ရမည့် အဓိကအကြောင်းအရာများ
- အများဆုံးဖြစ်ပေါ်သော တပ်ဆင်မှုမအောင်မြင်မှုပုံစံများ
- Log Analysis နှင့် Correlation နည်းလမ်းများ
- စွမ်းဆောင်ရည်စောင့်ကြည့်မှုနှင့် အကောင်းဆုံးလုပ်ဆောင်မှု
- လုံခြုံရေးဖြစ်ရပ်တွေ့ရှိမှုနှင့် တုံ့ပြန်မှု
- Disaster Recovery နှင့် Business Continuity

#### လက်တွေ့လေ့ကျင့်မှုများ

**Exercise 5.1: Troubleshooting Scenarios**
```bash
# အများဆုံးဖြစ်လေ့ရှိသောပြဿနာများကိုဖြေရှင်းရန်လေ့ကျင့်ပါ:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```

**Exercise 5.2: Monitoring Implementation**
```bash
# အကျုံးဝင်သောကြည့်ရှုမှုများကို စနစ်တကျပြင်ဆင်ပါ။
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```

**Exercise 5.3: Incident Response**
```bash
# အရေးပေါ်ဖြေရှင်းမှုလုပ်ထုံးလုပ်နည်းများတည်ဆောက်ပါ:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```

#### ကိုယ်တိုင်အကဲဖြတ်မေးခွန်းများ
1. azd တပ်ဆင်မှုများကို Troubleshooting လုပ်ရန် စနစ်တကျနည်းလမ်းကဘာလဲ။
2. အများစုံဝန်ဆောင်မှုများနှင့် အရင်းအမြစ်များအကြား Log များကို ဘယ်လိုဆက်စပ်မလဲ။
3. အရေးပေါ်ပြဿနာတွေ့ရှိမှုအတွက် အရေးကြီးဆုံး Monitoring Metrics များကဘာတွေလဲ။
4. အကျိုးရှိသော Disaster Recovery လုပ်ငန်းစဉ်များကို ဘယ်လိုအကောင်အထည်ဖော်မလဲ။
5. Incident Response Plan ၏ အဓိကအစိတ်အပိုင်းများကဘာတွေလဲ။

### Module 6: Advanced Topics and Best Practices (Week 7-8)

#### သင်ယူရမည့်ရည်ရွယ်ချက်များ
- အဖွဲ့အစည်းအဆင့် Deployment ပုံစံများကို အကောင်အထည်ဖော်နိုင်ရန်
- CI/CD Integration နှင့် Automation ကို ကျွမ်းကျင်စွာ လုပ်ဆောင်နိုင်ရန်
- Custom Templates တည်ဆောက်ပြီး Community အတွက် အကျိုးပြုနိုင်ရန်
- အဆင့်မြင့်လုံခြုံရေးနှင့် အညီအနေလိုအပ်ချက်များကို နားလည်နိုင်ရန်

#### ကျွမ်းကျင်ရမည့် အဓိကအကြောင်းအရာများ
- CI/CD Pipeline Integration ပုံစံများ
- Custom Template တည်ဆောက်မှုနှင့် ဖြန့်ဝေမှု
- အဖွဲ့အစည်း Governance နှင့် Compliance
- အဆင့်မြင့် Networking နှင့် Security Configuration
- စွမ်းဆောင်ရည်အကောင်းဆုံးလုပ်ဆောင်မှုနှင့် ကုန်ကျစရိတ်စီမံခန့်ခွဲမှု

#### လက်တွေ့လေ့ကျင့်မှုများ

**Exercise 6.1: CI/CD Integration**
```yaml
# Implement automated deployment pipelines:
1. GitHub Actions workflow for azd deployments
2. Azure DevOps pipeline integration
3. Multi-stage deployment with approvals
4. Automated testing and quality gates
5. Security scanning and compliance checks
```

**Exercise 6.2: Custom Template Development**
```bash
# စိတ်ကြိုက်အခြေခံပုံစံများကို ဖန်တီးပြီး ထုတ်ဝေပါ:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```

**Exercise 6.3: Enterprise Implementation**
```bash
# စီးပွားရေးအဆင့်အရည်အသွေးမြင့်လက္ခဏာများကို အကောင်အထည်ဖော်ပါ:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```

#### ကိုယ်တိုင်အကဲဖြတ်မေးခွန်းများ
1. azd ကို ရှိပြီးသား CI/CD Workflow များနှင့် ဘယ်လိုပေါင်းစည်းမလဲ။
2. Custom Template တည်ဆောက်မှုအတွက် အရေးကြီးသောစဉ်းစားရန်အချက်များကဘာတွေလဲ။
3. azd တပ်ဆင်မှုများတွင် Governance နှင့် Compliance ကို ဘယ်လိုအကောင်အထည်ဖော်မလဲ။
4. အဖွဲ့အစည်းအဆင့် Deployment များအတွက် အကောင်းဆုံးလုပ်ဆောင်မှုများကဘာတွေလဲ။
5. azd Community အတွက် ထိရောက်စွာ အကျိုးပြုနိုင်ရန် ဘယ်လိုလုပ်ဆောင်မလဲ။

## လက်တွေ့လုပ်ငန်းများ

### Project 1: Personal Portfolio Website
**အဆင့်**: Beginner  
**ကြာမြင့်ချိန်**: 1-2 weeks

အောက်ပါများကို အသုံးပြု၍ ကိုယ်ပိုင် Portfolio Website တည်ဆောက်ပြီး တပ်ဆင်ပါ:
- Azure Storage တွင် Static Website Hosting
- Custom Domain Configuration
- CDN Integration ဖြင့် Global Performance
- Automated Deployment Pipeline

**Deliverables**:
- Azure တွင် တပ်ဆင်ပြီး Website
- Portfolio Deployment များအတွက် Custom azd Template
- Deployment လုပ်ငန်းစဉ် Documentation
- ကုန်ကျစရိတ်အကောင်းဆုံးလုပ်ဆောင်မှုအကြံပြုချက်များ

### Project 2: Task Management Application
**အဆင့်**: Intermediate  
**ကြာမြင့်ချိန်**: 2-3 weeks

အောက်ပါများပါဝင်သော Full-stack Task Management Application တည်ဆောက်ပါ:
- React Frontend ကို App Service တွင် တပ်ဆင်ထားသည်
- Node.js API Backend နှင့် Authentication
- PostgreSQL Database နှင့် Migrations
- Application Insights Monitoring

**Deliverables**:
- User Authentication ပါဝင်သော Application အပြည့်အစုံ
- Database Schema နှင့် Migration Scripts
- Monitoring Dashboards နှင့် Alerting Rules
- Multi-environment Deployment Configuration

### Project 3: Microservices E-commerce Platform
**အဆင့်**: Advanced  
**ကြာမြင့်ချိန်**: 4-6 weeks

Microservices-based E-commerce Platform တည်ဆောက်ပြီး အကောင်အထည်ဖော်ပါ:
- API Services များ (Catalog, Orders, Payments, Users)
- Service Bus ဖြင့် Message Queue Integration
- Redis Cache ဖြင့် စွမ်းဆောင်ရည်အကောင်းဆုံးလုပ်ဆောင်မှု
- Comprehensive Logging နှင့် Monitoring

**Reference Example**: [Microservices Architecture](../../../examples/container-app/microservices) တွင် Production-ready Template နှင့် Deployment Guide ကို ကြည့်ပါ

**Deliverables**:
- Microservices Architecture အပြည့်အစုံ
- Inter-service Communication Patterns
- စွမ်းဆောင်ရည်စမ်းသပ်မှုနှင့် အကောင်းဆုံးလုပ်ဆောင်မှု
- Production-ready Security Implementation

## အကဲဖြတ်မှုနှင့် လက်မှတ်

### Knowledge Checks

Module တစ်ခုစီပြီးဆုံးပြီးနောက် အောက်ပါအကဲဖြတ်မှုများကို ပြီးစီးပါ:

**Module 1 Assessment**: အခြေခံအကြောင်းအရာများနှင့် Installation
- Core Concepts အပေါ် Multiple Choice မေးခွန်းများ
- Installation နှင့် Configuration လုပ်ငန်းစဉ်များ
- ရိုးရှင်းသော Deployment လေ့ကျင့်မှု

**Module 2 Assessment**: Configuration နှင့် Environments
- Environment Management အခြေအနေများ
- Configuration Troubleshooting လေ့ကျင့်မှုများ
- Security Configuration အကောင်အထည်ဖော်မှု

**Module 3 Assessment**: Deployment နှင့် Provisioning
- Infrastructure Design အခက်အခဲများ
- Multi-service Deployment အခြေအနေများ
- စွမ်းဆောင်ရည်အကောင်းဆုံးလုပ်ဆောင်မှုလေ့ကျင့်မှု

**Module 4 Assessment**: Pre-deployment Validation
- စွမ်းဆောင်ရည်စီမံခန့်ခွဲမှု Case Studies
- ကုန်ကျစရိတ်အကောင်းဆုံးလုပ်ဆောင်မှုအခြေအနေများ
- Validation Pipeline အကောင်အထည်ဖော်မှု

**Module 5 Assessment**: Troubleshooting နှင့် Debugging
- ပြဿနာ Diagnosis လေ့ကျင့်မှုများ
- Monitoring Implementation လုပ်ငန်းစဉ်များ
- Incident Response Simulations

**Module 6 Assessment**: Advanced Topics
- CI/CD Pipeline Design
- Custom Template Development
- Enterprise Architecture အခြေအနေများ

### Final Capstone Project

အခြေခံအကြောင်းအရာများအားလုံးကို ကျွမ်းကျင်မှုပြသနိုင်သော အပြည့်အစုံ Solution တစ်ခုကို တည်ဆောက်ပါ:

**Requirements**:
- Multi-tier Application Architecture
- Deployment Environments များစုံ
- စုံလင်သော Monitoring နှင့် Alerting
- Security နှင့် Compliance Implementation
- ကုန်ကျစရိတ်အကောင်းဆုံးလုပ်ဆောင်မှုနှင့် စွမ်းဆောင်ရည်တိုးတက်မှု
- Documentation နှင့် Runbooks အပြည့်အစုံ

**Evaluation Criteria**:
- Technical Implementation အရည်အသွေး
- Documentation အပြည့်အစုံ
- Security နှင့် Best Practices လိုက်နာမှု
- စွမ်းဆောင်ရည်နှင့် ကုန်ကျစရိတ်အကောင်းဆုံးလုပ်ဆောင်မှု
- Troubleshooting နှင့် Monitoring ထိရောက်မှု

## သင်ကြားရေးအရင်းအမြစ်များနှင့် ရင်းမြစ်များ

### Official Documentation
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Community Resources
- [AZD Template Gallery](https://azure.github.io/awesome-azd/)
- [Azure-Samples GitHub Organization](https://github.com/Azure-Samples)
- [Azure Developer CLI GitHub Repository](https://github.com/Azure/azure-dev)

### Practice Environments
- [Azure Free Account](https://azure.microsoft.com/free/)
- [Azure DevOps Free Tier](https://azure.microsoft.com/services/devops/)
- [GitHub Actions](https://github.com/features/actions)

### Additional Tools
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [Azure Tools Extension Pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)

## သင်ကြားရေးအချိန်ဇယားအကြံပြုချက်များ

### Full-Time Study (8 weeks)
- **Weeks 1-2**: Modules 1-2 (Getting Started, Configuration)
- **Weeks 3-4**: Modules 3-4 (Deployment, Pre-deployment)
- **Weeks 5-6**: Modules 5-6 (Troubleshooting, Advanced Topics)
- **Weeks 7-8**: Practical Projects and Final Assessment

### Part-Time Study (16 weeks)
- **Weeks 1-4**: Module 1 (Getting Started)
- **Weeks 5-7**: Module 2 (Configuration and Environments)
- **Weeks 8-10**: Module 3 (Deployment and Provisioning)
- **Weeks 11-12**: Module 4 (Pre-deployment Validation)
- **Weeks 13-14**: Module 5 (Troubleshooting and Debugging)
- **Weeks 15-16**: Module 6 (Advanced Topics and Assessment)

---

## တိုးတက်မှု Tracking နှင့် အကဲဖြတ် Framework

### Chapter Completion Checklist

Chapter တစ်ခုစီတွင် အောင်မြင်မှုကို အောက်ပါအချက်များဖြင့် Tracking လုပ်ပါ:

#### 📚 Chapter 1: Foundation & Quick Start
- [ ] **Installation Complete**: AZD ကို သင့် Platform တွင် Install ပြီး Verification ပြုလုပ်ထားသည်
- [ ] **First Deployment**: todo-nodejs-mongo Template ကို အောင်မြင်စွာ Deploy ပြုလုပ်ထားသည်
- [ ] **Environment Setup**: ပထမဆုံး Environment Variables ကို Configure ပြုလုပ်ထားသည်
- [ ] **Resource Navigation**: Azure Portal တွင် Deploy ပြုလုပ်ထားသော Resources ကို Explore ပြုလုပ်ထားသည်
- [ ] **Command Mastery**: AZD Commands အခြေခံများကို ကျွမ်းကျင်စွာ အသုံးပြုနိုင်သည်

#### 🤖 Chapter 2: AI-First Development  
- [ ] **AI Template Deployment**: azure-search-openai-demo ကို အောင်မြင်စွာ Deploy ပြုလုပ်ထားသည်
- [ ] **RAG Implementation**: Document Indexing နှင့် Retrieval ကို Configure ပြုလုပ်ထားသည်
- [ ] **Model Configuration**: ရည်ရွယ်ချက်ကွဲပြားသော AI Models များကို Setup ပြုလုပ်ထားသည်
- [ ] **AI Monitoring**: AI Workloads အတွက် Application Insights ကို Implement ပြုလုပ်ထားသည်
- [ ] **Performance Optimization**: AI Application Performance ကို Tune ပြုလုပ်ထားသည်

#### ⚙️ Chapter 3: Configuration & Authentication
- [ ] **Multi-Environment Setup**: Dev, Staging, နှင့် Prod Environments များကို Configure ပြုလုပ်ထားသည်
- [ ] **Security Implementation**: Managed Identity Authentication ကို Setup ပြုလုပ်ထားသည်
- [ ] **Secrets Management**: Sensitive Data အတွက် Azure Key Vault ကို Integrated ပြုလုပ်ထားသည်
- [ ] **Parameter Management**: Environment-specific Configurations များကို Create ပြုလုပ်ထားသည်
- [ ] **Authentication Mastery**: Secure Access Patterns ကို Implement ပြုလုပ်ထားသည်

#### 🏗️ Chapter 4: Infrastructure as Code & Deployment
- [ ] **Custom Template Creation**: Multi-service Application Template တစ်ခုကို Build ပြုလုပ်ထားသည်
- [ ] **Bicep Mastery**: Modular, Reusable Infrastructure Components များကို Create ပြုလုပ်ထားသည်
- [ ] **Deployment Automation**: Pre/Post Deployment Hooks ကို Implement ပြုလုပ်ထားသည်
- [ ] **Architecture Design**: Complex Microservices Architecture ကို Deploy ပြုလုပ်ထားသည်
- [ ] **Template Optimization**: Performance နှင့် Cost အတွက် Templates များကို Optimize ပြုလုပ်ထားသည်

#### 🎯 Chapter 5: Multi-Agent AI Solutions
- [ ] **Retail Solution Deployment**: Multi-agent Retail Scenario အပြည့်အစုံကို Deploy ပြုလုပ်ထားသည်
- [ ] **Agent Customization**: Customer နှင့် Inventory Agent Behaviors များကို Modify ပြုလုပ်ထားသည်
- [ ] **Architecture Scaling**: Load Balancing နှင့် Auto-scaling ကို Implement ပြုလုပ်ထားသည်
- [ ] **Production Monitoring**: Comprehensive Monitoring နှင့် Alerting ကို Setup ပြုလုပ်ထားသည်
- [ ] **Performance Tuning**: Multi-agent System Performance ကို Optimize ပြုလုပ်ထားသည်

#### 🔍 Chapter 6: Pre-Deployment Validation & Planning
- [ ] **Capacity Analysis**: Applications အတွက် Resource Requirements ကို Analyze ပြုလုပ်ထားသည်
- [ ] **SKU Optimization**: Cost-effective Service Tiers ကို Select ပြုလုပ်ထားသည်
- [ ] **Validation Automation**: Pre-deployment Check Scripts ကို Implement ပြုလုပ်ထားသည်
- [ ] **Cost Planning**: Deployment Cost Estimates နှင့် Budgets ကို Create ပြုလုပ်ထားသည်
- [ ] **Risk Assessment**: Deployment Risks များကို Identify ပြုလုပ်ပြီး Mitigate ပြုလုပ်ထားသည်

#### 🚨 Chapter 7: Troubleshooting & Debugging
- [ ] **Diagnostic Skills**: Intentional Broken Deployments များကို Successfully Debug ပြုလုပ်ထားသည်
- [ ] **Log Analysis**: Azure Monitor နှင့် Application Insights ကို ထိရောက်စွာ အသုံးပြုထားသည်
- [ ] **Performance Tuning**: Slow-performing Applications များကို Optimize ပြုလုပ်ထားသည်
- [ ] **Recovery Procedures**
5. **အသိုင်းအဝိုင်း၏ အထောက်အကူပြုမှု**: ပုံစံများ သို့မဟုတ် တိုးတက်မှုများကို မျှဝေပါ

#### အလုပ်အကိုင် ဖွံ့ဖြိုးတိုးတက်မှုရလဒ်များ
- **Portfolio Projects**: ထုတ်လုပ်မှုအဆင့်သို့ ပြင်ဆင်ပြီးသော deployment ၈ ခု
- **Technical Skills**: စက်မှုလုပ်ငန်းအဆင့် AZD နှင့် AI deployment ကျွမ်းကျင်မှု
- **ပြဿနာဖြေရှင်းနိုင်စွမ်း**: ကိုယ်တိုင် troubleshooting နှင့် optimization
- **အသိုင်းအဝိုင်းမှ အသိအမှတ်ပြုမှု**: Azure developer အသိုင်းအဝိုင်းတွင် တက်ကြွစွာ ပါဝင်မှု
- **အလုပ်အကိုင် တိုးတက်မှု**: Cloud နှင့် AI အလုပ်အကိုင်များတွင် တိုက်ရိုက်အသုံးချနိုင်သော ကျွမ်းကျင်မှု

#### အောင်မြင်မှု အတိုင်းအတာများ
- **Deployment Success Rate**: >95% အောင်မြင်သော deployment များ
- **Troubleshooting Time**: သာမန်ပြဿနာများအတွက် ၃၀ မိနစ်အောက်
- **Performance Optimization**: ကုန်ကျစရိတ်နှင့် စွမ်းဆောင်ရည် တိုးတက်မှုများကို သက်သေပြနိုင်မှု
- **Security Compliance**: အားလုံးသော deployment များသည် စီးပွားရေးလုံခြုံရေးစံချိန်များနှင့် ကိုက်ညီမှု
- **Knowledge Transfer**: အခြား developer များကို သင်ကြားနိုင်စွမ်း

### ဆက်လက်လေ့လာခြင်းနှင့် အသိုင်းအဝိုင်းနှင့် ပူးပေါင်းဆောင်ရွက်ခြင်း

#### လက်ရှိအခြေအနေကို သိရှိထားပါ
- **Azure Updates**: Azure Developer CLI release notes ကို လိုက်နာပါ
- **Community Events**: Azure နှင့် AI developer အဖြစ်အပျက်များတွင် ပါဝင်ပါ
- **Documentation**: အသိုင်းအဝိုင်း၏ documentation နှင့် ဥပမာများကို အထောက်အကူပြုပါ
- **Feedback Loop**: သင်ခန်းစာအကြောင်းအရာနှင့် Azure ဝန်ဆောင်မှုများအပေါ် အကြံပြုချက်ပေးပါ

#### အလုပ်အကိုင် ဖွံ့ဖြိုးတိုးတက်မှု
- **Professional Network**: Azure နှင့် AI ကျွမ်းကျင်သူများနှင့် ဆက်သွယ်ပါ
- **Speaking Opportunities**: ဆွေးနွေးပွဲများ သို့မဟုတ် meetup များတွင် သင်ယူမှုများကို တင်ပြပါ
- **Open Source Contribution**: AZD ပုံစံများနှင့် tools များကို အထောက်အကူပြုပါ
- **Mentorship**: AZD သင်ယူမှု ခရီးစဉ်တွင် အခြား developer များကို လမ်းညွှန်ပါ

---

**အခန်းများကို လမ်းညွှန်ခြင်း**:
- **📚 သင်ခန်းစာ အိမ်**: [AZD For Beginners](../README.md)
- **📖 သင်ယူမှုကို စတင်ပါ**: [Chapter 1: Foundation & Quick Start](../README.md#-chapter-1-foundation--quick-start)
- **🎯 တိုးတက်မှုကို ခြေရာခံပါ**: ၈ အခန်းပါသော သင်ယူမှုစနစ်ကို ကျယ်ကျယ်ပြန့်ပြန့် လေ့လာခြင်းမှတဆင့် တိုးတက်မှုကို ခြေရာခံပါ
- **🤝 အသိုင်းအဝိုင်း**: [Azure Discord](https://discord.gg/microsoft-azure) အထောက်အကူပြုမှုနှင့် ဆွေးနွေးမှုအတွက်

**လေ့လာမှု တိုးတက်မှု ခြေရာခံခြင်း**: Azure Developer CLI ကို အဆင့်ဆင့်၊ လက်တွေ့ကျသော သင်ယူမှုမှတဆင့် အောင်မြင်မှုရလဒ်များနှင့် အလုပ်အကိုင် ဖွံ့ဖြိုးတိုးတက်မှု အကျိုးကျေးဇူးများဖြင့် ကျွမ်းကျင်မှုရရှိရန် ဤစနစ်တကျ လမ်းညွှန်ချက်ကို အသုံးပြုပါ။

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**အကြောင်းကြားချက်**:  
ဤစာရွက်စာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ကို အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှန်ကန်မှုအတွက် ကြိုးစားနေသော်လည်း အလိုအလျောက် ဘာသာပြန်မှုများတွင် အမှားများ သို့မဟုတ် မှားယွင်းမှုများ ပါဝင်နိုင်သည်ကို သတိပြုပါ။ မူရင်းဘာသာစကားဖြင့် ရေးသားထားသော စာရွက်စာတမ်းကို အာဏာတရ အရင်းအမြစ်အဖြစ် သတ်မှတ်သင့်ပါသည်။ အရေးကြီးသော အချက်အလက်များအတွက် လူ့ဘာသာပြန်ပညာရှင်များကို အသုံးပြုရန် အကြံပြုပါသည်။ ဤဘာသာပြန်ကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော အလွဲအမှားများ သို့မဟုတ် အနားလွဲမှုများအတွက် ကျွန်ုပ်တို့သည် တာဝန်မယူပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->