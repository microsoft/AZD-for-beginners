# ၆။ အခြေခံအဆောက်အအုံ ဖျက်သိမ်းခြင်း

!!! tip "ဤမော်ဒျူး၏ အဆုံးသတ်တွင် သင်လုပ်ဆောင်နိုင်မည့်အရာများ"

    - [ ] Understand the importance of resource cleanup and cost management
    - [ ] Use `azd down` to deprovision infrastructure safely
    - [ ] Recover soft-deleted Azure AI Services if needed
    - [ ] **Lab 6:** Clean up Azure resources and verify removal

---

## အပိုအလေ့အကျင့်များ

ပရောဂျက်ကို ဖျက်သိမ်းမလုပ်ခင် အချိန်အနည်းငယ်ယူပြီး ဖွင့်လှစ်ပြီး စူးစမ်းလေ့လာကြည့်ပါ။

!!! info "ဤစူးစမ်းစစ်ဆေးရေး အကြံဉာဏ်များကို ကြိုးစားကြည့်ပါ"

    **Experiment with GitHub Copilot:**
    
    1. Ask: `What other AZD templates could I try for multi-agent scenarios?`
    2. Ask: `How can I customize the agent instructions for a healthcare use case?`
    3. Ask: `What environment variables control cost optimization?`
    
    **Explore the Azure Portal:**
    
    1. Review Application Insights metrics for your deployment
    2. Check the cost analysis for resources provisioned
    3. Explore the Microsoft Foundry portal agent playground one more time

---

## အခြေခံအဆောက်အအုံ ဖျက်သိမ်းခြင်း

!!! warning "သင် GA hosted-agent လေ့ကျင့်ခန်းကိုလည်း ပြီးမြောက်လိုက်ပါက"

    Check that exercise's environment separately. For a new Foundry project created by its AZD environment, `azd down` deletes the resource group and everything in it. For a reused Foundry project, it leaves the project, hosted agent, and other resources in place; remove only unwanted resources you own separately. Do not delete a shared project or resource group to clean up one agent. See the [hosted-agent cleanup guidance](https://learn.microsoft.com/azure/foundry/agents/quickstarts/quickstart-hosted-agent?pivots=azd#clean-up-resources).

၁။ အခြေခံအဆောက်အအုံကို ဖျက်သိမ်းခြင်းသည် အလွန်လွယ်ကူပါသည်။
      
      ```bash title="" linenums="0"
      azd env list
      azd show
      azd down
      ```
1. ရွေးချယ်ထားသောပတ်ဝန်းကျင်ကို အတည်ပြုပြီး ဖျက်ပစ်မည့် အရင်းအမြစ်များကို ပြန်ကြည့်ပါ။ ၎င်းသည် Azure အရင်းအမြစ်များကို ဖျက်ပစ်ပြီး ဒေတာများကို သင့်တော်သလို ပျက်စီးနိုင်သည်။ သင့်အတွက် သင်ယူမှု အလုပ်လုပ်စဉ်တွင် အတည်ပြုမေးခြင်းကို ထိန်းသိမ်းထားပါ။ သင်ပြီးစီးသည်နှင့် ဤအတိုင်း ရလဒ်များကို တွေ့မည်ဖြစ်သည်။
      
      ```text title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

၁။ ပေါ့ထွက်ကို ဝဘ်ဆိုက်တွင် အတည်ပြုပါက deployment ၏ နယ်နိမိတ် အပြင်ရှိ အရင်းအမြစ်များကိုစစ်ဆေးပါ။ ကုန်ကျစရိတ် အစီရင်ခံမှုနှင့် ကုန်ပမာဏ သတင်းအချက်အလက်များသည် နောက်ကျနိုင်သည်။ ဒေသခံ `.azure` ဖွဲ့စည်းမှုသည် သင် ရှင်းလင်းရန် မပြုလုပ်သေးမီအထိ ကျန်ရှိနေမည်ဖြစ်သည်။

၁။ `azd down --purge` သည် ပံ့ပိုးထားသော soft-deleted အရင်းအမြစ်များကို အမြဲတမ်းဖျက်ပစ်ရန် လည်းတောင်းဆိုပါသည်။ ပြန်လည်ရယူရန် မလိုလျှင်သာ အသုံးပြုပါ၊ ထို retention/purge-protection မူဝါဒများကို နားလည်ထားရမည်။ ၎င်းသည် ချက်ချင်း quota ဖြုတ်ပေးမှု မသေချာပါ။

၁။ စင်ကြယ်မှု အတည်ပြုဖို့အတွက် ပြန်လည်တပ်ဆင်ခြင်း မလုပ်ပါနဲ့။ နောက်ပိုင်း ရည်ရွယ်ချက်ရှိသော `azd up` သည် ကျန်ရှိသည့် ဒေသခံ input များ အသုံးပြူ၍ အရင်းအမြစ်များကို ပြန်လည်တည်ဆောက်နိုင်ပြီး ထပ်မံကောက်ခံမှု ဖြစ်စေသည်။ မော်ဒယ် အဆင့်မြှင့်တင်ရေးများသည် မိမိ့ကိုးကား ထောက်ပံ့သည့် provision ပြောင်းလဲမှုများ အသုံးပြုသည်၊ ဖျက်သိမ်းခြင်း မဟုတ်ပါ။

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ပြောကြားချက်**
ဤစာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှန်ကန်မှုအတွက် ကြိုးပမ်းနေသော်လည်း၊ စက်ကိရိယာဘာသာပြန်ခြင်းများတွင် အမှားများ သို့မဟုတ် မှားယွင်းချက်များ ပါဝင်နိုင်ကြောင်း သတိပြုပါရန် လိုအပ်ပါသည်။ မူလစာတမ်းကို မူရင်းဘာသာဖြင့်သာ ယုံကြည်စိတ်ချရသော အချက်အလက်အဖြစ် သတ်မှတ်သင့်သည်။ အရေးကြီးသည့် သတင်းအချက်အလက်များအတွက် ပရော်ဖက်ရှင်နယ် လူသားဘာသာပြန်သူဝန်ဆောင်မှုကို အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော နားလည်မှုကွာခြားမှုများ သို့မဟုတ် မမှန်ကန်သော အသုံးပြုမှုများအတွက် ကျွန်ုပ်တို့ တာဝန်မခံပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->