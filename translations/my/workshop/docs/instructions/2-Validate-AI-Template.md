# 2. Template ကို အတည်ပြုခြင်း

> 2026 ဇွန်လတွင် `azd 1.25.6` ဖြင့် စစ်ဆေးပြီးပါပြီ။

  
!!! tip "ဤမော်ဂျူးလ်၏ အဆုံးတွင် သင်၏အနေဖြင့် အောက်ပါအရာများကို ပြုလုပ်နိုင်မည်"

    - [ ] AI ဖြေရှင်းချက် ဖွဲ့စည်းပုံကို ခွဲခြမ်းစိစစ်ရန်
    - [ ] AZD ဖြန့်ချိမှု အလုပ်စဉ်ကို နားလည်ရန်
    - [ ] AZD အသုံးပြုနည်းအတွက် GitHub Copilot ကို ကူညီမှုအဖြစ် အသုံးပြုနိုင်ရန်
    - [ ] **Lab 2:** AI Agents template ကို ဖြန့်ချိ၍ အတည်ပြုခြင်း

---


## 1. မိတ်ဆက်

[Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) သို့မဟုတ် `azd` သည် Azure ပေါ်တွင် အပ်ပလီကေးရှင်းများကို တည်ဆောက်ပြီး ဖြန့်ချိရာ၌ developer workflow ကို လက်လှမ်းမီအောင် လွယ်ကူစေသည့် ဖွင့်ထားသော source command-line ကိရိယာတစ်ခုဖြစ်သည်။ 

[AZD Templates](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) များမှာ နမူနာ application ကုဒ်များ၊ _infrastructure-as-code_ အဆောက်အအုံများနှင့် `azd` ဖိုင်များကို ထည့်သွင်းထားသော စံပြ repository များဖြစ်ပြီး တစ်စုတည်းသော ဖြေရှင်းချက် ဖွဲ့စည်းပုံကို ပံ့ပိုးပေးသည်။ အထောက်အပံ့အဆောက်အအုံကို provision ပြုလုပ်ရန် သာမန်အားဖြင့် `azd provision` command လေးတစ်ခုဖြင့် ပြီးမြောက်နိုင်ပြီး၊ `azd up` ကို သုံးကာ အသုံးပြုလျှင် အဆောက်အအုံကို provision ဖို့လည်း ရှိကာ application ကို တစ်ပြိုင်နက်ထဲမှာ ပြန်လည်deploy လုပ်နိုင်သည်။

အကြောင်းကြောင့် သင့် application ဖွံ့ဖြိုးရေး လုပ်ငန်းစဉ်ကို စတင်ရန်အတွက် သင့် application နှင့် အဆောက်အအုံ လိုအပ်ချက်များနှင့် အနီးဆုံးကိုက်ညီသော _AZD Starter template_ ကို ရှာဖွေပြီး repository ကို သင့်အခြေအနေအတွက် အပြင်ဆင်သုံးနိုင်သည်။

စတင်ရန်မပြုခင် Azure Developer CLI ကို 설치ထားသည်ကို အရင်စစ်ဆေးပါ။

1. VS Code terminal ကိုဖွင့်ပြီး ဒီ command ကို ရိုက်ထည့်ပါ။

      ```bash title="" linenums="0"
      azd version
      ```

1. အဖြစ်ဒီလို တူညီသော output ကို တွေ့ရပါမည်။

      ```bash title="" linenums="0"
      azd version 1.25.6 (commit <current-build>)
      ```

**ယခု သင်သည် azd ဖြင့် template ကို ရွေးချယ်၍ ဖြန့်ချိရန် အသင့်ဖြစ်ပါပြီ**

---

## 2. Template ရွေးချယ်မှု

Microsoft Foundry ပလက်ဖောင်းတွင် [_set of recommended AZD templates_](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started) များပါရှိပြီး မျိုးစုံသော ဖြေရှင်းချက် စင်ဂျာရီများကို ကာကွယ်ပေးပါသည်၊ ဥပမာ _multi-agent workflow automation_ နှင့် _multi-modal content processing_ စသည့် ခေတ်ပြိုင် စိစစ်မှုများအတွက်။ ထို့အပြင် Microsoft Foundry portal မှလည်း ဤ template များကို ရှာဖွေနိုင်သည်။

1. Visit [https://ai.azure.com/templates](https://ai.azure.com/templates)
1. Prompt တက်လာသောအခါ Microsoft Foundry portal တွင် log in ဝင်ပါ - သင်အောက်ပါအတိုင်း ကြောင်းတွေ့ပါလိမ့်မည်။

![ရွေးချယ်ရန်](../../../../../translated_images/my/01-pick-template.60d2d5fff5ebc374.webp)


**Basic** ရွေးချယ်စရာများသည် စတาร์တာ template များဖြစ်သည်။

1. [ ] [Get Started with AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat) — အခြေခံ chat application တစ်ခုကို _with your data_ ဖြင့် Azure Container Apps သို့ ဖြန့်ချိပေးသည်။ အခြေခံ AI chatbot အခြေအနေပေါ်ကို စူးစမ်းရန် အတွက် အသုံးပြုပါ။
1. [X] [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) — Foundry Agents ပါဝင်သည့် စံပလက်အေဂျင့်ကိုလည်း ဖြန့်ချိပေးသည်။ tools နှင့် models ပါဝင်သည့် agentic AI ဖြေရှင်းချက်များနှင့် ရင်းနှီးစေသည်။

ဒုတိယ link ကို browser tab အသစ်တွင် ဖွင့်ကြည့်ပါ (သို့မဟုတ် card တွင် `Open in GitHub` ကို နှိပ်ပါ)။ သင်ဤ AZD Template အတွက် repository ကို တွေ့ရမည်ဖြစ်ပြီး README ကို တစ်မိနစ်ခန့် ကြည့်ရှုပါ။ application architecture သည် အောက်ပါအတိုင်း ဖြစ်ပါသည်။

![ဖွဲ့စည်းပုံ](../../../../../translated_images/my/architecture.8cec470ec15c65c7.webp)

---

## 3. Template အစပြုခြင်း

ဒီ template ကို ဖြန့်ချိ၍ တရားဝင် အသက်သေခံ ထားနိုင်ကြောင်း စစ်ဆေးကြည့်ပါမည်။ [Getting Started](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started) အပိုင်းရှိ လမ်းညွှန်ချက်များအတိုင်း လုပ်ဆောင်ပါမည်။

1. Template repository အတွက် အလုပ်လုပ်ရန် ပတ်ဝန်းကျင် တစ်ခုကို ရွေးချယ်ပါ။

      - **GitHub Codespaces**: ဤလင့်ခ်ကိုနှိပ်ပြီး [this link](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) နှင့် `Create codespace` ကို အတည်ပြုပါ
      - **Local clone or dev container**: Clone `Azure-Samples/get-started-with-ai-agents` ထားပြီး VS Code တွင် ဖွင့်ပါ

1. VS Code terminal ပြင်ဆင်ပြီး အသင့်ဖြစ်သည့်အခါ အောက်ပါ command ကို ရိုက်ထည့်ပါ။

   ```bash title="" linenums="0"
   azd up
   ```

ဒီအတိုင်း ဖောက်ပြန်မည့် workflow အဆင့်များကို ပြီးမြောက်ပါစေ။

1. Azure တွင် log in ဝင်ရန် prompt တက်လာပါလိမ့်မည် - authentication နှင့်ပတ်သက်သော ညွှန်ကြားချက်များကို လိုက်နာပါ
1. သင့်အတွက် unique ဖြစ်သော environment name ကို ထည့်သွင်းပါ - ဥပမာ၊ 我は `nitya-mshack-azd` ကို အသုံးပြုခဲ့ပါသည်
1. ၎င်းသည် `.azure/` ဖိုမတ်ကို ဖန်တီးမည် - သင် env နာမည်ပါ subfolder တစ်ခုကို တွေ့ရမည်
1. Subscription name ရွေးရန် prompt တက်လာပါလိမ့်မည် - default ကို စိတ်ကြိုက် ရွေးပါ
1. တည်နေရာ (location) မေးလိမ့်မည် - `East US 2` ကို အသုံးပြုပါ

အခု, provisioning ပြီးမြောက်ရန် စောင့်ဆိုင်းရပါမည်။ **ဤအရာသည် 10-15 မိနစ် ကြာနိုင်သည်**

1. ပြီးပြီဆို console တွင် SUCCESS စာသားကို အောက်ပါကဲ့သို့ မြင်ရမည်။
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. သင်၏ Azure Portal တွင် အဆိုပါ env နာမည်ဖြင့် provision ပြုလုပ်ထားသော resource group တစ်ခုပေါ်လာမည်။

      ![Provision လုပ်ထားသော အင်ဖရာ](../../../../../translated_images/my/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **ယခု သင်သည် ဖြန့်ချိထားသော အဆောက်အအုံနှင့် application ကို အတည်ပြုရန် အသင့်ဖြစ်ပါပြီ**။

---

## 4. Template အတည်ပြုမှု

1. Azure Portal ၏ [Resource Groups](https://portal.azure.com/#browse/resourcegroups) စာမျက်နှာသို့ သွားပါ - prompt တက်လာပါက log in ဝင်ပါ
1. သင့် environment နာမည်ပါ RG ကို နှိပ်ပါ - အထက်ပါ စာမျက်နှာကို မြင်ရမည်

      - Azure Container Apps resource ကို နှိပ်ပါ
      - _Essentials_ အပိုင်း (အထက်ညာ) မှ Application Url ကို နှိပ်ပါ

1. အောက်ပါကဲ့သို့ ဟော့စ်တက်ထားသော application front-end UI ကို မြင်ရမည်။

   ![အက်ပ်](../../../../../translated_images/my/03-test-application.471910da12c3038e.webp)

1. [sample questions](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md) အချို့ကို မေးကြည့်ပါ။

      1. မေးပါ: ```What is the capital of France?``` 
      1. မေးပါ: ```What's the best tent under $200 for two people, and what features does it include?```

1. အောက်ပါကဲ့သို့ ဖြေကြားချက်များကို ရရှိမည်။ _ဒါပေမယ့် ယင်းသည် မည်သို့ အလုပ်လုပ်သနည်း?_ 

      ![အက်ပ် မေးခွန်း ဖြေကြားချက်](../../../../../translated_images/my/03-test-question.521c1e863cbaddb6.webp)

---

## 5. Agent အတည်ပြုမှု

Azure Container App သည် ဒီ template အတွက် Microsoft Foundry project တွင် provision လုပ်ထားသော AI Agent ထံ ချိတ်ဆက်ထားသည့် endpoint တစ်ခုကို deploy လုပ်ပေးထားသည်။ ၎င်းအရာသည် ဘာကို ဆိုလိုသနည်းဆိုတာ ကြည့်ကြပါစို့။

1. Azure Portal တွင် သင့် resource group ၏ _Overview_ စာမျက်နှာသို့ ပြန်သွားပါ

1. ထိုစာရင်းထဲမှ `Microsoft Foundry` resource ကို နှိပ်ပါ

1. အောက်ပါအတိုင်း မြင်ရမည်။ `Go to Microsoft Foundry Portal` ခလုတ်ကို နှိပ်ပါ။ 
   ![Foundry ကြည့်ရှုရန်](../../../../../translated_images/my/04-view-foundry-project.fb94ca41803f28f3.webp)

1. သင့် AI application အတွက် Foundry Project စာမျက်နှာကို မြင်ရမည်
   ![ပရောဂျက်](../../../../../translated_images/my/05-visit-foundry-portal.d734e98135892d7e.webp)

1. `Agents` ကို နှိပ်ပါ - သင့် project တွင် default Agent တစ်ယောက် provision လုပ်ထားသော 것을 မြင်ရမည်
   ![အေးဂျင့်များ](../../../../../translated_images/my/06-visit-agents.bccb263f77b00a09.webp)

1. ယင်းအား ရွေးချယ်ပါ - Agent အသေးစိတ်ကို မြင်ရလိမ့်မည်။ အောက်ပါအချက်များကို မှတ်သားပါ။

      - Agent သည် default အနေဖြင့် File Search ကို အသုံးပြုထားသည် (အမြဲ)
      - Agent ၏ `Knowledge` သည် 32 ဖိုင် upload ထားသည်ဟု ပြသသည် (file search အတွက်)
      ![အေးဂျင့် အသေးစိတ်](../../../../../translated_images/my/07-view-agent-details.0e049f37f61eae62.webp)

1. ဘယ်ဘက် မီနူးတွင် `Data+indexes` ရွေးချယ်စရာကို ရှာ၍ အသေးစိတ်ကြည့်ပါ။

      - Knowledge အတွက် upload လုပ်ထားသော 32 ဖိုင်များကို မြင်ရမည်။
      - ၎င်းတို့သည် `src/files` အောက်ရှိ 12 customer ဖိုင်များနှင့် 20 product ဖိုင်များနှင့် ကိုက်ညီပါလိမ့်မည်။
      ![ဒေတာ](../../../../../translated_images/my/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**သင်သည် Agent အလုပ်လုပ်မှုကို အတည်ပြုလိုက်ပါပြီ!**

1. Agent ၏ ဖြေကြားချက်များသည် အဆိုပါဖိုင်များထဲရှိ ဗဟုသုတပေါ် အခြေခံထားပြီး ဖြစ်သည်။
1. ယခု သင်သည် ဤ ဒေတာနှင့်ဆိုင်သော မေးခွန်းများ မေးနိုင်ပြီး, ချမ်းသာသော အဖြေများ ရရှိနိုင်သည်။
1. ဥပမာ: `customer_info_10.json` သည် "Amanda Perez" မှ ဖျော်ဖြေခဲ့သော 3 ငွေပေးချေမှုများကို ဖော်ပြသည်။

Browser tab အား ပြန်လည်ဖွင့်ပြီး Container App endpoint တွင် `What products does Amanda Perez own?` ဟု မေးပါ။ အောက်ပါကဲ့သို့ ပြသနိုင်ပါသည်။

![ဒေတာအခြေခံ ဖြေကြားချက်](../../../../../translated_images/my/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. Agent Playground

Microsoft Foundry ၏ အင်အားများကို နားလည်မှုပို ရရှိစေရန် Agent ကို Agents Playground တွင် စမ်းသပ်ကြည့်ပါ။

1. Microsoft Foundry ၏ `Agents` စာမျက်နှာသို့ ပြန်သွားပြီး default agent ကို ရွေးချယ်ပါ
1. `Try in Playground` ရွေးချယ်စရာကို နှိပ်ပါ - Playground UI အမျိုးအစားတစ်ခုကို ကြည့်ရမည်
1. အတူတူမေးခွန်းကို မေးပါ: `What products does Amanda Perez own?`

    ![ဒေတာ Playgound တွင် မေးမြန်းခြင်း](../../../../../translated_images/my/09-ask-in-playground.a1b93794f78fa676.webp)

တူညီ (သို့မဟုတ် ဆန့်ကျင်) ဖြေကြားချက်ကို ရရှိပါလိမ့်မည် - သို့သော် သင်၏ agentic app ၏ အရည်အသွေး၊ ကုန်ကျစရိတ်နှင့် လုပ်ဆောင်နိုင်မှုကို နားလည်ရန် အသုံးချနိုင်သော အပိုဆောင်းအချက်များလည်း ရရှိမည်။ ဥပမာ -

1. ဖြေကြားချက်သည် ဖြေချင်းကို "ground" ပြုရန် အသုံးပြုသော data ဖိုင်များကို ရှာဖွေဖော်ပြထားသည်ကို သတိပြုပါ
1. ဖိုင် label များတွင် မာ့နှိပ်ပါ - သင်၏ မေးခွန်းနှင့် ပြသထားသော ဖြေဆိုချက်တို့ သဘောတူပါသလား?

သင်သည် ဖြေကြားချက်အောက်တွင် _stats_ တန်းတစ်ခုကိုလည်း မြင်ရမည်။

1. မည်သည့် မက်ထရစ်ကိုမဆို မတ်ထား၍ ကြည့်ပါ - ဥပမာ၊ Safety ကို မြင်ပါ။ ဤကဲ့သို့ ပြသပါမည်
1. သတ်မှတ်ထားသော အကဲဖြတ်ချက်သည် သင့်စိတ်ထင်မှတ်ချက်နှင့် ကိုက်ညီပါသလား?

      ![Run info meter ကို ကြည့်ရှုခြင်း](../../../../../translated_images/my/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. Built-in Observability

Observability ဆိုသည်မှာ သင့် application ကို အချက်အလက်ထုတ်လုပ်ရန် ဆောက်လုပ်ပေးခြင်းဖြစ်ပြီး ၎င်းအချက်အလက်များအား အသုံးပြုကာ လုပ်ဆောင်ချက်များကို နားလည်၊ ပြဿနာရှာဖွေ၊ တိုးတက်ကောင်းမွန်အောင် ပြုလုပ်နိုင်သည်။ ၎င်းကို ခံစားရန် -

1. `View Run Info` ခလုတ်ကို နှိပ်ပါ - ဤမြင်ကွင်းကို မြင်ရမည်။ ၎င်းသည် [Agent tracing](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) ၏ တစ်ဦးဦး ပုံရိပ်ဖြစ်သည်။ _Thread Logs ကို top-level menu မှလည်း နှိပ်၍ ဤမြင်ကွင်းကို ရယူနိုင်သည်_။

   - run အဆင့်များနှင့် agent က tools များကို အသုံးပြုပြီး လုပ်ဆောင်ထားသော အရာများကို သဘောပေါက်စေပါ
   - ဖြေကြားချက်အတွက် အသုံးပြုသည့် Token အရေအတွက်ကို (ထွက်ရ။
) နားလည်ပါ
   - latency နှင့် အချိန်သည် အားလုံးကို ဆိုင်းပင် မည်မျှ စုစည်းနေသည်ကို နားလည်ပါ

      ![Run Info မှာ ပြသထားသော Agent trace](../../../../../translated_images/my/10-view-run-info.b20ebd75fef6a1cc.webp)

1. `Metadata` တက်ကို နှိပ်၍ run အတွက် ပိုမိုအသုံးဝင်နိုင်သော attribute များကို ကြည့်ရှုပါ။  

      ![Agent မီတာဒေတာကြည့်ရှုမှု](../../../../../translated_images/my/11-view-run-info-metadata.7966986122c7c2df.webp)


1. `Evaluations` တက်ကို နှိပ်၍ agent ၏ ဖြေကြားချက်ပေါ် မူတည်၍ အလိုအလျောက် ပြုလုပ်ထားသော အကဲဖြတ်ချက်များကို ကြည့်ပါ။ ၎င်းများတွင် safety အကဲဖြတ်ချက်များ (ဥပမာ၊ Self-harm) နှင့် agent အထူးသတ်မှတ် အကဲဖြတ်ချက်များ (ဥပမာ၊ ရည်ရွယ်ချက် ဖြေရှင်းမှု၊ Task ကန့်သတ်မှုလိုက်နာမှု) ပါဝင်သည်။

      ![Agent အကဲဖြတ်ချက်များ](../../../../../translated_images/my/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. နောက်ဆုံးတွင် sidebar မီနူးမှ `Monitoring` တက်ကို နှိပ်ပါ။

      - ပြသထားသော စာမျက်နှာတွင် `Resource usage` တက်ကို ရွေး၍ မက်ထရစ်များကို ကြည့်ပါ။
      - token များဖြင့် တိုးတက်လာသော ကုန်ကျစရိတ်နှင့် request များအရ အသုံးပြုမှုကို တစ်ကြောင်းချင်းစီ မှတ်တမ်းတင်၍ စောင့်ကြည့်ပါ။
      - first byte (input processing) နှင့် last byte (output) အထိ app latency ကို ထောက်လှမ်းပါ။

      ![Monitoring - Resource usage](../../../../../translated_images/my/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. Environment Variables

ယခုတိုင်အောင် ကျွန်ုပ်တို့ browser မှီဖြင့် ဖြန့်ချိမှုပြီး၊ အဆောက်အအုံများ provision ပြီး application လည်း အလုပ်လုပ်နိုင်ကြောင်း အတည်ပြုလိုက်ပါပြီ။ သို့ပေမယ့် application ကို _code-first_ နည်းဖြင့် လက်ရှိ ဖိုင်များနှင့် အလုပ်လုပ်ရန် အတွက် သင့် local development environment အတွက် လိုအပ်သော environment variable များကို ပြင်ဆင်ထားရမည် ဖြစ်သည်။ `azd` သည် ဤအလုပ်ကို လွယ်ကူစေသည်။

1. Azure Developer CLI သည် application deployments များအတွက် configuration settings များကို သိမ်းဆည်း၊ စီမံရန် [environment variables](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash) ကို အသုံးပြုသည်။

1. Environment variables များကို `.azure/<env-name>/.env` တွင် သိမ်းဆည်းထားသည် - ၎င်းသည် deployment အချိန်တွင် အသုံးပြုသည့် `env-name` ကို scope ပေးပြီး တူညီ repository တွင် မတူညီသော deployment target များအတွက် environment များကို ခွဲခြားထားနိုင်စေသည်။

1. Environment variables များကို `azd` command သည် ပြီးပြည့်စုံသော command တစ်ခု လုပ်ဆောင်ချိန်တိုင်း အလိုအလျောက် load လုပ်ပေးသည် (ဥပမာ၊ `azd up`)။ သတိပြုရန် ကိစ္စမှာ `azd` သည် _OS-level_ environment variables များကို အလိုအလျောက် ဖတ်မရဘဲ (ဥပမာ၊ shell တွင် set ထားသော) - ပို၍ သတ်မှတ်ရန် `azd set env` နှင့် `azd get env` ကို scripts များတွင် အသုံးပြုရန် ဖြစ်သည်။

အချို့ command များကို စမ်းကြည့်ရအောင် -

1. ဤ environment တွင် `azd` အတွက် သတ်မှတ်ထားသော environment variables များအားလုံးကို ရယူပါ။

      ```bash title="" linenums="0"
      azd env get-values
      ```
      
      သင်သည် အောက်ပါကဲ့သို့ ကြည့်မြင်ရမည်။

      ```bash title="" linenums="0"
      AZURE_AI_AGENT_DEPLOYMENT_NAME="gpt-4.1-mini"
      AZURE_AI_AGENT_NAME="agent-template-assistant"
      AZURE_AI_EMBED_DEPLOYMENT_NAME="text-embedding-3-small"
      AZURE_AI_EMBED_DIMENSIONS=100
      ...
      ```

1. တိကျသော value တစ်ခုကို ရယူပါ - ဥပမာ၊ `AZURE_AI_AGENT_MODEL_NAME` value ကို သတ်မှတ်ထားမထားကို ကြည့်လို့ရမည်

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      သင်သည် အောက်ပါကဲ့သို့ တွေ့မြင်ရမည် - အစပိုင်းတွင် သတ်မှတ်ထားခြင်း မရှိပါ။

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. `azd` အတွက် environment variable အသစ်တစ်ခုကို သတ်မှတ်ပါ။ ဤနေရာတွင် agent model name ကို အပ်ဒိတ်ပြုလုပ်မည်။ _မှတ်ချက်: ပြုလုပ်သည့် မည်သည့်ပြောင်းလဲမှုများမျှ မဆို `.azure/<env-name>/.env` ဖိုင်တွင် ချက်ချင်း ထင်ဟပ်သည်။_

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      ယခု၊ ဤ value သည် သတ်မှတ်ထားကြောင်း တွေ့ရမည်။

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. အချို့ resource များသည် persistent ဖြစ်ပြီး (ဥပမာ၊ model deployments) ပြန်လည်deploy လုပ်ရန် အတွက် `azd up` အတော်လောက်သာမက အပေါ်ပိုင်းလှိုင်းများများ လိုအပ်နိုင်သည်။ မူလ deployment ကို ဖျက်ပြီး env vars ကို ပြောင်းလဲပြီး ထပ်မံ deploy လုပ်ကြည့်ပါ။

1. **Refresh** သင် မတိုင်ခင် azd template ဖြင့် infrastructure ကို deploy ပြုလုပ်ခဲ့ပါက - သင်၏ local environment variables အခြေအနေကို သင့် Azure deployment ၏ လက်ရှိအခြေအနေ အပေါ် မူတည်၍ refresh ပြုလုပ်နိုင်ပါသည်။ ဤ command ကို အသုံးပြုပါ။

      ```bash title="" linenums="0"
      azd env refresh
      ```

      ဤသည် သည် ဒုတိယ သို့မဟုတ် ထိုထက်ပို၍ ရှိသော ဒေသခံ ဖွံ့ဖြိုးရေး ပတ်ဝန်းကျင်များ (ဥပမာ၊ ဖွံ့ဖြိုးရေးသူများ များသော အဖွဲ့) အကြား ပတ်ဝန်းကျင် ပြောင်းလဲနိုင်သည့် တန်ဖိုးများကို _ကိုက်ညီ_ ပြုလုပ်ရန် အင်အားကြီးသော နည်းလမ်းတစ်ခု ဖြစ်သည် - တင်ထားသော infrastructure ကို ပတ်ဝန်းကျင် တန်ဖိုးအခြေအနေ၏ အမှန်တရား အခြေခံအဖြစ် သတ်မှတ်ခွင့် ပေးသည်။ အဖွဲ့ဝင်များသည် variables များကို _ပြန်လည်မွမ်းမံ_ လုပ်ခြင်းဖြင့် ပြန်လည်ကိုက်ညီနိုင်သည်။

---

## 9. ဂုဏ်ယူပါတယ် 🏆

သင်သည် အစမှ အဆုံး အလုပ်စဉ်တစ်ခုကို ယခုပြီးမြောက်ခဲ့ပြီး အောက်ပါ အချက်များကို ပြုလုပ်ခဲ့သည်:

- [X] သင်အသုံးပြုလိုသော AZD Template ကို ရွေးချယ်ခဲ့သည်
- [X] ထောက်ခံထားသော ဖွံ့ဖြိုးရေး ပတ်ဝန်းကျင်တွင် template ကို ဖွင့်ခဲ့သည်
- [X] Template ကို တင်သွင်းပြီး အလုပ်လုပ်ကြောင်း သက်သေပြခဲ့သည်

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ပြောကြားချက်**
ဤစာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှန်ကန်မှုအတွက် ကြိုးပမ်းနေသော်လည်း၊ စက်ကိရိယာဘာသာပြန်ခြင်းများတွင် အမှားများ သို့မဟုတ် မှားယွင်းချက်များ ပါဝင်နိုင်ကြောင်း သတိပြုပါရန် လိုအပ်ပါသည်။ မူလစာတမ်းကို မူရင်းဘာသာဖြင့်သာ ယုံကြည်စိတ်ချရသော အချက်အလက်အဖြစ် သတ်မှတ်သင့်သည်။ အရေးကြီးသည့် သတင်းအချက်အလက်များအတွက် ပရော်ဖက်ရှင်နယ် လူသားဘာသာပြန်သူဝန်ဆောင်မှုကို အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော နားလည်မှုကွာခြားမှုများ သို့မဟုတ် မမှန်ကန်သော အသုံးပြုမှုများအတွက် ကျွန်ုပ်တို့ တာဝန်မခံပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->