# 2. တမ်းပလိတ်ကို စစ်ဆေးခြင်း  

> ဇူလိုင် 2026 တွင် `azd 1.27.1` နှင့် အတည်ပြုထားသည်။  

!!! tip "ဤမော်ဂျူး၏ အဆုံးတွင် သင်လေ့လာနိုင်မည့်အရာများ"  

    - [ ] AI ဖြေရှင်းချက် သေချာစွာ ခွဲခြမ်းစိတ်ဖြာနိုင်ခြင်း  
    - [ ] AZD စနစ် စနစ်တကျ ဖော်ဆောင်မှု လျှောက်လွှာကို နားလည်နိုင်ခြင်း  
    - [ ] AZD အသုံးပြုရန် GitHub Copilot မှ အကူအညီ ရယူနိုင်ခြင်း  
    - [ ] **Lab 2:** AI Agent templates ကို တပ်ဆင်ပြီး စစ်ဆေးခြင်း  

---  


## 1. မိတ်ဆက်  

[Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) သို့မဟုတ် `azd` သည် Azure တွင် အပလီကေးရှင်းများကို တည်ဆောက်ခြင်းနှင့် တပ်ဆင်ခြင်းလုပ်ငန်းစဉ်ကို လျှော့ချပေးသည့် open-source ကမန်းလိုင်းကိရိယာတစ်ခု ဖြစ်သည်။  

[AZD Templates](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) သည် စံနမူနာ အပလီကေးရှင်းကုဒ်များ၊ _infrastructure-as-code_ ဆော့ဖ်ဝဲများနှင့် `azd` ဖိုင်များကို တစ်ရပ်တည်း စုစည်းထားသည့် စံပြ သိုလှောင်ရုံတစ်ခု ဖြစ်သည်။ အဆောက်အအုံ စက်ရုံတည်ဆောက်ခြင်းကို `azd provision` command တစ်ခု ဖြင့် လွယ်ကူစွာ ပြုလုပ်နိုင်ပြီး `azd up` ကို အသုံးပြု၍ အဆောက်အအုံနှင့် အပလီကေးရှင်းတပ်ဆင်ခြင်းကို တစ်ခါတည်း ပြုလုပ်နိုင်ပါသည်။  

ထို့ကြောင့် သင့်အတွက် သင့် လိုအပ်ချက်နှင့်ကိုက်ညီသော _AZD Starter template_ ကို ရှာဖွေပြီး ကိုယ်ပိုင်လိုအပ်ချက်များအရ သိုလှောင်ရုံကို မိတ်ဆက်ထားသော နည်းလမ်းဖြင့် စတင်လုပ်ကိုင်နိုင်ပါသည်။  

စတင်မတိုင်မီ Azure Developer CLI သင်ထည့်သွင်းထားကြောင်း သေချာစေကြပါစို့။  

1. VS Code terminal ကို ဖွင့်ပြီး ဤ command ကို ရိုက်ထည့်ပါ။  

      ```bash title="" linenums="0"
      azd version
      ```
  
1. အောက်ပါအတိုင်း ပြသပါမည်။  

      ```bash title="" linenums="0"
      azd version 1.27.1 (commit <current-build>)
      ```
  
**azd ဖြင့် template ရွေးချယ်ပြီး တပ်ဆင်ရန် ပြင်ဆင်ပြီးဖြစ်ပါပြီ**  

---  

## 2. Template ရွေးချယ်ခြင်း  

Microsoft Foundry ပလက်ဖောင်းတွင် ကျော်ကြားသော ဖြေရှင်းချက်အခြေအနေများအတွက် [_multi-agent workflow automation_ နှင့် _multi-modal content processing_] နည်းပညာတို့ကဲ့သို့သော အထောက်အပံ့ပေးမှုများ ပါဝင်သော [AZD templates အစုတစ်ခု](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started) ပါရှိသည်။ ဤ templates များကို Microsoft Foundry portal မှလည်း ရှာဖွေနိုင်ပါသည်။  

1. [https://ai.azure.com/templates](https://ai.azure.com/templates) သို့ ဝင်ရောက်ကြည့်ရှုပါ  
1. Microsoft Foundry portal တွင် ဝင်ရောက်ခြင်း (login) ပြုလုပ်ပါ - အောက်ပါပုံစံနှင့် တူညီသည်ကို တွေ့မြင်မည်။  

![Pick](../../../../../translated_images/my/01-pick-template.60d2d5fff5ebc374.webp)  


**Basic** ရွေးချယ်စရာတွေဟာ သင့်စတင်အသုံးပြုနိုင်သော template များဖြစ်သည်။  

1. [ ] [AI Chat အတွက် စတင်ပါ](https://github.com/Azure-Samples/get-started-with-ai-chat) - ဒေတာပါရှိပြီး Azure Container Apps သို့ မူလ chatbot အပလီကေးရှင်းကိုတပ်ဆင်သည်။ အခြေခံ AI chatbot အခြေအနေကို လေ့လာရန် အသုံးပြုပါ။  
1. [X] [AI Agents အတွက် စတင်ပါ](https://github.com/Azure-Samples/get-started-with-ai-agents) - Foundry Agents သုံးပြီး စံပြ AI Agent ကိုတပ်ဆင်သည်။ စက်မှု AI ဖြေရှင်းချက်နဲ့ အထောက်အပံ့ပေးမှုများအား သေချာစွာ လေ့လာရန် အသုံးပြုပါ။  

ဒုတိယလင့်ခ်ကို ဘရောက်ဇာ tab အသစ်တွင် ဖွင့်ပါ (သို့) ဆက်စပ်ကဒ်တွင် `Open in GitHub` ကိုနှိပ်ပါ။ ဤ AZD Template ရဲ့ သိုလှောင်ရုံ ကို ကြည့်ရှုနိုင်မည်ဖြစ်၍ README ကို စောင့်ကြည့်ပါ။ အပလီကေးရှင်းအစိတ်အပိုင်းရေးဆွဲထားသည့် ပုံရိပ်သည် အောက်ပါအတိုင်းဖြစ်သည်။  

![Arch](../../../../../translated_images/my/architecture.8cec470ec15c65c7.webp)  

---  

## 3. Template လုပ်ဆောင်ခြင်း  

ဤ template ကို တပ်ဆင်ပြီး မှန်ကန်မှုကို စစ်ဆေးကြပါစို့။ [Getting Started](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started) အပိုင်းအတိုင်း လုပ်ဆောင်မည်။  

1. Template သိုလှောင်ရုံအတွက် အလုပ်လုပ်ရန် ပတ်ဝန်းကျင် ရွေးချယ်ပါ -  

      - **GitHub Codespaces**: [ဤလင့်ခ်](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) ကိုနှိပ်ပြီး `Create codespace` ကို အတည်ပြုပါ  
      - **Local clone သို့မဟုတ် dev container**: `Azure-Samples/get-started-with-ai-agents` ကို clone လုပ်ပြီး VS Code တွင်ဖွင့်ပါ  

1. VS Code terminal ပြင်ဆင်ပြီးနောက် အောက်ပါ command ကို ရိုက်ထည့်ပါ။  

   ```bash title="" linenums="0"
   azd up
   ```
  
ဖော်ပြမည့် workflow အဆင့်များကို ပြီးမြောက်အောင်လုပ်ပါ -  

1. Azure ကို login ပြုလုပ်ရန် ဖိတ်ခေါ်မည် - ညွှန်ကြားချက်များကို လိုက်နာ၍ အတည်ပြုပါ  
1. သင်နှင့် သက်ဆိုင်သော unique ပတ်ဝန်းကျင်အမည် တစ်ခု ထည့်ပါ - ဥပမာ- `nitya-mshack-azd`  
1. `.azure/` ဖိုလ်ဒါ တစ်ခုကို ဖန်တီးမည် - ပတ်ဝန်းကျင်အမည်ပါသော subfolder တစ်ခု ရရှိမည်။  
1. subscription အမည် ရွေးချယ်ရန် ဖိတ်ခေါ်မည် - default ကို ရွေးပါ  
1. location ရွေးချယ်ရန် ဖိတ်ခေါ်မည် - `East US 2` ကို အသုံးပြုပါ  

ယခု provisioning ပြီးဆုံးရန် ခေတ္တ စောင့်ဆိုင်းပါ။ **ဤကိစ္စသည် ၁၀ မှ ၁၅ မိနစ် ကြာမြင့်သည်**  

1. ပြီးဆုံးပါက console တွင် SUCCESS သတင်းစကား ပြသမည်။ ဥပမာအောက်ပါအတိုင်းဖြစ်သည်။  
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. Azure Portal တွင် ပတ်ဝန်းကျင်အမည်ဖြင့် resource group တစ်ခု provisioning ပြီးစီးပါပြီ။  

      ![Infra](../../../../../translated_images/my/02-provisioned-infra.46c706b14f56e0bf.webp)  

1. **တပ်ဆင်ပြီးသော အဆောက်အအုံနှင့် အပလီကေးရှင်းကို ယခု စစ်ဆေးနိုင်ပါပြီ**။  

---  

## 4. Template စစ်ဆေးခြင်း  

1. Azure Portal [Resource Groups](https://portal.azure.com/#browse/resourcegroups) စာမျက်နှာသို့ ဝင်ပါ - login ပြုလုပ်ပါ  
1. သင့် ပတ်ဝန်းကျင် အမည်ရှိ RG တွင် ခြွင့်သွားပါ - အပေါ်ပုံအတိုင်းမျက်နှာပြင် တွေ့ရမည်  

      - Azure Container Apps resource ကို နှိပ်ပါ  
      - _Essentials_ အပိုင်း (အပေါ်လှည့်ညာ) တွင် Application Url ကို နှိပ်ပါ  

1. အောက်ပါကဲ့သို့သော hosted application ရဲ့ frontend UI ကို တွေ့မြင်ရမည်။  

   ![App](../../../../../translated_images/my/03-test-application.471910da12c3038e.webp)  

1. [sample questions](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md) အနည်းငယ် မေးကြည့်ပါ  

      1. မေးပါ: ```What is the capital of France?```  
      1. မေးပါ: ```What's the best tent under $200 for two people, and what features does it include?```  

1. အောက်ပါအတိုင်း အဖြေများ ရရှိမည်။ _ဒါဘယ်လို အလုပ်လုပ်တာလဲ?_  

      ![App](../../../../../translated_images/my/03-test-question.521c1e863cbaddb6.webp)  

---  

## 5. Agent စစ်ဆေးခြင်း  

Azure Container App သည် Microsoft Foundry project တွင် provision ပြုလုပ်ထားသော AI Agent သို့ ဆက်သွယ်မှု endpoint တစ်ခု တပ်ဆင်ပေးသည်။ ၎င်းသည် ဘာကို ဆိုလိုသနည်းကို ကြည့်ကြပါစို့။  

1. သင့် resource group အတွက် Azure Portal _Overview_ စာမျက်နှာသို့ ပြန်သွားပါ  

1. စာရင်းအတွင်းရှိ `Microsoft Foundry` resource ကို နှိပ်ပါ  

1. အောက်ပါအတိုင်း တွေ့မြင်ရမည်။ `Go to Microsoft Foundry Portal` ခလုတ်ကို နှိပ်ပါ။  
   ![Foundry](../../../../../translated_images/my/04-view-foundry-project.fb94ca41803f28f3.webp)  

1. သင့် AI application အတွက် Foundry Project စာမျက်နှာကို တွေ့မြင်ရမည်  
   ![Project](../../../../../translated_images/my/05-visit-foundry-portal.d734e98135892d7e.webp)  

1. `Agents` ကို နှိပ်ပါ - ပရောဂျက်တွင် သတ်မှတ်ထားသော Agent ကို တွေ့မြင်ပါမည်  
   ![Agents](../../../../../translated_images/my/06-visit-agents.bccb263f77b00a09.webp)  

1. ရွေးချယ်ပြီး Agent အသေးစိတ်ကို ကြည့်ရှုပါ။ အောက်ပါအချက်များကို သတိပြုပါ -  

      - အမြဲတမ်း File Search ကို အသုံးပြုသည်  
      - agent `Knowledge` တွင် ဖိုင် ၃၂ ဖိုင် တင်ထားပြီး (file search အတွက်)  
      ![Agents](../../../../../translated_images/my/07-view-agent-details.0e049f37f61eae62.webp)  

1. ဘယ်ဘက် မီယူတွင်ရှိသည့် `Data+indexes` ရွေးချယ်ပြီး အသေးစိတ်ကြည့်ပါ။  

      - နားလည်မှုအတွက် ဖိုင် ၃၂ ဖိုင် တင်ထားသည်ကို တွေ့ရှိမည်။  
      - ၎င်းတို့သည် `src/files` အောက်ရှိ customer ဖိုင် ၁၂ ဖိုင်နှင့် product ဖိုင် ၂၀ ဖိုင်နှင့် ကိုက်ညီသည်။  
      ![Data](../../../../../translated_images/my/08-visit-data-indexes.5a4cc1686fa0d19a.webp)  

**Agent လည်ပတ်မှုကို သင် စစ်ဆေးပြီးဖြစ်သည်!**  

1. Agent ၏ အဖြေများသည် ၎င်း ဖိုင်များအတွင်းရှိ နားလည်မှုအပေါ် အခြေခံသည်။  
1. သင်အဆိုပါ ဒေတာနှင့် ဆက်စပ်သော မေးခွန်းများ မေးလို့ရပြီး အားလုံး အခြေခံထားသော အဖြေများ ရရှိမည်။  
1. ဥပမာ - `customer_info_10.json` သည် "Amanda Perez" မှ ဝယ်ယူမှု သုံးခုကို ဖော်ပြထားသည်။  

Container App endpoint ပါသော browser tab ပြန် ရှာပြီး `Amanda Perez ပိုင်ဆိုင်ထားသော မည်သည့် ထုတ်ကုန်များ ရှိပါသလဲ?` ဟု မေးပါ။ အောက်ပါအတိုင်း တွေ့ရမည်။  

![Data](../../../../../translated_images/my/09-ask-in-aca.4102297fc465a4d5.webp)  

---  

## 6. Agent Playground  

Microsoft Foundry ၏ လုပ်ဆောင်ချက်များကို ပိုမို နားလည်စေရန် Agent ကို Agents Playground တွင် စမ်းသပ်ကြည့်ကြပါစို့။  

1. Microsoft Foundry တွင် `Agents` စာမျက်နှာသို့ ပြန်သွားပြီး default agent ကို ရွေးချယ်ပါ  
1. `Try in Playground` ကို နှိပ်ပါ - ဤအတိုင်း Playground UI ကို ရရှိမည်။  
1. မေးခွန်း တူညီသော `Amanda Perez ပိုင်ဆိုင်ထားသော ထုတ်ကုန်များ မည်သို့ ရှိပါသလဲ?` ကို မေးပါ။  

    ![Data](../../../../../translated_images/my/09-ask-in-playground.a1b93794f78fa676.webp)  

တူညီ (သို့) အနီးကပ် အဖြေ လည်းရမည် - ထို့အပြင် သင်၏ agentic app ၏ အရည်အသွေး၊ ကုန်ကျစရိတ်နှင့် စွမ်းဆောင်ရည်တို့အား နားလည်ရန် အကူအညီပေးသည့် သတင်းအချက်အလက်များကိုလည်း ရရှိမည်။ ဥပမာ -  

1. အဖြေသည် အခြေခံထားသည့် data files များကို ကိုးကားသည်။  
1. ဖိုင်များ၏ label များပေါ်တွင် မှုတ်လေ့လာပါ - ဒေတာသည် မေးခွန်းနှင့် ပြသထားသော အဖြေကို ကိုက်ညီသည်လား?  

အဖြေ၏ အောက်မှာ _stats_ စာကြောင်းတစ်ခုကိုလည်း တွေ့ရမည်။  

1. အချက်အလက်တစ်ခုစီ၌ မှုတ်လေ့လာပါ - ဥပမာ Safety metric ကို - အောက်ပါအတိုင်း မြင်ရမည်။  
1. သင့် စိတ်ခံစားချက်ဖြင့် အဖြေ၏ လုံခြုံမှု အဆင့် အလားအလာနှင့် ကိုက်ညီပါသလား?  

      ![Data](../../../../../translated_images/my/10-view-run-info-meter.6cdb89a0eea5531f.webp)  

---  

## 7. ဆောက်လုပ်ပြီး Observability  

Observability သည် သင့်အပလီကေးရှင်း၌ သတင်းအချက်အလက် များကို ထုတ်လုပ်ရန် ကိရိယာများ ထည့်သွင်းခြင်းဖြစ်သည် - ၎င်းကို နားလည်ရန်၊ ပြဿနာရှာဖွေရန် နှင့် တိုးတက်စေရန် အသုံးပြုသည်။ ဤကို နားလည်ရန် -  

1. `View Run Info` ခလုတ်ကို နှိပ်ပါ - ဤအမြင်ကို တွေ့မြင်ရမည်။ ၎င်းသည် [Agent tracing](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) ၏ လုပ်ဆောင်မှု ဥပမာဖြစ်သည်။ _ဤအမြင်ကို Thread Logs အထက်ဆုံး menu လုပ်ဆောင်ချက်မှလည်းရရှိနိုင်သည်_။  

   - Agent က အလုပ်လုပ်သည့် အဆင့်များနှင့် အသုံးပြုသော ကိရိယာများကို နားလည်နိုင်သည်။  
   - အဖြေတွင် အသုံးပြုသော Token အရေအတွက် (မူလ Token အရေအတွက်နှင့် နှိုင်းယှဉ်၍) ကို နားလည်နိုင်သည်။  
   - အချိန်ယူမှုနှင့် လုပ်ဆောင်ချက်ကြောင့် သုညတည်ရာကို နားလည်နိုင်သည်။  

      ![Agent](../../../../../translated_images/my/10-view-run-info.b20ebd75fef6a1cc.webp)  

1. `Metadata` တပ်ကို နှိပ်၍ အလုပ်လုပ်မှုအတွက် ထပ်ဆောင်း attribute များကို ကြည့်ရှုရန် - ပြဿနာရှာဖွေရန်အသုံးဝင်နိုင်သည်။  

      ![Agent](../../../../../translated_images/my/11-view-run-info-metadata.7966986122c7c2df.webp)  


1. `Evaluations` တပ်ကို နှိပ်၍ Agent ၏ အဖြေauto-assessment များကို ကြည့်ရှုနိုင်သည်။ ၎င်းတွင် လုံခြုံမှုသုံးသပ်ချက်များ (ဥပမာ- Self-harm) နှင့် agent အထူး သုံးသပ်ချက်များ (ဥပမာ- Intent resolution, Task adherence) ပါဝင်သည်။  

      ![Agent](../../../../../translated_images/my/12-view-run-info-evaluations.ef25e4577d70efeb.webp)  

1. နောက်ဆုံးပေါ်၊ sidebar menu တွင် `Monitoring` တပ်ကိုနှိပ်ပါ။  

      - ပြသသည့် စာမျက်နှာတွင် `Resource usage` တပ်ကို ရွေးချယ်ပြီး၊ metrics များကို ကြည့်ရှုပါ။  
      - ကုန်ကျစရိတ်များ (token) နှင့် လုပ်အားတောင်းဆိုမှုများ (requests) ကို လမ်းညွှန်ကြည့်ရှုနိုင်သည်။  
      - ပထမဘိုက် (အချက်အလက် ဝင်ရောက် စီမံခန့်ခွဲမှု) နှင့် နောက်ဆုံး ဘိုက် (အဖြေထွက်) အကြား ဠိာင်ဆန့် ခြားနားမှုကို အကဲဖြတ်နိုင်သည်။  

      ![Agent](../../../../../translated_images/my/13-monitoring-resources.5148015f7311807f.webp)  

---  

## 8. ပတ်ဝန်းကျင် မဟာဗျူဟာများ  

ယခုအခါအထိ၊ ငါတို့ browser တွင် တပ်ဆင်မှု ပြီးစီးခဲ့ပြီး၊ သက်ဆိုင်သော အဆောက်အအုံ provision ပြုလုပ်ပြီး၊ အပလီကေးရှင်း လည်ပတ်မှုရှိကြောင်း စစ်ဆေးခဲ့သည်။ ဒါပေမယ့် ကုဒ်အခြေခံ အလုပ်တိုင်းသို့ တက်ရောက်ရန်အတွက်၊ သက်ဆိုင်ရာ variable များကို သင့် ဒေသဆိုင်ရာ ဖွံ့ဖြိုးမှု ပတ်ဝန်းကျင်တွင် ပြင်ဆင်ထားရမည်ဖြစ်သည်။ `azd` သုံးခြင်းသည် ဤကိစ္စကို လွယ်ကူစေသည်။  

1. Azure Developer CLI သည် အပလီကေးရှင်း တပ်ဆင်ခြင်းများအတွက် ဖွဲ့စည်းမှု ဆက်တင်များကို သိမ်းဆည်း စီမံရန် [ပတ်ဝန်းကျင် မဟာဗျူဟာများ](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash) ကို အသုံးပြုသည်။  

1. ပတ်ဝန်းကျင် မဟာဗျူဟာများကို `.azure/<env-name>/.env` တွင် သိမ်းဆည်းထားပြီး၊ ဒီဟာက သီးသန့် deployment ရည်ရွယ်ချက်အတွက် `env-name` နာမည်နှင့် သက်ဆိုင်ပြီး တူညီသော သိုလှောင်ရုံတွင် ပတ်ဝန်းကျင်များကို ခွဲခြားပေးသည်။  

1. ပတ်ဝန်းကျင် မဟာဗျူဟာများကို `azd` command မည်သည့် command မဆို (ဥပမာ- `azd up`) ကို ဆောင်ရွက်သည့်အခါ အလိုအလျောက် ဖတ်ယူသည်။ သို့သော် `azd` သည် _OS-level_ ပတ်ဝန်းကျင် မဟာဗျူဟာများ (ဥပမာ shell တွင် set ထားသော) ကို မဖတ်ပါ - ဒီလို အချက်အလက်များကို `azd set env` နှင့် `azd get env` ဖြင့် script များတွင် လွှဲပြောင်းအသုံးပြုပါ။  


ကိစ္စအချို့ကို စမ်းကြည့်ကြမယ် -  

1. ဤ ပတ်ဝန်းကျင်အတွက် `azd` သတ်မှတ်ထားသော ပတ်ဝန်းကျင် မဟာဗျူဟာများအားလုံး ရယူပါ -  

      ```bash title="" linenums="0"
      azd env get-values
      ```
      
      အောက်ပါအတိုင်း ဖော်ပြမည်။  

      ```bash title="" linenums="0"
      AZURE_AI_AGENT_DEPLOYMENT_NAME="gpt-4.1-mini"
      AZURE_AI_AGENT_NAME="agent-template-assistant"
      AZURE_AI_EMBED_DEPLOYMENT_NAME="text-embedding-3-small"
      AZURE_AI_EMBED_DIMENSIONS=100
      ...
      ```
  
1. သတ်မှတ်ထားရန်လိုသော တစ်ခုခုသော တန်ဖိုး ရယူပါ - ဥပမာ `AZURE_AI_AGENT_MODEL_NAME` တန်ဖိုး ရှိသည်ဟုတ် မရှိသည်ဟုတ်ကို သိလိုပါသည်။  

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      ဤအတိုင်း တွေ့မြင်ရမည်။ ၎င်းသည် မူရင်းအနေဖြင့် သတ်မှတ်ထားခြင်း မရှိပါ။  

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```
  
1. `azd` အတွက် ပတ်ဝန်းကျင် မဟာဗျူဟာ အသစ်ကို သတ်မှတ်ပါ။ ဒီမှာတော့ agent model name ကို ပြောင်းလဲသတ်မှတ်ပြုလုပ်သည်။ _အောက်ပါအတိုင်း အပြောင်းအလဲများသည် `.azure/<env-name>/.env` ဖိုင်တွင် အချိန်နှင့်တပြေးညီ ပြန်လည် ထင်ဟပ်သွားမည်။_  

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```
  
      ယခုတော့ တန်ဖိုး သတ်မှတ်ပြီးဖြစ်သည်ဟု တွေ့ရမည်။  

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
  
1. အချို့ resource များသည် အမြဲတမ်းဖြစ်ပြီး (ဥပမာ- model deployment များ) `azd up` တစ်ခုသာဖြင့် ပြန်လည်တပ်ဆင်ခြင်း မပြုလုပ်နိုင်သဖြင့် မူလ တပ်ဆင်မှုကို ဖျက်၍ ပတ်ဝန်းကျင် မဟာဗျူဟာ အသစ်ဖြင့် ပြန်လည်တပ်ဆင်ရမည်။  

1. **Refresh** ယခင်က azd template တစ်ခု အသုံးပြု၍ infrastructure တပ်ဆင်ခဲ့သည်ဆိုပါက - လက်ရှိ Azure deployment အခြေအနေ အပေါ်မူတည်၍ သင်၏ ဒေသဆိုင်ရာ ပတ်ဝန်းကျင် မဟာဗျူဟာများ အခြေအနေကို _refresh_ ပြုလုပ်နိုင်သည်။ ဤ command ကို အသုံးပြုပါ -  

      ```bash title="" linenums="0"
      azd env refresh
      ```
  

      ဒါဟာ ဒေသခံဖွံ့ဖြိုးရေးပတ်ဝန်းကျင်တစ်ခု သို့မဟုတ် အဓိကအားဖြင့် ၂ခု သို့မဟုတ် အများမဟုတ်သော ပတ်ဝန်းကျင်များတွင် သင့်စိတ်ကြိုက် _sin သတ်ရန်_ အရေးပါသော နည်းလမ်းတစ်ခုဖြစ်သည် (ဥပမာ- အဖွဲ့တွင် အဖွဲ့ဝင်များစွာရှိသောအခါ) - စက်ရုံတပ်ဆင်ထားသော အပြန်လည်ဆောက်လုပ်မှုက အသုံးပြုသော ပတ်ဝန်းကျင်အခြေအနေအတွက် အခြေခံအချက်အလက်အဖြစ် ဝန်ဆောင်မှုပေးနိုင်သည်။ အဖွဲ့ဝင်များသည် အရင်ကဲ့သို့ _refresh_ ပြန်လုပ်ခြင်းဖြင့် ပြန်လည်အညီတက်နိုင်သည်။

---

## 9. ဂုဏ်ပြုပါသည် 🏆

သင်ဟာ ရှေ့ဆုံးမှ နောက်ဆုံးအထိ လုပ်ငန်းစဉ်တစ်ခု ပြီးမြောက်သွားပါပြီ၊ ထိုလုပ်ငန်းစဉ်မှာ သင်သည်-

- [X] သင့်လိုချင်သော AZD Template ကို ရွေးချယ်ပြီး
- [X] ထို template ကို အထောက်အပံ့ပေးသော ဖွံ့ဖြိုးရေးပတ်ဝန်းကျင်တစ်ခုတွင် ဖွင့်ပြီး
- [X] Template ကို တပ်ဆင်ပြီး အလုပ်လုပ်ဆိုတာ အတည်ပြုပြီးဖြစ်သည်

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ပြောကြားချက်**
ဤစာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှန်ကန်မှုအတွက် ကြိုးပမ်းနေသော်လည်း၊ စက်ကိရိယာဘာသာပြန်ခြင်းများတွင် အမှားများ သို့မဟုတ် မှားယွင်းချက်များ ပါဝင်နိုင်ကြောင်း သတိပြုပါရန် လိုအပ်ပါသည်။ မူလစာတမ်းကို မူရင်းဘာသာဖြင့်သာ ယုံကြည်စိတ်ချရသော အချက်အလက်အဖြစ် သတ်မှတ်သင့်သည်။ အရေးကြီးသည့် သတင်းအချက်အလက်များအတွက် ပရော်ဖက်ရှင်နယ် လူသားဘာသာပြန်သူဝန်ဆောင်မှုကို အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော နားလည်မှုကွာခြားမှုများ သို့မဟုတ် မမှန်ကန်သော အသုံးပြုမှုများအတွက် ကျွန်ုပ်တို့ တာဝန်မခံပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->