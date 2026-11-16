# ၆. အဆောက်အဦးဖျက်သိမ်းခြင်း

!!! tip "ဤမော်ဂျူး၏အဆုံးတွင် သင်မှာ အောက်ပါအရာများကို လုပ်နိုင်ပါမည်"

    - [ ] Understand the importance of resource cleanup and cost management
    - [ ] Use `azd down` to deprovision infrastructure safely
    - [ ] Recover soft-deleted Azure AI Services if needed
    - [ ] **Lab 6:** Clean up Azure resources and verify removal

---

## ပန်းတိုင်လက်တွေ့လေ့ကျင့်ခန်းများ

ပရောဂျက်ကို ဖျက်သိမ်းမည့်မတိုင်မီ၊ အချိန်အနည်းငယ်ယူ၍ ဖွင့်လှစ်စူးစမ်းခြင်းအနေနှင့်လုပ်ဆောင်ပါ။

!!! info "ဒီစမ်းသပ်စရာတောင်းဆိုချက်များကို လုပ်ကြည့်ပါ"

    **Experiment with GitHub Copilot:**
    
    1. Ask: `What other AZD templates could I try for multi-agent scenarios?`
    2. Ask: `How can I customize the agent instructions for a healthcare use case?`
    3. Ask: `What environment variables control cost optimization?`
    
    **Explore the Azure Portal:**
    
    1. Review Application Insights metrics for your deployment
    2. Check the cost analysis for resources provisioned
    3. Explore the Microsoft Foundry portal agent playground one more time

---

## အဆောက်အဦး ဖျက်ခြင်း

၁။ အဆောက်အဦးကို ဖျက်သိမ်းခြင်းမှာ အလွန်လွယ်ကူသည်-
      
      ```bash title="" linenums="0"
      azd env list
      azd show
      azd down
      ```
1။ ရွေးချယ်ထားသောenviromentကို အတည်ပြုပြီး ဖျက်မည့်ရင်းမြစ်များကို သုံးသပ်ပါ။ ဤလုပ်ဆောင်မှုသည် Azure ရင်းမြစ်များ ပြန်ဖျက်ပြီး ဒေတာကိုလည်း ဖျက်စေပါသည်။ လေ့လာရေးလုပ်ငန်းစဉ်အတွက် အတည်ပြုစာမျက်နှာကို ထိန်းသိမ်းပါ။ ပြီးစီးသွားလျှင် အောက်ပါအတိုင်း output ကို သင်မြင်ရပါမည်။
      
      ```text title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

၁။ portal တွင်ဖျက်သိမ်းမှုကို အတည်ပြုကြည့်ရှုပြီး deployment ၏ကွာလတင်အတွင်းမဟုတ်သော ရင်းမြစ်များရှိမရှိ စစ်ဆေးပါ။ ကုန်ကျစရိတ် 보고 및 할당량 갱신이 지연될 수 있습니다. 로컬 `.azure` 구성은 명시적으로 제거하지 않는 한 유지됩니다.

၁။ `azd down --purge` သည် ထောက်ပံ့ထားသော soft-deleted ရင်းမြစ်များ၏ သက်တမ်းကြာရှည်ဖျက်ပစ်ခြင်းကို ထပ်မံတောင်းဆိုသည်။ သတိပြုရန်မှာ ပြန်လည်ရယူခြင်းမလိုအပ်ပါကသာ အဲဒီကိုသုံးရန်ဖြစ်ပြီး သိမ်းဆည်းမှု/ဖယ်ရှားမှုကာကွယ်မှု မူဝါဒများကို နားလည်သည်။ ဤသည်သည် သတ်မှတ်ချက်လွတ်မြောက်မှုကို နှေးကွေးစေခြင်း မရှိပါ။

၁။ သန့်ရှင်းမှုကို စစ်ဆေးရန် အတွက် မပြန်လည်အသုံးပြုရန်။ နောက်မှ ရည်ရွယ်၍ `azd up` သည် ဒေသခံ input များကို အသုံးပြု၍ ရင်းမြစ်များကို ပြန်ဖန်တီးနိုင်ပြီး ပိုမိုကျသင့်မှုရှိစေပါသည်။ မော်ဒယ်အပ်ဒိတ်များသည် ပုံမှန်အားဖြင့် ထောက်ပံ့ထားသော provisioning ပြင်ဆင်မှုများကိုသာ အသုံးပြုသည်၊ အဆောက်အဦးဖျက်သိမ်းခြင်းမဟုတ်ပါ။

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ပြောကြားချက်**
ဤစာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှန်ကန်မှုအတွက် ကြိုးပမ်းနေသော်လည်း၊ စက်ကိရိယာဘာသာပြန်ခြင်းများတွင် အမှားများ သို့မဟုတ် မှားယွင်းချက်များ ပါဝင်နိုင်ကြောင်း သတိပြုပါရန် လိုအပ်ပါသည်။ မူလစာတမ်းကို မူရင်းဘာသာဖြင့်သာ ယုံကြည်စိတ်ချရသော အချက်အလက်အဖြစ် သတ်မှတ်သင့်သည်။ အရေးကြီးသည့် သတင်းအချက်အလက်များအတွက် ပရော်ဖက်ရှင်နယ် လူသားဘာသာပြန်သူဝန်ဆောင်မှုကို အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော နားလည်မှုကွာခြားမှုများ သို့မဟုတ် မမှန်ကန်သော အသုံးပြုမှုများအတွက် ကျွန်ုပ်တို့ တာဝန်မခံပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->