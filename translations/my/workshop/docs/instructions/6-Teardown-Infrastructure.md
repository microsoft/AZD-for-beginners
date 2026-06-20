# 6. အင်ဖရာစထရား ဖျက်သိမ်းခြင်း

!!! tip "ဒီမော်ဂျူး၏ အဆုံးတွင် သင် အောက်ပါအရာများကို ပြုလုပ်နိုင်ပါမည်"

    - [ ] ရင်းမြစ်များ ဖျက်သိမ်းခြင်းနှင့် ကုန်ကျစရိတ် စီမံခန့်ခွဲမှု၏ အရေးပါမှုကို နားလည်ရန်
    - [ ] လုံခြုံစွာ အင်ဖရာစထရား ပယ်ဖျက်ရန် `azd down` ကို အသုံးပြုပါ
    - [ ] လိုအပ်လျှင် soft-deleted ဖြစ်ထားသော Azure AI Services များကို ပြန်လည် ရယူရန်
    - [ ] **Lab 6:** Azure အရင်းအမြစ်များကို ဖျက်သိမ်း၍ ဖျက်ပြီးပြီဖြစ်ကြောင်း စစ်ဆေးရန်

---

## အပို လေ့ကျင့်ခန်းများ

Before we tear down the project, take a few minutes to do some open-ended exploration.

!!! info "ဤ စူးစမ်းလေ့လာရန် အကြံပြုချက်များကို စမ်းသပ်ပါ"

    **GitHub Copilot ဖြင့် စမ်းသပ်ခြင်း:**
    
    1. မေးပါ: `multi-agent အခြေအနေများအတွက် မည်သည့် AZD templates များကို ကြိုးစားကြည့်နိုင်ပါသနည်း?`
    2. မေးပါ: `ကျန်းမာရေးဆိုင်ရာ အသုံးပြုမှုအတွက် agent ညွှန်ကြားချက်များကို မည်သို့ တွဲဖက်ပြင်ဆင်နိုင်သနည်း?`
    3. မေးပါ: `ကုန်ကျစရိတ် အာရုံစိုက်မှုကို ထိန်းချုပ်သည့် environment variables များဘာတွေလဲ?`
    
    **Azure Portal ကို တိုက်ရိုက် စူးစမ်းပါ:**
    
    1. သင့် deployment အတွက် Application Insights မက်ထရစ်များကို ပြန်လည် သုံးသပ်ပါ
    2. Provision လုပ်ထားသော ရင်းမြစ်များအတွက် ကုန်ကျစရိတ် ခွဲခြမ်းစိတ်ဖြာကို စစ်ဆေးပါ
    3. Microsoft Foundry portal ရဲ့ agent playground ကို ထပ်မံ စူးစမ်းကြည့်ပါ

---

## အင်ဖရာစထရား ပယ်ဖျက်ခြင်း

1. အင်ဖရာစထရားကို ပိတ်ပင် ဖျက်သိမ်းခြင်းမှာ အလွန်လွယ်ကူသည် - အောက်ပါအတိုင်းပါ:
      
      ```bash title="" linenums="0"
      azd down --purge
      ```
1. The `--purge` flag ensures that it also purges soft-deleted Cognitive Service resources, thereby releasing quota held by these resources. Once complete you will see something like this:
      
      ```bash title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd
      (✓) Done: Purging Cognitive Account: aoai-3cz3zkynhvpbc

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. (Optional) ယခု `azd up` ကို ထပ်မံ လည်ပတ်ပါက၊ သင့် local `.azure` ဖိုလ်ဒါတွင် environment variable ကို ပြောင်းလဲ၍ သိမ်းဆည်းထားသောကြောင့် gpt-4.1 မော်ဒယ် ထပ်မံ deploy လုပ်ခံရမည်ကို တွေ့ရပါလိမ့်မည်။ 

      ဒီမှာ မော်ဒယ် deployment များ၏ **မတိုင်မီ** အခြေအနေ ဖြစ်သည်:

      ![အစ](../../../../../translated_images/my/14-deploy-initial.30e4cf1c29b587bc.webp)

      နှင့် ၎င်းသည် **ပြီးနောက်** ဖြစ်ပါသည်:
      ![အသစ်](../../../../../translated_images/my/14-deploy-new.f7f3c355a3cf7299.webp)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ပြောကြားချက်**
ဤစာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှန်ကန်မှုအတွက် ကြိုးပမ်းနေသော်လည်း၊ စက်ကိရိယာဘာသာပြန်ခြင်းများတွင် အမှားများ သို့မဟုတ် မှားယွင်းချက်များ ပါဝင်နိုင်ကြောင်း သတိပြုပါရန် လိုအပ်ပါသည်။ မူလစာတမ်းကို မူရင်းဘာသာဖြင့်သာ ယုံကြည်စိတ်ချရသော အချက်အလက်အဖြစ် သတ်မှတ်သင့်သည်။ အရေးကြီးသည့် သတင်းအချက်အလက်များအတွက် ပရော်ဖက်ရှင်နယ် လူသားဘာသာပြန်သူဝန်ဆောင်မှုကို အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော နားလည်မှုကွာခြားမှုများ သို့မဟုတ် မမှန်ကန်သော အသုံးပြုမှုများအတွက် ကျွန်ုပ်တို့ တာဝန်မခံပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->