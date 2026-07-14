# အခန်း ၄: အင်ဖရာစထရပ်ချက်ဇာတ်ကောင်အဖြစ်နှင့် ထည့်သွင်းခြင်း  

**📚 သင်ခန်းစာ**: [AZD For Beginners](../../README.md) | **⏱️ ကြာမြင့်ချိန်**: ၁-၁.၅ နာရီ | **⭐ အဆင့်**: အလယ်အလတ်  

---  

## အကျဉ်းချုပ်  

ဒီအခန်းမှာ Infrastructure as Code (IaC) ရဲ့ ပုံစံများကို Bicep templates နဲ့ resource provisioning နှင့် Azure Developer CLI ကို အသုံးပြုသည့် deployment များကို ဖော်ပြထားပါတယ်။  

> ၂၀၂၆ ခုနှစ် ဇူလိုင်လတွင် `azd 1.27.1` နှင့် အတည်ပြုထားသည်။  

## သင်ယူရမည့် ရည်မှန်းချက်များ  

ဒီအခန်းကိုပြီးမြောက်ပါက သင်သည်-  
- Bicep template ဖွဲ့စည်းမှုနှင့် စာလုံးပေါင်းနည်းကို နားလည်သည်  
- `azd provision` ဖြင့် Azure အရင်းအမြစ်များကို provision ပြုလုပ်နိုင်သည်  
- `azd deploy` ဖြင့် အက်ပလီကေးရှင်းများကို ထည့်သွင်းနိုင်သည်  
- blue-green နှင့် rolling deployment များကို လုပ်ဆောင်နိုင်သည်  

---  

## 📚 သင်ခန်းစာများ  

| # | သင်ခန်းစာ | ဖော်ပြချက် | အချိန် |  
|---|--------|-------------|------|  
| 1 | [Provisioning Resources](provisioning.md) | AZD ဖြင့် Azure resource စီမံခန့်ခွဲမှု | ၄၅ မိနစ် |  
| 2 | [Deployment Guide](deployment-guide.md) | အက်ပလီကေးရှင်း ထည့်သွင်းမှု မျိုးစုံ | ၄၅ မိနစ် |  
| 3 | [Authoring Your Own Template](custom-templates.md) | အသုံးပြုနိုင်သော azd template များ ဆောက်လုပ်နှင့် ထုတ်ပြန်ခြင်း | ၃၀ မိနစ် |  

---  

## 🚀 အမြန်စတင်ခြင်း  

```bash
# စံနမူနาจาก စတင်ခြင်း
azd init --template azure-functions-python-v2-http

# ဖန်တီးမည့်အရာကို ကြိုကြည့်ရှုခြင်း
azd provision --preview

# အခြေခံအဆောက်အအုံသာ ရှိထုတ်ခြင်း
azd provision

# ကုဒ်သာ တပ်ဆင်ခြင်း
azd deploy

# သို့မဟုတ် နှစ်ခုလုံးကိုအတူတကွ
azd up
```
  
---  

## 📁 AZD စီမံကိန်း ဖွဲ့စည်းမှု  

```
my-project/
├── azure.yaml            # ← Project definition
├── infra/                # ← Infrastructure as Code
│   ├── main.bicep        # Entry point
│   ├── main.parameters.json
│   └── modules/          # Reusable components
│       ├── web.bicep
│       └── database.bicep
└── src/                  # Application code
    └── api/
```
  
---  

## 🔧 အရေးကြီးဆုံး command များ  

| Command | ဖော်ပြချက် |  
|---------|-------------|  
| `azd init` | စီမံကိန်း စတင်ခြင်း |  
| `azd provision` | Azure အရင်းအမြစ်များ ဖန်တီးခြင်း |  
| `azd deploy` | အက်ပလီကေးရှင်း ကုဒ် ထည့်သွင်းခြင်း |  
| `azd up` | provision + deploy |  
| `azd down` | အရင်းအမြစ်များအားလုံး ဖျက်ခြင်း |  

---  

## 🔗 လမ်းညွှန်မှု  

| ဘက် | အခန်း |  
|-----------|---------|  
| **ယခင်** | [အခန်း ၃: စနစ်ဖွဲ့ခြင်း](../chapter-03-configuration/README.md) |  
| **နောက်တစ်ခုပေါ်** | [အခန်း ၅: Multi-Agent Solutions](../chapter-05-multi-agent/README.md) |  

---  

## 📖 ဆက်စပ် အရင်းအမြစ်များ  

- [Pre-Deployment Checks](../chapter-06-pre-deployment/README.md)  
- [Container App Examples](../../examples/container-app/README.md)  
- [Database App Example](../../examples/database-app/README.md)  

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ပြောကြားချက်**
ဤစာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှန်ကန်မှုအတွက် ကြိုးပမ်းနေသော်လည်း၊ စက်ကိရိယာဘာသာပြန်ခြင်းများတွင် အမှားများ သို့မဟုတ် မှားယွင်းချက်များ ပါဝင်နိုင်ကြောင်း သတိပြုပါရန် လိုအပ်ပါသည်။ မူလစာတမ်းကို မူရင်းဘာသာဖြင့်သာ ယုံကြည်စိတ်ချရသော အချက်အလက်အဖြစ် သတ်မှတ်သင့်သည်။ အရေးကြီးသည့် သတင်းအချက်အလက်များအတွက် ပရော်ဖက်ရှင်နယ် လူသားဘာသာပြန်သူဝန်ဆောင်မှုကို အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော နားလည်မှုကွာခြားမှုများ သို့မဟုတ် မမှန်ကန်သော အသုံးပြုမှုများအတွက် ကျွန်ုပ်တို့ တာဝန်မခံပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->