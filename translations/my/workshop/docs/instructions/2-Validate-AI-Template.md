# 2. တမ်းပလိတ် အတည်ပြုခြင်း

> March 2026 တွင် `azd 1.23.12` ဖြင့် အတည်ပြုထားသည်။

!!! tip "ဒီမော်ဒုလ် အဆုံးတွငျ သငျ အောက်ပါအရာများကို လုပ်ဆောင်နိုင်ပါမည်"

    - [ ] AI ဖြေရှင်းချက်၏ ဖွဲ့စည်းပုံကို ခွဲခြမ်းစိတ်ဖြာနိုင်ရန်
    - [ ] AZD ပို့ဆောင်မှု အလုပ်စဉ်ကို နားလည်နိုင်ရန်
    - [ ] AZD အသုံးပြုမှုအတွက် အကူအညီ ရယူရန် GitHub Copilot ကို အသုံးပြုနိုင်ရန်
    - [ ] **Lab 2:** AI Agents တမ်းပလိတ်ကို တပ်ဆင်၍ အတည်ပြုခြင်း

---


## 1. အချက်ပေးချက်

The [Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) သို့မဟုတ် `azd` သည် ဖွင့်ဆိုဒ် command-line ကိရိယာတစ်ခု ဖြစ်ပြီး Azure သို့ application များကို တည်ဆောက်ခြင်းနှင့် တပ်ဆင်ခြင်းအတွင်း developer အလုပ်စဉ်ကို ပိုမိုကောင်းမွန်စေရန် အလွယ်တကူ စီမံခန့်ခွဲပေးသည်။

[AZD Templates](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) သည် ဥပမာ application ကုဒ်၊ _infrastructure-as-code_ အချက်အလက်များနှင့် `azd` ဖိုင်များ ပါဝင်သော စံချိန်တန်းထားသော repository များဖြစ်ပြီး တစ်စုံတစ်ရာဖြေရှင်းချက်တစ်ခုအဖြစ် တက်ရောက်စေသည်။ အခြေခံအဆောက်အုံကို provisioning လုပ်ရန် `azd provision` အမိန့်တစ်ခုလောက်သာ လိုအပ်ပြီး `azd up` ဖြင့် infrastructure ကို provision လုပ်ပြီး application ကို တစ်ပြိုင်နက်တည်း deploy လုပ်နိုင်သည်!

ထို့ကြောင့် သင့် application ဖွံ့ဖြိုးရေးကို စတင်နိုင်ရန်အတွက် သင့်လိုအပ်ချက်နှင့် အသင့်ဆုံးလျှောက်လှမ်းသော _AZD Starter template_ ကို ရှာဖွေပြီး repository ကို သင့်ရည်ရွယ်ချက်အတိုင်း အရာများကို အလွယ်တကူ အပြင်ဆင်နိုင်သည်။

 စတင်ရန်မတိုင်မီ Azure Developer CLI ကို တပ်ဆင်ထားကြောင်း သေချာစေပါ။

1. VS Code terminal ကိုဖွင့်၍ အောက်ပါအမိန့်ထည့်ပါ။

      ```bash title="" linenums="0"
      azd version
      ```

1. အောက်ပါကဲ့သို့ ရလာမည်။

      ```bash title="" linenums="0"
      azd version 1.23.12 (commit <current-build>)
      ```

**အခု သင် azd ဖြင့် တမ်းပလိတ်ကိုရွေးချယ်၍ တပ်ဆင်ရန် အဆင်သင့်ဖြစ်ပါပြီ**

---

## 2. တမ်းပလိတ် ရွေးချယ်ခြင်း

Microsoft Foundry ပလက်ဖောင်းတွင် [recommended AZD templates များ](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started) ရှိပြီး ၎င်းတို့သည် _multi-agent workflow automation_ နှင့် _multi-modal content processing_ အစရှိသည့် လူကြိုက်များသော ဖြေရှင်းချက်များအား ဖုံးလွှမ်းထားသည်။ သင်သည် Microsoft Foundry ပေါ်တွင်လည်း ဤတမ်းပလိတ်များကို ရှာဖွေနိုင်သည်။

1. [https://ai.azure.com/templates](https://ai.azure.com/templates) သို့ သွားပါ
1. ကၽြနု်ပ်တို့ မှာ prompt ထွက်လာသောအခါ Microsoft Foundry ပေါ်သို့ ဝင်ရန် လော့ဂ်အင် လုပ်ပါ - အောက်ပါကဲ့သို့ အဖြစ်မြင်ရမည်။

![ရွေးချယ်မည်](../../../../../translated_images/my/01-pick-template.60d2d5fff5ebc374.webp)


**Basic** ရွေးချယ်ခွင့်များသည် သင့်စတาร์တာ တမ်းပလိတ်များဖြစ်သည်။

1. [ ] [Get Started with AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat) — သင်၏ဒေတာနှင့်အတူ Azure Container Apps သို့ အခြေခံ chat application ကို တပ်ဆင်သည်။ အခြေခံ AI chatbot အခြေအနေကို လေ့လာရန် အသုံးပြုပါ။
1. [X] [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) — Foundry Agents ပါသော စံချိန် Agent ကို တပ်ဆင်ပေးသည်။ tools နှင့် models ပါဝင်သော agentic AI ဖြေရှင်းချက်များနှင့် မိတ်ဆက်ရန် ဤကို အသုံးပြုပါ။

ဒုတိယ link ကို browser tab အသစ်တွင် ဖွင့်ပါ (သို့မဟုတ် related card အတွက် `Open in GitHub` ကိုနှိပ်ပါ)။ သင်သည် ဤ AZD Template အတွက် repository ကို မြင်ရမည်။ README ကို စစ်ဆေးရန် အချိန်ယူပါ။ application ဖွဲ့စည်းပုံမှာ အောက်ပါအတိုင်း ဖြစ်သည်။

![ဖွဲ့စည်းမှုပုံ](../../../../../translated_images/my/architecture.8cec470ec15c65c7.webp)

---

## 3. တမ်းပလိတ် အလုပ်ဖြင့် ဖွင့်ခြင်း

ဤတမ်းပလိတ်ကို တပ်ဆင်၍ မှန်ကန်ကြောင်း အတည်ပြုကြည့်ပါမည်။ [Getting Started](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started) အပိုင်းတွင် ဖော်ပြထားသည့် လမ်းညွှန်ချက်များကို လိုက်နာပါ။

1. တမ်းပလိတ် repository အတွက် သင့်အလုပ်လုပ်ရန် ပတ်ဝန်းကျင်ကို ရွေးချယ်ပါ။

      - **GitHub Codespaces**: ဤ link ကို နှိပ်ပါ [https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents] နှင့် `Create codespace` ကို အတည်ပြုပါ
      - **Local clone သို့မဟုတ် dev container**: `Azure-Samples/get-started-with-ai-agents` ကို clone ပြီး VS Code တွင် သွားဖွင့်ပါ

1. VS Code terminal ပြင်ဆင်ပြီး အောက်ပါ အမိန့် ထည့်ပါ။

   ```bash title="" linenums="0"
   azd up
   ```

ဤအတွက် trigger ဖြစ်စေမည့် workflow အဆင့်များကို ပြီးမြောက်ပါ။

1. Azure သို့ လော့ဂ်အင် ရမည့်အချိန်မှာ prompt ပေါ်လာမည် - အချက်အလက်များအတိုင်း authentication ကို လုပ်ပါ
1. သင့်အတွက် unique environment name တစ်ခု ထည့်ပါ - ဥပမာ၊ ကျွန်ုပ်က `nitya-mshack-azd` ကို အသုံးပြုခဲ့သည်
1. ဒါက `.azure/` ဖိုလ်ဒါတစ်ခု ထူထောင်ပေးမည် - သင့် env name ဖြင့် subfolder တစ်ခုကို တွေ့ရမည်
1. subscription name တစ်ခု ရွေးရန် prompt ပေါ်မည် - default ကို ရွေးပါ
1. location မေးလျှင် `East US 2` ကို အသုံးပြုပါ

အခု သင့်အား provisioning ပြီးဆုံးရန် စောင့်ဆိုင်းရမည်။ **ဤသည် 10-15 မိနစ် ခန့် ယူပါမည်**

1. ပြီးဆုံးသွားပါက console တွင် အောက်ပါအတိုင်း SUCCESS message တစ်ခု မြင်ရမည်။
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. သင့် Azure Portal တွင် အဆိုပါ env name ဖြင့် provision ပြီးသော resource group တစ်ခု ရှိနေမည်။

      ![Provisioned Infra](../../../../../translated_images/my/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **ယခု သင် deployed ဖြစ်သော infrastructure နှင့် application ကို အတည်ပြုရန် အဆင်သင့်ရှိပါပြီ။**

---

## 4. တမ်းပလိတ် အတည်ပြုမှု

1. Azure Portal ရှိ [Resource Groups](https://portal.azure.com/#browse/resourcegroups) စာမျက်နှာသို့ သွားပါ - prompt တွေ့လျှင် လော့ဂ်အင် ဝင်ပါ
1. သင့် environment name အတွက် RG ကို နှိပ်ပါ - အထက်ပါစာမျက်နှာကို မြင်ရမည်

      - Azure Container Apps resource ကို နှိပ်ပါ
      - _Essentials_ အပိုင်း (အပေါ်ညာ) တွင်ရှိသည့် Application Url ကို နှိပ်ပါ

1. အောက်ပါကဲ့သို့ hosted application front-end UI တစ်ခုကို မြင်ရမည်။

   ![အပ်ပလီကေးရှင်း](../../../../../translated_images/my/03-test-application.471910da12c3038e.webp)

1. [ဥပမာမေးခွန်း몇몇](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md) မေး၍ ကြည့်ပါ

      1. မေးပါ: ```What is the capital of France?``` 
      1. မေးပါ: ```What's the best tent under $200 for two people, and what features does it include?```

1. အောက်တွင် ပြသထားသည့် အဖြေများနှင့် ဆင်တူသော အဖြေများ ရရှိမည်။ _ဒါပေမယ့် ၎င်းသည် ယင်းလိုဖြစ်ပုံကို ဘယ်လိုလုပ်ဆောင်သနည်း?_ 

      ![မေးခွန်းစမ်းသပ်မှု](../../../../../translated_images/my/03-test-question.521c1e863cbaddb6.webp)

---

## 5. Agent အတည်ပြုခြင်း

Azure Container App သည် ဤ template အတွက် Microsoft Foundry project တွင် provision ထားသော AI Agent နှင့် ချိတ်ဆက်သည့် endpoint တစ်ခုကို တပ်ဆင်ပေးသည်။ ၎င်းသည် ဘာကို ဆိုလိုသည်နည်းဆိုတာ ကြည့်ကြရအောင်။

1. သင့် resource group အတွက် Azure Portal _Overview_ စာမျက်နှာသို့ ပြန်သွားပါ

1. အဆိုပါစာရင်းတွင် `Microsoft Foundry` resource ကို နှိပ်ပါ

1. အောက်ပါကို မြင်ရမည်။ `Go to Microsoft Foundry Portal` ခလုတ်ကို နှိပ်ပါ။
   ![Foundry မြှင့်](../../../../../translated_images/my/04-view-foundry-project.fb94ca41803f28f3.webp)

1. သင့် AI application အတွက် Foundry Project စာမျက်နှာကို မြင်ရမည်
   ![Project စာမျက်နှာ](../../../../../translated_images/my/05-visit-foundry-portal.d734e98135892d7e.webp)

1. `Agents` ကို နှိပ်ပါ - သင့် project တွင် provision လုပ်ထားသော default Agent ကို မြင်ရမည်
   ![Agents စာမျက်နှာ](../../../../../translated_images/my/06-visit-agents.bccb263f77b00a09.webp)

1. ၎င်းကို ရွေးချယ်ပါ - Agent အသေးစိတ် ကို မြင်ရမည်။ အောက်ပါအချက်များကို သတိထားပါ။

      - Agent သည် မည်သည့်အခါမျှ File Search ကို default အဖြစ် အသုံးပြုသည်
      - Agent ရဲ့ `Knowledge` တွင် ဖိုင် 32 ဖိုင် တင်ထားသည်ဟု ပြသည် (file search အတွက်)
      ![Agent အသေးစိတ်](../../../../../translated_images/my/07-view-agent-details.0e049f37f61eae62.webp)

1. ဘေး menu တွင် `Data+indexes` ရွေးချယ်မှုကို ရှာပြီး အသေးစိတ် ကြည့်ပါ။

      - သိမ်းဆည်းထားသော ဗဟုသုတအတွက် ဖိုင် 32 ဖိုင် upload ပြုလုပ်ထားကို တွေ့ရမည်။
      - ၎င်းများမှာ `src/files` အောက်ရှိ customer ဖိုင် 12 ဖိုင် နှင့် product ဖိုင် 20 ဖိုင်နှင့် ကိုက်ညီမည်။
      ![ဒေတာနှင့် အင်ဒက်စ်များ](../../../../../translated_images/my/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**သင် Agent အလုပ်လုပ်မှုကို အတည်ပြုခဲ့ပါပြီ!**

1. Agent ရဲ့ တုံ့ပြန်မှုများသည် ၎င်းဖိုင်များထဲရှိ ဗဟုသုတအပေါ် အခြေခံထားသည်။
1. ယခု သင်သည် အဆိုပါ ဒေတာနှင့် သက်ဆိုင်သော မေးခွန်းများ မေး၍ အခြေခံထားသော အဖြေများ ရယူနိုင်သည်။
1. ဥပမာ - `customer_info_10.json` သည် "Amanda Perez" က ဝယ်ယူထားသည့် ပစ္စည်း 3 ခုကို ဖော်ပြသည်။

Container App endpoint ပါရှိသော browser tab သို့ ပြန်သွားကာ မေးပါ: `What products does Amanda Perez own?`။ အောက်ပါကဲ့သို့ မြင်ရမည်။

![ဒေတာခေါ်ဆိုမှု](../../../../../translated_images/my/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. Agent Playground

Microsoft Foundry ၏ အင်္ဂါရပ်များကို နက်နဲစွာ သိရှိရန်အတွက် Agent ကို Agents Playground တွင်စမ်းကြည့်ရအောင်။

1. Microsoft Foundry ထဲက `Agents` စာမျက်နှာသို့ ပြန်သွားပြီး default agent ကို ရွေးချယ်ပါ
1. `Try in Playground` ရွေးချယ်မှုကို နှိပ်ပါ - Playground UI တစ်ခုကို မြင်ရမည်
1. ထပ်မံ မေးပါ: `What products does Amanda Perez own?`

    ![Playground တွင် မေးခွန်း](../../../../../translated_images/my/09-ask-in-playground.a1b93794f78fa676.webp)

တူညီသော (သို့) ဆင်တူသော တုံ့ပြန်မှုကို ရရှိမည် - ဒါပေမယ့် agentic app ၏ တရားဝင်ခြေစုံ၊ ကုန်ကျစရိတ်နှင့် အလုပ်ဆောင်ရည်ဆိုင်ရာ ထပ်ထည့်သတင်းအချက်အလက်များကိုလည်း ကြည့်ရှုနိုင်သည်။ ဥပမာ -

1. တုံ့ပြန်ချက်သည် တုံ့ပြန်မှုကို "ground" ပြုရန် အသုံးပြုသော data ဖိုင်များကို ရေးပေးသည်။
1. ဖိုင် label မည်သို့ဖြစ်သည်ကို hover ပြီး စစ်ဆေးပါ - ဒေတာသည် သင့်မေးခွန်းနှင့် ပြသထားသော တုံ့ပြန်မှုနှင့် ကိုက်ညီပါသလား?

တုံ့ပြန်ချက်အောက်တွင် _stats_ ဇယားတန်းကိုလည်း မြင်ရမည်။

1. မည်သည့်မျက်နှာပြင် metric ကိုမဆို hover ပြီး ကြည့်ပါ - ဥပမာ Safety ။ အကဲဖြတ်ထားသော အဆင့်သည် သင့်အထင်အမြင်နှင့် ကိုက်ညီပါသလား?

      ![Run info မီတာ](../../../../../translated_images/my/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. အင်္ဂါရပ်အတွင်း ကြည့်ရှုနိုင်မှု (Built-in Observability)

Observability သည် သင်၏ application ကို သိရှိနိုင်ရန်၊ debug ပြုရန်နှင့် အကောင်းဆုံးထိန်းသိမ်းရန် အသုံးပြုနိုင်သော ဒေတာများ ဖန်တီးပေးရန် အက်ပ်ကို instrument လုပ်ခြင်းအကြောင်းဖြစ်သည်။ ၎င်းကို ရှုမြင်ရန်အတွက် -

1. `View Run Info` ခလုတ်ကို နှိပ်ပါ - ဤမြင်ကွင်းကို ကြည့်လို့ရမည်။ ဤသည်မှာ [Agent tracing](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) ၏ တစ်စိတ်တစ်ပိုင်းဖြစ်ပြီး အလက်စီတက်လ်တစ်ခုဖြစ်သည်။ _သင်သည် Thread Logs ကို ထိပ်ပိုင်း မီနူးတွင် နှိပ်လျှင်လည်း ဤမြင်ကွင်းကို ရနိုင်သည်_။

   - run အဆင့်များနှင့် agent က လုပ်ဆောင်သည့် tools များကို သဘောပေါက်စေပါ
   - တုံ့ပြန်မှုအတွက် စုစုပေါင်း Token အရေအတွက် (နှင့် output tokens အကြောင်း) ကို နားလည်ပါ
   - execution အတွင်း latency နှင့် အချိန် မည်သို့ ဖြု့စီးထားသည်ကို နားလည်ပါ

      ![Agent run info](../../../../../translated_images/my/10-view-run-info.b20ebd75fef6a1cc.webp)

1. `Metadata` tab ကို နှိပ်၍ run အတွက် နောက်ထပ် attribute များကို ကြည့်ပါ။ ၎င်းများသည် အရေးကြီး debugging context များ ပံ့ပိုးနိုင်သည်။

      ![Agent metadata](../../../../../translated_images/my/11-view-run-info-metadata.7966986122c7c2df.webp)


1. `Evaluations` tab ကို နှိပ်၍ agent တုံ့ပြန်မှုအပေါ် auto-assessments များကို ကြည့်ပါ။ ၎င်းတို့တွင် safety အကဲဖြတ်ချက်များ (ဥပမာ Self-harm) နှင့် agent specific အကဲဖြတ်ချက်များ (ဥပမာ Intent resolution, Task adherence) ပါဝင်သည်။

      ![Agent evaluations](../../../../../translated_images/my/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. အဆုံးတွင် sidebar menu ထဲမှ `Monitoring` tab ကို နှိပ်ပါ။

      - ပြသထားသည့် စာမျက်နှာတွင် `Resource usage` တပ်ကို ရွေးပါ - metrics များကို ကြည့်ပါ။
      - tokens အရေအတွက်နှင့် request များအပေါ်အခြေခံ၍ application အသုံးပြုမှုနှင့် ကုန်ကျစရိတ်များကို လိုက်နာစောင့်ကြည့်ပါ။
      - input processing (first byte) နှင့် output (last byte) အထိ application latency ကို ကြည့်ပါ။

      ![Monitoring resources](../../../../../translated_images/my/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. ပတ်ဝန်းကျင် များ (Environment Variables)

ယနေ့အထိ ကျွန်ုပ်တို့သည် browser ထဲကနေ deployment ကို လမ်းလျှောက်ပြီး ကျွန်ုပ်တို့၏ infrastructure မှာ provision ပြီး application လည်ပတ်နေကြသည်ဟု အတည်ပြုခဲ့သည်။ သို့သော် application ကို _code-first_ နည်းဖြင့် အလုပ်လုပ်ရန်အတွက် သတ်မှတ်ထားသော အရင်းအမြစ်များနှင့် ဆက်စပ်သည့် environment variable များကို သင့် local development ပတ်ဝန်းကျင်တွင် ဖန်တီးရမည်။ `azd` ကိုအသုံးပြုခြင်းက ဒီအလုပ်ကို လွယ်ကူစေသည်။

1. Azure Developer CLI သည် အသုံးပြုသူ application deployments အတွက် configuration settings များကို သိမ်းဆည်းစီမံရန် [environment variables](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash) ကို အသုံးပြုသည်။

1. Environment variables များကို `.azure/<env-name>/.env` တွင် သိမ်းဆည်းထားသည် - ၎င်းသည် deployment အတွက် အသုံးပြုသော `env-name` ကို scope လုပ်ပေးကာ တူညီ repo အတွင်းတွင် deployment တစ်ခုနှင့် တစ်ခုမတူ ခြားနားစေသည်။

1. Environment variables များကို `azd` မှ အထူး command တစ်ခု (ဥပမာ `azd up`) ကို ဆောင်ရွက်သည့်အချိန်တိုင်း အလိုအလျောက် load လုပ်ပေးသည်။ သတိပြုရန် - `azd` သည် _OS-level_ environment variables များကို အလိုအလျောက် ဖတ်မယူပါ (ဥပမာ shell တွင် set ထားသည့်) - အစား `azd set env` နှင့် `azd get env` ကို scripts များအတွင်း သတင်းအချက်အလက်များ ဆက်လက်လွှဲပြောင်းရန် အသုံးပြုပါ။

အချို့ command များကို စမ်းကြည့်ပါ။

1. ဒီ environment အတွက် `azd` တွင် set ထားသော environment variable များအားလုံးကို ရယူပါ။

      ```bash title="" linenums="0"
      azd env get-values
      ```
      
      အောက်ပါကဲ့သို့ မြင်ရမည်။

      ```bash title="" linenums="0"
      AZURE_AI_AGENT_DEPLOYMENT_NAME="gpt-4.1-mini"
      AZURE_AI_AGENT_NAME="agent-template-assistant"
      AZURE_AI_EMBED_DEPLOYMENT_NAME="text-embedding-3-small"
      AZURE_AI_EMBED_DIMENSIONS=100
      ...
      ```

1. အထူးတန်ဖိုးတစ်ခုကို ရယူပါ - ဥပမာ၊ `AZURE_AI_AGENT_MODEL_NAME` တန်ဖိုးကို သင်ထားရှိထားသလား စစ်ဆေးပါ။

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      အောက်ပါကဲ့သို့ မြင်ရမည် - default အဖြစ် ဆက်တင်ထားခြင်းမရှိသေးပါ။

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. `azd` အတွက် အခြား environment variable အသစ် တပ်ဆင်ပါ။ ဒီနေရာမှာ agent model name ကို ပြင်ဆင်ပါ။ _အမှတ်ချက်: ပြုလုပ်သော ပြောင်းလဲမှုများသည် `.azure/<env-name>/.env` ဖိုင်ထဲတွင် လက်ရှိ အချက်အလက်အား ချက်ချင်း ပြသပါမည်။_

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      ယခု သင်သည် တန်ဖိုးအား တွေ့ရှိမည်။

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. သတိပြုရန် အချို့ resource များ (ဥပမာ model deployments) သည် များသောအားဖြင့် ပျက်ကွက်မှုမရှိဘဲ အဖြစ်အပျက်ရှိပြီး `azd up` သာဖြင့် ပြန်တပ်ဆင်ခြင်းမဖြစ်နိုင်ပါ။ မူလ deployment ကို ဖျက်ပြီး env vars ပြောင်းလဲပြီး ထပ်မံ deploy လုပ်ကြည့်ပါ။

1. **refresh** - ယခင်က azd template တစ်ခုကို အသုံးပြု၍ infrastructure တပ်ဆင်ထားခဲ့ပါက - သင့် local environment variables များကို Azure deployment ၏ လက်ရှိအခြေအနေအရ refresh ပြုလုပ်နိုင်သည်။ အောက်ပါ command ကို အသုံးပြုပါ။

      ```bash title="" linenums="0"
      azd env refresh
      ```

      ၎င်းသည် ဒေသဆိုင်ရာ ဖွံ့ဖြိုးရေး ပတ်ဝန်းကျင်နှစ်ခု သို့မဟုတ် ထိုထက်ပိုများရှိသော ပတ်ဝန်းကျင်များအကြား environment variables များကို _ချိန်ကိုက်_ ပြုလုပ်ပေးနိုင်သည့် အင်အားကြီးသော နည်းလမ်းဖြစ်သည် (ဥပမာ၊ ဖွံ့ဖြိုးရေးသူများစွာပါဝင်သော အဖွဲ့) - တင်ထားသော အင်ဖရာစထရိုကို env variable အခြေအနေ၏ အမှန်တရားအဖြစ် အသုံးပြုခွင့်ပေးသည်။ အဖွဲ့ဝင်များသည် variables များကို _ပြန်လည်အသစ်ရယူ_ လုပ်ခြင်းဖြင့် ထပ်မံ ကိုက်ညီလာနိုင်သည်။

---

## 9. ဂုဏ်ယူပါတယ် 🏆

သင်သည် အစ မှ အဆုံး အလုပ်စဉ်တစ်ခုကို ယခုတစ်ခါ ပြီးစီးလိုက်ပါပြီ၊ ထိုအလုပ်စဉ်တွင် သင်:

- [X] သင်အသုံးပြုလိုသော AZD Template ကို ရွေးချယ်ပြီးဖြစ်သည်
- [X] ပံ့ပိုးထားသော ဖွံ့ဖြိုးရေး ပတ်ဝန်းကျင်တွင် အဆိုပါ template ကို ဖွင့်ခဲ့သည်
- [X] Template ကို တင်ပြီး ၎င်း အလုပ်လုပ်နိုင်ကြောင်း စစ်ဆေးပြီးဖြစ်သည်

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
ဤစာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ဖြင့် ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှုအတွက် ကြိုးပမ်းပေမယ့် အလိုအလျောက် ဘာသာပြန်ချက်များတွင် အမှားများ သို့မဟုတ် တိကျမှုလျော့နည်းမှုများ ပါဝင်နိုင်ကြောင်း သတိပြုပါ။ မူလစာတမ်းကို မူလဘာသာစကားဖြင့် ရှိသော မူရင်းစာတမ်းကို ယုံကြည်စိတ်ချရသော အရင်းအမြစ်အဖြစ် ခံယူသင့်သည်။ အရေးကြီးသော အချက်အလက်များအတွက် ပရော်ဖက်ရှင်နယ် လူ့ဘာသာပြန်ကို အသုံးပြုရန် အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုခြင်းကြောင့် ဖြစ်ပေါ်လာနိုင်သည့် နားလည်မှုမှားခြင်းများ သို့မဟုတ် အဓိပ္ပာယ်မှားဖော်ပြချက်များအတွက် ကျွန်ုပ်တို့ တာဝန်မယူပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->