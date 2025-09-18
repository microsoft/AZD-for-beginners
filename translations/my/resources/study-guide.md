<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ee6549c72fe4271931326578e2379243",
  "translation_date": "2025-09-18T13:30:39+00:00",
  "source_file": "resources/study-guide.md",
  "language_code": "my"
}
-->
# သင်ကြားမှုလမ်းညွှန် - အကျွမ်းတဝင် သင်ယူရမည့် ရည်မှန်းချက်များ

**သင်ကြားမှုလမ်းကြောင်းအတွင်း လမ်းညွှန်မှု**
- **📚 သင်ခန်းစာ အိမ်စာမျက်နှာ**: [AZD အခြေခံသင်ခန်းစာ](../README.md)
- **📖 သင်ယူမှု စတင်ရန်**: [အခန်း ၁: အခြေခံနှင့် အမြန်စတင်ခြင်း](../README.md#-chapter-1-foundation--quick-start)
- **🎯 တိုးတက်မှု ထိန်းသိမ်းမှု**: [သင်ခန်းစာ ပြီးမြောက်မှု](../README.md#-course-completion--certification)

## မိတ်ဆက်

ဒီအကျွမ်းတဝင် သင်ကြားမှုလမ်းညွှန်သည် Azure Developer CLI (azd) ကို ကျွမ်းကျင်စွာ အသုံးပြုနိုင်ရန် သင်ယူရမည့် ရည်မှန်းချက်များ၊ အဓိကအကြောင်းအရာများ၊ လက်တွေ့လေ့ကျင့်မှုများနှင့် သင်ယူမှုအကဲဖြတ်ပစ္စည်းများကို စနစ်တကျ ဖော်ပြထားသည်။ သင်၏ တိုးတက်မှုကို ထိန်းသိမ်းရန်နှင့် အရေးပါသော အကြောင်းအရာများအားလုံးကို လေ့လာပြီးကြောင်း သေချာစေရန် ဒီလမ်းညွှန်ကို အသုံးပြုပါ။

## သင်ယူရမည့် ရည်မှန်းချက်များ

ဒီလမ်းညွှန်ကို ပြီးမြောက်စွာ လေ့လာပြီးပါက၊ သင်သည်:
- Azure Developer CLI ၏ အခြေခံနှင့် အဆင့်မြင့် အကြောင်းအရာများအားလုံးကို ကျွမ်းကျင်စွာ သိရှိမည်။
- Azure အပလီကေးရှင်းများကို တင်သွင်းခြင်းနှင့် စီမံခန့်ခွဲခြင်းဆိုင်ရာ လက်တွေ့ကျွမ်းကျင်မှု ရရှိမည်။
- တင်သွင်းမှုများကို ပြဿနာဖြေရှင်းခြင်းနှင့် အကောင်းဆုံးအခြေအနေသို့ ရောက်အောင် လုပ်ဆောင်နိုင်မည်။
- ထုတ်လုပ်မှုအဆင့်သို့ ရောက်ရှိရန် လိုအပ်သော တင်သွင်းမှုနည်းလမ်းများနှင့် လုံခြုံရေးဆိုင်ရာ အချက်များကို နားလည်မည်။

## သင်ယူမှုရလဒ်များ

ဒီလမ်းညွှန်၏ အခန်းအားလုံးကို ပြီးမြောက်စွာ လေ့လာပြီးပါက၊ သင်သည်:
- azd ကို အသုံးပြု၍ အပြည့်အစုံသော အပလီကေးရှင်း အဆောက်အအုံများကို ဒီဇိုင်းဆွဲခြင်း၊ တင်သွင်းခြင်းနှင့် စီမံခန့်ခွဲခြင်းကို ကျွမ်းကျင်စွာ လုပ်ဆောင်နိုင်မည်။
- စုံလင်သော မော်နီတာလုပ်ခြင်း၊ လုံခြုံရေးနှင့် ကုန်ကျစရိတ် အကောင်းဆုံးဖြစ်စေရန် နည်းလမ်းများကို အကောင်အထည်ဖော်နိုင်မည်။
- ရှုပ်ထွေးသော တင်သွင်းမှု ပြဿနာများကို ကိုယ်တိုင်ဖြေရှင်းနိုင်မည်။
- ကိုယ်ပိုင် template များကို ဖန်တီးပြီး azd အသိုင်းအဝိုင်းတွင် ပါဝင်ဆောင်ရွက်နိုင်မည်။

## ၈-အခန်း သင်ယူမှုဖွဲ့စည်းမှု

### အခန်း ၁: အခြေခံနှင့် အမြန်စတင်ခြင်း (ပထမအပတ်)
**ကြာမြင့်ချိန်**: ၃၀-၄၅ မိနစ် | **အဆင့်**: ⭐

#### သင်ယူရမည့် ရည်မှန်းချက်များ
- Azure Developer CLI ၏ အဓိကအကြောင်းအရာများနှင့် အသုံးအနှုန်းများကို နားလည်ခြင်း
- AZD ကို သင်၏ ဖွံ့ဖြိုးရေးပလက်ဖောင်းတွင် အောင်မြင်စွာ တပ်ဆင်ခြင်းနှင့် ဖွဲ့စည်းခြင်း
- ရှိပြီးသား template ကို အသုံးပြု၍ သင်၏ ပထမဆုံး အပလီကေးရှင်းကို တင်သွင်းခြင်း
- AZD command-line interface ကို ထိရောက်စွာ အသုံးပြုနိုင်ခြင်း

#### ကျွမ်းကျင်ရမည့် အဓိကအကြောင်းအရာများ
- AZD project ဖွဲ့စည်းမှုနှင့် အစိတ်အပိုင်းများ (azure.yaml, infra/, src/)
- Template-based တင်သွင်းမှု လုပ်ငန်းစဉ်များ
- ပတ်ဝန်းကျင် ဖွဲ့စည်းမှု အခြေခံများ
- Resource group နှင့် subscription စီမံခန့်ခွဲမှု

#### လက်တွေ့လေ့ကျင့်မှုများ
1. **တပ်ဆင်မှု အတည်ပြုခြင်း**: AZD ကို တပ်ဆင်ပြီး `azd version` ဖြင့် အတည်ပြုပါ
2. **ပထမဆုံး တင်သွင်းမှု**: todo-nodejs-mongo template ကို အောင်မြင်စွာ တင်သွင်းပါ
3. **ပတ်ဝန်းကျင် ဖွဲ့စည်းမှု**: သင်၏ ပထမဆုံး environment variables ကို ဖွဲ့စည်းပါ
4. **Resource ရှာဖွေမှု**: Azure Portal တွင် တင်သွင်းထားသော resources ကို လှည့်လည်ကြည့်ရှုပါ

#### အကဲဖြတ်မေးခွန်းများ
- AZD project ၏ အဓိကအစိတ်အပိုင်းများက ဘာတွေလဲ?
- Template မှ project အသစ်တစ်ခုကို ဘယ်လို စတင်မလဲ?
- `azd up` နှင့် `azd deploy` တို့၏ ကွာခြားချက်က ဘာလဲ?
- AZD ဖြင့် ပတ်ဝန်းကျင်များစွာကို ဘယ်လို စီမံခန့်ခွဲမလဲ?

---

### အခန်း ၂: AI-First ဖွံ့ဖြိုးမှု (ဒုတိယအပတ်)
**ကြာမြင့်ချိန်**: ၁-၂ နာရီ | **အဆင့်**: ⭐⭐

#### သင်ယူရမည့် ရည်မှန်းချက်များ
- AZD workflows နှင့် Azure AI Foundry services ကို ပေါင်းစပ်ခြင်း
- AI-powered အပလီကေးရှင်းများကို တင်သွင်းခြင်းနှင့် ဖွဲ့စည်းခြင်း
- RAG (Retrieval-Augmented Generation) အကောင်အထည်ဖော်မှု ပုံစံများကို နားလည်ခြင်း
- AI မော်ဒယ် တင်သွင်းမှုများနှင့် အရွယ်အစားချဲ့ထွင်မှုကို စီမံခန့်ခွဲခြင်း

#### ကျွမ်းကျင်ရမည့် အဓိကအကြောင်းအရာများ
- Azure OpenAI service ပေါင်းစပ်ခြင်းနှင့် API စီမံခန့်ခွဲမှု
- AI Search ဖွဲ့စည်းမှုနှင့် vector indexing
- မော်ဒယ် တင်သွင်းမှု နည်းလမ်းများနှင့် စွမ်းဆောင်ရည် စီမံခန့်ခွဲမှု
- AI အပလီကေးရှင်း မော်နီတာလုပ်ခြင်းနှင့် စွမ်းဆောင်ရည် အကောင်းဆုံးဖြစ်စေရန် နည်းလမ်းများ

#### လက်တွေ့လေ့ကျင့်မှုများ
1. **AI Chat တင်သွင်းမှု**: azure-search-openai-demo template ကို တင်သွင်းပါ
2. **RAG အကောင်အထည်ဖော်မှု**: စာရွက်စာတမ်းများကို index လုပ်ခြင်းနှင့် ရှာဖွေမှုကို ဖွဲ့စည်းပါ
3. **မော်ဒယ် ဖွဲ့စည်းမှု**: ရည်ရွယ်ချက်များကွဲပြားသော AI မော်ဒယ်များကို ဖွဲ့စည်းပါ
4. **AI မော်နီတာလုပ်ခြင်း**: AI workloads အတွက် Application Insights ကို အကောင်အထည်ဖော်ပါ

#### အကဲဖြတ်မေးခွန်းများ
- AZD template တွင် Azure OpenAI services ကို ဘယ်လို ဖွဲ့စည်းမလဲ?
- RAG architecture ၏ အဓိကအစိတ်အပိုင်းများက ဘာတွေလဲ?
- AI မော်ဒယ် စွမ်းဆောင်ရည်နှင့် အရွယ်အစားချဲ့ထွင်မှုကို ဘယ်လို စီမံခန့်ခွဲမလဲ?
- AI အပလီကေးရှင်းများအတွက် အရေးပါသော မော်နီတာ metrics များက ဘာတွေလဲ?

---

### အခန်း ၃: ဖွဲ့စည်းမှုနှင့် အတည်ပြုခြင်း (တတိယအပတ်)
**ကြာမြင့်ချိန်**: ၄၅-၆၀ မိနစ် | **အဆင့်**: ⭐⭐

#### သင်ယူရမည့် ရည်မှန်းချက်များ
- ပတ်ဝန်းကျင် ဖွဲ့စည်းမှုနှင့် စီမံခန့်ခွဲမှု နည်းလမ်းများကို ကျွမ်းကျင်စွာ သိရှိခြင်း
- လုံခြုံသော အတည်ပြုမှု ပုံစံများနှင့် managed identity ကို အကောင်အထည်ဖော်ခြင်း
- အရင်းအမြစ်များကို သင့်တော်သော နာမည်ပုံစံများဖြင့် စီမံခန့်ခွဲခြင်း
- ပတ်ဝန်းကျင်များစွာ (development, staging, production) ကို ဖွဲ့စည်းခြင်း

#### ကျွမ်းကျင်ရမည့် အဓိကအကြောင်းအရာများ
- ပတ်ဝန်းကျင် အဆင့်အတန်းနှင့် ဖွဲ့စည်းမှု ဦးစားပေးမှု
- Managed identity နှင့် service principal အတည်ပြုမှု
- Key Vault ပေါင်းစပ်ခြင်းဖြင့် လျှို့ဝှက်ချက်များကို စီမံခန့်ခွဲခြင်း
- ပတ်ဝန်းကျင်-specific parameter စီမံခန့်ခွဲမှု

#### လက်တွေ့လေ့ကျင့်မှုများ
1. **Multi-Environment ဖွဲ့စည်းမှု**: development, staging, production ပတ်ဝန်းကျင်များကို ဖွဲ့စည်းပါ
2. **လုံခြုံရေး ဖွဲ့စည်းမှု**: managed identity အတည်ပြုမှုကို အကောင်အထည်ဖော်ပါ
3. **လျှို့ဝှက်ချက် စီမံခန့်ခွဲမှု**: Azure Key Vault ကို sensitive data အတွက် ပေါင်းစပ်ပါ
4. **Parameter စီမံခန့်ခွဲမှု**: ပတ်ဝန်းကျင်-specific ဖွဲ့စည်းမှုများကို ဖန်တီးပါ

#### အကဲဖြတ်မေးခွန်းများ
- AZD ဖြင့် ပတ်ဝန်းကျင်များကို ဘယ်လို ဖွဲ့စည်းမလဲ?
- Managed identity ကို service principals ထက် အသုံးပြုမှု အကျိုးကျေးဇူးများက ဘာတွေလဲ?
- အပလီကေးရှင်း လျှို့ဝှက်ချက်များကို ဘယ်လို လုံခြုံစွာ စီမံခန့်ခွဲမလဲ?
- AZD ၏ ဖွဲ့စည်းမှု ဦးစားပေးမှုက ဘာလဲ?

---

### အခန်း ၄: Infrastructure as Code နှင့် တင်သွင်းမှု (စတုတ္ထအပတ်-ငါးပတ်)
**ကြာမြင့်ချိန်**: ၁-၁.၅ နာရီ | **အဆင့်**: ⭐⭐⭐

#### သင်ယူရမည့် ရည်မှန်းချက်များ
- Bicep infrastructure templates ကို ဖန်တီးခြင်းနှင့် customize လုပ်ခြင်း
- အဆင့်မြင့် တင်သွင်းမှု pattern များနှင့် workflows ကို အကောင်အထည်ဖော်ခြင်း
- အရင်းအမြစ်များ provision လုပ်ခြင်း strategies ကို နားလည်ခြင်း
- အရွယ်အစားချဲ့ထွင်နိုင်သော multi-service architectures ကို ဒီဇိုင်းဆွဲခြင်း

#### ကျွမ်းကျင်ရမည့် အဓိကအကြောင်းအရာများ
- Bicep template ဖွဲ့စည်းမှုနှင့် အကောင်းဆုံးအလေ့အထ
- အရင်းအမြစ် အချင်းချင်း အချိုးအစားနှင့် တင်သွင်းမှု အစီအစဉ်
- Parameter ဖိုင်များနှင့် template modularity
- Custom hooks နှင့် တင်သွင်းမှု automation

#### လက်တွေ့လေ့ကျင့်မှုများ
1. **Custom Template ဖန်တီးမှု**: multi-service application template တစ်ခုကို ဖန်တီးပါ
2. **Bicep ကျွမ်းကျင်မှု**: modular, reusable infrastructure components ကို ဖန်တီးပါ
3. **တင်သွင်းမှု automation**: pre/post deployment hooks ကို အကောင်အထည်ဖော်ပါ
4. **Architecture ဒီဇိုင်း**: ရှုပ်ထွေးသော microservices architecture ကို တင်သွင်းပါ

#### အကဲဖြတ်မေးခွန်းများ
- AZD အတွက် custom Bicep templates ကို ဘယ်လို ဖန်တီးမလဲ?
- Infrastructure code ကို စီမံခန့်ခွဲရန် အကောင်းဆုံးအလေ့အထများက ဘာတွေလဲ?
- Templates တွင် အရင်းအမြစ် အချိုးအစားများကို ဘယ်လို ကိုင်တွယ်မလဲ?
- Zero-downtime updates ကို ပံ့ပိုးသော တင်သွင်းမှု pattern များက ဘာတွေလဲ?

---

### အခန်း ၅: Multi-Agent AI Solutions (ဆဋ္ဌမအပတ်-ခုနစ်ပတ်)
**ကြာမြင့်ချိန်**: ၂-၃ နာရီ | **အဆင့်**: ⭐⭐⭐⭐

#### သင်ယူရမည့် ရည်မှန်းချက်များ
- Multi-agent AI architectures ကို ဒီဇိုင်းဆွဲခြင်းနှင့် အကောင်အထည်ဖော်ခြင်း
- Agent coordination နှင့် ဆက်သွယ်မှုကို စီမံခန့်ခွဲခြင်း
- မော်နီတာလုပ်ခြင်းနှင့် production-ready AI solutions ကို တင်သွင်းခြင်း
- Agent specialization နှင့် workflow patterns ကို နားလည်ခြင်း

#### ကျွမ်းကျင်ရမည့် အဓိကအကြောင်းအရာများ
- Multi-agent architecture patterns နှင့် ဒီဇိုင်းအခြေခံများ
- Agent ဆက်သွယ်မှု protocols နှင့် data flow
- AI agents အတွက် load balancing နှင့် အရွယ်အစားချဲ့ထွင်မှု strategies
- Multi-agent systems အတွက် production monitoring

#### လက်တွေ့လေ့ကျင့်မှုများ
1. **Retail Solution တင်သွင်းမှု**: multi-agent retail scenario အပြည့်အစုံကို တင်သွင်းပါ
2. **Agent customization**: Customer နှင့် Inventory agent အပြုအမူများကို ပြင်ဆင်ပါ
3. **Architecture အရွယ်အစားချဲ့ထွင်မှု**: load balancing နှင့် auto-scaling ကို အကောင်အထည်ဖော်ပါ
4. **Production Monitoring**: မော်နီတာလုပ်ခြင်းနှင့် alerting ကို စုံလင်စွာ ဖွဲ့စည်းပါ

#### အကဲဖြတ်မေးခွန်းများ
- Multi-agent ဆက်သွယ်မှု patterns ကို ဘယ်လို ဒီဇိုင်းဆွဲမလဲ?
- AI agent workloads အတွက် အရွယ်အစားချဲ့ထွင်မှု အရေးပါသော အချက်များက ဘာတွေလဲ?
- Multi-agent AI systems ကို ဘယ်လို မော်နီတာလုပ်ပြီး debug လုပ်မလဲ?
- AI agents အတွက် ယုံကြည်စိတ်ချရမှုရှိသော production patterns များက ဘာတွေလဲ?

---

### အခန်း ၆: Pre-Deployment Validation & Planning (ရှစ်ပတ်)
**ကြာမြင့်ချိန်**: ၁ နာရီ | **အဆင့်**: ⭐⭐

#### သင်ယူရမည့် ရည်မှန်းချက်များ
- စုံလင်သော capacity planning နှင့် resource validation ကို လုပ်ဆောင်ခြင်း
- ကုန်ကျစရိတ်အကျိုးရှိစေရန် Azure SKUs ကို ရွေးချယ်ခြင်း
- Automated pre-flight checks နှင့် validation ကို အကောင်အထည်ဖော်ခြင်း
- ကုန်ကျစရိတ် optimization strategies ဖြင့် တင်သွင်းမှုများကို စီမံခန့်ခွဲခြင်း

#### ကျွမ်းကျင်ရမည့် အဓိကအကြောင်းအရာများ
- Azure resource quotas နှင့် capacity ကန့်သတ်ချက်များ
- SKU ရွေးချယ်မှု criteria နှင့် ကုန်ကျစရိတ် optimization
- Automated validation scripts နှင့် စမ်းသပ်မှု
- Deployment planning နှင့် risk assessment

#### လက်တွေ့လေ့ကျင့်မှုများ
1. **Capacity Analysis**: သင်၏ အပလီကေးရှင်းများအတွက် resource လိုအပ်ချက်များကို ခွဲခြမ်းစိတ်ဖြာပါ
2. **SKU Optimization**: ကုန်ကျစရိတ်အကျိုးရှိသော service tiers ကို နှိုင်းယှဉ်ပြီး ရွေးချယ်ပါ
3. **Validation Automation**: Pre-deployment check scripts ကို အကောင်အထည်ဖော်ပါ
4. **Cost Planning**: Deployment cost estimates နှင့် budgets ကို ဖန်တီး
2. Azure အရင်းအမြစ်ရရှိနိုင်မှုကို တင်သွင်းမီ ဘယ်လိုအတည်ပြုမလဲ?  
3. Pre-flight check စနစ်၏ အဓိကအစိတ်အပိုင်းများက ဘာတွေလဲ?  
4. တင်သွင်းမှုကုန်ကျစရိတ်ကို ဘယ်လိုခန့်မှန်းပြီး ထိန်းချုပ်မလဲ?  
5. စွမ်းဆောင်ရည်အစီအစဉ်ရေးဆွဲရန် အရေးကြီးသော မော်နီတာလုပ်ငန်းများက ဘာတွေလဲ?

### Module 5: ပြဿနာရှာဖွေခြင်းနှင့် Debugging (Week 6)

#### သင်ယူရမည့်ရည်ရွယ်ချက်များ  
- စနစ်တကျ ပြဿနာရှာဖွေခြင်းနည်းလမ်းများကို ကျွမ်းကျင်စွာအသုံးပြုနိုင်ရန်  
- ရှုပ်ထွေးသော တင်သွင်းမှုပြဿနာများကို Debug လုပ်နိုင်ရန် ကျွမ်းကျင်မှုရရှိရန်  
- စုံလင်သော မော်နီတာလုပ်ငန်းနှင့် အချက်ပေးစနစ်များကို အကောင်အထည်ဖော်နိုင်ရန်  
- အရေးပေါ်တုံ့ပြန်မှုနှင့် ပြန်လည်ထူထောင်ရေးလုပ်ငန်းစဉ်များကို တည်ဆောက်နိုင်ရန်  

#### ကျွမ်းကျင်ရမည့် အဓိကအကြောင်းအရာများ  
- တင်သွင်းမှုမအောင်မြင်မှု ပုံစံများ  
- Log ကို ချိတ်ဆက်ပြီး အနက်ရှိုင်းစွာ လေ့လာခြင်းနည်းလမ်းများ  
- စွမ်းဆောင်ရည် မော်နီတာလုပ်ငန်းနှင့် အကောင်းဆုံးအခြေအနေသို့ ရောက်ရှိစေရန် အဆင့်မြှင့်တင်ခြင်း  
- လုံခြုံရေးအရေးပေါ်အခြေအနေများကို ရှာဖွေပြီး တုံ့ပြန်ခြင်း  
- Disaster recovery နှင့် စီးပွားရေးဆက်လက်လုပ်ကိုင်နိုင်မှု  

#### လက်တွေ့လေ့ကျင့်မှုများ  

**Exercise 5.1: ပြဿနာရှာဖွေမှုအခြေအနေများ**  
```bash
# Practice resolving common issues:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```  

**Exercise 5.2: မော်နီတာလုပ်ငန်းအကောင်အထည်ဖော်ခြင်း**  
```bash
# Set up comprehensive monitoring:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```  

**Exercise 5.3: အရေးပေါ်တုံ့ပြန်မှု**  
```bash
# Build incident response procedures:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```  

#### ကိုယ်တိုင်အကဲဖြတ်မေးခွန်းများ  
1. azd တင်သွင်းမှုများကို ပြဿနာရှာဖွေရာတွင် စနစ်တကျနည်းလမ်းက ဘာလဲ?  
2. ဝန်ဆောင်မှုများနှင့် အရင်းအမြစ်များအကြား Log များကို ဘယ်လိုချိတ်ဆက်မလဲ?  
3. ပြဿနာများကို စောစောမတိုင်မီ ရှာဖွေရန် အရေးကြီးသော မော်နီတာလုပ်ငန်း metrics များက ဘာတွေလဲ?  
4. အကျိုးရှိသော disaster recovery လုပ်ငန်းစဉ်များကို ဘယ်လိုအကောင်အထည်ဖော်မလဲ?  
5. အရေးပေါ်တုံ့ပြန်မှုအစီအစဉ်၏ အဓိကအစိတ်အပိုင်းများက ဘာတွေလဲ?  

### Module 6: အဆင့်မြင့်အကြောင်းအရာများနှင့် အကောင်းဆုံးအလေ့အကျင့်များ (Week 7-8)

#### သင်ယူရမည့်ရည်ရွယ်ချက်များ  
- စီးပွားရေးအဆင့် deployment ပုံစံများကို အကောင်အထည်ဖော်နိုင်ရန်  
- CI/CD ပေါင်းစည်းမှုနှင့် အလိုအလျောက်လုပ်ငန်းစဉ်များကို ကျွမ်းကျင်စွာအသုံးပြုနိုင်ရန်  
- ကိုယ်ပိုင် template များကို တီထွင်ပြီး အသိုင်းအဝိုင်းအတွက် အကျိုးပြုနိုင်ရန်  
- အဆင့်မြင့်လုံခြုံရေးနှင့် လိုက်နာမှုလိုအပ်ချက်များကို နားလည်နိုင်ရန်  

#### ကျွမ်းကျင်ရမည့် အဓိကအကြောင်းအရာများ  
- CI/CD pipeline ပေါင်းစည်းမှုပုံစံများ  
- ကိုယ်ပိုင် template တီထွင်ခြင်းနှင့် ဖြန့်ဝေခြင်း  
- စီးပွားရေးအဆင့် governance နှင့် လိုက်နာမှု  
- အဆင့်မြင့် network နှင့် လုံခြုံရေး configuration များ  
- စွမ်းဆောင်ရည်မြှင့်တင်ခြင်းနှင့် ကုန်ကျစရိတ်စီမံခန့်ခွဲမှု  

#### လက်တွေ့လေ့ကျင့်မှုများ  

**Exercise 6.1: CI/CD ပေါင်းစည်းမှု**  
```yaml
# Implement automated deployment pipelines:
1. GitHub Actions workflow for azd deployments
2. Azure DevOps pipeline integration
3. Multi-stage deployment with approvals
4. Automated testing and quality gates
5. Security scanning and compliance checks
```  

**Exercise 6.2: ကိုယ်ပိုင် Template တီထွင်ခြင်း**  
```bash
# Create and publish custom templates:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```  

**Exercise 6.3: စီးပွားရေးအကောင်အထည်ဖော်ခြင်း**  
```bash
# Implement enterprise-grade features:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```  

#### ကိုယ်တိုင်အကဲဖြတ်မေးခွန်းများ  
1. azd ကို ရှိပြီးသား CI/CD workflows တွင် ဘယ်လိုပေါင်းစည်းမလဲ?  
2. ကိုယ်ပိုင် template တီထွင်ရာတွင် အဓိကစဉ်ဆက်များက ဘာတွေလဲ?  
3. azd တင်သွင်းမှုများတွင် governance နှင့် လိုက်နာမှုကို ဘယ်လိုအကောင်အထည်ဖော်မလဲ?  
4. စီးပွားရေးအဆင့် deployment များအတွက် အကောင်းဆုံးအလေ့အကျင့်များက ဘာတွေလဲ?  
5. azd အသိုင်းအဝိုင်းအတွက် ထိရောက်စွာ အကျိုးပြုရန် ဘယ်လိုပံ့ပိုးမလဲ?  

## လက်တွေ့ပရောဂျက်များ  

### Project 1: ကိုယ်ပိုင် Portfolio Website  
**အဆင့်**: Beginner  
**ကြာမြင့်ချိန်**: 1-2 weeks  

အောက်ပါများကို အသုံးပြု၍ ကိုယ်ပိုင် portfolio website တည်ဆောက်ပြီး deploy လုပ်ပါ-  
- Azure Storage တွင် static website hosting  
- Custom domain configuration  
- CDN ပေါင်းစည်းမှုဖြင့် ကမ္ဘာလုံးဆိုင်ရာ စွမ်းဆောင်ရည်မြှင့်တင်ခြင်း  
- Automated deployment pipeline  

**Deliverables**:  
- Azure တွင် deploy လုပ်ထားသော website  
- Portfolio deployments အတွက် custom azd template  
- တင်သွင်းမှုလုပ်ငန်းစဉ် documentation  
- ကုန်ကျစရိတ်ခန့်မှန်းခြင်းနှင့် အဆင့်မြှင့်တင်ရန် အကြံပြုချက်များ  

### Project 2: Task Management Application  
**အဆင့်**: Intermediate  
**ကြာမြင့်ချိန်**: 2-3 weeks  

အောက်ပါများပါဝင်သော full-stack task management application တည်ဆောက်ပါ-  
- React frontend ကို App Service တွင် deploy လုပ်ခြင်း  
- Node.js API backend နှင့် authentication  
- PostgreSQL database နှင့် migrations  
- Application Insights monitoring  

**Deliverables**:  
- User authentication ပါဝင်သော အပြည့်အစုံ application  
- Database schema နှင့် migration scripts  
- Monitoring dashboards နှင့် alerting rules  
- Multi-environment deployment configuration  

### Project 3: Microservices E-commerce Platform  
**အဆင့်**: Advanced  
**ကြာမြင့်ချိန်**: 4-6 weeks  

Microservices-based e-commerce platform တည်ဆောက်ပြီး အကောင်အထည်ဖော်ပါ-  
- API services များ (catalog, orders, payments, users)  
- Service Bus ဖြင့် message queue integration  
- Redis cache ဖြင့် စွမ်းဆောင်ရည်မြှင့်တင်ခြင်း  
- စုံလင်သော logging နှင့် monitoring  

**Deliverables**:  
- အပြည့်အစုံ microservices architecture  
- Inter-service communication patterns  
- စွမ်းဆောင်ရည်စမ်းသပ်ခြင်းနှင့် အဆင့်မြှင့်တင်ခြင်း  
- Production-ready security implementation  

## အကဲဖြတ်ခြင်းနှင့် လက်မှတ်ထုတ်ပေးခြင်း  

### Knowledge Checks  

Module တစ်ခုစီပြီးဆုံးပြီးနောက် အောက်ပါအကဲဖြတ်မှုများကို ပြီးစီးပါ-  

**Module 1 Assessment**: အခြေခံအကြောင်းအရာများနှင့် installation  
- အခြေခံအကြောင်းအရာများအပေါ် multiple choice မေးခွန်းများ  
- Installation နှင့် configuration လုပ်ငန်းစဉ်များ  
- ရိုးရှင်းသော တင်သွင်းမှုလေ့ကျင့်မှု  

**Module 2 Assessment**: Configuration နှင့် environments  
- Environment စီမံခန့်ခွဲမှုအခြေအနေများ  
- Configuration ပြဿနာရှာဖွေမှုလေ့ကျင့်မှုများ  
- လုံခြုံရေး configuration အကောင်အထည်ဖော်ခြင်း  

**Module 3 Assessment**: Deployment နှင့် provisioning  
- Infrastructure design စိန်ခေါ်မှုများ  
- Multi-service deployment အခြေအနေများ  
- စွမ်းဆောင်ရည်မြှင့်တင်ခြင်းလေ့ကျင့်မှုများ  

**Module 4 Assessment**: Pre-deployment validation  
- စွမ်းဆောင်ရည်အစီအစဉ် case studies  
- ကုန်ကျစရိတ်အဆင့်မြှင့်တင်မှုအခြေအနေများ  
- Validation pipeline အကောင်အထည်ဖော်ခြင်း  

**Module 5 Assessment**: Troubleshooting နှင့် debugging  
- ပြဿနာရှာဖွေမှုလေ့ကျင့်မှုများ  
- မော်နီတာလုပ်ငန်းအကောင်အထည်ဖော်ခြင်း tasks  
- အရေးပေါ်တုံ့ပြန်မှု simulation များ  

**Module 6 Assessment**: အဆင့်မြင့်အကြောင်းအရာများ  
- CI/CD pipeline design  
- ကိုယ်ပိုင် template တီထွင်ခြင်း  
- စီးပွားရေး architecture အခြေအနေများ  

### Final Capstone Project  

အခြေခံအကြောင်းအရာများအားလုံးကို ကျွမ်းကျင်မှုပြသနိုင်သော အပြည့်အစုံ solution တည်ဆောက်ပြီး အကဲဖြတ်ပါ-  

**Requirements**:  
- Multi-tier application architecture  
- Deployment environments များစွာ  
- စုံလင်သော monitoring နှင့် alerting  
- လုံခြုံရေးနှင့် လိုက်နာမှုအကောင်အထည်ဖော်ခြင်း  
- ကုန်ကျစရိတ်အဆင့်မြှင့်တင်ခြင်းနှင့် စွမ်းဆောင်ရည်မြှင့်တင်ခြင်း  
- စုံလင်သော documentation နှင့် runbooks  

**Evaluation Criteria**:  
- Technical implementation အရည်အသွေး  
- Documentation စုံလင်မှု  
- လုံခြုံရေးနှင့် အကောင်းဆုံးအလေ့အကျင့်လိုက်နာမှု  
- စွမ်းဆောင်ရည်နှင့် ကုန်ကျစရိတ်အဆင့်မြှင့်တင်မှု  
- Troubleshooting နှင့် monitoring ထိရောက်မှု  

## သင်ယူရန်အရင်းအမြစ်များနှင့် ကိုးကားချက်များ  

### တရားဝင် Documentation  
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)  

### အသိုင်းအဝိုင်းအရင်းအမြစ်များ  
- [AZD Template Gallery](https://azure.github.io/awesome-azd/)  
- [Azure-Samples GitHub Organization](https://github.com/Azure-Samples)  
- [Azure Developer CLI GitHub Repository](https://github.com/Azure/azure-dev)  

### လေ့ကျင့်ရန်ပတ်ဝန်းကျင်များ  
- [Azure Free Account](https://azure.microsoft.com/free/)  
- [Azure DevOps Free Tier](https://azure.microsoft.com/services/devops/)  
- [GitHub Actions](https://github.com/features/actions)  

### အပိုဆောင်း Tools  
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)  
- [Visual Studio Code](https://code.visualstudio.com/)  
- [Azure Tools Extension Pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)  

## သင်ယူမှုအချိန်ဇယားအကြံပြုချက်များ  

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

## တိုးတက်မှု Tracking နှင့် အကဲဖြတ်မှု Framework  

### Chapter Completion Checklist  

သင်၏တိုးတက်မှုကို အောက်ပါ measurable outcomes များဖြင့် Tracking လုပ်ပါ-  

#### 📚 Chapter 1: Foundation & Quick Start  
- [ ] **Installation Complete**: AZD ကို သင်၏ platform တွင် install လုပ်ပြီး အတည်ပြုထားသည်  
- [ ] **First Deployment**: todo-nodejs-mongo template ကို အောင်မြင်စွာ deploy လုပ်ထားသည်  
- [ ] **Environment Setup**: ပထမဆုံး environment variables များကို configure လုပ်ထားသည်  
- [ ] **Resource Navigation**: Azure Portal တွင် deploy လုပ်ထားသော resources များကို explore လုပ်ထားသည်  
- [ ] **Command Mastery**: AZD commands များကို အခြေခံကျွမ်းကျင်မှုရရှိထားသည်  

#### 🤖 Chapter 2: AI-First Development  
- [ ] **AI Template Deployment**: azure-search-openai-demo ကို အောင်မြင်စွာ deploy လုပ်ထားသည်  
- [ ] **RAG Implementation**: document indexing နှင့် retrieval ကို configure လုပ်ထားသည်  
- [ ] **Model Configuration**: ရည်ရွယ်ချက်ကွဲပြားသော AI models များကို setup လုပ်ထားသည်  
- [ ] **AI Monitoring**: AI workloads အတွက် Application Insights ကို implement လုပ်ထားသည်  
- [ ] **Performance Optimization**: AI application performance ကို tune လုပ်ထားသည်  

#### ⚙️ Chapter 3: Configuration & Authentication  
- [ ] **Multi-Environment Setup**: dev, staging, prod environments များကို configure လုပ်ထားသည်  
- [ ] **Security Implementation**: managed identity authentication ကို setup လုပ်ထားသည်  
- [ ] **Secrets Management**: sensitive data အတွက် Azure Key Vault ကို integrate လုပ်ထားသည်  
- [ ] **Parameter Management**: environment-specific configurations များကို create လုပ်ထားသည်  
- [ ] **Authentication Mastery**: secure access patterns များကို implement လုပ်ထားသည်  

#### 🏗️ Chapter 4: Infrastructure as Code & Deployment  
- [ ] **Custom Template Creation**: multi-service application template တစ်ခုကို build လုပ်ထားသည်  
- [ ] **Bicep Mastery**: modular, reusable infrastructure components များကို create လုပ်ထားသည်  
- [ ] **Deployment Automation**: pre/post deployment hooks များကို implement လုပ်ထားသည်  
- [ ] **Architecture Design**: ရှုပ်ထွေးသော microservices architecture ကို deploy လုပ်ထားသည်  
- [ ] **Template Optimization**: performance နှင့် cost အတွက် templates များကို optimize လုပ်ထားသည်  

#### 🎯 Chapter 5: Multi-Agent AI Solutions  
- [ ] **Retail Solution Deployment**: multi-agent retail scenario အပြည့်အစုံကို deploy လုပ်ထားသည်  
- [ ] **Agent Customization**: Customer နှင့် Inventory agent behaviors များကို modify လုပ်ထားသည်  
- [ ] **Architecture Scaling**: load balancing နှင့် auto-scaling ကို implement လုပ်ထားသည်  
- [ ] **Production Monitoring**: စုံလင်သော monitoring နှင့် alerting ကို setup လုပ်ထားသည်  
- [ ] **Performance Tuning**: multi-agent system performance ကို optimize လုပ်ထားသည်  

#### 🔍 Chapter 6: Pre-Deployment Validation & Planning  
- [ ] **Capacity Analysis**: applications အတွက် resource requirements များကို analyze လုပ်ထားသည်  
- [ ] **SKU Optimization**: cost-effective service tiers များကို select လုပ်ထားသည်  
- [ ] **Validation Automation**: pre-deployment check scripts များကို implement လုပ်ထားသည်  
- [ ] **Cost Planning**: deployment cost estimates နှင့် budgets များကို create လုပ်ထားသည်  
- [ ] **Risk Assessment**: deployment risks များကို identify လုပ်ပြီး mitigate လုပ်ထားသည်  

#### 🚨 Chapter 7: Troubleshooting & Debugging  
- [ ] **Diagnostic Skills**: ရည်ရွယ်ချက်ဖြင့် error ထည့်ထားသော deployments များကို debug လုပ်ထားသည်  
- [ ] **Log Analysis**: Azure Monitor နှင့် Application Insights ကို ထိရောက်စွာအသုံးပြုထားသည်  
- [ ] **Performance Tuning**: slow-performing applications
- **စာရွက်စာတမ်း**: လူမှုအသိုင်းအဝိုင်း၏စာရွက်စာတမ်းများနှင့် ဥပမာများတွင် ပါဝင်ဆောင်ရွက်ပါ
- **တုံ့ပြန်မှုလှိုင်း**: သင်ခန်းစာအကြောင်းအရာများနှင့် Azure ဝန်ဆောင်မှုများအပေါ် တုံ့ပြန်မှုပေးပါ

#### အလုပ်အကိုင်ဖွံ့ဖြိုးတိုးတက်မှု
- **ပရော်ဖက်ရှင်နယ်ကွန်ရက်**: Azure နှင့် AI ကျွမ်းကျင်သူများနှင့် ချိတ်ဆက်ပါ
- **ပြောကြားရန်အခွင့်အရေးများ**: ဆွေးနွေးပွဲများ သို့မဟုတ် အစည်းအဝေးများတွင် သင်ယူမှုများကို တင်ပြပါ
- **အခမဲ့ရင်းမြစ်များတွင် ပါဝင်မှု**: AZD template များနှင့် tools များတွင် ပါဝင်ဆောင်ရွက်ပါ
- **လမ်းညွှန်မှု**: AZD သင်ယူမှုခရီးစဉ်တွင် အခြား developer များကို လမ်းညွှန်ပါ

---

**အခန်းများအကြောင်းအရာ**
- **📚 သင်ခန်းစာအိမ်**: [AZD အခြေခံသင်ခန်းစာ](../README.md)
- **📖 သင်ယူမှုစတင်ရန်**: [အခန်း ၁: အခြေခံနှင့် အမြန်စတင်ခြင်း](../README.md#-chapter-1-foundation--quick-start)
- **🎯 တိုးတက်မှုကိုခြေရာခံရန်**: အခန်း ၈ ခုပါဝင်သော သင်ယူမှုစနစ်ကို အပြည့်အစုံတိုးတက်မှုအတိုင်းအတာဖြင့် ခြေရာခံပါ
- **🤝 လူမှုအသိုင်းအဝိုင်း**: [Azure Discord](https://discord.gg/microsoft-azure) မှ အထောက်အပံ့နှင့် ဆွေးနွေးမှုများ

**သင်ယူမှုတိုးတက်မှုကိုခြေရာခံခြင်း**: Azure Developer CLI ကို အဆင့်ဆင့်၊ လက်တွေ့ကျသော သင်ယူမှုများနှင့် တိုင်းတာနိုင်သောရလဒ်များ၊ ပရော်ဖက်ရှင်နယ်ဖွံ့ဖြိုးတိုးတက်မှုအကျိုးကျေးဇူးများဖြင့် ကျွမ်းကျင်ရန် ဒီစနစ်တကျလမ်းညွှန်ကို အသုံးပြုပါ။

---

**အကြောင်းကြားချက်**:  
ဤစာရွက်စာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ကို အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှန်ကန်မှုအတွက် ကြိုးစားနေသော်လည်း၊ အလိုအလျောက် ဘာသာပြန်ခြင်းတွင် အမှားများ သို့မဟုတ် မမှန်ကန်မှုများ ပါဝင်နိုင်သည်ကို သတိပြုပါ။ မူရင်းဘာသာစကားဖြင့် ရေးသားထားသော စာရွက်စာတမ်းကို အာဏာတရားရှိသော ရင်းမြစ်အဖြစ် သတ်မှတ်သင့်ပါသည်။ အရေးကြီးသော အချက်အလက်များအတွက် လူ့ဘာသာပြန်ပညာရှင်များမှ ပရော်ဖက်ရှင်နယ် ဘာသာပြန်ခြင်းကို အကြံပြုပါသည်။ ဤဘာသာပြန်ကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော အလွဲအလွတ်များ သို့မဟုတ် အနားလွဲမှုများအတွက် ကျွန်ုပ်တို့သည် တာဝန်မယူပါ။