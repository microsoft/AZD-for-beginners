# 2. Template ကို အတည်ပြုခြင်း

!!! tip "ဤ မော်ဂျူး၏ အဆုံးတွင် သင်အောက်ပါများကို ပြုနိုင်ပါလိမ့်မည်"

    - [ ] AI ဖြေရှင်းချက်၏ အဆောက်အအုံကို ခွဲခြမ်းစစ်ဆေးနိုင်နိုင်ခြင်း
    - [ ] AZD ဖြင့် တပ်ဆင်မှု လုပ်ငန်းစဉ်ကို နားလည်နိုင်ခြင်း
    - [ ] AZD အသုံးပြုမှုအတွက် အကူအညီရယူရန် GitHub Copilot ကို အသုံးပြုနိုင်ခြင်း
    - [ ] **Lab 2:** AI Agents template ကို တပ်ဆင်နှင့် အတည်ပြုနိုင်ခြင်း

---


## 1. နိဒါန်း

[Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) သို့မဟုတ် `azd` သည် ဖွင့်ရင်းမြစ် command-line ကိရိယာတစ်ခုဖြစ်ပြီး Azure သို့ အက်ပလီကေးရှင်းများကို ဆောက်လုပ်၍ တပ်ဆင်ရာတွင် developer ၏ workflow ကို စိတ်ချရလွယ်ကူစေရန် ကူညီပေးသည်။

[AZD Templates](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) များသည် နားလည်ရလွယ်ကူသော repository များဖြစ်ပြီး နမူနာ application ကုဒ်၊ _infrastructure-as-code_ အထောက်အကူများ နှင့် `azd` ဖိုင်များကို တစ်စုတည်းတွင် ပေါင်းစပ်ထည့်သွင်းထားသည်။ အထူးသဖြင့် အဖွဲ့အစည်းတစ်ခုအတွက် အငြိမ်းစားအောင် provision လုပ်ရန် `azd provision` ဆိုသည့် command တစ်ခုသာ လိုအပ်ပြီး `azd up` ကို အသုံးပြုလျှင် infrastructure ကို provision လုပ်ကာ application ကို တစ်ပြိုင်နက်တည်း deploy လုပ်နိုင်သည်။

တစ်နည်းအားဖြင့်၊ သင့် application နှင့် infrastructure လိုအပ်ချက်များနှင့် အနီးဆုံး သင့်တော်သည့် _AZD Starter template_ ကို ရှာဖွေကာ repository ကို သင့်အနေအထားအတိုင်း အပြင်ဆင်၍ စတင်ဖွံ့ဖြိုးမှုလုပ်ငန်းစဉ်ကို ရှေ့ဆက်နိုင်သည်။

စတင်မယ့်အခါ မည်သည့် AZD CLI မရှိနေရင် ထည့်သွင်းထားခြင်းကို အတည်ပြုလိုက်ရအောင်။

1. VS Code terminal ကို ဖွင့်၍ ဤ command ကို ရိုက်ထည့်ပါ:

      ```bash title="" linenums="0"
      azd version
      ```

1. ဤလိုပင် ပြသမည်!

      ```bash title="" linenums="0"
      azd version 1.19.0 (commit b3d68cea969b2bfbaa7b7fa289424428edb93e97)
      ```

**သင်သည် ယခု azd ဖြင့် template ကို ရွေးချယ်၍ တပ်ဆင်ဖို့ ပြင်ဆင်ပြီးဖြစ်ပါပြီ**

---

## 2. Template ရွေးချယ်ခြင်း

Microsoft Foundry ပလက်ဖောင်းတွင် _multi-agent workflow automation_ နှင့် _multi-modal content processing_ ကဲ့သို့ အများဆုံး အသုံးများသော ဖြေရှင်းချက် ဇုန်များကို ကာဖို့ [အကြံပြုထားသော AZD templates များ](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started) ပါဝင်သည်။ သင်သည် Microsoft Foundry ပေါ်တွင်လည်း ဒီ template များကို ရှာဖွေတွေ့ရှိနိုင်သည်။

1. [https://ai.azure.com/templates](https://ai.azure.com/templates) သို့ သွားရောက်ပါ
1. ဖော်ပြချက်အတိုင်း Microsoft Foundry portal သို့ လော့ဂ်အင်ရန် ဆက်သွယ်ပါ - ဤမျိုး ပြသမည်။

![ရွေးချယ်ရန်](../../../../../translated_images/my/01-pick-template.60d2d5fff5ebc374.webp)


**Basic** ရွေးချယ်စရာများသည် စတင်အသုံးပြုရန် template များဖြစ်သည်။

1. [ ] [Get Started with AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat) — သင့်ဒေတာနှင့်အတူ Azure Container Apps အပေါ် မူတည်၍ အခြေခံ chat application တစ်ခုကို deploy လုပ်ပေးသည်။ အခြေခံ AI chatbot အခြေအနေကို လေ့လာရန် အတွက် အသုံးပြုပါ။
1. [X] [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) — Foundry Agents ဖြင့် ပုံမှန် AI Agent တစ်ခုကို deploy လုပ်ပေးသည်။ ကိုယ့်အတွက် agent-based AI ဖြေရှင်းချက်များ (tools နှင့် models ကို အသုံးပြုသည့်) တွင် အကျင့်တရား သင်ယူရန် အသုံးဝင်သည်။

ဒုတိယ link ကို browser tab အသစ်တွင် ဖွင့်ပါ (သို့မဟုတ် ဆက်စပ် card အတွက် `Open in GitHub` ကို နှိပ်ပါ)။ သင်သည် ဤ AZD Template အတွက် repository ကို မြင်ရမည်။ README ကို တစ်မိနစ်ပေးပြီး စမ်းသပ် ကြည့်ပါ။ အက်ပလီကေးရှင်း၏ ဆောက်လုပ်ပုံသည် အောက်ပါအတိုင်း ဖြစ်သည်။

![ဆောက်လုပ်ပုံ](../../../../../translated_images/my/architecture.8cec470ec15c65c7.webp)

---

## 3. Template Activation

ဒီ template ကို deploy ပြီး အတည်ပြုကြည့်ကြပါမယ်။ [Getting Started](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started) အပိုင်းအတိုင်း လိုက်နာပါ။

1. ဤလင့်ခ်ကို နှိပ်ပါ: [this link](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) - default action ကို `Create codespace` အဖြစ် အတည်ပြုပါ
1. ဤသည် browser tab အသစ်ကို ဖွင့်လှစ်ပါ - GitHub Codespaces session ပြီးစီးရန် မစိုးရိမ်ပဲ စောင့်ပါ
1. Codespaces ထဲမှ VS Code terminal ကို ဖွင့်ပြီး အောက်ပါ command ကို ရိုက်ထည့်ပါ:

   ```bash title="" linenums="0"
   azd up
   ```

ဤကိရိယာသည် trigger သည့် workflow အဆင့်များကို ပြီးစီးပါ။

1. Azure သို့ လော့ဂ်အင်ရန် တောင်းဆိုမည် - အတည်ပြုပြီး authentication လုပ်ပါ
1. သင့်အတွက် unique environment name တစ်ခုရိုက်ထည့်ပါ - ဥပမာအနေနဲ့ ငါက `nitya-mshack-azd` ကို အသုံးပြုခဲ့တယ်
1. ဤအရာက `.azure/` ဖိုလ်ဒါကို ဖန်တီးပေးမည် - env name ဖြင့် subfolder တစ်ခုကို တွေ့ရမည်
1. subscription name တစ်ခု ရွေးချယ်ရန် တောင်းမည် - default ကို ရွေးပါ
1. location ကို တောင်းမည် - `East US 2` ကို အသုံးပြုပါ

ယခု သင်သည် provisioning ပြီးစီးသည်အထိ စောင့်ဆိုင်းရမည်။ **ဤသည် 10-15 မိနစ် လောက် ကြာနိုင်သည်**

1. ပြီးဆုံးသောအချိန်တွင် console မှာ ဤလို SUCCESS စာတန်းပြထားမည်။
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. သင်၏ Azure Portal တွင် ယင်း env name ဖြင့် provision လုပ်ထားသော resource group တစ်ခုရှိနေမည်။

      ![အင်ဖရာ](../../../../../translated_images/my/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **ယခု သင်သည် တပ်ဆင်ထားသော infrastructure နှင့် application ကို အတည်ပြုရန် ပြင်ဆင်ပြီးပါပြီ။**

---

## 4. Template အတည်ပြုခြင်း

1. Azure Portal ၏ [Resource Groups](https://portal.azure.com/#browse/resourcegroups) စာမျက်နှာသို့ သွားပါ - တောင်းဆိုပါက လော့ဂ်အင်ပါ
1. သင့် environment name အတွက် RG ကို နှိပ်ပါ - အထက်ပါ စာမျက်နှာကို မြင်ရမည်

      - Azure Container Apps resource ကို နှိပ်ပါ
      - _Essentials_ ဧကရာဇ်ပိုင်း (ထိပ်ညာ) တွင်ရှိသည့် Application Url ကို နှိပ်ပါ

1. ဤကဲ့သို့ ဟိုစ့်ထားသော application front-end UI ကို မြင်ရမည်။

   ![အက်ပလီကေးရှင်း](../../../../../translated_images/my/03-test-application.471910da12c3038e.webp)

1. [နမူနာ မေးခွန်းများ](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md) အနည်းငယ် မေးမြန်းကြည့်ပါ

      1. မေးပါ: ```ပြင်သစ်နိုင်ငံ၏ မြို့တော် ဘယ်မြို့လဲ?``` 
      1. မေးပါ: ```လူနှစ်ဦးအတွက် $200 အောက်ရှိ အကောင်းဆုံး တဲ ဘယ်ဟာလဲ၊ ၎င်းတွင် ဘယ်လို အင်္ဂါရပ်များ ပါဝင်သလဲ?```

1. အဓိကအားဖြင့် အောက်ပါအတိုင်းဖြေကြားချက်များ ရရှိရမည်။ _ဒါပေမယ့် ဤသည် မည်ကဲ့သို့ အလုပ်လုပ်သနည်း?_ 

      ![အက်ပလီကေးရှင်း](../../../../../translated_images/my/03-test-question.521c1e863cbaddb6.webp)

---

## 5.  Agent အတည်ပြုခြင်း

Azure Container App သည် ဒီ template အတွက် Microsoft Foundry project တွင် provision လုပ်ထားသော AI Agent နှင့် ချိတ်ဆက်ထားသည့် endpoint ကို deploy လုပ်ပေးသည်။ ၎င်း၏ အဓိပ္ပာယ်ကို ကြည့်ကြရအောင်။

1. သင့် resource group အတွက် Azure Portal _Overview_ စာမျက်နှာသို့ ပြန်သွားပါ

1. ဤစာရင်းထဲမှ `Microsoft Foundry` resource ကို နှိပ်ပါ

1. ဤအရာကို မျက်နှာပြင်ပေါ် တွေ့ရမည်။ `Go to Microsoft Foundry Portal` ခလုတ်ကို နှိပ်ပါ။
   ![Foundry](../../../../../translated_images/my/04-view-foundry-project.fb94ca41803f28f3.webp)

1. သင့် AI application အတွက် Foundry Project စာမျက်နှာကို ကြည့်ရမည်
   ![Project](../../../../../translated_images/my/05-visit-foundry-portal.d734e98135892d7e.webp)

1. `Agents` ကို နှိပ်ပါ - သင့် project တွင် default Agent တစ်ခုကို provision လုပ်ထားသည်ကို တွေ့ရမည်
   ![Agents](../../../../../translated_images/my/06-visit-agents.bccb263f77b00a09.webp)

1. ရွေးချယ်ပါ - Agent အသေးစိတ်များကို မြင်ရမည်။ အောက်ပါအချက်များကို မှတ်သားပါ။

      - အဆိုပါ agent သည် အမြဲ File Search ကို အဓိကအသုံးပြုထားသည် (မပြောင်းလဲနိုင်သော ပုံမှန်)
      - agent ၏ `Knowledge` တွင် ဖိုင် 32 ဖိုင် တင်ထားသည်ဟု ပြထားသည် (file search အတွက်)
      ![Agents](../../../../../translated_images/my/07-view-agent-details.0e049f37f61eae62.webp)

1. ဘယ်ဖက်မီနူးတွင် `Data+indexes` ရှိသည်ကို ရှာဖွေပြီး အသေးစိတ်အချက်အလက်အတွက် နှိပ်ကြည့်ပါ။ 

      - မိမိသည် knowledge အတွက် တင်ထားသော 32 ဖိုင်ကို တွေ့ရမည်။
      - ၎င်းများသည် `src/files` အောက်ရှိ customer ဖိုင် 12 ခုနှင့် product ဖိုင် 20 ခုနှင့် ကိုက်ညီမည်။
      ![Data](../../../../../translated_images/my/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**သင့်သည် Agent လည်ပတ်မှုကို အတည်ပြုပြီးပါပြီ!**

1. Agent ၏ ဖြေကြားချက်များသည် ထိုဖိုင်များ၏ မူပိုင် သိမွတ်မှုအပေါ် မူတည်ကာ အခြေခံထားသည်။
1. သင်သည် ယင်း ဒေတာနှင့် ဆက်စပ်သည့် မေးခွန်းများကို မေးမြန်းကာ အခြေခံ ဖြေကြားချက်များ ရယူနိုင်သည်။
1. ဥပမာ - `customer_info_10.json` သည် "Amanda Perez" မှ 3 ကြိမ် ဝယ်ယူခဲ့သော အချက်အလက်များအား ဖော်ပြထားသည်။

Container App endpoint သာမန် browser tab သို့ ပြန်သွားကာ မေးပါ: `Amanda Perez သည် ဘာတွေ ဝယ်ထားသလဲ?`။ ဤကဲ့သို့ တိုက်ရိုက် ပြထားမည်။

![ဒေတာ](../../../../../translated_images/my/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. Agent Playground

Microsoft Foundry ၏ စွမ်းရည်များကို နားလည်ရန် Agent ကို Agents Playground ထဲတွင် လွှမ်းမိုးကြည့်ကြပါစို့။

1. Microsoft Foundry ၏ `Agents` စာမျက်နှာသို့ ပြန်သွားပါ - default agent ကို ရွေးချယ်ပါ
1. `Try in Playground` ရွေးချယ်မှုကို နှိပ်ပါ - ထိုအခါ Playground UI တစ်ခုကို မြင်ရမည်
1. အစဥ်မပြောင်းပဲ အဲဒီမေးခွန်းကို မေးပါ: `Amanda Perez သည် ဘာတွေ ဝယ်ထားသလဲ?`

    ![ဒေတာ](../../../../../translated_images/my/09-ask-in-playground.a1b93794f78fa676.webp)

တူညီ (သို့မဟုတ် ဆင်တူ) ဖြေကြားချက်ကို ရရှိမည် - သို့သော် agentic app ၏ အရည်အသွေး၊ ကုန်ကျစရိတ်နှင့် ဖျော်ဖြေမှုကို နားလည်ရန် အသုံးတည့်သော အချက်အလက်များကိုလည်း ရရှိနိုင်သည်။ ဥပမာအားဖြင့် -

1. ဖြေကြားချက်သည် ဖြေကြားမှုကို အခြေခံစေသော data ဖိုင်များကို ရည်ညွှန်းထားသည်ကို သတိပြုပါ
1. ဖိုင် များအား ယင်းတန်းတူ label များဆီ သွား၍ သင်၏ မေးခွန်းနှင့် ပြသထားသော ဖြေကြားချက်နှင့် ကိုက်ညီမှု ရှိမရှိ ကြည့်ပါ

သင်သည် ဖြေကြားချက်အောက်တွင် _stats_ စာတန်းတစ်ကြောင်းကိုလည်း မြင်ရမည်။

1. မည်သည့် မက်ထရစ်ကို မဆို hover လုပ်၍ ကြည့်ပါ - ဥပမာ Safety ကို hover လုပ်ပါ။ ဤကဲ့သို့ ပြသမည်။
1. သတ်မှတ်ထားသည့် အဆင့်သတ်မှတ်ချက်သည် သင်၏ စိတ်ထင်မြင်ချက်နှင့် ကိုက်ညီသည်မဟုတ်သလား စစ်ဆေးပါ။

      ![ဒေတာ](../../../../../translated_images/my/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. Built-in Observability

Observability သည် သင့် application ကို data ထုတ်ပေးရန် instrumentation ပြုလုပ်ခြင်းအား ဆိုလိုသည်။ ၎င်း data ကို အသုံးပြု၍ ဆန်းစစ်၊ ပြုပြင်၊ မြှင့်တင်နိုင်သည်။ သက်ဆိုင်ရာ ကိုယ်စားလှယ်များကို ကြည့်ဖို့ -

1. `View Run Info` ခလုတ်ကို နှိပ်ပါ - ဤမူပိုင်ရှင်းကို မြင်ရမည်။ ၎င်းသည် [Agent tracing](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) ၏ လက်တွေ့ ဥပမာ ဖြစ်သည်။ _ဤမြင်ကွင်းကို top-level menu တြင် Thread Logs ကို နှိပ်၍လည်း ရနိုင်သည်_။

   - run အဆင့်များနှင့် agent အသုံးပြုသော tools များကို နားလည်ပါ
   - ဖြေကြားချက်အတွက် စုစုပေါင်း Token အရေအတွက် (နှင့် output tokens အသုံးများ) ကို နားလည်ပါ
   - latency နှင့် ဆောင်ရွက်မှုတွင် အချိန်ဘယ်နေရာတွင်ကုန်ဆုံးနေသည်ကို နားလည်ပါ

      ![Agent](../../../../../translated_images/my/10-view-run-info.b20ebd75fef6a1cc.webp)

1. `Metadata` tab ကို နှိပ်၍ run အတွက် အပိုဆောင်း attribute များကို ကြည့်ပါ၊ ၎င်းများသည် နောက်ပိုင်း bug တွေရှာဖွေရန် အတွက် အသုံး၀င်နိုင်သည်။   

      ![Agent](../../../../../translated_images/my/11-view-run-info-metadata.7966986122c7c2df.webp)


1. `Evaluations` tab ကို နှိပ်၍ agent ၏ ဖြေကြားချက်ပေါ် အလိုအလျောက် အကဲဖြတ်ချက်များကို ကြည့်ပါ။ ၎င်းတို့တွင် safety အကဲဖြတ်ချက်များ (ဥပမာ Self-harm) နှင့် agent ပတ်သတ် သတ်မှတ်ချက် အကဲဖြတ်ချက်များ (ဥပမာ Intent resolution, Task adherence) တို့ ပါဝင်သည်။

      ![Agent](../../../../../translated_images/my/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. နောက်ဆုံးတွင် sidebar menu တွင် `Monitoring` tab ကို နှိပ်ပါ။

      - ပြသထားသော စာမျက်နှာ၌ `Resource usage` tab ကို ရွေး၍ metrics များကို ကြည့်ပါ
      - token များနှင့် request များ အရ application အသုံးပြုမှုကို ကုန်ကျစရိတ်အရ လိုက်လံ ရှာဖွေပါ
      - input processing (first byte) နှင့် output (last byte) အထိ application latency ကို လေ့လာပါ

      ![Agent](../../../../../translated_images/my/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. ပတ်ဝန်းကျင် အပြောင်းအလဲများ (Environment Variables)

ယခုထိ၊ ကျွန်ုပ်တို့သည် browser အတွင်း deployment ကို လိုက်လံပြီး infrastructure သက်ဆိုင်ရာများသေချာစွာ provision ဖြစ်ပြီး application လည်ပတ်နေကြောင်း အတည်ပြုပြီးပါပြီ။ သို့သော် ကိုဒ်အခြေပြု အလုပ်လုပ်ရန် (code-first) သင့်ရဲ့ local development ပတ်ဝန်းကျင်ကို ထို resource များနှင့် အလုပ်လုပ်ရန် လိုအပ်သော သတ်မှတ်ချက်များဖြင့် ပြင်ဆင်ရန် လိုအပ်မည်။ `azd` သည် ဤကိစ္စကို လွယ်ကူစေသည်။

1. Azure Developer CLI သည် application deployments များအတွက် configuration သတ်မှတ်ချက်များကို သိမ်းဆည်းစောင့်ရှောက်ရန် [ပတ်ဝန်းကျင် အပြောင်းအလဲများကို အသုံးပြုသည်](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash)။

1. ပတ်ဝန်းကျင် အပြောင်းအလဲများကို `.azure/<env-name>/.env` တွင် သိမ်းဆည်းထားသည် - ၎င်းသည် deployment အတွက် အသုံးပြုထားသည့် `env-name` ကို scope ဖွဲ့ပေးသဖြင့် တူညီ repository တွင် မတူညီသော deployment target များအကြား ပတ်ဝန်းကျင်များကို သီးခြားထားနိုင်သည်။

1. `azd` command မည်သည့် specific command ကိုလည်း သုံးတဲ့အခါ အချိန်တိုင်း အလိုအလျောက် ပတ်ဝန်းကျင် အပြောင်းအလဲများကို load လုပ်ပေးသည် (ဥပမာ `azd up`)။ သို့သော် `azd` သည် OS-level environment variables (ဥပမာ shell တွင် set ထားသော) ကို အလိုအလျောက် မဖတ်ပါ - အစား `azd set env` နှင့် `azd get env` ကို အသုံးပြု၍ script များအတွင်း အချက်အလက်များကို လွှဲပြောင်းပါ။

ချို့တဲ့သော် အချို့ command များကို စမ်းကြည့်ပါ။

1. ဤ environment အတွက် `azd` အတွက် သတ်မှတ်ထားသော ပတ်ဝန်းကျင် အပြောင်းအလဲများအားလုံးကို ရယူပါ:

      ```bash title="" linenums="0"
      azd env get-values
      ```
      
      သင်သည် ဤလို ပြထားသည်ကို မြင်ရမည်။

      ```bash title="" linenums="0"
      AZURE_AI_AGENT_DEPLOYMENT_NAME="gpt-4o-mini"
      AZURE_AI_AGENT_NAME="agent-template-assistant"
      AZURE_AI_EMBED_DEPLOYMENT_NAME="text-embedding-3-small"
      AZURE_AI_EMBED_DIMENSIONS=100
      ...
      ```

1. တစ်ခုချင်း စတန်တန်ဖို့ - ဥပမာ အကယ်၍ `AZURE_AI_AGENT_MODEL_NAME` အတန်ဖိုးကို ထည့်ထားသလား သိချင်ပါက

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      ဤလိုမျိုး ပြသမည် - ဒါကို default အနေဖြင့် မသတ်မှတ်ထားသေးပါ။

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. `azd` အတွက် ပတ်ဝန်းကျင်အပြောင်းအလဲအသစ် တန်ဖိုးကို သတ်မှတ်ပါ။ ဤနေရာတွင်၊ agent model name ကို အပ်ဒိတ်လုပ်သည်။ _မှတ်ချက်: ပြုလုပ်သည့် ဘယ်အပြောင်းအလဲမျိုးမဆို `.azure/<env-name>/.env` ဖိုင်ထဲတွင် အရှိန်အဟုန်ဖြင့် အသက်ဝင်ပါမည်။_

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      ယခုမှာ အဲဒီတန်ဖိုး သတ်မှတ်ထားသည်ကို တွေ့ရမည်။

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. မှတ်ချက် အချို့သော resources များသည် အမြဲတမ်း ရှိနေပြီး (ဥပမာ model deployments) ထပ်မံ deploy ပြန်ရန်အတွက် `azd up` ထက် ပိုမိုလုပ်ဆောင်ရမည်ဖြစ်သည်။ အစပိုင်း deployment ကို ဖျက်ပြီး ပြန်တပ်ဆင်ရန် ကြိုးစားကြည့်မယ်။

1. **Refresh** အကယ်၍ သင် အရင်က azd template အသုံးပြု၍ infrastructure တပ်ဆင်ထားပြီးသားဖြစ်လျှင် - သင်၏ local ပတ်ဝန်းကျင် အပြောင်းအလဲအစီအစဉ်များကို သင့် Azure deployment ၏ လက်ရှိအခြေအနေအလျောက် refresh လုပ်နိုင်သည်၊ ဤ command ကို အသုံးပြုပါ။

      ```bash title="" linenums="0"
      azd env refresh
      ```

      ဤသည်မှာ ဒေသဆိုင်ရာ ဖွံ့ဖြိုးရေး ပတ်ဝန်းကျင်နည်းပညာနှစ်ခု သို့မဟုတ် ထို့ထက်မႊားသော ပတ်ဝန်းကျင်များအကြား environment variables များကို _ကိုက်ညီ_ စေဖို့ အလွန်အစွမ်းထက်တဲ့ နည်းလမ်းတစ်ခုဖြစ်သည် (ဥပမာ၊ ဖန်တီးသူများ အများအပြားပါဝင်သော အဖွဲ့) — တပ်ဆင်ထားသော အလုပ်အမှုဆောင်ဖွဲ့စည်းမှုကို env variable အခြေအနေအတွက် အမှန်တရားအဖြစ် အသုံးပြုခွင့်ပေးသည်။ အဖွဲ့ဝင်များသည် variables များကို _ပြန်လည်အသစ်လုပ်_ သာဖြင့် ထပ်မံ ကိုက်ညီလာစေကြသည်။

---

## 9. ဂုဏ်ယူပါတယ် 🏆

You just completed an end-to-end workflow where you:

- [X] သင် အသုံးချလိုသော AZD Template ကို ရွေးချယ်ထားပြီးဖြစ်သည်
- [X] GitHub Codespaces နှင့်အတူ Template ကို စတင်စေတင်ခဲ့သည်
- [X] Template ကို တပ်ဆင်ပြီး အလုပ်လုပ်နိုင်ကြောင်း အတည်ပြုခဲ့သည်

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
အသိပေးချက်:
ဤစာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ဖြင့် ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့ သေချာမှုအပေါ် ကြိုးပမ်းသော်လည်း အလိုအလျောက် ဘာသာပြန်ချက်များတွင် အမှားများ သို့မဟုတ် တိကျမှုမရှိနိုင်သည့် အချက်များ ရှိနိုင်သည်ကို ကျေးဇူးပြု၍ သတိထားပါ။ မူလဘာသာဖြင့် ရေးသားထားသော မူရင်းစာတမ်းကို အာဏာပိုင် ရင်းမြစ်အဖြစ် ယူဆသင့်သည်။ အရေးကြီးသော အချက်အလက်များအတွက် လူကင်းမဲ့မည့် မဟုတ်သော်လည်း ကျွမ်းကျင်သော လူဘာသာပြန်တစ်ဦးက ပြုသင့်သည်ကို ညွှန်ကြားအကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုခြင်းကြောင့် ဖြစ်ပေါ်လာနိုင်သော နားမလည်မှုများ သို့မဟုတ် အဓိပ္ပာယ် မှားဖတ်ရှုမှုများအတွက် ကျွန်ုပ်တို့ တာဝန် မယူပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->